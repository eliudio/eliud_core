import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/access_model.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/conditions_model.dart';
import 'package:eliud_core/model/dialog_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/model/member_public_info_model.dart';
import 'package:eliud_core/model/menu_item_model.dart';
import 'package:eliud_core/model/page_model.dart';
import 'package:eliud_core/package/package.dart';
import 'package:eliud_core/tools/action/action_model.dart';
import 'package:eliud_core/tools/merge.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:eliud_core/core/access/bloc/access_event.dart';

import '../../global_data.dart';

abstract class AccessState extends Equatable {
  const AccessState();

  @override
  List<Object?> get props => [];

  bool isLoggedIn();
  bool hasAccessToOtherApps();
  bool forceAcceptMembership();
  bool memberIsOwner();
  MemberModel? getMember();

  List<MemberCollectionInfo>? getMemberCollectionInfo();
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

  @override
  MemberModel? getMember() => null;

  @override
  List<MemberCollectionInfo>? getMemberCollectionInfo() => null;
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

  @override
  MemberModel? getMember() => null;

  @override
  List<MemberCollectionInfo>? getMemberCollectionInfo() => null;
}

class PackageCondition extends Equatable {
  final Package? pkg;
  final String? condition;
  final bool? access;

  @override
  List<Object?> get props => [condition, access];

  PackageCondition({this.pkg, this.condition, this.access});
}

class PagesAndDialogAccesss {
  // Map between page-id and access
  final Map<String?, bool> pagesAccess;

  // Map between dialog-id and access
  final Map<String?, bool> dialogsAccess;

  // Map between packageCondition and access
  final Map<String, PackageCondition?> packageConditionsAccess;

  final PrivilegeLevel? privilegeLevel;

  final bool? blocked;

  PagesAndDialogAccesss(this.pagesAccess, this.dialogsAccess,
      this.packageConditionsAccess, this.privilegeLevel, this.blocked);
}

class AccessHelper {
  static List<String> getAllPackageConditions() {
    var packageConditions = <String>[];
    for (var i = 0; i < GlobalData.registeredPackages.length; i++) {
      var newItems =
          GlobalData.registeredPackages[i].retrieveAllPackageConditions();
      if (newItems != null) {
        packageConditions.addAll(newItems);
      }
    }
    return packageConditions;
  }

  static Future<PackageCondition?> conditionOkForPackage(
      String packageCondition,
      AppModel app,
      MemberModel? member,
      bool isOwner,
      bool? isBlocked,
      PrivilegeLevel? privilegeLevel) async {
    for (var i = 0; i < GlobalData.registeredPackages.length; i++) {
      var plg = GlobalData.registeredPackages[i];
      var plgOk = await plg.isConditionOk(
          packageCondition, app, member, isOwner, isBlocked, privilegeLevel);
      if (plgOk != null) {
        return PackageCondition(
          pkg: plg,
          condition: packageCondition,
          access: plgOk,
        );
      }
    }
    return null;
  }

  static bool conditionOk(
      Map<String, PackageCondition?> packagesConditions,
      ConditionsModel conditions,
      PrivilegeLevel privilegedLevel,
      bool isOwner,
      bool? isBlocked,
      bool isLoggedIn) {
    var privilegedLevelRequired = conditions.privilegeLevelRequired;

    if (privilegedLevel.index < conditions.privilegeLevelRequired!.index) {
      return false;
    }

    if (conditions == null) return true;

    var packageCondition = conditions.packageCondition;
    if ((packageCondition != null) && (!packagesConditions[packageCondition]!.access!)) {
      return false;
    }

    if (conditions.conditionOverride != null) {
      switch (conditions.conditionOverride) {
        case ConditionOverride.ExactPrivilege:
          if (privilegedLevel.index != conditions.privilegeLevelRequired!.index) return false;
          break;
        case ConditionOverride.InclusiveForBlockedMembers:
          if ((isBlocked != null) && (isBlocked)) return true;
          break;
        case ConditionOverride.ExclusiveForBlockedMember:
          if ((isBlocked != null) && (isBlocked)) return true;
          break;
      }
    }

    if ((isBlocked != null) && (isBlocked)) return false;

    return true;
  }

  static Future<PrivilegeLevel?> getPrivilegeLevel(
      AppModel app, MemberModel member, bool isOwner) async {
    if (isOwner) return PrivilegeLevel.OwnerPrivilege;
    if (member != null) {
      var access =
          await accessRepository(appId: app.documentID)!.get(member.documentID);
      var privilegeLevel = access == null ? 0 : access.privilegeLevel;
      return privilegeLevel as Future<PrivilegeLevel?>;
    }
    return PrivilegeLevel.NoPrivilege;
  }

