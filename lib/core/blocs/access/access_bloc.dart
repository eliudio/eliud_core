import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:eliud_core/core/blocs/access/state/access_determined.dart';
import 'package:eliud_core/core/blocs/access/state/access_state.dart';
import 'package:eliud_core/core/blocs/access/state/logged_out.dart';
import 'package:eliud_core/core/blocs/access/state/undertermined_access_state.dart';
import 'package:eliud_core/core/blocs/app/app_bloc.dart';
import 'package:eliud_core/core/blocs/app/app_state.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/access_model.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/model/member_subscription_model.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/tools/random.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'access_event.dart';
import 'state/logged_in.dart';

class AccessBloc extends Bloc<AccessEvent, AccessState> {
  AccessBloc() : super(UndeterminedAccessState());

  @override
  Stream<AccessState> mapEventToState(AccessEvent event) async* {
    var theState = state;
    if (event is AccessInit) {
      var usr = await AbstractMainRepositorySingleton.singleton
          .userRepository()!
          .currentSignedinUser();
      var toYield = await _mapUsrAndApp([event.app], usr, null);
      yield toYield;
    } else if (theState is AccessDetermined) {
      if (event is MemberUpdated) {
        if ((event.member != null) && (theState is LoggedIn)) {
          yield await theState.copyWith(event.member);
        } else {
          // Assumed the result of having logged out, which has been processed separately by the bloc already
        }
      } else if (event is LogoutEvent) {
        await AbstractMainRepositorySingleton.singleton
            .userRepository()!
            .signOut();
        var toYield = await _mapUsrAndApp(theState.apps, null, null);
        yield toYield;
      } else if (event is LoginEvent) {
        var usr;
        try {
          usr = await AbstractMainRepositorySingleton.singleton
              .userRepository()!
              .signInWithGoogle();
        } catch (exception) {
          print('Exception during signInWithGoogle: $exception');
        }
        yield await _mapUsrAndApp(theState.apps, usr, event.actions);
        if (event.actions != null) {
          event.actions!.runTheAction();
        }
      } else if (event is AddAppEvent) {
        // reconstruct current state and include the new app, i.e.
/*
        state.copyWith(expand existing apps + the event.app)
        this copy should make sure the page, dialog and package settings are set appropriatly but in an efficient way, ie. copy what exists and change
*/
      } else if (event is UpdatePackageCondition) {
/*
        change the condition for this package, for this app
        yield the changed access state with this condition
*/
      }
/*
      } else if (event is AcceptedMembership) {
        // accept membership
        // add app to state so that access is re-determined
        var _member = theState.getMember();
        if (_member != null) {
          _invokeStateChangeListenersBefore(event, theState);
          var member = await _acceptMembership(_member, event.app);
          if (member != null) {
            var newState = await _mapMemberAndApp(
                event.usr, member, app, theState.playStoreApp, null);
            if (newState is LoggedInWithoutMembership) {
              if (newState.postLoginAction != null) {
                newState.postLoginAction!.runTheAction();
              }
            }
            var toYield = newState;
            _invokeStateChangeListenersAfter(event, toYield);
            yield toYield;
          } else {
            eliud_router.Router.message(
                navigationBloc, 'You must accept membership');
          }
        }
      } else if (event is ChangePrivilegeEvent) {
        if (state is LoggedInWithMembership) {
          var theState = state as LoggedInWithMembership;
          if ((state.getMember() != null) &&
              (state.getMember()!.documentID! == theState.app.ownerID!)) {
            // if the current member is the owner, he can change his privilege
            // this can be done for the owner to look at the app with a different priv. to "test" that priv.
            var toYield = await theState.copyWithOtherPrivilege(
                event.privilege, event.blocked);
            yield toYield;
          }
        }
*/
    }
  }

  Future<AccessState> _mapMemberAndApp(User usr, MemberModel member,
      List<AppModel> apps, PostLoginAction? postLoginAction) async {
    return await LoggedIn.getLoggedIn(usr, member, apps, postLoginAction);
  }

