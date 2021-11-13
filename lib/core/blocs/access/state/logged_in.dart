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
    AccessContext currentContext,
    List<AppModel> apps,
    Map<String, PagesAndDialogAccesss> accesses,
  ) : super(currentApp, currentContext, apps, accesses);

  static Future<LoggedIn> getLoggedIn(
      User usr,
      MemberModel member,
      AppModel currentApp,
      List<AppModel> apps,
      PostLoginAction? postLoginAction, {PageModel? page, Map<String, dynamic>? parameters}) async {
    var accesses = await AccessHelper.getAccesses(member, apps, false);
    var newPageContext;
    if (page == null) {
      var privilegeLevel = _privilegeLevel(currentApp.documentID!, accesses);
      var isBlocked = _isBlocked(currentApp.documentID!, accesses);
      newPageContext = PageContext(await getHomepage(currentApp, isBlocked, privilegeLevel));
    } else {
      assert(page.appId == currentApp.documentID);
      newPageContext = PageContext(page, parameters: parameters);
    }

    var loggedInWithoutMembership = LoggedIn._(usr, member, postLoginAction,
        currentApp, newPageContext, apps, accesses);
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
  Future<LoggedIn> switchApp(AppModel newCurrentApp, {PageModel? pageModel, Map<String, dynamic>? parameters}) async {
    if (newCurrentApp != currentApp) {
      if (apps.contains(newCurrentApp)) {
        var newPageContext = pageModel != null ? PageContext(pageModel, parameters: parameters) : PageContext(await getHomepage(
            newCurrentApp,
            isBlocked(
              newCurrentApp.documentID!,
            ),
            getPrivilegeLevel(newCurrentApp.documentID!)));
        return Future.value(LoggedIn._(
          usr,
          member,
          postLoginAction,
          newCurrentApp,
          newPageContext,
          apps,
          accesses,
        ));
      } else {
        // todo: OPTIMISE THIS, REUSE THE ACCESS WE ALREADY DETERMINED FOR THE EXISTING APPS
        var newApps = apps.map((v) => v).toList();
        newApps.add(newCurrentApp);
        return getLoggedIn(
            usr, member, newCurrentApp, newApps, null, page: pageModel);
      }
    } else {
      return Future.value(this);
    }
  }

  @override
  Future<LoggedIn> updateApp(
    AppModel newCurrentApp,
  ) {
    if (newCurrentApp == currentApp) {
      return Future.value(LoggedIn._(
        usr,
        member,
        postLoginAction,
        newCurrentApp,
        currentContext,
        apps,
        accesses,
      ));
    } else {
      throw Exception('');
    }
  }

  @override
  Future<AccessDetermined> copyWithNewPage(PageModel page, {Map<String, dynamic>? parameters}) async {
    return LoggedIn._(
      usr,
      member,
      postLoginAction,
      currentApp,
      PageContext(page, parameters: parameters),
      apps,
      accesses,
    );
  }

  @override
  Future<AccessDetermined> copyWithNewDialog(DialogModel dialog, {Map<String, dynamic>? parameters}) async {
    return LoggedIn._(
      usr,
      member,
      postLoginAction,
      currentApp,
      DialogContext(dialog, parameters: parameters),
      apps,
      accesses,
    );
  }

  @override
  MemberModel? getMember() => member;

  @override
  PrivilegeLevel getPrivilegeLevel(String appId) => _privilegeLevel(appId, accesses);

  static PrivilegeLevel _privilegeLevel(String appId, Map<String, PagesAndDialogAccesss> accesses) {
    var appAccess = accesses[appId];
    if (appAccess == null) return PrivilegeLevel.NoPrivilege;
    return appAccess.privilegeLevel ?? PrivilegeLevel.NoPrivilege;
  }

  @override
  bool isBlocked(String appId) => _isBlocked(appId, accesses);

  static bool _isBlocked(String appId, Map<String, PagesAndDialogAccesss>  accesses) {
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
          currentContext == other.currentContext &&
          usr == other.usr &&
          member == other.member &&
          postLoginAction == other.postLoginAction &&
          mapEquals(accesses, other.accesses) &&
          ListEquality().equals(apps, other.apps);

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
