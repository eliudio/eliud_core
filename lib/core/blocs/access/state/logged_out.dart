import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/core/blocs/access/helper/access_helpers.dart';
import 'package:eliud_core/model/access_model.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/dialog_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/model/page_model.dart';
import 'package:eliud_core/package/package.dart';
import 'package:flutter/foundation.dart';

import '../access_bloc.dart';
import 'access_determined.dart';

class LoggedOut extends AccessDetermined {
  static Future<LoggedOut> getLoggedOut(AppModel currentApp, AccessBloc accessBloc,
      List<DeterminedApp> apps, {
        AppModel? playstoreApp,
      }) async {
    var accesses = await AccessHelper.getAccesses(accessBloc, null, apps, false);
    var loggedOut = LoggedOut._(currentApp, apps, accesses, playstoreApp: playstoreApp);
    return loggedOut;
  }

  static Future<LoggedOut> getLoggedOut2(AccessBloc accessBloc,
      AppModel app, {
      AppModel? playstoreApp,
      }) async {
    var homePage = await getHomepage(app);
    var apps = [DeterminedApp(app, homePage)];
    var accesses = await AccessHelper.getAccesses(accessBloc, null, apps, false);
    var loggedOut = LoggedOut._(app, apps, accesses, playstoreApp: playstoreApp);
    return loggedOut;
  }

  LoggedOut._(AppModel currentApp,
    List<DeterminedApp> apps,
    Map<String, PagesAndDialogAccesss> accesses, {
    AppModel? playstoreApp,
    bool? isProcessing,
  }) : super(currentApp, apps, accesses,
            playstoreApp: playstoreApp, isProcessing: isProcessing);

  @override
  bool hasAccessToOtherApps() => false;

  @override
  bool isLoggedIn() => false;

  @override
  bool forceAcceptMembership(String appId) => false;

  @override
  bool memberIsOwner(String memberId) => false;

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
      [currentApp, accesses, apps, playstoreApp, isProcessing];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoggedOut &&
          currentApp == other.currentApp &&
          runtimeType == other.runtimeType &&
          mapEquals(accesses, other.accesses) &&
          ListEquality().equals(apps, other.apps) &&
          playstoreApp == other.playstoreApp &&
          isProcessing == other.isProcessing;

  @override
  Future<LoggedOut> addApp(AccessBloc accessBloc, AppModel newCurrentApp) async {
    if (apps.contains(newCurrentApp)) {
      return LoggedOut._(newCurrentApp,
        apps,
        accesses,
        playstoreApp: playstoreApp,
        isProcessing: isProcessing,
      );
    } else {
      var homePage = await getHomepage(newCurrentApp);
      var newAccesses = await AccessHelper.extendAccesses(accessBloc,
          null, accesses, newCurrentApp, false);
      var newApps = apps.map((v) => v).toList();
      newApps.add(DeterminedApp(newCurrentApp, homePage));
      return Future.value(LoggedOut._(newCurrentApp,
        newApps,
        newAccesses,
        playstoreApp: playstoreApp,
      ));
    }
  }

  @override
  Future<LoggedOut> updateApps(
    List<DeterminedApp> newApps,
  ) {
    return Future.value(LoggedOut._(currentApp,
      newApps,
      accesses,
      playstoreApp: playstoreApp,
    ));
  }

/*
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
*/

  static Future<PageModel> getHomepage(AppModel app) =>
      AccessDetermined.getPage(app.documentID!, app.homePages!.homePagePublic);

  @override
  AccessDetermined asNotProcessing() {
    return LoggedOut._(currentApp,
      apps,
      accesses,
      playstoreApp: playstoreApp,
      isProcessing: false,
    );
  }

  @override
  AccessDetermined asProcessing() {
    return LoggedOut._(currentApp,
      apps,
      accesses,
      playstoreApp: playstoreApp,
      isProcessing: true,
    );
  }

  @override
  AccessDetermined withNewAccesses(Map<String, PagesAndDialogAccesss> newAccesses) {
    return LoggedOut._(currentApp,
      apps,
      newAccesses,
      playstoreApp: playstoreApp,
      isProcessing: isProcessing,
    );
  }

  @override
  Future<AccessDetermined> withOtherPrivilege(AccessBloc accessBloc, AppModel newApp, PrivilegeLevel privilege, bool blocked) async {
    accesses.removeWhere((key, value) => key == newApp.documentID);
    var newAccesses = await AccessHelper.extendAccesses(accessBloc,
        null, accesses, newApp, false);
    return Future.value(LoggedOut._(currentApp,
      apps,
      newAccesses,
      playstoreApp: playstoreApp,
    ));
  }
}
