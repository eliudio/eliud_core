import 'package:eliud_core/core/blocs/access/helper/access_helpers.dart';
import 'package:eliud_core/model/access_model.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/model/menu_item_model.dart';
import 'package:eliud_core/tools/action/action_model.dart';

import 'access_state.dart';

abstract class AccessDetermined extends AccessState {
  final List<AppModel> apps;
  final Map<String, PagesAndDialogAccesss> accesses;

  @override
  List<Object?> get props =>
      [apps, accesses];

  AccessDetermined(this.apps, this.accesses);

  bool actionHasAccess(ActionModel action) {
    if (action.conditions != null) {
      var theAccess = accesses[action.appID];
      if ((theAccess != null) && (!AccessHelper.conditionOk(
          theAccess.packageConditionsAccess,
          action.conditions!,
          getPrivilegeLevel(action.appID)!,
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
  PrivilegeLevel? getPrivilegeLevel(String appId);
  bool isBlocked(String appId);
}
