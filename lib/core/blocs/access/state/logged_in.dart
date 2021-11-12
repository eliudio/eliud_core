import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/core/blocs/access/helper/access_helpers.dart';
import 'package:eliud_core/model/access_model.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/package/package.dart';
import 'package:eliud_core/package/packages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '../access_event.dart';
import 'access_determined.dart';

class LoggedIn extends AccessDetermined {
  final User usr;
  final MemberModel member;
  final PostLoginAction? postLoginAction;

  LoggedIn._(
      this.usr,
      this.member,
      this.postLoginAction,
      AppModel currentApp,
      List<AppModel> apps,
      Map<String, PagesAndDialogAccesss> accesses,
      )
      : super(currentApp, apps, accesses);

  static Future<LoggedIn> getLoggedIn(
      User usr,
      MemberModel member,
      AppModel currentApp,
      List<AppModel> apps,
      PostLoginAction? postLoginAction) async {
    var accesses = await AccessHelper.getAccesses(member, apps, false);
    var loggedInWithoutMembership = LoggedIn._(
        usr,
        member,
        postLoginAction,
        currentApp,
        apps,
        accesses);
    return loggedInWithoutMembership;
  }

  @override
  bool hasAccessToOtherApps() {
    if (member.subscriptions != null) return false;
    return member.subscriptions!.length > 1;
  }

  @override
  bool isLoggedIn() => true;

  String? memberProfilePhoto() {
    return member.photoURL;
  }

  @override
  bool memberIsOwner(String appId) {
    return member.documentID == appId;
  }

  @override
  Future<LoggedIn> switchApp(AppModel newCurrentApp, ) {
    if (newCurrentApp != currentApp) {
      if (apps.contains(newCurrentApp)) {
        return Future.value(LoggedIn._(
          usr,
          member,
          postLoginAction,
          newCurrentApp,
          apps,
          accesses,
        ));
      } else {
        // todo: OPTIMISE THIS, REUSE THE ACCESS WE ALREADY DETERMINED FOR THE EXISTING APPS
        var newApps = apps.map((v) => v).toList();
        newApps.add(newCurrentApp);
        return getLoggedIn(
            usr,
            member,
            newCurrentApp,
            newApps, null);
      }
    } else {
      return Future.value(this);
    }
  }

  @override
  Future<LoggedIn> updateApp(AppModel newCurrentApp, ) {
    if (newCurrentApp == currentApp) {
      return Future.value(LoggedIn._(
        usr,
        member,
        postLoginAction,
        newCurrentApp,
        apps,
        accesses,
      ));
    } else {
      throw Exception('');
    }
  }

  @override
  MemberModel? getMember() => member;

  @override
  PrivilegeLevel getPrivilegeLevel(String appId) {
    var appAccess = accesses[appId];
    if (appAccess == null) return PrivilegeLevel.NoPrivilege;
    return appAccess.privilegeLevel ?? PrivilegeLevel.NoPrivilege;
  }

  @override
  bool isBlocked(String appId) {
    var appAccess = accesses[appId];
    if (appAccess == null) return false;
    return appAccess.blocked ?? false;
  }

  @override
  List<MemberCollectionInfo> getMemberCollectionInfo() {
    var memberCollectionInfo = <MemberCollectionInfo>[];
    for (var i = 0; i < Packages.registeredPackages.length; i++) {
      var packageCollectionInfo = Packages.registeredPackages[i].getMemberCollectionInfo();
      if (packageCollectionInfo != null) {
        memberCollectionInfo.addAll(packageCollectionInfo);
      }
    }
    return memberCollectionInfo;
  }

  @override
  // todo!
  bool forceAcceptMembership(String appId) => false;

  @override
  bool operator == (Object other) =>
      identical(this, other) ||
          other is LoggedIn &&
              currentApp == other.currentApp &&
              usr == other.usr &&
              member == other.member &&
              postLoginAction == other.postLoginAction &&
              mapEquals(accesses, other.accesses) &&
              ListEquality().equals(apps, other.apps);
}

/*
class LoggedInWithoutMembership extends LoggedIn {

  static Future<LoggedInWithoutMembership> getLoggedInWithoutMembership(
      User usr,
      MemberModel member,
      List<AppModel> apps,
      PostLoginAction? postLoginAction) async {
    var accesses = await AccessHelper.getAccesses(null, apps, false);
    var loggedInWithoutMembership = LoggedInWithoutMembership._(
        usr,
        member,
        postLoginAction,
        apps,
        accesses);
    return loggedInWithoutMembership;
  }

  LoggedInWithoutMembership._(
      User usr,
      MemberModel member,
      PostLoginAction? postLoginAction,
      List<AppModel> apps,
      Map<String, PagesAndDialogAccesss> accesses,
      )
      : super._(usr, member, postLoginAction, apps, accesses);

  @override
  Future<LoggedInWithoutMembership> copyWith(MemberModel? member) async {
    return getLoggedInWithoutMembership(
        usr, member ?? this.member, apps, postLoginAction);
  }

  @override
  bool forceAcceptMembership(String appId) => true;

  @override
  List<Object?> get props => [
    usr,
    member,
  ];

  @override
  bool operator == (Object other) =>
      identical(this, other) ||
          other is LoggedInWithoutMembership &&
              usr == other.usr &&
              member == other.member &&
              postLoginAction == other.postLoginAction &&
              mapEquals(accesses, other.accesses) &&
              ListEquality().equals(apps, other.apps);
}

class LoggedInWithMembership extends LoggedIn {
  static Future<LoggedInWithMembership> getLoggedInWithMembership(
    User usr,
    MemberModel member,
    PostLoginAction? postLoginAction,
    List<AppModel> apps,
  ) async {
    var accesses = await AccessHelper.getAccesses(member, apps, false);
    var loggedInWithMembership = LoggedInWithMembership._(
        usr,
        member,
        postLoginAction,
        apps,
        accesses,
    );
    return loggedInWithMembership;
  }

  LoggedInWithMembership._(
      User usr,
      MemberModel member,
      PostLoginAction? postLoginAction,
      List<AppModel> apps,
      Map<String, PagesAndDialogAccesss> accesses,
      )
      : super._(usr, member, postLoginAction, apps, accesses);

  @override
  Future<LoggedInWithMembership> copyWith(
      MemberModel? theMember) {
    return getLoggedInWithMembership(
        usr, member ?? this.member, postLoginAction, apps);
  }

  Future<LoggedInWithMembership> copyWithOtherPrivilege(AppModel app, PrivilegeLevel privilegeLevel, bool blocked) async {
*/
/*
    var accesses = await AccessHelper.getAccesses2(member, app, false, );
    return LoggedInWithMembership._(
        usr,
        member, apps, accesses);
*//*

  }

  @override
  bool forceAcceptMembership(String appId) => false;

  @override
  List<Object?> get props => [
    usr,
    member,
  ];

  @override
  bool operator == (Object other) =>
      identical(this, other) ||
          other is LoggedInWithoutMembership &&
              usr == other.usr &&
              member == other.member &&
              postLoginAction == other.postLoginAction &&
              mapEquals(accesses, other.accesses) &&
              ListEquality().equals(apps, other.apps);
}
*/
