import 'package:eliud_core/core/app/app_state.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/model/menu_item_model.dart';
import 'package:eliud_core/model/page_model.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:eliud_core/core/access/bloc/access_event.dart';

import '../../global_data.dart';

abstract class AccessState extends Equatable {
  const AccessState();

  @override
  List<Object> get props => [];

  bool isLoggedIn();
  bool hasAccessToOtherApps();
  bool forceAcceptMembership();
  bool memberIsOwner(AppState appState);
}

class UndeterminedAccessState extends AccessState {
  UndeterminedAccessState();

  @override
  bool isLoggedIn() => false;

  @override
  bool hasAccessToOtherApps() => false;

  @override
  bool forceAcceptMembership() => false;

  @override
  bool memberIsOwner(AppState appState) => false;
}

abstract class AccessStateWithDetails extends AccessState {
  final AppModel app;
  final Map<String, bool> pagesAccess = {};

  AccessStateWithDetails(this.app);

  Future<bool> _conditionOkForPackage(String packageCondition, AppModel app, MemberModel member, bool isOwner) async {
    for (var i = 0; i < GlobalData.registeredPackages.length; i++) {
      var plg = GlobalData.registeredPackages[i];
      var plgOk = await plg.isConditionOk(packageCondition, app, member, isOwner);
      if (plgOk != null) {
        return plgOk;
      }
    }
    return false;
  }

  Future<bool> _conditionOk(AppModel app, MemberModel member, PageCondition condition, String packageCondition, bool isOwner) async {
    if (condition == null) return true;
    switch (condition) {
      case PageCondition.Always: return true;
      case PageCondition.MustBeLoggedIn: return isLoggedIn();
      case PageCondition.MustNotBeLoggedIn: return !isLoggedIn();
      case PageCondition.PackageDecides: return await _conditionOkForPackage(packageCondition, app, member, isOwner);
      case PageCondition.AdminOnly: return isOwner;
      case PageCondition.Unknown: return true;
    }
    return true;
  }

  Future<void> init(MemberModel member, AppModel app) async {
    var isOwner = member != null && member.documentID == app.ownerID;
    var theList = await AbstractRepositorySingleton.singleton.pageRepository(app.documentID).valuesList();
    for (var i = 0; i < theList.length; i++) {
      var page = theList[i];
      pagesAccess[page.documentID] = await _conditionOk(app, member, page.conditional, page.packageCondition, isOwner);
    }
  }

  bool hasAccess(MenuItemModel item) {
    try {
      var action = item.action;
      if (action is GotoPage) {
        var pageID = action.pageID;
        var access = pagesAccess[pageID];
        if (access == null) return false;
        return access;
      } else if (action is PopupMenu) {
        var access = false;
        action.menuDef.menuItems.forEach((item) {
          if (hasAccess(item)) access = true;
        });
        return access;
      } else if (action is InternalAction){
        if (action.internalActionEnum == InternalActionEnum.Login) {
          return !isLoggedIn();
        } else if (action.internalActionEnum == InternalActionEnum.Logout) {
          return isLoggedIn();
        } else if (action.internalActionEnum == InternalActionEnum.OtherApps) {
          return hasAccessToOtherApps();
        }
        else if (action.internalActionEnum == InternalActionEnum.Flush) {
          return true;
        }
        return true;
      }
    } catch (_) {
      return false;
    };
    return false;
  }

  List<bool> hasNAccess(AccessState state, List<MenuItemModel> items) {
    return items.map((e) => hasAccess(e)).toList();
  }}

class LoggedOut extends AccessStateWithDetails {

  LoggedOut(AppModel app): super(app) {
    init(null, app);
  }

  @override
  bool hasAccessToOtherApps() => false;

  @override
  bool isLoggedIn() => false;

  @override
  bool forceAcceptMembership() => false;

  @override
  bool memberIsOwner(AppState appState) => false;
}

abstract class LoggedIn extends AccessStateWithDetails {
  final FirebaseUser usr;
  final MemberModel member;

  LoggedIn({this.usr, this.member, AppModel app}) : super(app) {
    init(member, app);
  }

  @override
  bool hasAccessToOtherApps() {
    return member.subscriptions.length > 1;
  }

  @override
  bool isLoggedIn() => true;

  String memberProfilePhoto() {
    return member.photoURL;
  }

  @override
  bool memberIsOwner(AppState appState) {
    if (appState is AppLoaded) {
      return member.documentID == appState.app.ownerID;
    } else {
      return false;
    }
  }

  LoggedIn copyWith({ MemberModel member});
}

class LoggedInWithoutMembership extends LoggedIn {
  // What is the event that should be triggered after the membership will be accepted...
  final PostLoginAction postLoginAction;
  LoggedInWithoutMembership({FirebaseUser usr, MemberModel member, AppModel app, this.postLoginAction}): super(usr: usr, member: member, app: app);

  @override
  LoggedInWithoutMembership copyWith({ MemberModel member}) {
    return LoggedInWithoutMembership(usr: usr, member: member ?? this.member, app: app, postLoginAction: postLoginAction);
  }

  @override
  bool forceAcceptMembership() => true;
}

class LoggedInWithMembership extends LoggedIn {
  LoggedInWithMembership({FirebaseUser usr, MemberModel member, AppModel app}): super(usr: usr, member: member, app: app);

  @override
  LoggedInWithMembership copyWith({ MemberModel member}) {
    return LoggedInWithMembership(usr: usr, member: member ?? this.member, app: app);
  }

  @override
  bool forceAcceptMembership() => false;
}
