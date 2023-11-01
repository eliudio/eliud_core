import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:tuple/tuple.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/access_model.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/dialog_model.dart';
import 'package:eliud_core/model/display_conditions_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/model/page_model.dart';
import 'package:eliud_core/package/packages.dart';
import 'package:eliud_core/tools/merge.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../access_bloc.dart';
/*
class PackageConditionX extends Equatable {
  final Package? pkg;
  final String? condition;
  final bool? access;

  PackageCondition({this.pkg, this.condition, this.access});

  @override
  List<Object?> get props => [pkg, condition, access];

  @override
  bool operator == (Object other) =>
      identical(this, other) ||
          other is PackageCondition &&
              runtimeType == other.runtimeType && 
              pkg == other.pkg && 
              condition == other.condition &&
              access == other.access;
}*/

class PagesAndDialogAccesss extends Equatable {
  // Map between page-id and access
  final Map<String, bool> pagesAccess;

  // Map between dialog-id and access
  final Map<String, bool> dialogsAccess;

  // Map between packageCondition and access
  final Map<String, bool> packageConditionsAccess;

  final PrivilegeLevel? privilegeLevel;

  final bool? blocked;

  PagesAndDialogAccesss(this.pagesAccess, this.dialogsAccess,
      this.packageConditionsAccess, this.privilegeLevel, this.blocked);

  @override
  List<Object?> get props => [pagesAccess, dialogsAccess, packageConditionsAccess, privilegeLevel, blocked];

  @override
  bool operator == (Object other) =>
      identical(this, other) ||
          other is PagesAndDialogAccesss &&
              runtimeType == other.runtimeType &&
              mapEquals(pagesAccess, other.pagesAccess) &&
              mapEquals(dialogsAccess, other.dialogsAccess) &&
              mapEquals(packageConditionsAccess, other.packageConditionsAccess) &&
              privilegeLevel == other.privilegeLevel &&
              blocked == other.blocked;

  PagesAndDialogAccesss copyWith({Map<String, bool>? pagesAccess, Map<String, bool>? dialogsAccess, Map<String, bool>? packageConditionsAccess, PrivilegeLevel? privilegeLevel, bool? blocked, }) {
    return PagesAndDialogAccesss(pagesAccess ?? this.pagesAccess, dialogsAccess ?? this.dialogsAccess, packageConditionsAccess ?? this.packageConditionsAccess, privilegeLevel ?? this.privilegeLevel, blocked ?? this.blocked);
  }

}

class AccessHelper {
/*
  static List<String> getAllPackageConditions() {
    var packageConditions = <String>[];
    for (var i = 0; i < Packages.registeredPackages.length; i++) {
      var newItems = Packages.registeredPackages[i].retrieveAllPackageConditions();
      if (newItems != null) {
        packageConditions.addAll(newItems);
      }
    }
    return packageConditions;
  }
*/

/*  static Future<PackageCondition?> _conditionOkForPackage(AccessBloc accessBloc,
      String packageCondition,
      AppModel app,
      MemberModel? member,
      bool isOwner,
      bool? isBlocked,
      PrivilegeLevel? privilegeLevel) async {
    for (var i = 0; i < Packages.registeredPackages.length; i++) {
      var plg = Packages.registeredPackages[i];
      var plgOk = await plg.isConditionOk(accessBloc,
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
  }*/

  static bool displayConditionOk(
      Map<String, bool> packagesConditions,
      DisplayConditionsModel conditions,
      PrivilegeLevel privilegedLevel,
      bool isOwner,
      bool? isBlocked,
      bool isLoggedIn) {
    var privilegeLevelRequiredIndex = conditions.privilegeLevelRequired == null || conditions.privilegeLevelRequired == PrivilegeLevelRequired.Unknown ? PrivilegeLevelRequired.NoPrivilegeRequired.index : conditions.privilegeLevelRequired!.index;

    if (privilegedLevel.index < privilegeLevelRequiredIndex) {
      return false;
    }

    if (conditions == null) return true;

    var packageCondition = conditions.packageCondition;
    if (packageCondition != null) {
      var packageConditionValue = packagesConditions[packageCondition];
      if ((packageConditionValue != null) && (!packageConditionValue)) {
        return false;
      }
    }

    if (conditions.conditionOverride != null) {
      switch (conditions.conditionOverride) {
        case ConditionOverride.ExactPrivilege:
          if (privilegedLevel.index != privilegeLevelRequiredIndex) return false;
          break;
        case ConditionOverride.InclusiveForBlockedMembers:
          if ((isBlocked != null) && (isBlocked)) return true;
          break;
        case ConditionOverride.ExclusiveForBlockedMember:
          if ((isBlocked != null) && (isBlocked)) return true;
          break;
        case ConditionOverride.Unknown:
          break;
      }
    }

    if ((isBlocked != null) && (isBlocked)) return false;

    return true;
  }

  static Future<PrivilegeLevel?> getPrivilegeLevel(
      AppModel app, MemberModel member, bool isOwner) async {
    if (isOwner) return PrivilegeLevel.OwnerPrivilege;
    var access =
        await accessRepository(appId: app.documentID)!.get(member.documentID);
    var privilegeLevel = access == null ? 0 : access.privilegeLevel;
    return privilegeLevel as Future<PrivilegeLevel?>;
      return PrivilegeLevel.NoPrivilege;
  }

