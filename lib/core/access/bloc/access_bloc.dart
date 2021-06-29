import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/core/access/bloc/access_event.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';
import 'package:eliud_core/core/navigate/navigate_bloc.dart';
import 'package:eliud_core/core/navigate/navigation_event.dart';
import 'package:eliud_core/core/navigate/router.dart' as eliud_router;
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/access_model.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/model/member_subscription_model.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/tools/random.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// When subscribing the MapAccessEvent method, then this will be called before AccessBloc has handled the event, i.e. the state is the current state
typedef MapAccessEvent = void Function(AccessEvent event, AccessState state);

// When subscribing the MapAccessState method, then this will be called after AccessBloc has handled the event, i.e. the state is the new state
typedef MapAccessState = void Function(AccessEvent event, AccessState state);

class AccessBloc extends Bloc<AccessEvent, AccessState> {
  final List<MapAccessEvent> extraEventMappers = [];
  final List<MapAccessState> extraStateMappersBefore = [];
  final List<MapAccessState> extraStateMappersAfter = [];

  final NavigatorBloc? navigatorBloc;

  AccessBloc(this.navigatorBloc) : super(UndeterminedAccessState());

  Future<AppModel?> _fetchApp(String? id) async {
    return await AbstractMainRepositorySingleton.singleton
        .appRepository()!
        .get(id);
  }

  void addMapper(MapAccessEvent mapper) {
    extraEventMappers.add(mapper);
  }

  void addStateChangeListenerBefore(MapAccessState mapper) {
    extraStateMappersBefore.add(mapper);
  }

  void addStateChangeListenerAfter(MapAccessState mapper) {
    extraStateMappersAfter.add(mapper);
  }

  void _invokeMappers(AccessEvent event, AccessState state) {
    for (var i = 0; i < extraEventMappers.length; i++) {
      extraEventMappers[i](event, state);
    }
  }

  void _invokeStateChangeListenersBefore(AccessEvent event, AccessState state) {
    for (var i = 0; i < extraStateMappersBefore.length; i++) {
      extraStateMappersBefore[i](event, state);
    }
  }

  void _invokeStateChangeListenersAfter(AccessEvent event, AccessState state) {
    for (var i = 0; i < extraStateMappersAfter.length; i++) {
      extraStateMappersAfter[i](event, state);
    }
  }

