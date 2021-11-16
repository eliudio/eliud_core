import 'package:eliud_core/core/blocs/access/helper/access_helpers.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/access_model.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/dialog_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/model/menu_item_model.dart';
import 'package:eliud_core/model/page_model.dart';
import 'package:eliud_core/tools/action/action_model.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import 'access_state.dart';

abstract class AccessAction extends Equatable {
  final Map<String, dynamic>? parameters;

  AccessAction(this.parameters);
  String appId();

  @override
  List<Object?> get props => [ parameters ];
}

class NoAction extends AccessAction {
  NoAction(Map<String, dynamic>? parameters) : super(parameters);

  @override
  String appId() => throw Exception("NoAction has no appId");
}

class OpenPageAction extends AccessAction {
  final PageModel page;

  OpenPageAction(this.page, {Map<String, dynamic>? parameters}): super(parameters);

  @override
  String appId() => page.appId!;

  @override
  List<Object?> get props => [page, parameters];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is OpenPageAction &&
              page == other.page &&
              mapEquals(parameters, other.parameters);
}

class OpenDialogAction extends AccessAction {
  final DialogModel dialog;

  OpenDialogAction(this.dialog, {Map<String, dynamic>? parameters}): super(parameters);

  @override
  String appId() => dialog.appId!;

  @override
  List<Object?> get props => [dialog, parameters];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is OpenDialogAction &&
              dialog == other.dialog &&
              mapEquals(parameters, other.parameters);
}

abstract class AccessDetermined extends AccessState {
  final AppModel currentApp;
  final PageModel homePage;
  final List<AppModel> apps;
  final Map<String, PagesAndDialogAccesss> accesses;
  AccessAction? accessAction;

  @override
  List<Object?> get props =>
      [apps, accesses];

  AccessDetermined(this.currentApp, this.homePage, this.apps, this.accesses, this.accessAction);

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
  Future<AccessDetermined> switchApp(AppModel newCurrentApp, {PageModel? page, Map<String, dynamic>? parameters});
  Future<AccessDetermined> updateApp(AppModel newCurrentApp, );

  String currentAppId() => currentApp.documentID!;
  bool isCurrentAppBlocked() => isBlocked(currentAppId());
  PrivilegeLevel getPrivilegeLevelCurrentApp() => getPrivilegeLevel(currentAppId());

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

  Future<AccessDetermined> switchPage(PageModel page, {Map<String, dynamic>? parameters}) async {
    if (page.appId != currentApp.documentID) {
      var newCurrentApp = await appRepository()!.get(page.appId);
      if (newCurrentApp != null) {
        return switchApp(newCurrentApp, page: page, parameters: parameters);
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
}
