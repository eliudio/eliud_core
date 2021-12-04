import 'package:eliud_core/core/blocs/access/helper/access_helpers.dart';
import 'package:eliud_core/core/navigate/router.dart' as eliud_router;
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/access_model.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/dialog_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/model/menu_item_model.dart';
import 'package:eliud_core/model/page_model.dart';
import 'package:eliud_core/package/package.dart';
import 'package:eliud_core/tools/action/action_model.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../access_bloc.dart';
import 'access_state.dart';

class DeterminedApp extends Equatable {
  final AppModel app;
  final PageModel homePage;

  DeterminedApp(this.app, this.homePage);

  @override
  List<Object?> get props => [app, homePage];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is DeterminedApp &&
              app == other.app &&
              homePage == other.homePage;
}

abstract class AccessDetermined extends AccessState {
  final AppModel? playstoreApp;
  final List<DeterminedApp> apps;
  final Map<String, PagesAndDialogAccesss> accesses;
  bool? isProcessing;

  bool isProcessingStatus() => isProcessing ?? false;

  @override
  List<Object?> get props =>
      [apps, accesses];

  AccessDetermined(this.apps, this.accesses, {this.playstoreApp, this.isProcessing});

  bool actionHasAccess(ActionModel action) {
    if (action.conditions != null) {
      var theAccess = accesses[action.appID];
      if ((theAccess != null) && (!AccessHelper.conditionOk(
          theAccess.packageConditionsAccess,
          action.conditions!,
          getPrivilegeLevel(action.appID),
          memberIsOwner(action.appID),
          isBlocked(action.appID),
          isLoggedIn()))) return false;
    }
    if (action is GotoPage) {
      var theAccess = accesses[action.appID];
      if (theAccess == null) return false;
      var pageID = action.pageID;
      var access = theAccess.pagesAccess[pageID];
      if (access == null) return false;
      return access;
    } else if (action is OpenDialog) {
      var theAccess = accesses[action.appID];
      if (theAccess == null) return false;
      var dialogID = action.dialogID;
      var access = theAccess.dialogsAccess[dialogID];
      if (access == null) return false;
      return access;
    } else if (action is PopupMenu) {
      var access = false;
      action.menuDef!.menuItems!.forEach((item) {
        if (menuItemHasAccess(item)) access = true;
      });
      return access;
    } else if (action is InternalAction) {
      if (action.internalActionEnum == InternalActionEnum.Login) {
        return !isLoggedIn();
      } else if (action.internalActionEnum == InternalActionEnum.Logout) {
        return isLoggedIn();
      } else if (action.internalActionEnum == InternalActionEnum.OtherApps) {
        return hasAccessToOtherApps();
      }
      return true;
    }
    return true;
  }

  bool menuItemHasAccess(MenuItemModel item) {
    try {
      var action = item.action!;
      return actionHasAccess(action);
    } catch (_) {
      return false;
    }
  }

  List<bool> hasNAccess(AccessState state, List<MenuItemModel> items) {
    return items.map((e) => menuItemHasAccess(e)).toList();
  }

  @override
  MemberModel? getMember();
  PrivilegeLevel getPrivilegeLevel(String appId);
  bool isBlocked(String appId);
  Future<AccessDetermined> addApp(AccessBloc accessBloc, AppModel newCurrentApp);

  String currentAppId(BuildContext context) => eliud_router.Router.getCurrentAppId(context);
  AppModel currentApp(BuildContext context) {
    var appId = currentAppId(context);
    for (var app in apps) {
      if (app.app.documentID == appId) return app.app;
    }
    throw Exception("Can not find app with id $appId");
  }

  bool isCurrentAppBlocked(BuildContext context) => isBlocked(currentAppId(context));
  PrivilegeLevel getPrivilegeLevelCurrentApp(BuildContext context) => getPrivilegeLevel(currentAppId(context));

  static Future<PageModel> getPage(String appId, String? pageId, { String? alternativePageId }) async {
    var page;
    if (pageId != null) {
      page = await pageRepository(appId: appId)!.get(pageId);
    }
    if (page == null) {
      if (alternativePageId != null) {
        page = await pageRepository(appId: appId)!.get(alternativePageId);
        if (page == null) {
          throw Exception('Failed to retrieve the page for app with id $appId. pageId = $pageId, alternativePageId = $alternativePageId');
        } else {
          print('Warning: Failed to retrieve the page for app with id $appId. pageId = $pageId. Using the alternativePageId = $alternativePageId');
          return page;
        }
      } else {
        throw Exception('Failed to retrieve the page for app with id $appId. pageId = $pageId, alternativePageId = $alternativePageId');
      }
    } else {
      return page;
    }
  }

/*
  Future<AccessDetermined> switchPage(PageModel page, {Map<String, dynamic>? parameters}) async {
    if (page.appId != currentApp.documentID) {
      var newCurrentApp = await appRepository()!.get(page.appId);
      if (newCurrentApp != null) {
        return addApp(newCurrentApp, page: page, parameters: parameters);
      } else {
        throw Exception("newCurrentApp can not be determined. appId = " + page.appId!);
      }
    } else {
      return copyWithNewPage(page, parameters: parameters);
    }
  }

  Future<AccessDetermined> openDialog(DialogModel dialog, {Map<String, dynamic>? parameters}) async {
    assert(dialog.appId == currentApp.documentID);
    return copyWithNewDialog(dialog, parameters: parameters);
  }

  Future<AccessDetermined> copyWithNewPage(PageModel page, {Map<String, dynamic>? parameters});
  Future<AccessDetermined> copyWithNewDialog(DialogModel dialog, {Map<String, dynamic>? parameters});

*/
  AccessDetermined asNotProcessing();
  AccessDetermined asProcessing();
  @override
  AccessDetermined withDifferentPackageCondition(
      String appId, Package package, String packageCondition, bool value) {
    var newAccesses = {...accesses};
    if (newAccesses[appId] != null) {
      var newPackageConditionsAccess = {
        ...newAccesses[appId]!.packageConditionsAccess
      };
      newPackageConditionsAccess[packageCondition] = value;
      newAccesses[appId] = newAccesses[appId]!
          .copyWith(packageConditionsAccess: newPackageConditionsAccess);

      return withNewAccesses(newAccesses);
    } else {
      return this;
    }
  }
  AccessDetermined withNewAccesses(Map<String, PagesAndDialogAccesss> newAccesses);
  Future<AccessDetermined> withOtherPrivilege(AccessBloc accessBloc, AppModel app, PrivilegeLevel privilege, bool blocked);

  Future<AccessDetermined> updateApp(
      AppModel newCurrentApp,
      ) {
    List<DeterminedApp> newApps = [];
    for (var app in apps) {
      if (app.app.documentID == newCurrentApp.documentID) {
        newApps.add(DeterminedApp(newCurrentApp, app.homePage));
      } else {
        newApps.add(app);
      }
    }
    return updateApps(newApps);
  }

  Future<AccessDetermined> updateApps(
      List<DeterminedApp> newApps,
      );

  PageModel homePageForAppId(String appId) {
    for (var app in apps) {
      if (app.app.documentID == appId) {
        return app.homePage;
      }
    }
    throw Exception('app not found when trying to find homepage');
  }
}
