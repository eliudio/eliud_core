import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:eliud_core/core/navigate/navigate_bloc.dart';
import 'package:eliud_core/core/navigate/navigation_event.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/model/member_subscription_model.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/tools/random.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import 'package:eliud_core/core/access/bloc/access_event.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccessBloc extends Bloc<AccessEvent, AccessState> {
  final NavigatorBloc navigatorBloc;

  AccessBloc(this.navigatorBloc): super(UndeterminedAccessState());

  Future<AppModel> _fetchApp(String id) async {
    return await AbstractMainRepositorySingleton.singleton.appRepository().get(id);
  }

  @override
  Stream<AccessState> mapEventToState(AccessEvent event) async* {
    var theState = state;
    if (event is InitApp) {
      var usr = await AbstractMainRepositorySingleton.singleton.userRepository().currentSignedinUser();
      var app = await _fetchApp(event.appId);
      if (app == null) {
        yield AppError('App with ' + event.appId + ' does not exist');
      } else {
        yield await _mapUsrAndApp(
            usr, app, event.isPlaystore ? app : null, null);
      }
    } else if (theState is AppLoaded) {
      var app = theState.app;
      if (event is MemberUpdated) {
        if (theState is LoggedIn) {
          yield await theState.copyWith(event.member, theState.playStoreApp);
        } else {
          // impossible
        }
      } else if (event is SwitchAppEvent) {
        var app = await _fetchApp(event.appId);
        if (app == null) {
          yield AppError('App with ' + event.appId + ' does not exist');
        } else {
          yield await _mapOldStateToNewApp(
              state, app, theState.playStoreApp, null);
          navigatorBloc.add(GoHome());
        }
      } else if (event is LogoutEvent) {
          await AbstractMainRepositorySingleton.singleton
              .userRepository().signOut();
          yield await _mapUsrAndApp(null, app, theState.playStoreApp, null);
          navigatorBloc.add(GoHome());
        } else if (event is LoginEvent) {
          try {
            var usr = await AbstractMainRepositorySingleton.singleton
                .userRepository().signInWithGoogle();
            AccessState accessState;
            if (usr != null) {
              accessState = await _mapUsrAndApp(usr, app, theState.playStoreApp, event.actions);
            }
            yield accessState;
            if (accessState is LoggedInWithoutMembership) {
              navigatorBloc.add(GoHome());
            } else {
              if (event.actions != null) {
                event.actions.runTheAction();
              } else {
                navigatorBloc.add(GoHome());
              }
            }
          } catch (all) {
            debugPrint(all.toString());
          }
        } else if (event is AcceptedMembership) {
          var member = await _acceptMembership(event.member, app);
          yield await _mapMemberAndApp(event.usr, member, app, theState.playStoreApp, null);
          if (theState is LoggedInWithoutMembership) {
            if (theState.postLoginAction != null) {
              theState.postLoginAction.runTheAction();
            }
          } else {
            navigatorBloc.add(GoHome());
          }
        }
    } else {
      throw 'Unexpected state';
    }
  }

  Future<AccessState> _mapMemberAndApp(FirebaseUser usr, MemberModel member, AppModel app, AppModel playstoreApp, PostLoginAction postLoginAction) async {
    if (!isSubscibred(member, app)) {
      return await LoggedInWithoutMembership.getLoggedInWithoutMembership(usr, member, app, playstoreApp, postLoginAction);
    } else {
      return await LoggedInWithMembership.getLoggedInWithMembership(usr, member, app, playstoreApp);
    }
  }

  Future<AccessState> _mapOldStateToNewApp(AccessState state, AppModel app,  AppModel playstoreApp, PostLoginAction postLoginAction) async {
    if (state is LoggedIn) {
      if (!isSubscibred(state.member, app)) {
        return await LoggedInWithoutMembership.getLoggedInWithoutMembership(state.usr, state.member, app, playstoreApp, postLoginAction);
      } else {
        return await LoggedInWithMembership.getLoggedInWithMembership(state.usr, state.member, app, playstoreApp);
      }
    } else {
      return await LoggedOut.getLoggedOut(app, playstoreApp);
    }

  }

  Future<AccessState> _mapUsrAndApp(FirebaseUser usr, AppModel app, AppModel playstoreApp, PostLoginAction postLoginAction) async {
    if (usr == null) {
      return await LoggedOut.getLoggedOut(app, playstoreApp);
    } else {
      var member = await _firebaseToMemberModel(usr);
      if (member == null) {
        throw 'Can not find nor create member';
      } else {
        return _mapMemberAndApp(usr, member, app, playstoreApp, postLoginAction);
      }
    }
  }

  Future<MemberModel> _firebaseToMemberModel(FirebaseUser usr) async {
    var futureMemberModel = await memberRepository().get(usr.uid).then((member) async {
      if (member == null) {
        member = MemberModel(
            documentID: usr.uid,
            name: usr.displayName,
            email: usr.email,
            isAnonymous: usr.isAnonymous,
            photoURL: usr.photoUrl,
            subscriptions: [],
            /*items:[]*/);
        return await memberRepository()
            .add(member);
      } else {
        return member;
      }
    }).catchError((onError) {
      return null;
    });
    return futureMemberModel;
  }

  Future<MemberModel> _acceptMembership(MemberModel member, AppModel app) async {
    if (member == null) return null;
    if (isSubscibred(member, app)) return member;

    var subscriptions = member.subscriptions;
    subscriptions.add(MemberSubscriptionModel(documentID: newRandomKey(), app: app));
    member = member.copyWith(subscriptions: subscriptions);
    return await memberRepository().update(member);
  }

  @override
  Future<void> close() {
    return super.close();
  }

  /* Helper functions to get details from the AppState */
  static AccessBloc getBloc(BuildContext context) {
    return BlocProvider.of<AccessBloc>(context);
  }

  static bool isSubscibred(MemberModel member, AppModel app) {
    if (member == null) return false;
    if (member.subscriptions == null) return false;
    // if (member.subscriptions.length == 0) return false;

    var matches = member.subscriptions.where((subscription) => subscription.app != null ? subscription.app.documentID == app.documentID : false);
    return matches.isNotEmpty;
  }

  static MemberModel memberFor(AccessState state) {
    if (state is LoggedIn) {
      return state.member;
    }
    return null;
  }

  static AccessState getState(BuildContext context) {
    var state = BlocProvider.of<AccessBloc>(context).state;
    return state;
  }
  
  static AppModel app(BuildContext context) {
    var state = BlocProvider.of<AccessBloc>(context).state;
    if (state is AppLoaded) {
      return state.app;
    } else {
      return null;
    }
  }

  static String appId(BuildContext context) {
    var appState = BlocProvider.of<AccessBloc>(context).state;
    if (appState is AppLoaded) {
      return appState.app.documentID;
    }
    return null;
  }

  static String addPlayStoreApp(BuildContext context) {
    var appState = BlocProvider.of<AccessBloc>(context).state;
    if (appState is AppLoaded) {
      if (appState.playStoreApp == null) return null;
      if (appState.app.documentID == appState.playStoreApp.documentID) {
        return null;
      }
      return appState.playStoreApp.documentID;
    }
    return null;
  }

  static bool isPlayStoreApp(BuildContext context, String documentID) {
    var appState = BlocProvider.of<AccessBloc>(context).state;
    if (appState is AppLoaded) {
      return appState.playStoreApp.documentID == documentID;
    }
    return false;
  }

}
