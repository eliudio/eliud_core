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
import 'package:eliud_core/style/style_registry.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'access_event.dart';
import 'state/logged_in.dart';

class AccessBloc extends Bloc<AccessEvent, AccessState> {
  final Map<String, StreamSubscription<AppModel?>> _appSubscription = {};
  final Map<String, StreamSubscription<AccessModel?>> _accessSubscription = {};
  StreamSubscription<MemberModel?>? _memberSubscription;
  final GlobalKey<NavigatorState> navigatorKey;

  AccessBloc(this.navigatorKey) : super(UndeterminedAccessState()) {
    on<AccessInitEvent>((event, emit) async {
      var usr = await AbstractMainRepositorySingleton.singleton
          .userRepository()!
          .currentSignedinUser();

      if (usr == null) {
        await StyleRegistry.registry()
            .addApp(null, event.app, () => _currentStyleChanged(event.app));
        _listenToApp(event.app.documentID, null);
        emit(await LoggedOut.getLoggedOut2(this, event.app,
            playstoreApp: event.playstoreApp));
      } else {
        var member = await firebaseToMemberModel(usr);
        _listenToMember(member);
        await StyleRegistry.registry()
            .addApp(member, event.app, () => _currentStyleChanged(event.app));

        _listenToApp(event.app.documentID, member);
        emit(await LoggedIn.getLoggedIn2(
            this, usr, member, event.app, LoggedIn.getSubscriptions(member),
            playstoreApp: event.playstoreApp));
      }
    });
    on<GoHome>((event, emit) async {
      var theState = state as AccessDetermined;
      if (event.isProcessing()) {
        var appId = event.app.documentID;
        var app = theState.getApp(appId);
        var homePage = (event.redetermine && (app != null))
            ? await theState.reterminedHomePageForAppId(app)
            : theState.homePageForAppId(appId);
        gotoPage(true, event.app.documentID,
            homePage == null ? null : homePage.documentID,
            errorString:
                'Homepage not set correct for app ' + event.app.documentID);
        emit(theState.asNotProcessing());
      } else {
        add(event.asProcessing());
        emit(theState.asProcessing());
      }
    });
    on<LogoutEvent>((event, emit) async {
      var theState = state as AccessDetermined;
      _stopListenToMember();
      if (event.isProcessing()) {
        await AbstractMainRepositorySingleton.singleton
            .userRepository()!
            .signOut();
        var toEmit = await LoggedOut.getLoggedOut(this,
            theState.apps.map((determinedApp) => determinedApp.app).toList(),
            playstoreApp: theState.playstoreApp);
        var homePage = toEmit.homePageForAppId(event.app.documentID);
        gotoPage(true, event.app.documentID,
            homePage == null ? null : homePage.documentID,
            errorString:
                'Homepage not set correct for app ' + event.app.documentID);
        emit(toEmit);
      } else {
        add(event.asProcessing());
        emit(theState.asProcessing());
      }
    });

    on<LoginEvent>((event, emit) async {
      var theState = state as AccessDetermined;
      if (event.isProcessing()) {
        var usr;
        try {
          switch (event.loginType) {
            case LoginType.GoogleLogin:
              usr = await AbstractMainRepositorySingleton.singleton
                  .userRepository()!
                  .signInWithGoogle();
              break;
            case LoginType.AppleLogin:
              usr = await AbstractMainRepositorySingleton.singleton
                  .userRepository()!
                  .signInWithApple();
              break;
          }
        } catch (exception) {
          print('Exception during signInWithGoogle: $exception');
        }
        if (usr != null) {
          var member = await firebaseToMemberModel(usr);
          var toEmit = await LoggedIn.getLoggedIn(
              this,
              usr,
              member,
              theState.apps.map((determinedApp) => determinedApp.app).toList(),
              null,
              LoggedIn.getSubscriptions(member),
              playstoreApp: theState.playstoreApp);
          _resetAccessListeners(
              theState.apps.map((e) => e.app.documentID).toList(),
              member.documentID);

          _listenToMember(member);
          emit(toEmit);
          if (event.actions != null) {
            event.actions!.runTheAction();
          } else {
            var homePage = toEmit.homePageForAppId(event.app.documentID);
            gotoPage(true, event.app.documentID,
                homePage == null ? null : homePage.documentID,
                errorString: 'Homepage not set correct for app ' +
                    event.app.documentID);
          }
        }
      } else {
        add(event.asProcessing());
        emit(theState.asProcessing());
      }
    });

    on<SwitchAppWithIDEvent>((event, emit) async {
      var theState = state as AccessDetermined;
      if (event.isProcessing()) {
        var app = await _fetchApp(event.appId);
        await StyleRegistry.registry()
            .addApp(state.getMember(), app, () => _currentStyleChanged(app));
        var newState = await theState.asNotProcessing().addApp(this, app);
        var homePage = newState.homePageForAppId(event.appId);
        gotoPage(
            false, event.appId, homePage == null ? null : homePage.documentID,
            errorString: 'Homepage not set correct for app ' + event.appId);

        _listenToApp(event.appId, theState.getMember());
        emit(newState);
      } else {
        add(event.asProcessing());
        emit(theState.asProcessing());
      }
    });

    on<MemberUpdatedEvent>((event, emit) async {
      if (state is AccessDetermined) {
        var theState = state as AccessDetermined;
        var newState = await theState.updateMember(event.member);
        emit(newState);
      }
    });

    on<AppUpdatedEvent>((event, emit) async {
      if (state is AccessDetermined) {
        var theState = state as AccessDetermined;
        var newState = await theState.updateApp2(this, event.app);
        await StyleRegistry.registry().addApp(
            state.getMember(), event.app, () =>
            _currentStyleChanged(event.app));
        emit(newState);
      }
    });

    on<RefreshAppEvent>((event, emit) async {
      if (state is AccessDetermined) {
        var theState = state as AccessDetermined;
        var newState = theState.newVersion();
        emit(newState);
      }
    });

    on<GotoPageEvent>((event, emit) async {
      // NAVIGATION-USING-BLOC: Navigation within the context of using bloc should use BlocListener. However, there are issues with that, see : https://github.com/felangel/bloc/issues/2938
      // When this would get resolved, then we can use theState.switchPage(page, parameters: event.parameters)
      // and remove the navigation from here:
      gotoPage(false, event.app.documentID, event.pageId,
          parameters: event.parameters, errorString: 'Page not does not exist');
    });

    on<OpenDialogEvent>((event, emit) async {
      // See comment @ GotoPageEvent
      // We should use theState.openDialog(`dialog, parameters: event.parameters);
    });

    on<UpdatePackageConditionEvent>((event, emit) async {
      if (state is AccessDetermined) {
        var theState = state as AccessDetermined;
        var newState = theState.withDifferentPackageCondition(
            event.app.documentID,
            event.package,
            event.packageCondition,
            event.condition);
        emit(newState);
      }
    });

    on<PrivilegeChangedEvent>((event, emit) async {
      if (state is AccessDetermined) {
        var theState = state as AccessDetermined;
        emit(await theState.withOtherPrivilege(
            this, event.app, event.privilege, event.blocked));
      }
    });

    on<AcceptedMembershipEvent>((event, emit) async {
      if (state is AccessDetermined) {
        var theState = state as AccessDetermined;
        if (theState is LoggedIn) {
          var _member = theState.getMember();
          if (_member != null) {
            await LoggedIn.acceptMembership(_member, event.app);
/*
            var newState = await theState.withSubscriptions(getSubscriptions(member));
            if (newState.postLoginAction != null) {
              newState.postLoginAction!.runTheAction();
            }
            emit(newState);
*/
          }
        }
      }
    });

    on<AccessUpdatedEvent>((event, emit) async {
      if (state is AccessDetermined) {
        var theState = state as AccessDetermined;
        emit(await theState.withNewAccess(this, event.access));
      }
    });
  }

