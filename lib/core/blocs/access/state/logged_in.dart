import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/core/blocs/access/helper/access_helpers.dart';
import 'package:eliud_core/model/access_model.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/dialog_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/model/page_model.dart';
import 'package:eliud_core/package/package.dart';
import 'package:eliud_core/package/packages.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '../access_bloc.dart';
import '../access_event.dart';
import 'access_determined.dart';

class LoggedIn extends AccessDetermined {
  final User usr;
  final MemberModel member;
  final PostLoginAction? postLoginAction;
  final List<String> subscribedToApps;

  LoggedIn._(
      this.usr,
      this.member,
      this.postLoginAction,
      AppModel currentApp,
      List<DeterminedApp> apps,
      Map<String, PagesAndDialogAccesss> accesses,
      this.subscribedToApps,
      {AppModel? playstoreApp,
      bool? isProcessing})
      : super(currentApp, apps, accesses,
            playstoreApp: playstoreApp, isProcessing: isProcessing);

  static Future<LoggedIn> getLoggedIn(
    AppModel currentApp,
    AccessBloc accessBloc,
    User usr,
    MemberModel member,
    List<AppModel> apps,
    PostLoginAction? postLoginAction,
    List<String> subscribedToApps, {
    AppModel? playstoreApp,
  }) async {

    var accesses =
    await AccessHelper.getAccesses(accessBloc, member, apps, false);

    var determinedApps = await Future.wait(apps.map((app) async {
      var privilegeLevel = _privilegeLevel(app.documentID!, accesses);
      var appIsBlocked = _isBlocked(app.documentID!, accesses);
      var homePage = await getHomepage(app, appIsBlocked, privilegeLevel);
      return DeterminedApp(app, homePage);
    }).toList());

    var loggedIn = LoggedIn._(
      usr,
      member,
      postLoginAction,
      currentApp,
      determinedApps,
      accesses,
      subscribedToApps,
      playstoreApp: playstoreApp,
    );
    return loggedIn;
  }

  static Future<LoggedIn> getLoggedIn2(
    AccessBloc accessBloc,
    User usr,
    MemberModel member,
    AppModel app,
    List<String> subscribedToApps, {
    AppModel? playstoreApp,
  }) async {
    var accesses =
        await AccessHelper.getAccesses2(accessBloc, member, [app], false);
    var privilegeLevel = _privilegeLevel(app.documentID!, accesses);
    var appIsBlocked = _isBlocked(app.documentID!, accesses);
    var homePage = await getHomepage(app, appIsBlocked, privilegeLevel);
    var apps = [DeterminedApp(app, homePage)];

    var loggedIn = LoggedIn._(
      usr,
      member,
      null,
      app,
      apps,
      accesses,
      subscribedToApps,
      playstoreApp: playstoreApp,
    );
    return loggedIn;
  }

  bool isSubscribedToCurrentApp() {
    return subscribedToApps.contains(currentApp.documentID);
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
    var memberId = member.documentID;
    for (var app in apps) {
      if (app.app.documentID == appId) return app.app.ownerID == memberId;
    }
    return false;
  }

  @override
  Future<LoggedIn> addApp(AccessBloc accessBloc, AppModel newCurrentApp) async {
    for (var app in apps) {
      if (app.app.documentID == newCurrentApp.documentID) {
        return LoggedIn._(
          usr,
          member,
          postLoginAction,
          newCurrentApp,
          apps,
          accesses,
          subscribedToApps,
          playstoreApp: playstoreApp,
          isProcessing: isProcessing,
        );
      }
    }

    return addApp2(accessBloc, accesses, apps, newCurrentApp);
  }

  @override
  Future<LoggedIn> addApp2(AccessBloc accessBloc, Map<String, PagesAndDialogAccesss> _accesses, List<DeterminedApp> _apps, AppModel newCurrentApp) async {
    var newAccesses = await AccessHelper.extendAccesses(
        accessBloc, member, _accesses, newCurrentApp, true);
    var newApps = _apps.map((v) => v).toList();

    var privilegeLevel =
    _privilegeLevel(newCurrentApp.documentID!, newAccesses);
    var appIsBlocked = _isBlocked(newCurrentApp.documentID!, newAccesses);
    var homePage =
    await getHomepage(newCurrentApp, appIsBlocked, privilegeLevel);
    newApps.add(DeterminedApp(newCurrentApp, homePage));
    return Future.value(LoggedIn._(
      usr,
      member,
      postLoginAction,
      newCurrentApp,
      newApps,
      newAccesses,
      subscribedToApps,
      playstoreApp: playstoreApp,
    ));
  }

  @override
  Future<LoggedIn> updateApps(
      AppModel newCurrentApp,
    List<DeterminedApp> newApps,
  ) {
    return Future.value(LoggedIn._(
      usr,
      member,
      postLoginAction,
      newCurrentApp,
      newApps,
      accesses,
      subscribedToApps,
      playstoreApp: playstoreApp,
    ));
  }

  @override
  AccessDetermined asNotProcessing() {
    return LoggedIn._(
      usr,
      member,
      postLoginAction,
      currentApp,
      apps,
      accesses,
      subscribedToApps,
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
      apps,
      accesses,
      subscribedToApps,
      playstoreApp: playstoreApp,
      isProcessing: true,
    );
  }

  @override
  AccessDetermined withNewAccesses(
      Map<String, PagesAndDialogAccesss> newAccesses) {
    return LoggedIn._(
      usr,
      member,
      postLoginAction,
      currentApp,
      apps,
      newAccesses,
      subscribedToApps,
      playstoreApp: playstoreApp,
      isProcessing: isProcessing,
    );
  }

/*
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
*/

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
          usr == other.usr &&
          member == other.member &&
          postLoginAction == other.postLoginAction &&
          mapEquals(accesses, other.accesses) &&
          ListEquality().equals(apps, other.apps) &&
          ListEquality().equals(subscribedToApps, other.subscribedToApps) &&
          playstoreApp == other.playstoreApp &&
          isProcessing == other.isProcessing;

  @override
  List<Object?> get props => [
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

  @override
  Future<AccessDetermined> withOtherPrivilege(AccessBloc accessBloc,
      AppModel newApp, PrivilegeLevel privilege, bool blocked) async {
    var newAccesses = await AccessHelper.extendAccesses(
        accessBloc, member, accesses, newApp, true);
    var newApps = apps.map((v) => v).toList();
    newApps
        .removeWhere((element) => element.app.documentID == newApp.documentID);

    var homePage = await getHomepage(newApp, blocked, privilege);
    newApps.add(DeterminedApp(newApp, homePage));
    return Future.value(LoggedIn._(
      usr,
      member,
      postLoginAction,
      currentApp,
      newApps,
      newAccesses,
      subscribedToApps,
      playstoreApp: playstoreApp,
    ));
  }

  LoggedIn withSubscriptions(List<String> newSubscribedToApps) {
    return LoggedIn._(
      usr,
      member,
      postLoginAction,
      currentApp,
      apps,
      accesses,
      newSubscribedToApps,
      playstoreApp: playstoreApp,
    );
  }

}