  static Future<PagesAndDialogAccesss> _getAccess(
      MemberModel? member, AppModel app, bool isLoggedIn) async {
    var pagesAccess = <String?, bool>{};
    var isOwner = member != null && member.documentID == app.ownerID;

    var accessModel;
    if (member != null) {
      accessModel = await accessRepository(appId: app.documentID)!.get(member.documentID);
    }
    var privilegeLevel;
    var isBlocked;
    if (accessModel != null) {
      privilegeLevel = accessModel.privilegeLevel;
      isBlocked = accessModel.blocked;
    } else {
      privilegeLevel = PrivilegeLevel.NoPrivilege;
    }

    var packageConditionsAccess = <String, PackageCondition?>{};
    {
      var packageConditions = getAllPackageConditions();
      for (var i = 0; i < packageConditions.length; i++) {
        var packageCondition = packageConditions[i];
        packageConditionsAccess[packageCondition] = await conditionOkForPackage(
            packageCondition, app, member, isOwner, isBlocked, privilegeLevel);
      }
    }
    {
      var repo = pageRepository(appId: app.documentID);

      var pages = <PageModel?>[];
      var countDown = privilegeLevel.index;
      while (countDown >= 0) {
        pages.addAll(await repo!.valuesList(privilegeLevel: countDown));
        countDown--;
      }

      var theList = removeDuplicates(
          pages, (page1, page2) => page1.documentID == page2.documentID);

      for (var i = 0; i < theList.length; i++) {
        var page = theList[i]!;
        pagesAccess[page.documentID] = conditionOk(packageConditionsAccess,
            page.conditions!, privilegeLevel, isOwner, isBlocked, isLoggedIn);
      }
    }
    var dialogsAccess = <String?, bool>{};
    {
      var repo = dialogRepository(appId: app.documentID);
      var dialogs = <DialogModel?>[];
      var countDown = privilegeLevel.index;
      while (countDown >= 0) {
        dialogs.addAll(await repo!.valuesList(privilegeLevel: countDown));
        countDown--;
      }

      var theList = removeDuplicates(dialogs,
          (dialog1, dialog2) => dialog1.documentID == dialog2.documentID);

      for (var i = 0; i < theList.length; i++) {
        var dialog = theList[i]!;
        dialogsAccess[dialog.documentID] = conditionOk(packageConditionsAccess,
            dialog.conditions!, privilegeLevel, isOwner, isBlocked, isLoggedIn);
      }
    }

    return PagesAndDialogAccesss(pagesAccess, dialogsAccess,
        packageConditionsAccess, privilegeLevel, isBlocked);
  }
}

abstract class AppLoaded extends AccessState {
  final AppModel app;
  final AppModel?
      playStoreApp; // The playstore app. If null, then no playstore app available.
  final Map<String?, bool> pagesAccess;
  final Map<String?, bool> dialogAccess;
  final Map<String, PackageCondition?> packageConditionsAccess;

  @override
  List<Object?> get props =>
      [app, playStoreApp, pagesAccess, dialogAccess, packageConditionsAccess];

  AppLoaded(this.app, this.playStoreApp, this.pagesAccess, this.dialogAccess,
      this.packageConditionsAccess);

  bool actionHasAccess(ActionModel action) {
    if (action.conditions != null) {
      if (!AccessHelper.conditionOk(
          packageConditionsAccess,
          action.conditions!,
          getPrivilegeLevel()!,
          memberIsOwner(),
          isBlocked(),
          isLoggedIn())) return false;
    }
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
      action.menuDef!.menuItems!.forEach((item) {
        if (menuItemHasAccess(item)) access = true;
      });
      return access;
    } else if (action is InternalAction) {
      if (action.internalActionEnum == InternalActionEnum.Login) {
        return !isLoggedIn();
      } else if (action.internalActionEnum == InternalActionEnum.Logout) {
        return isLoggedIn();
      } else if (action.internalActionEnum == InternalActionEnum.OtherApps) {
        return hasAccessToOtherApps();
      } else if (action.internalActionEnum == InternalActionEnum.Flush) {
        return true;
      }
      return true;
    }
    return true;
  }

  bool menuItemHasAccess(MenuItemModel item) {
    try {
      var action = item.action!;
      return actionHasAccess(action);
    } catch (_) {
      return false;
    }
  }

  List<bool> hasNAccess(AccessState state, List<MenuItemModel> items) {
    return items.map((e) => menuItemHasAccess(e)).toList();
  }

  MemberModel? getMember();
  PrivilegeLevel? getPrivilegeLevel();
  bool isBlocked();
}