  void _currentStyleChanged(AppModel app) {
    add(RefreshAppEvent(app));
  }

  void gotoPage(bool clearHistory, String? appId, String? pageId,
      {Map<String, dynamic>? parameters, String? errorString}) {
    if (appId == null) {
      throw Exception('Error: gotoPage(null)');
    }
    if (pageId != null) {
      if (navigatorKey.currentState != null) {
        if (clearHistory) {
          navigatorKey.currentState!.pushNamedAndRemoveUntil(
              eliudrouter.Router.pageRoute, (_) => false,
              arguments:
                  eliudrouter.Arguments(appId + '/' + pageId, parameters));
        } else {
          navigatorKey.currentState!.pushNamed(eliudrouter.Router.pageRoute,
              arguments:
                  eliudrouter.Arguments(appId + '/' + pageId, parameters));
        }
      } else {
        throw Exception(
            "Can't pushNamed page $appId/$pageId because navigatorKey.currentState is null");
      }
    } else {
      if (clearHistory) {
        navigatorKey.currentState!.pushNamedAndRemoveUntil(
            eliudrouter.Router.messageRoute, (_) => false,
            arguments: eliudrouter.Arguments(appId, {'message': errorString}));
      } else {
        navigatorKey.currentState!.pushNamed(eliudrouter.Router.messageRoute,
            arguments: eliudrouter.Arguments(appId, {'message': errorString}));
      }
    }
  }

