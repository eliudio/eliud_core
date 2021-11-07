import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/core/blocs/access/helper/access_helpers.dart';
import 'package:eliud_core/model/access_model.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/package/package.dart';
import 'package:flutter/foundation.dart';

import 'access_determined.dart';

class LoggedOut extends AccessDetermined {
  static Future<LoggedOut> getLoggedOut(List<AppModel> apps) async {
    var accesses = await AccessHelper.getAccesses(null, apps, false);
    var loggedOut = LoggedOut._(apps, accesses);
    return loggedOut;
  }

  LoggedOut._(
  List<AppModel> apps,
  Map<String, PagesAndDialogAccesss> accesses,)
      : super(apps, accesses);

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
              runtimeType == other.runtimeType &&
              mapEquals(accesses, other.accesses) &&
              ListEquality().equals(apps, other.apps);
}
