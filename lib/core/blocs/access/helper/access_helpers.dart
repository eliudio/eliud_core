import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/core/blocs/access/state/access_determined.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/access_model.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/conditions_model.dart';
import 'package:eliud_core/model/dialog_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/model/page_model.dart';
import 'package:eliud_core/package/package.dart';
import 'package:eliud_core/package/packages.dart';
import 'package:eliud_core/tools/merge.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../access_bloc.dart';

class PackageCondition extends Equatable {
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
}

class PagesAndDialogAccesss extends Equatable {
  // Map between page-id and access
  final Map<String, bool> pagesAccess;

  // Map between dialog-id and access
  final Map<String, bool> dialogsAccess;

  // Map between packageCondition and access
  final Map<String, PackageCondition> packageConditionsAccess;

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

  PagesAndDialogAccesss copyWith({Map<String, bool>? pagesAccess, Map<String, bool>? dialogsAccess, Map<String, PackageCondition>? packageConditionsAccess, PrivilegeLevel? privilegeLevel, bool? blocked, }) {
    return PagesAndDialogAccesss(pagesAccess ?? this.pagesAccess, dialogsAccess ?? this.dialogsAccess, packageConditionsAccess ?? this.packageConditionsAccess, privilegeLevel ?? this.privilegeLevel, blocked ?? this.blocked);
  }

}

class PackageInfo {
  final String name;
  final List<String> conditions;

  PackageInfo(this.name, this.conditions);
}

class PackageInfo2 {
  final String packageName;
  final String packageCondition;

  PackageInfo2(this.packageName, this.packageCondition);
}

class AccessHelper {
  static List<PackageInfo2> getAllPackageConditionsAsPackageInfos2() {
    var packageInfos = <PackageInfo2>[];
    for (var i = 0; i < Packages.registeredPackages.length; i++) {
      var package = Packages.registeredPackages[i];
      var packageConditions = package.retrieveAllPackageConditions();
      if (packageConditions != null) {
        for (var j = 0; j < packageConditions.length; j++) {
          packageInfos.add(PackageInfo2(package.packageName, packageConditions[j]));
        }
      }
    }
    return packageInfos;
  }

  static List<PackageInfo> getAllPackageConditionsAsPackageInfos() {
    var packageInfos = <PackageInfo>[];
    for (var i = 0; i < Packages.registeredPackages.length; i++) {
      var package = Packages.registeredPackages[i];
      var newItems = Packages.registeredPackages[i].retrieveAllPackageConditions() ?? [];
      packageInfos.add(PackageInfo(package.packageName, newItems));
    }
    return packageInfos;
  }

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

  static Future<PackageCondition?> _conditionOkForPackage(AccessBloc accessBloc,
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
  }

  static bool conditionOk(
      Map<String, PackageCondition> packagesConditions,
      ConditionsModel conditions,
      PrivilegeLevel privilegedLevel,
      bool isOwner,
      bool? isBlocked,
      bool isLoggedIn) {
    if (privilegedLevel.index < conditions.privilegeLevelRequired!.index) {
      return false;
    }

    if (conditions == null) return true;

    var packageCondition = conditions.packageCondition;
    if (packageCondition != null) {
      var packageConditionValue = packagesConditions[packageCondition];
      if ((packageConditionValue != null) && (packageConditionValue.access != null) && (!packageConditionValue.access!)) {
        return false;
      }
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

  static Future<Map<String, PagesAndDialogAccesss>> getAccesses2(AccessBloc accessBloc, MemberModel? member, List<AppModel> apps, bool isLoggedIn) async {
    var accesses = <String, PagesAndDialogAccesss>{};
    for (var app in apps) {
      var access = await AccessHelper._getAccess(accessBloc, member, app, isLoggedIn);
      accesses[app.documentID!] = access;
    }
    return accesses;
  }

  static Future<Map<String, PagesAndDialogAccesss>> getAccesses(AccessBloc accessBloc, MemberModel? member, List<DeterminedApp> apps, bool isLoggedIn) async {
    var accesses = <String, PagesAndDialogAccesss>{};
    for (var app in apps) {
      var access = await AccessHelper._getAccess(accessBloc, member, app.app, isLoggedIn);
      accesses[app.app.documentID!] = access;
    }
    return accesses;
  }

  static Future<Map<String, PagesAndDialogAccesss>> extendAccesses(AccessBloc accessBloc, MemberModel? member, Map<String, PagesAndDialogAccesss> currentAccesses, AppModel addApp, bool isLoggedIn) async {
    var access = await AccessHelper._getAccess(accessBloc, member, addApp, isLoggedIn);
    currentAccesses[addApp.documentID!] = access;
    return currentAccesses;
  }

  static Future<PagesAndDialogAccesss> _getAccess(AccessBloc accessBloc,
      MemberModel? member, AppModel app, bool isLoggedIn) async {
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

    return _getAccess2(accessBloc, member, app, isLoggedIn, privilegeLevel, isBlocked);
  }
/*

  static Future<Map<String, PagesAndDialogAccesss>> getAccesses2(MemberModel? member, List<AppModel> apps, bool isLoggedIn) async {
    var accesses = <String, PagesAndDialogAccesss>{};
    for (var app in apps) {
      var access = await AccessHelper._getAccess(member, app, isLoggedIn);
      accesses[app.documentID!] = access;
    }
    return accesses;
  }
*/

  static Future<PagesAndDialogAccesss> _getAccess2(AccessBloc accessBloc,
      MemberModel? member, AppModel app, bool isLoggedIn, PrivilegeLevel privilegeLevel, bool? isBlocked, ) async {
    var pagesAccess = <String, bool>{};
    var isOwner = member != null && member.documentID == app.ownerID;

    var packageConditionsAccess = <String, PackageCondition>{};
    {
      var packageConditions = getAllPackageConditions();
      for (var i = 0; i < packageConditions.length; i++) {
        var packageCondition = packageConditions[i];
        var value= await _conditionOkForPackage(accessBloc,
            packageCondition, app, member, isOwner, isBlocked, privilegeLevel);
        if (value != null) {
          packageConditionsAccess[packageCondition] = value;
        }
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
        pagesAccess[page.documentID!] = conditionOk(packageConditionsAccess,
            page.conditions!, privilegeLevel, isOwner, isBlocked, isLoggedIn);
      }
    }
    var dialogsAccess = <String, bool>{};
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
        dialogsAccess[dialog.documentID!] = conditionOk(packageConditionsAccess,
            dialog.conditions!, privilegeLevel, isOwner, isBlocked, isLoggedIn);
      }
    }

    return PagesAndDialogAccesss(pagesAccess, dialogsAccess,
        packageConditionsAccess, privilegeLevel, isBlocked);
  }
}

