import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/dialog_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/model/menu_item_model.dart';
import 'package:eliud_core/model/page_model.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/tools/merge.dart';
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
  bool memberIsOwner();
}

class AppError extends AccessState {
  final String message;
  AppError(this.message);

  @override
  List<Object> get props => [message];

  @override
  bool isLoggedIn() => false;

  @override
  bool hasAccessToOtherApps() => false;

  @override
  bool forceAcceptMembership() => false;

  @override
  bool memberIsOwner() => false;
}

class UndeterminedAccessState extends AccessState {
  UndeterminedAccessState();

  @override
  List<Object> get props => [];

  @override
  bool isLoggedIn() => false;

  @override
  bool hasAccessToOtherApps() => false;

  @override
  bool forceAcceptMembership() => false;

  @override
  bool memberIsOwner() => false;
}

class PagesAndDialogAccesss {
  final Map<String, bool> pagesAccess;
  final Map<String, bool> dialogsAccess;

  PagesAndDialogAccesss(this.pagesAccess, this.dialogsAccess);
}

class AccessHelper {
  final Map<String, bool> pagesAccess = {};

  static Future<bool> _conditionOkForPackage(String packageCondition,
      AppModel app, MemberModel member, bool isOwner) async {
    for (var i = 0; i < GlobalData.registeredPackages.length; i++) {
      var plg = GlobalData.registeredPackages[i];
      var plgOk = await plg.isConditionOk(
          packageCondition, app, member, isOwner);
      if (plgOk != null) {
        return plgOk;
      }
    }
    return false;
  }

  static Future<bool> _ConditionOk(AppModel app, MemberModel member,
      ReadCondition condition, int privilegedLevelRequired, int privilegedLevel, String packageCondition, bool isOwner,
      bool isLoggedIn) async {
    if (condition == null) return true;
    switch (condition) {
      case ReadCondition.NoRestriction:
        return true;
      case ReadCondition.MustNotBeLoggedIn:
        return !isLoggedIn;
      case ReadCondition.PackageDecides:
      return await _conditionOkForPackage(
          packageCondition, app, member, isOwner);
      case ReadCondition.MemberOrPrivilegedMemberOnly:
        return privilegedLevel >= privilegedLevelRequired || isOwner;
    }
    return true;
  }

  static Future<int> getPrivilegeLevel(AppModel app, MemberModel member, bool isOwner) async {
    if (isOwner) return 3;
    if (member != null) {
      var access = await accessRepository(appId: app.documentID).get(
          member.documentID);
      var privilegeLevel = access == null ? 0 : access.privilegeLevel;
      return privilegeLevel;
    }
    return 0;
  }

  static Future<PagesAndDialogAccesss> _getAccess(MemberModel member, AppModel app, bool isLoggedIn) async {
    var pagesAccess = <String, bool>{};
    var isOwner = member != null && member.documentID == app.ownerID;
    var privilegeLevel = await getPrivilegeLevel(app, member, isOwner);
    {
      var repo = pageRepository(appId: app.documentID);

      var pages = <PageModel>[];
      var countDown = privilegeLevel;
      while (countDown >= 0) {
        pages.addAll(await repo.valuesList(privilegeLevel: countDown));
        countDown--;
      }

      var theList = removeDuplicates(pages, (page1, page2) => page1.documentID == page2.documentID);

      for (var i = 0; i < theList.length; i++) {
        var page = theList[i];
        pagesAccess[page.documentID] = await _ConditionOk(
            app,
            member,
            page.readCondition,
            page.privilegeLevelRequired,
            privilegeLevel,
            page.packageCondition,
            isOwner,
            isLoggedIn);
      }
    }
    var dialogsAccess = <String, bool>{};
    {
      var repo = dialogRepository(appId: app.documentID);
      var dialogs = <DialogModel>[];
      var countDown = privilegeLevel;
      while (countDown >= 0) {
        dialogs.addAll(await repo.valuesList(privilegeLevel: countDown));
        countDown--;
      }

      var theList = removeDuplicates(dialogs, (dialog1, dialog2) => dialog1.documentID == dialog2.documentID);

      for (var i = 0; i < theList.length; i++) {
        var dialog = theList[i];
        dialogsAccess[dialog.documentID] = await _ConditionOk(
            app,
            member,
            dialog.readCondition,
            dialog.privilegeLevelRequired,
            privilegeLevel,
            dialog.packageCondition,
            isOwner,
            isLoggedIn);
      }
    }

    return PagesAndDialogAccesss(pagesAccess, dialogsAccess);
  }
}

