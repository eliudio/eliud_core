import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/model/menu_item_model.dart';
import 'package:eliud_core/model/page_model.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/action_model.dart';

import '../../global_data.dart';

class AccessDetails {
  final Map<String, bool> pagesAccess =  Map();

  AccessDetails();

  bool _conditionOk(AppModel app, MemberModel member, PageCondition condition, bool isOwner) {
    if (condition == null) return true;
    switch (condition) {
      case PageCondition.Always: return true;
      case PageCondition.MustBeLoggedIn: return GlobalData.isLoggedOn();
      case PageCondition.MustNotBeLoggedIn: return !GlobalData.isLoggedOn();
// !!!AFTER!!! consider what to do here!
      case PageCondition.MustHaveStuffInBasket: return true; // return await CartTools.hasItems(app, member);
      case PageCondition.AdminOnly: return isOwner;
      case PageCondition.Unknown: return true;
    }
  }

  Future<AccessDetails> init(MemberModel member, AppModel app) async {
    bool isOwner = member != null && member.documentID == app.ownerID;
    return await AbstractRepositorySingleton.singleton.pageRepository().valuesList().then((theList) => theList.forEach((page) {
      pagesAccess[page.documentID] = _conditionOk(app, member, page.conditional, isOwner);
    })).then((_) => this);
  }

  bool hasAccess(MenuItemModel item) {
    try {
      ActionModel action = item.action;
      if (action is GotoPage) {
        String pageID = action.pageID;
        bool access = pagesAccess[pageID];
        if (access == null) return false;
        return access;
      } else if (action is PopupMenu) {
        bool access = false;
        action.menuDef.menuItems.forEach((item) {
          if (hasAccess(item)) access = true;
        });
        return access;
      } else if (action is InternalAction){
        if (action.internalActionEnum == InternalActionEnum.Login)
          return !GlobalData.isLoggedOn();
        else if (action.internalActionEnum == InternalActionEnum.Logout)
          return GlobalData.isLoggedOn();
        else if (action.internalActionEnum == InternalActionEnum.OtherApps)
          return GlobalData.accessToOtherApps();
        else if (action.internalActionEnum == InternalActionEnum.Flush)
          return true;
        return true;
      }
    } catch (_) {
      return false;
    };
    return false;
  }

  List<bool> hasNAccess(List<MenuItemModel> items) {
    return items.map((e) => hasAccess(e)).toList();
  }
}
