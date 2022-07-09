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
import 'abstract_repository_singleton.dart';

import '../extensions/member_dashboard_component.dart';
import '../editors/member_dashboard_component_editor.dart';
import 'member_dashboard_component_selector.dart';
import 'package:eliud_core/model/internal_component.dart';




class ComponentRegistry {

  void init() {
    Registry.registry()!.addInternalComponents('eliud_core', ["apps", "appBars", "appPolicys", "dialogs", "drawers", "gridViews", "homeMenus", "members", "memberDashboards", "memberPublicInfos", "menuDefs", "pages", ]);

    Registry.registry()!.register(componentName: "eliud_core_internalWidgets", componentConstructor: ListComponentFactory());
    Registry.registry()!.addDropDownSupporter("memberDashboards", DropdownButtonComponentFactory());
    Registry.registry()!.register(componentName: "memberDashboards", componentConstructor: MemberDashboardComponentConstructorDefault());
    Registry.registry()!.addComponentSpec('eliud_core', 'core', [
      ComponentSpec('memberDashboards', MemberDashboardComponentConstructorDefault(), MemberDashboardComponentSelector(), MemberDashboardComponentEditorConstructor(), ({String? appId}) => memberDashboardRepository(appId: appId)! ), 
    ]);
      Registry.registry()!.registerRetrieveRepository('eliud_core', 'accesss', ({String? appId}) => accessRepository(appId: appId)!);
      Registry.registry()!.registerRetrieveRepository('eliud_core', 'appBars', ({String? appId}) => appBarRepository(appId: appId)!);
      Registry.registry()!.registerRetrieveRepository('eliud_core', 'appPolicys', ({String? appId}) => appPolicyRepository(appId: appId)!);
      Registry.registry()!.registerRetrieveRepository('eliud_core', 'backendRequests', ({String? appId}) => backendRequestRepository(appId: appId)!);
      Registry.registry()!.registerRetrieveRepository('eliud_core', 'dialogs', ({String? appId}) => dialogRepository(appId: appId)!);
      Registry.registry()!.registerRetrieveRepository('eliud_core', 'drawers', ({String? appId}) => drawerRepository(appId: appId)!);
      Registry.registry()!.registerRetrieveRepository('eliud_core', 'gridViews', ({String? appId}) => gridViewRepository(appId: appId)!);
      Registry.registry()!.registerRetrieveRepository('eliud_core', 'homeMenus', ({String? appId}) => homeMenuRepository(appId: appId)!);
      Registry.registry()!.registerRetrieveRepository('eliud_core', 'memberDashboards', ({String? appId}) => memberDashboardRepository(appId: appId)!);
      Registry.registry()!.registerRetrieveRepository('eliud_core', 'memberMediums', ({String? appId}) => memberMediumRepository(appId: appId)!);
      Registry.registry()!.registerRetrieveRepository('eliud_core', 'menuDefs', ({String? appId}) => menuDefRepository(appId: appId)!);
      Registry.registry()!.registerRetrieveRepository('eliud_core', 'pages', ({String? appId}) => pageRepository(appId: appId)!);
      Registry.registry()!.registerRetrieveRepository('eliud_core', 'platformMediums', ({String? appId}) => platformMediumRepository(appId: appId)!);

  }
}