enum ProcessingType {
  LoginProcess, LogoutProcess, SwitchApp, SwitchAppAndPage
}

class AppProcessingState extends AppLoaded {
  ProcessingType processingType;
  AccessState stateBeforeProcessing;

  AppProcessingState._(
      this.processingType,
      this.stateBeforeProcessing,
      AppModel app,
      AppModel? playstoreApp,
      Map<String?, bool> pagesAccess,
      Map<String?, bool> dialogAccess,
      Map<String, PackageCondition?> packageConditionsAccess)
      : super(app, playstoreApp, pagesAccess, dialogAccess,
      packageConditionsAccess);

  @override
  bool hasAccessToOtherApps() => false;

  @override
  bool isLoggedIn() => false;

  @override
  bool forceAcceptMembership() => false;

  @override
  bool memberIsOwner() => false;

  @override
  MemberModel? getMember() => null;

  @override
  PrivilegeLevel getPrivilegeLevel() => PrivilegeLevel.NoPrivilege;

  @override
  bool isBlocked() => false;

  @override
  List<MemberCollectionInfo>? getMemberCollectionInfo() => null;

  @override
  List<Object?> get props =>
      [processingType, app, playStoreApp, pagesAccess, dialogAccess, packageConditionsAccess];

  static Future<AppProcessingState> getAppProcessingState(ProcessingType processingType, AccessState stateBeforeProcessing, AppModel app, AppModel? playstoreApp) async {
    var access = await AccessHelper._getAccess(null, app, false);
    var appProcessingState = AppProcessingState._(processingType, stateBeforeProcessing, app, playstoreApp, access.pagesAccess,
        access.dialogsAccess, access.packageConditionsAccess);
    return appProcessingState;
  }
}

class LoggedOut extends AppLoaded {
  static Future<LoggedOut> getLoggedOut(
      AppModel app, AppModel? playstoreApp) async {
    var access = await AccessHelper._getAccess(null, app, false);
    var loggedOut = LoggedOut._(app, playstoreApp, access.pagesAccess,
        access.dialogsAccess, access.packageConditionsAccess);
    return loggedOut;
  }

  LoggedOut._(
      AppModel app,
      AppModel? playstoreApp,
      Map<String?, bool> pagesAccess,
      Map<String?, bool> dialogAccess,
      Map<String, PackageCondition?> packageConditionsAccess)
      : super(app, playstoreApp, pagesAccess, dialogAccess,
            packageConditionsAccess);

  @override
  bool hasAccessToOtherApps() => false;

  @override
  bool isLoggedIn() => false;

  @override
  bool forceAcceptMembership() => false;

  @override
  bool memberIsOwner() => false;

  @override
  MemberModel? getMember() => null;

  @override
  PrivilegeLevel getPrivilegeLevel() => PrivilegeLevel.NoPrivilege;

  @override
  bool isBlocked() => false;

  @override
  List<MemberCollectionInfo>? getMemberCollectionInfo() => null;
}

abstract class LoggedIn extends AppLoaded {
  final User usr;
  final MemberModel member;
  final MemberPublicInfoModel memberPublicInfoModel;
  final PrivilegeLevel privilegeLevel;
  final bool blocked;

  @override
  List<Object?> get props => [
        app,
        playStoreApp,
        pagesAccess,
        dialogAccess,
        packageConditionsAccess,
        usr,
        member,
        privilegeLevel
      ];

  LoggedIn._(
      this.usr,
      this.member,
      this.memberPublicInfoModel,
      AppModel app,
      AppModel? playstoreApp,
      Map<String?, bool> pagesAccess,
      Map<String?, bool> dialogAccess,
      this.privilegeLevel,
      Map<String, PackageCondition?> packageConditionsAccess,
      this.blocked)
      : super(app, playstoreApp, pagesAccess, dialogAccess,
            packageConditionsAccess);

  @override
  bool hasAccessToOtherApps() {
    if (member != null) return false;
    if (member.subscriptions != null) return false;
    return member.subscriptions!.length > 1;
  }

  @override
  bool isLoggedIn() => true;

  String? memberProfilePhoto() {
    return member.photoURL;
  }

  @override
  bool memberIsOwner() {
    return member.documentID == app.ownerID;
  }

  Future<LoggedIn> copyWith(MemberModel? member, MemberPublicInfoModel memberPublicInfoModel, AppModel? playstoreApp);

  @override
  MemberModel? getMember() => member;

  @override
  PrivilegeLevel? getPrivilegeLevel() => privilegeLevel;

  @override
  bool isBlocked() => (blocked != null) && blocked;

