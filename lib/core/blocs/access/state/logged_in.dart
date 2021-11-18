import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/core/blocs/access/helper/access_helpers.dart';
import 'package:eliud_core/model/access_model.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/dialog_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/model/page_model.dart';
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
    PageModel homePage,
    List<AppModel> apps,
    Map<String, PagesAndDialogAccesss> accesses,
    AccessAction? accessAction,
    {AppModel? playstoreApp, bool? isProcessing}
  ) : super(currentApp, homePage, apps, accesses, accessAction, playstoreApp: playstoreApp, isProcessing: isProcessing);

  static Future<LoggedIn> getLoggedIn(
      User usr,
      MemberModel member,
      AppModel currentApp,
      List<AppModel> apps,
      PostLoginAction? postLoginAction,
      {PageModel? openThisPage,
      Map<String, dynamic>? parameters,
      AppModel? playstoreApp,}) async {
    var accesses = await AccessHelper.getAccesses(member, apps, false);
    var privilegeLevel = _privilegeLevel(currentApp.documentID!, accesses);
    var isBlocked = _isBlocked(currentApp.documentID!, accesses);
    var homePage = await getHomepage(currentApp, isBlocked, privilegeLevel);

    var loggedIn = LoggedIn._(
        usr,
        member,
        postLoginAction,
        currentApp,
        homePage,
        apps,
        accesses,
        openThisPage != null
            ? OpenPageAction(openThisPage, parameters: parameters)
            : OpenPageAction(homePage),
        playstoreApp: playstoreApp,
    );
    return loggedIn;
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
  Future<LoggedIn> switchApp(AppModel newCurrentApp,
      {PageModel? page, Map<String, dynamic>? parameters}) async {
    if (newCurrentApp != currentApp) {
      var newHomePage = await getHomepage(
          newCurrentApp,
          isBlocked(
            newCurrentApp.documentID!,
          ),
          getPrivilegeLevel(newCurrentApp.documentID!));
      var newAccessAction = page != null
          ? OpenPageAction(page, parameters: parameters)
          : OpenPageAction(homePage);
      if (apps.contains(newCurrentApp)) {
        return Future.value(LoggedIn._(
          usr,
          member,
          postLoginAction,
          newCurrentApp,
          newHomePage,
          apps,
          accesses,
          newAccessAction,
          playstoreApp: playstoreApp,
        ));
      } else {
        var newAccesses = await AccessHelper.extendAccesses(member, accesses, newCurrentApp, true);
        var newApps = apps.map((v) => v).toList();
        newApps.add(newCurrentApp);
        return Future.value(LoggedIn._(
          usr,
          member,
          postLoginAction,
          newCurrentApp,
          newHomePage,
          newApps,
          newAccesses,
          newAccessAction,
          playstoreApp: playstoreApp,
        ));

      }
    } else {
      return Future.value(this);
    }
  }

  @override
  Future<LoggedIn> updateApp(
    AppModel newCurrentApp,
  ) {
    if (newCurrentApp.documentID == currentApp.documentID) {
      return Future.value(LoggedIn._(
        usr,
        member,
        postLoginAction,
        newCurrentApp,
        homePage,
        apps,
        accesses,
        accessAction,
        playstoreApp: playstoreApp,
      ));
    } else {
      throw Exception('');
    }
  }

  @override
  AccessDetermined asNotProcessing() {
    return LoggedIn._(
      usr,
      member,
      postLoginAction,
      currentApp,
      homePage,
      apps,
      accesses,
      accessAction,
      playstoreApp: playstoreApp,
      isProcessing: false,
    );
  }

  @override
  AccessDetermined asProcessing() {
    return LoggedIn._(
      usr,
      member,
      postLoginAction,
      currentApp,
      homePage,
      apps,
      accesses,
      accessAction,
      playstoreApp: playstoreApp,
      isProcessing: true,
    );
  }

  @override
  Future<AccessDetermined> copyWithNewPage(PageModel page, {Map<String, dynamic>? parameters}) async {
    return LoggedIn._(
      usr,
      member,
      postLoginAction,
      currentApp,
      homePage,
      apps,
      accesses,
      OpenPageAction(page, parameters: parameters),
      playstoreApp: playstoreApp,
    );
  }

  @override
  Future<AccessDetermined> copyWithNewDialog(DialogModel dialog, {Map<String, dynamic>? parameters}) async {
    return LoggedIn._(
      usr,
      member,
      postLoginAction,
      currentApp,
      homePage,
      apps,
      accesses,
      OpenDialogAction(dialog, parameters: parameters),
      playstoreApp: playstoreApp,
    );
  }

  @override
  MemberModel? getMember() => member;

  @override
  PrivilegeLevel getPrivilegeLevel(String appId) =>
      _privilegeLevel(appId, accesses);

  static PrivilegeLevel _privilegeLevel(
      String appId, Map<String, PagesAndDialogAccesss> accesses) {
    var appAccess = accesses[appId];
    if (appAccess == null) return PrivilegeLevel.NoPrivilege;
    return appAccess.privilegeLevel ?? PrivilegeLevel.NoPrivilege;
  }

  @override
  bool isBlocked(String appId) => _isBlocked(appId, accesses);

  static bool _isBlocked(
      String appId, Map<String, PagesAndDialogAccesss> accesses) {
    var appAccess = accesses[appId];
    if (appAccess == null) return false;
    return appAccess.blocked ?? false;
  }

  @override
  List<MemberCollectionInfo> getMemberCollectionInfo() {
    var memberCollectionInfo = <MemberCollectionInfo>[];
    for (var i = 0; i < Packages.registeredPackages.length; i++) {
      var packageCollectionInfo =
          Packages.registeredPackages[i].getMemberCollectionInfo();
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
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoggedIn &&
          currentApp == other.currentApp &&
          homePage == other.homePage &&
          usr == other.usr &&
          member == other.member &&
          postLoginAction == other.postLoginAction &&
          mapEquals(accesses, other.accesses) &&
          accessAction == other.accessAction &&
          ListEquality().equals(apps, other.apps) &&
          playstoreApp == other.playstoreApp &&
          isProcessing == other.isProcessing;

  @override
  List<Object?> get props => [
    currentApp,
    homePage,
    usr,
    member,
    postLoginAction,
    accesses,
    playstoreApp,
  ];

  static Future<PageModel> getHomepage(
      AppModel app, bool isBlocked, PrivilegeLevel privilegeLevel) {
    var appId = app.documentID!;
    if (isBlocked) {
      return AccessDetermined.getPage(
          appId, app.homePages!.homePageBlockedMember,
          alternativePageId: app.homePages!.homePagePublic);
    }
    if ((privilegeLevel.index >= PrivilegeLevel.OwnerPrivilege.index)) {
      return AccessDetermined.getPage(appId, app.homePages!.homePageOwner,
          alternativePageId: app.homePages!.homePagePublic);
    }
    if ((privilegeLevel.index >= PrivilegeLevel.Level2Privilege.index)) {
      return AccessDetermined.getPage(
          appId, app.homePages!.homePageLevel2Member,
          alternativePageId: app.homePages!.homePagePublic);
    }
    if ((privilegeLevel.index >= PrivilegeLevel.Level1Privilege.index)) {
      return AccessDetermined.getPage(
          appId, app.homePages!.homePageLevel1Member,
          alternativePageId: app.homePages!.homePagePublic);
    }
    if ((privilegeLevel.index >= PrivilegeLevel.NoPrivilege.index)) {
      return AccessDetermined.getPage(
          appId, app.homePages!.homePageSubscribedMember,
          alternativePageId: app.homePages!.homePagePublic);
    }
    return AccessDetermined.getPage(appId, app.homePages!.homePagePublic);
  }
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
*/ /*

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
