import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:eliud_core/core/blocs/access/state/access_determined.dart';
import 'package:eliud_core/core/navigate/router.dart' as eliudrouter;
import 'package:eliud_core/core/blocs/access/state/access_state.dart';
import 'package:eliud_core/core/blocs/access/state/logged_out.dart';
import 'package:eliud_core/core/blocs/access/state/undertermined_access_state.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/access_model.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/model/member_subscription_model.dart';
import 'package:eliud_core/model/page_model.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/tools/random.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'access_event.dart';
import 'state/logged_in.dart';

class AccessBloc extends Bloc<AccessEvent, AccessState> {
  StreamSubscription? _appSubscription;
  final GlobalKey<NavigatorState> navigatorKey;

  AccessBloc(this.navigatorKey) : super(UndeterminedAccessState());

  @override
  Stream<AccessState> mapEventToState(AccessEvent event) async* {
    var theState = state;
    if (event is AccessInit) {
      var usr = await AbstractMainRepositorySingleton.singleton
          .userRepository()!
          .currentSignedinUser();
      yield await _mapUsrAndApp(event.app, [event.app], usr, null);
    } else if (theState is AccessDetermined) {
      if (event is LogoutEvent) {
        await AbstractMainRepositorySingleton.singleton
            .userRepository()!
            .signOut();
        var toYield = await _mapUsrAndApp(theState.currentApp, theState.apps, null, null);
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
        yield await _mapUsrAndApp(theState.currentApp, theState.apps, usr, event.actions);
        if (event.actions != null) {
          event.actions!.runTheAction();
        }
      } else if (event is SelectApp) {
        yield await switchApp(theState, event.app);
      } else if (event is SelectAppWithID) {
        yield await switchApp(theState, await _fetchApp(event.appId));
      } else if (event is AppUpdated) {
        yield await theState.updateApp(event.app);
      } else if (event is GotoPageEvent) {
        var page = await pageRepository(appId: event.appId)!.get(event.pageId);
        if (page != null) {
          var newState = await theState.switchPage(page, parameters: event.parameters);
//        newState.accessAction = null;
          yield newState;
/*
          gotoPage(event.appId, event.pageId, parameters: event.parameters);
          yield await theState.switchPage(page, parameters: event.parameters);
*/
        } else {
          print('Trying to open page ' + event.pageId + ' in app ' + event.appId + "which doesn't exist");
        }
      } else if (event is OpenDialogEvent) {
        var dialog = await dialogRepository(appId: theState.currentAppId())!.get(event.dialogId);
        if (dialog != null) {
          yield await theState.openDialog(
              dialog, parameters: event.parameters);
        } else {
          print('Trying to open dialog ' + event.dialogId + ' in app ' + theState.currentAppId() + "which doesn't exist");
        }
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

  Future<AccessDetermined> switchApp(AccessDetermined accessState, AppModel app) async {
    var accessDetermined = accessState.switchApp(app);
/*
    var currentContext = accessState.currentContext;
    if (currentContext is PageContext) {
      gotoPage(app.documentID!, currentContext.page.documentID!);
    }
*/
    return accessDetermined;
  }

/*
  Future<void> gotoPage(String appId, String pageId, { Map<String, dynamic>? parameters }) async {
    if (navigatorKey.currentState != null) {
      await navigatorKey.currentState!.pushNamed(
          eliudrouter.Router.pageRoute, arguments: eliudrouter.Arguments(
          appId + '/' + pageId, parameters));
    } else {
      throw Exception("Can't pushNamed page $appId/$pageId because navigatorKey.currentState is null");
    }
  }
*/

  Stream<AccessState> _listenToApp(String appId) async* {
    await _appSubscription?.cancel();
    _appSubscription = appRepository(appId: appId)!.listenTo(appId, (value) {
      if (value != null) add(AppUpdated(value));
    });
  }

  Future<AccessState> _mapMemberAndApp(User usr, MemberModel member, AppModel currentApp,
      List<AppModel> apps, PostLoginAction? postLoginAction) async {
    return await LoggedIn.getLoggedIn(usr, member, currentApp, apps, postLoginAction);
  }

  Future<AccessState> _mapUsrAndApp(AppModel currentApp,
      List<AppModel> apps, User? usr, PostLoginAction? postLoginAction) async {
    if (usr == null) {
      return await LoggedOut.getLoggedOut(currentApp, apps);
    } else {
      var member = await firebaseToMemberModel(usr);
      return _mapMemberAndApp(usr, member, currentApp, apps, postLoginAction);
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
    var theState = AccessBloc.getState(context);
    if (theState is AccessDetermined) {
      return theState.memberIsOwner(theState.currentApp.documentID!);
    } else {
      return false;
    }
  }

  static AppModel currentApp(BuildContext context) {
    var theState = AccessBloc.getState(context);
    if (theState is AccessDetermined) {
      return theState.currentApp;
    } else {
      throw Exception('No current app');
    }
  }

  static String currentAppId(BuildContext context) {
    var theState = AccessBloc.getState(context);
    if (theState is AccessDetermined) {
      return theState.currentApp.documentID!;
    } else {
      throw Exception('No current app');
    }
  }

  static AccessState getState(BuildContext context) {
    var state = BlocProvider.of<AccessBloc>(context).state;
    return state;
  }

  Future<AppModel> _fetchApp(String id) async {
    var appModel = await AbstractMainRepositorySingleton.singleton
        .appRepository()!
        .get(id);
    if (appModel == null) {
      throw Exception("Unable to find app with id '$id");
    } else {
      return appModel;
    }
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