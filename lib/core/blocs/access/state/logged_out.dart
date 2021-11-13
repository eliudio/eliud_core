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
      AppModel currentApp, List<AppModel> apps,
      {PageModel? page}) async {
    var newPage = page ?? await getHomepage(currentApp);
    var accesses = await AccessHelper.getAccesses(null, apps, false);
    var loggedOut =
        LoggedOut._(currentApp, PageContext(newPage), apps, accesses);
    return loggedOut;
  }

  LoggedOut._(
    AppModel currentApp,
    AccessContext currentContext,
    List<AppModel> apps,
    Map<String, PagesAndDialogAccesss> accesses,
  ) : super(currentApp, currentContext, apps, accesses);

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
  List<Object?> get props => [apps, accesses];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoggedOut &&
          currentApp == other.currentApp &&
          currentContext == other.currentContext &&
          runtimeType == other.runtimeType &&
          mapEquals(accesses, other.accesses) &&
          ListEquality().equals(apps, other.apps);

  @override
  Future<LoggedOut> switchApp(AppModel newCurrentApp,
      {PageModel? pageModel, Map<String, dynamic>? parameters}) async {
    if (newCurrentApp != currentApp) {
      if (apps.contains(newCurrentApp)) {
        var newPageContext = pageModel != null ? PageContext(pageModel, parameters: parameters) :
            PageContext(await getHomepage(
              newCurrentApp,
            ));
        return Future.value(LoggedOut._(
          newCurrentApp,
          newPageContext,
          apps,
          accesses,
        ));
      } else {
        // todo: OPTIMISE THIS, REUSE THE ACCESS WE ALREADY DETERMINED FOR THE EXISTING APPS
        var newApps = apps.map((v) => v).toList();
        newApps.add(newCurrentApp);
        return getLoggedOut(newCurrentApp, newApps, page: pageModel);
      }
    } else {
      return Future.value(this);
    }
  }

  @override
  Future<LoggedOut> updateApp(
    AppModel newCurrentApp,
  ) {
    if (newCurrentApp == currentApp) {
      return Future.value(LoggedOut._(
        newCurrentApp,
        currentContext,
        apps,
        accesses,
      ));
    } else {
      throw Exception('Incorrectly received ');
    }
  }

  @override
  Future<AccessDetermined> copyWithNewPage(PageModel page, {Map<String, dynamic>? parameters}) async {
    return LoggedOut._(
      currentApp,
      PageContext(page, parameters: parameters),
      apps,
      accesses,
    );
  }

  @override
  Future<AccessDetermined> copyWithNewDialog(DialogModel dialog, {Map<String, dynamic>? parameters}) async {
    return LoggedOut._(
      currentApp,
      DialogContext(dialog, parameters: parameters),
      apps,
      accesses,
    );
  }

  static Future<PageModel> getHomepage(AppModel app) =>
      AccessDetermined.getPage(app.documentID!, app.homePages!.homePagePublic);
}