  @override
  List<MemberCollectionInfo> getMemberCollectionInfo() {
    List<MemberCollectionInfo> memberCollectionInfo = [];
    for (var i = 0; i < GlobalData.registeredPackages.length; i++) {
      var packageCollectionInfo = GlobalData.registeredPackages[i].getMemberCollectionInfo();
      if (packageCollectionInfo != null) {
        memberCollectionInfo.addAll(packageCollectionInfo);
      }
    }
    return memberCollectionInfo;
  }
}

class LoggedInWithoutMembership extends LoggedIn {
  static Future<LoggedInWithoutMembership> getLoggedInWithoutMembership(
      User usr,
      MemberModel member,
      MemberPublicInfoModel memberPublicInfoModel,
      AppModel app,
      AppModel? playstoreApp,
      PostLoginAction? postLoginAction) async {
    var access = await AccessHelper._getAccess(member, app, false);
    var loggedInWithoutMembership = LoggedInWithoutMembership._(
        usr,
        member,
        memberPublicInfoModel,
        app,
        playstoreApp,
        postLoginAction,
        access.pagesAccess,
        access.dialogsAccess,
        access.privilegeLevel ?? PrivilegeLevel.NoPrivilege,
        access.packageConditionsAccess,
        access.blocked);
    return loggedInWithoutMembership;
  }

  @override
  List<Object?> get props => [
        usr,
        member,
        app,
        pagesAccess,
        dialogAccess,
        packageConditionsAccess,
        usr,
        member,
        privilegeLevel
      ];

  // What is the event that should be triggered after the membership will be accepted...
  final PostLoginAction? postLoginAction;
  LoggedInWithoutMembership._(
      User usr,
      MemberModel member,
      MemberPublicInfoModel memberPublicInfoModel,
      AppModel app,
      AppModel? playstoreApp,
      this.postLoginAction,
      Map<String?, bool> pagesAccess,
      Map<String?, bool> dialogAccess,
      PrivilegeLevel privilegeLevel,
      Map<String, PackageCondition?> packageConditionsAccess,
      bool? blocked)
      : super._(usr, member, memberPublicInfoModel, app, playstoreApp, pagesAccess, dialogAccess,
            privilegeLevel, packageConditionsAccess, blocked == null ? false : blocked);

  @override
  Future<LoggedInWithoutMembership> copyWith(
      MemberModel? member, MemberPublicInfoModel memberPublicInfoModel, AppModel? playstoreApp) async {
    return getLoggedInWithoutMembership(
        usr, member ?? this.member, memberPublicInfoModel ?? this.memberPublicInfoModel, app, playstoreApp, postLoginAction);
  }

  @override
  bool forceAcceptMembership() => true;
}

class LoggedInWithMembership extends LoggedIn {
  static Future<LoggedInWithMembership> getLoggedInWithMembership(
    User usr,
    MemberModel member,
    MemberPublicInfoModel memberPublicInfoModel,
    AppModel app,
    AppModel? playstoreApp,
  ) async {
    var access = await AccessHelper._getAccess(member, app, false);
    var loggedInWithMembership = LoggedInWithMembership._(
        usr,
        member,
        memberPublicInfoModel,
        app,
        playstoreApp,
        access.pagesAccess,
        access.dialogsAccess,
        access.privilegeLevel ?? PrivilegeLevel.NoPrivilege,
        access.packageConditionsAccess,
        access.blocked ?? false);
    return loggedInWithMembership;
  }

  @override
  List<Object?> get props => [
        usr,
        member,
        app,
        pagesAccess,
        dialogAccess,
        packageConditionsAccess,
        usr,
        member,
        privilegeLevel
      ];

  LoggedInWithMembership._(
      User usr,
      MemberModel member,
      MemberPublicInfoModel memberPublicInfoModel,
      AppModel app,
      AppModel? playstoreApp,
      Map<String?, bool> pagesAccess,
      Map<String?, bool> dialogsAccess,
      PrivilegeLevel privilegeLevel,
      Map<String, PackageCondition?> packageConditionsAccess,
      bool blocked)
      : super._(usr, member, memberPublicInfoModel, app, playstoreApp, pagesAccess, dialogsAccess,
            privilegeLevel, packageConditionsAccess, blocked);

  @override
  Future<LoggedInWithMembership> copyWith(
      MemberModel? member, MemberPublicInfoModel memberPublicInfoModel, AppModel? playstoreApp) {
    return getLoggedInWithMembership(
        usr, member ?? this.member, memberPublicInfoModel ?? this.memberPublicInfoModel, app, playstoreApp);
  }

  @override
  bool forceAcceptMembership() => false;
}