  static Future<Map<String, PagesAndDialogAccesss>> getAccesses2(AccessBloc accessBloc, MemberModel? member, List<AppModel> apps, bool isLoggedIn) async {
    var accesses = <String, PagesAndDialogAccesss>{};
    for (var app in apps) {
      var access = await AccessHelper._getAccess(accessBloc, member, app, isLoggedIn);
      accesses[app.documentID] = access;
    }
    return accesses;
  }

  static Future<Map<String, PagesAndDialogAccesss>> getAccesses(AccessBloc accessBloc, MemberModel? member, List<AppModel> apps, bool isLoggedIn) async {
    var accesses = <String, PagesAndDialogAccesss>{};
    for (var app in apps) {
      var access = await AccessHelper._getAccess(accessBloc, member, app, isLoggedIn);
      accesses[app.documentID] = access;
    }
    return accesses;
  }

  static Future<Map<String, PagesAndDialogAccesss>> extendAccesses(AccessBloc accessBloc, MemberModel? member, Map<String, PagesAndDialogAccesss> currentAccesses, AppModel addApp, bool isLoggedIn) async {
    var access = await AccessHelper._getAccess(accessBloc, member, addApp, isLoggedIn);
    currentAccesses[addApp.documentID] = access;
    return currentAccesses;
  }

  static Future<Map<String, PagesAndDialogAccesss>> extendAccesses2(AccessBloc accessBloc, MemberModel? member, Map<String, PagesAndDialogAccesss> currentAccesses, AppModel addApp, bool isLoggedIn, PrivilegeLevel privilegeLevel, bool? isBlocked) async {
    var access = await _getAccess2(accessBloc, member, addApp, isLoggedIn, privilegeLevel, isBlocked);
    currentAccesses[addApp.documentID] = access;
    return currentAccesses;
  }

  static Future<PagesAndDialogAccesss> _getAccess(AccessBloc accessBloc,
      MemberModel? member, AppModel app, bool isLoggedIn) async {
    var afm = await getAccessForMember(member, app.documentID);
    return _getAccess2(accessBloc, member, app, isLoggedIn, afm.item1, afm.item2);
  }

  static Future<Tuple2<PrivilegeLevel, bool>> getAccessForMember(MemberModel? member, String appId) async {
    var accessModel;
    if (member != null) {
      accessModel = await accessRepository(appId: appId)!.get(member.documentID);
    }
    var privilegeLevel;
    bool isBlocked = false;
    if (accessModel != null) {
      privilegeLevel = accessModel.privilegeLevel;
      isBlocked = accessModel.blocked ?? false;
    } else {
      privilegeLevel = PrivilegeLevel.NoPrivilege;
      if (member != null) {
        // normally this would have happened when accepting the app's terms, but anyway
        // create an access entry. creation with privilege level 0 is allowed
        await accessRepository(appId: appId)!.add(AccessModel(
          documentID: member.documentID,
          appId: appId,
          privilegeLevel: PrivilegeLevel.NoPrivilege,
          points: 0,
        ));
      }
    }
    return Tuple2(privilegeLevel, isBlocked);
  }
/*

  static Future<Map<String, PagesAndDialogAccesss>> getAccesses2(MemberModel? member, List<AppModel> apps, bool isLoggedIn) async {
    var accesses = <String, PagesAndDialogAccesss>{};
    for (var app in apps) {
      var access = await AccessHelper._getAccess(member, app, isLoggedIn);
      accesses[app.documentID] = access;
    }
    return accesses;
  }
*/

  static Future<PagesAndDialogAccesss> _getAccess2(AccessBloc accessBloc,
      MemberModel? member, AppModel app, bool isLoggedIn, PrivilegeLevel privilegeLevel, bool? isBlocked, ) async {
    var pagesAccess = <String, bool>{};
    var isOwner = member != null && member.documentID == app.ownerID;

    var packageConditionsAccess = <String, bool>{};
    {
      for (var pkg in Packages.registeredPackages) {
        var packageConditionDetails = await pkg.getAndSubscribe(accessBloc, app, member, isOwner, isBlocked, privilegeLevel);
        if (packageConditionDetails != null) {
          for (var packageConditionDetail in packageConditionDetails) {
            packageConditionsAccess[packageConditionDetail.conditionName] = packageConditionDetail.value;
          }
        }
      }
    }
    {
      var repo = pageRepository(appId: app.documentID);

      var pages = <PageModel?>[];
      var countDown = privilegeLevel.index;
      while (countDown >= 0) {
        pages.addAll(await repo!.valuesList(
            eliudQuery: getComponentSelectorQuery(countDown, app.documentID)));
        countDown--;
      }

      var theList = removeDuplicates(
          pages, (page1, page2) => page1.documentID == page2.documentID);

      for (var i = 0; i < theList.length; i++) {
        var page = theList[i]!;
        pagesAccess[page.documentID] = true;
      }
    }
    var dialogsAccess = <String, bool>{};
    {
      var repo = dialogRepository(appId: app.documentID);
      var dialogs = <DialogModel?>[];
      var countDown = privilegeLevel.index;
      while (countDown >= 0) {
        dialogs.addAll(await repo!.valuesList(
            eliudQuery: getComponentSelectorQuery(countDown, app.documentID)));
        countDown--;
      }

      var theList = removeDuplicates(dialogs,
          (dialog1, dialog2) => dialog1.documentID == dialog2.documentID);

      for (var i = 0; i < theList.length; i++) {
        var dialog = theList[i]!;
        dialogsAccess[dialog.documentID] = true;
      }
    }

    return PagesAndDialogAccesss(pagesAccess, dialogsAccess,
        packageConditionsAccess, privilegeLevel, isBlocked);
  }
}

