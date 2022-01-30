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
import 'package:eliud_core/core/registry.dart';
import 'package:eliud_core/tools/component/component_spec.dart';

import '../extensions/member_dashboard_component.dart';
import '../editors/member_dashboard_component_editor.dart';
import 'member_dashboard_component_selector.dart';
import 'package:eliud_core/model/internal_component.dart';




class ComponentRegistry {

  void init() {
    Registry.registry()!.addInternalComponents('eliud_core', ["apps", "appBars", "appPolicys", "backgrounds", "countrys", "dialogs", "drawers", "gridViews", "homeMenus", "members", "memberDashboards", "memberPublicInfos", "menuDefs", "pages", "posSizes", "shadows", ]);

    Registry.registry()!.register(componentName: "eliud_core_internalWidgets", componentConstructor: ListComponentFactory());
    Registry.registry()!.addDropDownSupporter("memberDashboards", DropdownButtonComponentFactory());
    Registry.registry()!.register(componentName: "memberDashboards", componentConstructor: MemberDashboardComponentConstructorDefault());
    Registry.registry()!.addComponentSpec('eliud_core', [
      ComponentSpec('memberDashboards', MemberDashboardComponentConstructorDefault(), MemberDashboardComponentSelector(), MemberDashboardComponentEditorConstructor(), ), 
    ]);

  }
}


