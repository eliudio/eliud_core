import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:eliud_core/core/navigate/navigate_bloc.dart';
import 'package:eliud_core/core/navigate/navigation_event.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/model/member_subscription_model.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
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

  @override
  Stream<AccessState> mapEventToState(AccessEvent event) async* {
    var theState = state;
    if (event is InitApp) {
      var usr = await AbstractMainRepositorySingleton.singleton.userRepository().currentSignedinUser();
      yield await _mapUsrAndApp(usr, event.app, null);
    } else if (theState is AccessStateWithDetails) {
      var app = theState.app;
      if (event is MemberUpdated) {
        if (theState is LoggedIn) {
          yield theState.copyWith(member: event.member);
        } else {
          // impossible
        }
      } else if (event is SwitchedApp) {
        yield _mapOldStateToNewApp(state, event.app, null);
      } else if (event is LogoutEvent) {
          await AbstractMainRepositorySingleton.singleton
              .userRepository().signOut();
          yield await _mapUsrAndApp(null, app, null);
          navigatorBloc.add(GoHome());
        } else if (event is LoginEvent) {
          try {
            var usr = await AbstractMainRepositorySingleton.singleton
                .userRepository().signInWithGoogle();
            AccessState accessState;
            if (usr != null) {
              accessState = await _mapUsrAndApp(usr, app, event.actions);
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
          yield await _mapMemberAndApp(event.usr, member, app, null);
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

  AccessState _mapMemberAndApp(FirebaseUser usr, MemberModel member, AppModel app, PostLoginAction postLoginAction) {
    if (!isSubscibred(member, app)) {
      return LoggedInWithoutMembership(usr: usr, member: member, app: app, postLoginAction: postLoginAction);
    } else {
      return LoggedInWithMembership(usr: usr, member: member, app: app);
    }

  }

  AccessState _mapOldStateToNewApp(AccessState state, AppModel app, PostLoginAction postLoginAction) {
    if (state is LoggedIn) {
      if (!isSubscibred(state.member, app)) {
        return LoggedInWithoutMembership(usr: state.usr, member: state.member, app: app, postLoginAction: postLoginAction);
      } else {
        return LoggedInWithMembership(usr: state.usr, member: state.member, app: app);
      }
    } else {
      return LoggedOut(app);
    }

  }

  Future<AccessState> _mapUsrAndApp(FirebaseUser usr, AppModel app, PostLoginAction postLoginAction) async {
    if (usr == null) {
      return LoggedOut(app);
    } else {
      var member = await _firebaseToMemberModel(usr);
      if (member == null) {
        throw 'Can not find nor create member';
      } else {
        return _mapMemberAndApp(usr, member, app, postLoginAction);
      }
    }
  }

  Future<MemberModel> _firebaseToMemberModel(FirebaseUser usr) async {
    var futureMemberModel = await AbstractRepositorySingleton.singleton.memberRepository().get(usr.uid).then((member) async {
      if (member == null) {
        member = MemberModel(
            documentID: usr.uid,
            name: usr.displayName,
            email: usr.email,
            isAnonymous: usr.isAnonymous,
            photoURL: usr.photoUrl,
            subscriptions: [],
            /*items:[]*/);
        return await AbstractRepositorySingleton.singleton.memberRepository()
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
    return await AbstractRepositorySingleton.singleton.memberRepository().update(member);
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
    return BlocProvider.of<AccessBloc>(context).state;
  }

}
