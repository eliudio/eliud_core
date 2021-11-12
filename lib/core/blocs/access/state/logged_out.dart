import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/core/blocs/access/helper/access_helpers.dart';
import 'package:eliud_core/model/access_model.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/package/package.dart';
import 'package:flutter/foundation.dart';

import 'access_determined.dart';

class LoggedOut extends AccessDetermined {
  static Future<LoggedOut> getLoggedOut(AppModel currentApp, List<AppModel> apps) async {
    var accesses = await AccessHelper.getAccesses(null, apps, false);
    var loggedOut = LoggedOut._(currentApp, apps, accesses);
    return loggedOut;
  }

  LoggedOut._(
      AppModel currentApp,
  List<AppModel> apps,
  Map<String, PagesAndDialogAccesss> accesses,)
      : super(currentApp, apps, accesses);

  @override
  bool hasAccessToOtherApps() => false;

  @override
  bool isLoggedIn() => false;

  @override
  bool forceAcceptMembership(String appId) => false;

  @override
  bool memberIsOwner(String appId) => false;

  @override
  MemberModel? getMember() => null;

  @override
  PrivilegeLevel getPrivilegeLevel(String appId) => PrivilegeLevel.NoPrivilege;

  @override
  bool isBlocked(String appId) => false;

  @override
  List<MemberCollectionInfo>? getMemberCollectionInfo() => null;

  @override
  List<Object?> get props =>
      [apps, accesses];

  @override
  bool operator == (Object other) =>
      identical(this, other) ||
          other is LoggedOut &&
              currentApp == other.currentApp &&
              runtimeType == other.runtimeType &&
              mapEquals(accesses, other.accesses) &&
              ListEquality().equals(apps, other.apps);

  @override
  Future<LoggedOut> switchApp(AppModel newCurrentApp, ) {
    if (newCurrentApp != currentApp) {
      if (apps.contains(newCurrentApp)) {
        return Future.value(LoggedOut._(
          newCurrentApp,
          apps,
          accesses,
        ));
      } else {
        // todo: OPTIMISE THIS, REUSE THE ACCESS WE ALREADY DETERMINED FOR THE EXISTING APPS
        var newApps = apps.map((v) => v).toList();
        newApps.add(newCurrentApp);
        return getLoggedOut(
            newCurrentApp,
            newApps);
      }
    } else {
      return Future.value(this);
    }
  }

  @override
  Future<LoggedOut> updateApp(AppModel newCurrentApp, ) {
    if (newCurrentApp == currentApp) {
      return Future.value(LoggedOut._(
        newCurrentApp,
        apps,
        accesses,
      ));
    } else {
      throw Exception('Incorrectly received ');
    }
  }
}
