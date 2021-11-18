import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/core/blocs/access/helper/access_helpers.dart';
import 'package:eliud_core/model/access_model.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/dialog_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/model/page_model.dart';
import 'package:eliud_core/package/package.dart';
import 'package:flutter/foundation.dart';

import 'access_determined.dart';

class LoggedOut extends AccessDetermined {
  static Future<LoggedOut> getLoggedOut(
    AppModel currentApp,
    List<AppModel> apps, {
    AppModel? playstoreApp,
  }) async {
    var homePage = await getHomepage(currentApp);
    var accesses = await AccessHelper.getAccesses(null, apps, false);
    var loggedOut = LoggedOut._(
        currentApp, homePage, apps, accesses, OpenPageAction(homePage),
        playstoreApp: playstoreApp);
    return loggedOut;
  }

  LoggedOut._(
    AppModel currentApp,
    PageModel homePage,
    List<AppModel> apps,
    Map<String, PagesAndDialogAccesss> accesses,
    AccessAction? accessAction, {
    AppModel? playstoreApp,
    bool? isProcessing,
  }) : super(currentApp, homePage, apps, accesses, accessAction,
            playstoreApp: playstoreApp, isProcessing: isProcessing);

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
      [currentApp, homePage, accesses, apps, playstoreApp, isProcessing];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoggedOut &&
          currentApp == other.currentApp &&
          homePage == other.homePage &&
          runtimeType == other.runtimeType &&
          mapEquals(accesses, other.accesses) &&
          ListEquality().equals(apps, other.apps) &&
          playstoreApp == other.playstoreApp &&
          isProcessing == other.isProcessing;

  @override
  Future<LoggedOut> switchApp(AppModel newCurrentApp,
      {PageModel? page, Map<String, dynamic>? parameters}) async {
    if (newCurrentApp != currentApp) {
      var newHomePage = await getHomepage(newCurrentApp);
      var newAccessAction = page != null
          ? OpenPageAction(page, parameters: parameters)
          : OpenPageAction(homePage);
      if (apps.contains(newCurrentApp)) {
        var homePage = await getHomepage(
          newCurrentApp,
        );
        return Future.value(LoggedOut._(
          newCurrentApp,
          newHomePage,
          apps,
          accesses,
          newAccessAction,
          playstoreApp: playstoreApp,
        ));
      } else {
        var newAccesses = await AccessHelper.extendAccesses(null, accesses, newCurrentApp, false);
        var newApps = apps.map((v) => v).toList();
        newApps.add(newCurrentApp);
        return Future.value(LoggedOut._(
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
  Future<LoggedOut> updateApp(
    AppModel newCurrentApp,
  ) {
    if (newCurrentApp.documentID == currentApp.documentID) {
      return Future.value(LoggedOut._(
        newCurrentApp,
        homePage,
        apps,
        accesses,
        accessAction,
        playstoreApp: playstoreApp,
      ));
    } else {
      throw Exception('Incorrectly received ');
    }
  }

  @override
  Future<AccessDetermined> copyWithNewPage(PageModel page,
      {Map<String, dynamic>? parameters}) async {
    return LoggedOut._(
      currentApp,
      homePage,
      apps,
      accesses,
      OpenPageAction(page, parameters: parameters),
      playstoreApp: playstoreApp,
    );
  }

  @override
  Future<AccessDetermined> copyWithNewDialog(DialogModel dialog,
      {Map<String, dynamic>? parameters}) async {
    return LoggedOut._(
      currentApp,
      homePage,
      apps,
      accesses,
      OpenDialogAction(dialog, parameters: parameters),
      playstoreApp: playstoreApp,
    );
  }

  static Future<PageModel> getHomepage(AppModel app) =>
      AccessDetermined.getPage(app.documentID!, app.homePages!.homePagePublic);

  @override
  AccessDetermined asNotProcessing() {
    return LoggedOut._(
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
    return LoggedOut._(
      currentApp,
      homePage,
      apps,
      accesses,
      accessAction,
      playstoreApp: playstoreApp,
      isProcessing: true,
    );
  }
}