  @override
  Stream<AccessState> mapEventToState(AccessEvent event) async* {
    _invokeMappers(event, state);
    var theState = state;
    if (event is InitApp) {
      _invokeStateChangeListenersBefore(event, theState);
      var usr = await AbstractMainRepositorySingleton.singleton
          .userRepository()!
          .currentSignedinUser();
      var app = await _fetchApp(event.appId);
      if (app == null) {
        var toYield = AppError('App with ' + event.appId! + ' does not exist');
        _invokeStateChangeListenersAfter(event, toYield);
        yield toYield;
      } else {
        var toYield =
            await _mapUsrAndApp(usr, app, event.isPlaystore! ? app : null, null);
        _invokeStateChangeListenersAfter(event, toYield);
        yield toYield;
      }
    } else if (theState is AppLoaded) {
      _invokeStateChangeListenersBefore(event, theState);
      var app = theState.app;
      if (event is MemberUpdated) {
        if ((event.member != null) && (theState is LoggedIn)) {
          var toYield =
              await theState.copyWith(event.member, theState.playStoreApp);

          var sameState = toYield == theState;
/*

          if (!sameState) {
*/
            _invokeStateChangeListenersAfter(event, toYield);
            yield toYield;
            if ((event.refresh != null) && event.refresh!) {
              if (navigatorBloc != null)
                navigatorBloc!.add(GoHome());
            }
/*
          }
*/
        } else {
          // Assumed the result of having logged out, which has been processed separately by the bloc already
        }
      } else if (event is SwitchAppAndPageEvent) {
        _invokeStateChangeListenersBefore(event, theState);
        var toYield = await AppProcessingState.getAppProcessingState(ProcessingType.SwitchAppAndPage, theState, app, theState.playStoreApp);
        yield toYield;
        add(SwitchAppAndPageProcessingEvent(event.appId, event.pageId, event.parameters));
      } else if (event is SwitchAppAndPageProcessingEvent) {
        var app = await _fetchApp(event.appId);
        if (app == null) {
          var toYield = AppError('App with ' + event.appId! + ' does not exist');
          _invokeStateChangeListenersAfter(event, toYield);
          yield toYield;
        } else {
          var toYield = await _mapOldStateToNewApp(
              state, app, theState.playStoreApp, null);
          _invokeStateChangeListenersAfter(event, toYield);
          yield toYield;
          if (navigatorBloc != null)
            navigatorBloc!
                .add(GoToPageEvent(event.pageId, parameters: event.parameters));
        }
      } else if (event is SwitchAppEvent) {
        _invokeStateChangeListenersBefore(event, theState);
        var toYield = await AppProcessingState.getAppProcessingState(ProcessingType.SwitchApp, theState, app, theState.playStoreApp);
        yield toYield;
        add(SwitchAppProcessingEvent(event.appId));
      } else if (event is SwitchAppProcessingEvent) {
        _invokeStateChangeListenersBefore(event, theState);
        var app = await _fetchApp(event.appId);
        if (app == null) {
          var toYield = AppError('App with ' + event.appId! + ' does not exist');
          _invokeStateChangeListenersAfter(event, toYield);
          yield toYield;
        } else {
          var toYield = await _mapOldStateToNewApp(
              state, app, theState.playStoreApp, null);
          _invokeStateChangeListenersAfter(event, toYield);
          yield toYield;
          if (navigatorBloc != null)
            navigatorBloc!.add(GoHome());
        }
      } else if (event is LogoutEvent) {
        _invokeStateChangeListenersBefore(event, theState);
        var toYield = await AppProcessingState.getAppProcessingState(ProcessingType.LogoutProcess, theState, app, theState.playStoreApp);
        yield toYield;
        add(LogoutProcessingEvent());
      } else if (event is LogoutProcessingEvent) {
        await AbstractMainRepositorySingleton.singleton
            .userRepository()!
            .signOut();
        var toYield =
        await _mapUsrAndApp(null, app, theState.playStoreApp, null);
        _invokeStateChangeListenersAfter(event, toYield);
        yield toYield;
        if (navigatorBloc != null)
          navigatorBloc!.add(GoHome());
      } else if (event is LoginEvent) {
        _invokeStateChangeListenersBefore(event, theState);
        try {
          var usr = await AbstractMainRepositorySingleton.singleton
              .userRepository()!
              .signInWithGoogle(navigatorBloc);
          if (usr != null) {
            add(GoogleLoginProcessEvent(
                event.actions,
                usr));
            var toYield = await AppProcessingState.getAppProcessingState(ProcessingType.LoginProcess, theState, app, theState.playStoreApp);
            yield toYield;
          }
        } catch (_) {
        }
      } else if (event is GoogleLoginProcessEvent) {
        var usr = event.usr;
        AccessState accessState = await _mapUsrAndApp(
            usr, app, theState.playStoreApp, event.actions);
        var toYield = accessState;
        _invokeStateChangeListenersAfter(event, toYield);
        yield toYield;
        if (accessState is LoggedInWithoutMembership) {
          if (navigatorBloc != null)
            navigatorBloc!.add(GoHome());
        } else {
          if (event.actions != null) {
            event.actions!.runTheAction();
          } else {
            if (navigatorBloc != null)
              navigatorBloc!.add(GoHome());
          }
        }
      } else if (event is AcceptedMembership) {
        _invokeStateChangeListenersBefore(event, theState);
        var member = await _acceptMembership(event.member, app);
        if (member != null) {
          var newState = await _mapMemberAndApp(
              event.usr, member, app, theState.playStoreApp, null);
          if (newState is LoggedInWithoutMembership) {
            if (newState.postLoginAction != null) {
              newState.postLoginAction!.runTheAction();
            }
          } else {
            if (navigatorBloc != null)
              navigatorBloc!.add(GoHome());
          }
          var toYield = newState;
          _invokeStateChangeListenersAfter(event, toYield);
          yield toYield;
        } else {
          eliud_router.Router.message(
              navigatorBloc, "You must accept membership");
        }
      }
    }
  }

