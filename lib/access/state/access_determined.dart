import 'package:eliud_core_main/apis/action_api/action_model.dart';
import 'package:eliud_core_main/apis/action_api/actions/internal_action.dart';
import 'package:eliud_core_main/apis/action_api/actions/goto_page.dart';
import 'package:eliud_core_main/apis/action_api/actions/open_dialog.dart';
import 'package:eliud_core_main/apis/action_api/actions/popup_menu.dart';
import 'package:eliud_core_main/model/abstract_repository_singleton.dart';
import 'package:eliud_core_main/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core_main/model/app_model.dart';
import 'package:eliud_core_model/model/access_model.dart';
import 'package:eliud_core_main/model/member_model.dart';
import 'package:eliud_core_main/model/menu_item_model.dart';
import 'package:eliud_core_main/model/page_model.dart';
import 'package:equatable/equatable.dart';

import '../../package/package.dart';
import '../access_bloc.dart';
import '../helper/access_helpers.dart';
import 'access_state.dart';

class DeterminedApp extends Equatable {
  final AppModel app;
  final PageModel? homePage;

  DeterminedApp(this.app, this.homePage);

  @override
  List<Object?> get props => [app, homePage];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DeterminedApp && app == other.app && homePage == other.homePage;

  @override
  int get hashCode => app.hashCode ^ homePage.hashCode;
}

abstract class AccessDetermined extends AccessState {
//  final AppModel currentApp;
  final AppModel? playstoreApp;
  final List<DeterminedApp> apps;
  final Map<String, PagesAndDialogAccesss> accesses;
  final bool? isProcessing;
  final String? tempMessage;

  // flag to allow to force a new version of accessDetermined
  final int forceRefresh;

  bool isProcessingStatus() => isProcessing ?? false;

  @override
  List<Object?> get props => [apps, accesses];

  AccessDetermined newVersion();

  AccessDetermined(
    this.apps,
    this.accesses, {
    this.playstoreApp,
    this.isProcessing,
    this.tempMessage,
    int? newForceRefresh,
  }) : forceRefresh = newForceRefresh ?? 0;

  AppModel? getApp(String appId) {
    for (var app in apps) {
      if (app.app.documentID == appId) return app.app;
    }
    return null;
  }

  Future<bool> actionHasAccess(ActionModel action) async {
    var appID = action.app.documentID;
    if (action.conditions != null) {
      var theAccess = accesses[appID];
      if ((theAccess != null) &&
          (!AccessHelper.displayConditionOk(
              theAccess.packageConditionsAccess,
              action.conditions!,
              getPrivilegeLevel(appID),
              memberIsOwner(appID),
              isBlocked(appID),
              isLoggedIn()))) return false;
    }
    if (action is GotoPage) {
      var theAccess = accesses[appID];
      if (theAccess == null) return false;
      var pageID = action.pageID;
      var access = theAccess.pagesAccess[pageID];
      if (access == null) {
        access = (await pageRepository(appId: action.app.documentID)!
                .get(pageID, onError: (_) {}) !=
            null);
        theAccess.pagesAccess[pageID] = access;
        return access;
      }
      return access;
    } else if (action is OpenDialog) {
      var theAccess = accesses[appID];
      if (theAccess == null) return false;
      var dialogID = action.dialogID;
      var access = theAccess.dialogsAccess[dialogID];
      if (access == null) {
        access = (await dialogRepository(appId: action.app.documentID)!
                .get(dialogID, onError: (_) {}) !=
            null);
        theAccess.dialogsAccess[dialogID] = access;
        return access;
      }
      return access;
    } else if (action is PopupMenu) {
      var access = false;
      for (var item in action.menuDef!.menuItems!) {
        var hasAccess = await menuItemHasAccess(item);
        if (hasAccess) access = true;
      }
/*
      action.menuDef!.menuItems!.forEach((item) async {
        var hasAccess = await menuItemHasAccess(item);
        if (hasAccess) access = true;
      });
*/
      return access;
    } else if (action is InternalAction) {
      if (action.internalActionEnum == InternalActionEnum.login) {
        return !isLoggedIn();
      } else if (action.internalActionEnum == InternalActionEnum.logout) {
        return isLoggedIn();
      } else if (action.internalActionEnum == InternalActionEnum.goHome) {
        return true;
      } else if (action.internalActionEnum == InternalActionEnum.otherApps) {
        return hasAccessToOtherApps();
      }
      return true;
    }
    return true;
  }