  void _listenToApp(String appId, MemberModel? member) async {
    await _appSubscription[appId]?.cancel();
    _appSubscription[appId] =
        appRepository(appId: appId)!.listenTo(appId, (value) {
      if (value != null) add(AppUpdatedEvent(value));
    });

    if (member != null) {
      _accessSubscription[appId] =
          accessRepository(appId: appId)!.listenTo(member.documentID, (value) {
        if (value != null) add(AccessUpdatedEvent(value));
      });
    }
  }

  void _listenToMember(MemberModel member) async {
    await _memberSubscription?.cancel();
    _memberSubscription =
        memberRepository()!.listenTo(member.documentID, (value) {
      if (value != null) add(MemberUpdatedEvent(value));
    });
  }

  void _stopListenToMember() async {
    await _memberSubscription?.cancel();
  }

  void _resetAccessListeners(List<String> apps, String memberId) async {
    for (var _as in _accessSubscription.values) {
      await _as.cancel();
    }
    for (var appId in apps) {
      _accessSubscription[appId] =
          accessRepository(appId: appId)!.listenTo(memberId, (value) {
        if (value != null) add(AccessUpdatedEvent(value));
      });
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
      print('Exception in firebaseToMemberModel ' + onError.toString());
    });
    return futureMemberModel;
  }

  @override
  Future<void> close() {
    return super.close();
  }

  /* Helper functions to get details from the AppState */
  static AccessBloc getBloc(BuildContext context) {
    return BlocProvider.of<AccessBloc>(context);
  }

  static MemberModel? member(BuildContext context) {
    var state = BlocProvider.of<AccessBloc>(context).state;
    if (state is AccessDetermined) {
      return state.getMember();
    } else {
      return null;
    }
  }

  static String? memberId(BuildContext context) {
    var _member = member(context);
    return (_member != null) ? _member.documentID : null;
  }

  static bool isOwner(BuildContext context, AppModel app) {
    var theState = AccessBloc.getState(context);
    if (theState is AccessDetermined) {
      if (app.ownerID != null) {
        return theState.memberIsOwner(app.documentID);
      }
    }
    return false;
  }

/*
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
      return theState.currentApp.documentID;
    } else {
      throw Exception('No current app');
    }
  }

  static String currentOwnerId(BuildContext context) {
    var theState = AccessBloc.getState(context);
    if (theState is AccessDetermined) {
      return theState.currentApp.ownerID!;
    } else {
      throw Exception('No current app');
    }
  }
*/

  static AccessState getState(BuildContext context) {
    var accessBloc = BlocProvider.of<AccessBloc>(context);
    var state = accessBloc.state;
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
}