  Future<AccessState> _mapMemberAndApp(
      User usr,
      MemberModel member,
      AppModel app,
      AppModel? playstoreApp,
      PostLoginAction? postLoginAction) async {
    if (!isSubscibred(member, app)) {
      return await LoggedInWithoutMembership.getLoggedInWithoutMembership(
          usr, member, app, playstoreApp, postLoginAction);
    } else {
      return await LoggedInWithMembership.getLoggedInWithMembership(
          usr, member, app, playstoreApp);
    }
  }

  Future<AccessState> _mapOldStateToNewApp(AccessState state, AppModel app,
      AppModel? playstoreApp, PostLoginAction? postLoginAction) async {
    if (state is AppProcessingState) {
      state = state.stateBeforeProcessing;
      if (state is LoggedIn) {
        if (!isSubscibred(state.member, app)) {
          return await LoggedInWithoutMembership.getLoggedInWithoutMembership(
              state.usr, state.member, app, playstoreApp, postLoginAction);
        } else {
          return await LoggedInWithMembership.getLoggedInWithMembership(
              state.usr, state.member, app, playstoreApp);
        }
      }
    }
    return await LoggedOut.getLoggedOut(app, playstoreApp);
  }

  Future<AccessState> _mapUsrAndApp(User? usr, AppModel app,
      AppModel? playstoreApp, PostLoginAction? postLoginAction) async {
    if (usr == null) {
      return await LoggedOut.getLoggedOut(app, playstoreApp);
    } else {
      var member = await firebaseToMemberModel(usr);
      if (member == null) {
        throw 'Can not find nor create member';
      } else {
        return _mapMemberAndApp(
            usr, member, app, playstoreApp, postLoginAction);
      }
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
    if (member == null) return null;
    if (isSubscibred(member, app)) return member;

    var subscriptions = member.subscriptions!;
    subscriptions
        .add(MemberSubscriptionModel(documentID: newRandomKey(), app: app));
    member = member.copyWith(subscriptions: subscriptions);
    var returnMe = await memberRepository()!.update(member);

    var accessModel = await accessRepository(appId: app.documentID)!.get(member.documentID);
    if (accessModel == null) {
      // create an access entry. creation with privilege level 0 is allowed
      await accessRepository(appId: app.documentID)!.add(AccessModel(
        documentID: member.documentID,
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

  static MemberModel? memberFor(AccessState state) {
    if (state is LoggedIn) {
      return state.member;
    }
    return null;
  }

  static MemberModel? member(BuildContext context) {
    var state = BlocProvider.of<AccessBloc>(context).state;
    if (state is AppLoaded) {
      return state.getMember();
    } else {
      return null;
    }
  }

  static AccessState getState(BuildContext context) {
    AccessState state = BlocProvider.of<AccessBloc>(context).state;
    return state;
  }

  static AppModel? app(BuildContext context) {
    var state = BlocProvider.of<AccessBloc>(context).state;
    if (state is AppLoaded) {
      return state.app;
    } else {
      return null;
    }
  }

  static String? appId(BuildContext context) {
    AccessState appState = BlocProvider.of<AccessBloc>(context).state;
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
    AccessState appState = BlocProvider.of<AccessBloc>(context).state;
    return playStoreApp(appState);
  }

  static bool isPlayStoreApp(BuildContext context, String documentID) {
    AccessState appState = BlocProvider.of<AccessBloc>(context).state;
    if (appState is AppLoaded) {
      if (appState.playStoreApp != null) {
        return appState.playStoreApp!.documentID == documentID;
      }
    }
    return false;
  }

}