  Future<bool> menuItemHasAccess(MenuItemModel item) async {
    try {
      var action = item.action!;
      return actionHasAccess(action);
    } catch (_) {
      return false;
    }
  }

  Future<List<bool>> hasNAccess(List<MenuItemModel> items) async {
    return await Future.wait(items.map((e) => menuItemHasAccess(e)).toList());
  }

  @override
  MemberModel? getMember();
  PrivilegeLevel getPrivilegeLevel(String appId);
  bool isBlocked(String appId);
  Future<AccessDetermined> addApp(
      AccessBloc accessBloc, AppModel newCurrentApp);
  Future<AccessDetermined> addApp2(
      AccessBloc accessBloc,
      Map<String, PagesAndDialogAccesss> accesses,
      List<DeterminedApp> apps,
      AppModel newCurrentApp);

  bool isCurrentAppBlocked(String currentAppId) => isBlocked(currentAppId);
  PrivilegeLevel getPrivilegeLevelCurrentApp(String currentAppId) =>
      getPrivilegeLevel(currentAppId);

  static Future<PageModel?> getPage(String appId, String? pageId,
      {String? alternativePageId}) async {
    PageModel? page;
    if (pageId != null) {
      page = await pageRepository(appId: appId)!.get(pageId);
    }
    if (page == null) {
      if (alternativePageId != null) {
        return await pageRepository(appId: appId)!.get(alternativePageId);
      }
    } else {
      return page;
    }
    return null;
  }

  AccessDetermined asNotProcessing();
  AccessDetermined asProcessing();
  AccessDetermined updateMember(MemberModel member);
  AccessDetermined withTempMessage(String message);
  AccessDetermined clearTempMessage();

  Future<AccessDetermined> withNewAccess(
      AccessBloc accessBloc, AccessModel access) async {
    var appId = access.appId;
    var newCurrentApp = await appRepository()!.get(appId);
    if (newCurrentApp == null) {
      throw Exception("Can't find app with id $appId");
    }
    var newAccesses = {...accesses};
    newAccesses.removeWhere((key, value) => key == appId);

    var newApps = [...apps];
    newApps.removeWhere((element) => element.app.documentID == appId);

    return addApp2(accessBloc, newAccesses, newApps, newCurrentApp);
  }

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

  AccessDetermined withNewAccesses(
      Map<String, PagesAndDialogAccesss> newAccesses);
  Future<AccessDetermined> withOtherPrivilege(AccessBloc accessBloc,
      AppModel app, PrivilegeLevel privilege, bool blocked);

/*
  Future<AccessDetermined> updateApp(
      AppModel newCurrentApp,
      ) {
    var newApps = <DeterminedApp>[];
    for (var app in apps) {
      if (app.app.documentID == newCurrentApp.documentID) {
        newApps.add(DeterminedApp(newCurrentApp, app.homePage));
      } else {
        newApps.add(app);
      }
    }
    return updateApps(newCurrentApp, newApps);
  }

*/
  Future<AccessDetermined> updateApp2(
      AccessBloc accessBloc, AppModel newCurrentApp);

  Future<AccessDetermined> updateApps(
    AppModel newCurrentApp,
    List<DeterminedApp> newApps,
  );

  PageModel? homePageForAppId(String appId) {
    for (var app in apps) {
      if (app.app.documentID == appId) {
        return app.homePage;
      }
    }
    throw Exception('app not found when trying to find homepage');
  }

  Future<PageModel?> reterminedHomePageForAppId(AppModel app);
}