  Future<AccessState> _mapUsrAndApp(
      List<AppModel> apps, User? usr, PostLoginAction? postLoginAction) async {
    if (usr == null) {
      return await LoggedOut.getLoggedOut(apps);
    } else {
      var member = await firebaseToMemberModel(usr);
      return _mapMemberAndApp(usr, member, apps, postLoginAction);
    }
  }

  static Future<MemberModel> firebaseToMemberModel(User usr) async {
    var futureMemberModel =
        await memberRepository()!.get(usr.uid).then((member) async {
      if (member == null) {
        member = MemberModel(
          documentID: usr.uid,
          name: usr.displayName,
          email: usr.email,
          isAnonymous: usr.isAnonymous,
          photoURL: usr.photoURL,
          subscriptions: [],
          /*items:[]*/
        );
        return await memberRepository()!.add(member);
      } else {
        return member;
      }
    }).catchError((onError) {
      return null;
    });
    return futureMemberModel;
  }

  Future<MemberModel?> _acceptMembership(
      MemberModel member, AppModel app) async {
    if (isSubscibred(member, app)) return member;

    var subscriptions = member.subscriptions!;
    subscriptions
        .add(MemberSubscriptionModel(documentID: newRandomKey(), app: app));
    member = member.copyWith(subscriptions: subscriptions);
    var returnMe = await memberRepository()!.update(member);

    var accessModel =
        await accessRepository(appId: app.documentID)!.get(member.documentID);
    if (accessModel == null) {
      // create an access entry. creation with privilege level 0 is allowed
      await accessRepository(appId: app.documentID)!.add(AccessModel(
        documentID: member.documentID,
        appId: app.documentID,
        privilegeLevel: PrivilegeLevel.NoPrivilege,
        points: 0,
      ));
    }

    return returnMe;
  }

  @override
  Future<void> close() {
    return super.close();
  }

  /* Helper functions to get details from the AppState */
  static AccessBloc getBloc(BuildContext context) {
    return BlocProvider.of<AccessBloc>(context);
  }

  static bool isSubscibred(MemberModel? member, AppModel app) {
    if (member == null) return false;
    if (member.subscriptions == null) return false;
    // if (member.subscriptions.length == 0) return false;

    var matches = member.subscriptions!.where((subscription) =>
        subscription.app != null
            ? subscription.app!.documentID == app.documentID
            : false);
    return matches.isNotEmpty;
  }
/*
  static MemberModel? memberFor(AccessState state) {
    if (state is LoggedIn) {
      return state.member;
    }
    return null;
  }*/

  static MemberModel? member(BuildContext context) {
    var state = BlocProvider.of<AccessBloc>(context).state;
    if (state is AccessDetermined) {
      return state.getMember();
    } else {
      return null;
    }
  }

  static bool isOwner(BuildContext context) {
    return AccessBloc.getState(context).memberIsOwner(AppBloc.currentAppId(context));
  }

  static AccessState getState(BuildContext context) {
    var state = BlocProvider.of<AccessBloc>(context).state;
    return state;
  }

/*  static AppModel? app(BuildContext context) {
    var state = BlocProvider.of<AccessBloc>(context).state;
    if (state is AppLoaded) {
      return state.app;
    } else {
      return null;
    }
  }

  static String? appId(BuildContext context) {
    var appState = BlocProvider.of<AccessBloc>(context).state;
    if (appState is AppLoaded) {
      return appState.app.documentID;
    }
    return null;
  }

  static String? playStoreApp(AccessState appState) {
    if (appState is AppLoaded) {
      if (appState.playStoreApp == null) return null;
      if (appState.app.documentID == appState.playStoreApp!.documentID) {
        return null;
      }
      return appState.playStoreApp!.documentID;
    }
    return null;
  }

  static String? addPlayStoreApp(BuildContext context) {
    var appState = BlocProvider.of<AccessBloc>(context).state;
    return playStoreApp(appState);
  }

  static bool isPlayStoreApp(BuildContext context, String documentID) {
    var appState = BlocProvider.of<AccessBloc>(context).state;
    if (appState is AppLoaded) {
      if (appState.playStoreApp != null) {
        return appState.playStoreApp!.documentID == documentID;
      }
    }
    return false;
  }*/
}
