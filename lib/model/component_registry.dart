/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 model/component_registry.dart
                       
 This code is generated. This is read only. Don't touch!

*/


import '../model/internal_component.dart';
import 'package:eliud_core/tools/registry.dart';

import '../extensions/member_dashboard_component.dart';
import 'package:eliud_core/model/internal_component.dart';




class ComponentRegistry {

  void init() {
    Registry.registry().addInternalComponents('eliud_core', ["apps", "appBars", "backgrounds", "countrys", "dialogs", "drawers", "fonts", "gridViews", "homeMenus", "members", "memberDashboards", "menuDefs", "pages", "posSizes", "shadows", ]);

    Registry.registry().register(componentName: "eliud_core_internalWidgets", componentConstructor: ListComponentFactory());
    Registry.registry().addDropDownSupporter("memberDashboards", DropdownButtonComponentFactory());
    Registry.registry().register(componentName: "memberDashboards", componentConstructor: MemberDashboardComponentConstructorDefault());

  }
}