abstract class AppLoaded extends AccessState {
  final AppModel app;
  final AppModel playStoreApp; // The playstore app. If null, then no playstore app available.
  final Map<String, bool> pagesAccess;
  final Map<String, bool> dialogAccess;

  @override
  List<Object> get props => [ app, playStoreApp, pagesAccess ];

  AppLoaded(this.app, this.playStoreApp, this.pagesAccess, this.dialogAccess);

  bool hasAccess(MenuItemModel item) {
    try {
      var action = item.action;
      if (action is GotoPage) {
        var pageID = action.pageID;
        var access = pagesAccess[pageID];
        if (access == null) return false;
        return access;
      } else if (action is OpenDialog) {
        var dialogID = action.dialogID;
        var access = dialogAccess[dialogID];
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

class LoggedOut extends AppLoaded {
  static Future<LoggedOut> getLoggedOut(AppModel app, AppModel playstoreApp) async {
    var access = await AccessHelper._getAccess(null, app, false);
    var loggedOut = LoggedOut._(app, playstoreApp, access.pagesAccess, access.dialogsAccess);
    return loggedOut;
  }

  LoggedOut._(AppModel app, AppModel playstoreApp, Map<String, bool> pagesAccess, Map<String, bool> dialogAccess): super(app, playstoreApp, pagesAccess, dialogAccess);

  @override
  bool hasAccessToOtherApps() => false;

  @override
  bool isLoggedIn() => false;

  @override
  bool forceAcceptMembership() => false;

  @override
  bool memberIsOwner() => false;
}

abstract class LoggedIn extends AppLoaded {
  final FirebaseUser usr;
  final MemberModel member;

  @override
  List<Object> get props => [ app, pagesAccess, dialogAccess, usr, member ];

  LoggedIn._(this.usr, this.member, AppModel app, AppModel playstoreApp, Map<String, bool> pagesAccess, Map<String, bool> dialogAccess) : super(app, playstoreApp, pagesAccess, dialogAccess);

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
  bool memberIsOwner() {
    return member.documentID == app.ownerID;
  }

  Future<LoggedIn> copyWith(MemberModel member, AppModel playstoreApp);
}

class LoggedInWithoutMembership extends LoggedIn {
  static Future<LoggedInWithoutMembership> getLoggedInWithoutMembership(FirebaseUser usr, MemberModel member, AppModel app, AppModel playstoreApp, PostLoginAction postLoginAction) async {
    var access = await AccessHelper._getAccess(member, app, false);
    var loggedInWithoutMembership = LoggedInWithoutMembership._(usr, member, app, playstoreApp, postLoginAction, access.pagesAccess, access.dialogsAccess);
    return loggedInWithoutMembership;
  }

  @override
  List<Object> get props => [ usr, member, app, pagesAccess ];

  // What is the event that should be triggered after the membership will be accepted...
  final PostLoginAction postLoginAction;
  LoggedInWithoutMembership._(FirebaseUser usr, MemberModel member, AppModel app, AppModel playstoreApp, this.postLoginAction, Map<String, bool> pagesAccess, Map<String, bool> dialogAccess): super._(usr, member, app, playstoreApp, pagesAccess, dialogAccess);

  @override
  Future<LoggedInWithoutMembership> copyWith(MemberModel member, AppModel playstoreApp) async {
    return getLoggedInWithoutMembership(usr, member ?? this.member, app, playstoreApp, postLoginAction);
  }

  @override
  bool forceAcceptMembership() => true;
}

class LoggedInWithMembership extends LoggedIn {
  static Future<LoggedInWithMembership> getLoggedInWithMembership(FirebaseUser usr, MemberModel member, AppModel app, AppModel playstoreApp, ) async {
    var access = await AccessHelper._getAccess(member, app, false);
    var loggedInWithMembership = LoggedInWithMembership._(usr, member, app, playstoreApp, access.pagesAccess, access.dialogsAccess);
    return loggedInWithMembership;
  }

  @override
  List<Object> get props => [ usr, member, app, pagesAccess ];

  LoggedInWithMembership._(FirebaseUser usr, MemberModel member, AppModel app, AppModel playstoreApp, Map<String, bool> pagesAccess, Map<String, bool> dialogsAccess): super._(usr, member, app, playstoreApp, pagesAccess, dialogsAccess);

  @override
  Future<LoggedInWithMembership> copyWith(MemberModel member, AppModel playstoreApp) {
    return getLoggedInWithMembership(usr, member ?? this.member, app, playstoreApp);
  }

  @override
  bool forceAcceptMembership() => false;
}
