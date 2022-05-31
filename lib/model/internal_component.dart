/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 model/internal_component.dart
                       
 This code is generated. This is read only. Don't touch!

*/


import 'package:eliud_core/tools/component/component_constructor.dart';
import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/tools/query/query_tools.dart';

import 'package:eliud_core/tools/has_fab.dart';


import 'package:eliud_core/model/app_list_bloc.dart';
import 'package:eliud_core/model/app_list.dart';
import 'package:eliud_core/model/app_dropdown_button.dart';
import 'package:eliud_core/model/app_list_event.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_core/model/entity_export.dart';

import 'package:eliud_core/model/app_bar_list_bloc.dart';
import 'package:eliud_core/model/app_bar_list.dart';
import 'package:eliud_core/model/app_bar_dropdown_button.dart';
import 'package:eliud_core/model/app_bar_list_event.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_core/model/entity_export.dart';

import 'package:eliud_core/model/app_policy_list_bloc.dart';
import 'package:eliud_core/model/app_policy_list.dart';
import 'package:eliud_core/model/app_policy_dropdown_button.dart';
import 'package:eliud_core/model/app_policy_list_event.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_core/model/entity_export.dart';

import 'package:eliud_core/model/dialog_list_bloc.dart';
import 'package:eliud_core/model/dialog_list.dart';
import 'package:eliud_core/model/dialog_dropdown_button.dart';
import 'package:eliud_core/model/dialog_list_event.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_core/model/entity_export.dart';

import 'package:eliud_core/model/drawer_list_bloc.dart';
import 'package:eliud_core/model/drawer_list.dart';
import 'package:eliud_core/model/drawer_dropdown_button.dart';
import 'package:eliud_core/model/drawer_list_event.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_core/model/entity_export.dart';

import 'package:eliud_core/model/grid_view_list_bloc.dart';
import 'package:eliud_core/model/grid_view_list.dart';
import 'package:eliud_core/model/grid_view_dropdown_button.dart';
import 'package:eliud_core/model/grid_view_list_event.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_core/model/entity_export.dart';

import 'package:eliud_core/model/home_menu_list_bloc.dart';
import 'package:eliud_core/model/home_menu_list.dart';
import 'package:eliud_core/model/home_menu_dropdown_button.dart';
import 'package:eliud_core/model/home_menu_list_event.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_core/model/entity_export.dart';

import 'package:eliud_core/model/member_list_bloc.dart';
import 'package:eliud_core/model/member_list.dart';
import 'package:eliud_core/model/member_dropdown_button.dart';
import 'package:eliud_core/model/member_list_event.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_core/model/entity_export.dart';

import 'package:eliud_core/model/member_dashboard_list_bloc.dart';
import 'package:eliud_core/model/member_dashboard_list.dart';
import 'package:eliud_core/model/member_dashboard_dropdown_button.dart';
import 'package:eliud_core/model/member_dashboard_list_event.dart';

import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_core/model/entity_export.dart';

import 'package:eliud_core/model/member_public_info_list_bloc.dart';
import 'package:eliud_core/model/member_public_info_list.dart';
import 'package:eliud_core/model/member_public_info_dropdown_button.dart';
import 'package:eliud_core/model/member_public_info_list_event.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_core/model/entity_export.dart';

import 'package:eliud_core/model/menu_def_list_bloc.dart';
import 'package:eliud_core/model/menu_def_list.dart';
import 'package:eliud_core/model/menu_def_dropdown_button.dart';
import 'package:eliud_core/model/menu_def_list_event.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_core/model/entity_export.dart';

import 'package:eliud_core/model/page_list_bloc.dart';
import 'package:eliud_core/model/page_list.dart';
import 'package:eliud_core/model/page_dropdown_button.dart';
import 'package:eliud_core/model/page_list_event.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_core/model/entity_export.dart';

class ListComponentFactory implements ComponentConstructor {
  Widget? createNew({Key? key, required AppModel app,  required String id, int? privilegeLevel, Map<String, dynamic>? parameters}) {
    return ListComponent(app: app, componentId: id);
  }

  @override
  dynamic getModel({required AppModel app, required String id}) {
    return null;
  }
}


typedef DropdownButtonChanged(String? value, int? privilegeLevel);

class DropdownButtonComponentFactory implements ComponentDropDown {
  @override
  dynamic getModel({required AppModel app, required String id}) {
    return null;
  }


  bool supports(String id) {

    if (id == "apps") return true;
    if (id == "appBars") return true;
    if (id == "appPolicys") return true;
    if (id == "dialogs") return true;
    if (id == "drawers") return true;
    if (id == "gridViews") return true;
    if (id == "homeMenus") return true;
    if (id == "members") return true;
    if (id == "memberDashboards") return true;
    if (id == "memberPublicInfos") return true;
    if (id == "menuDefs") return true;
    if (id == "pages") return true;
    return false;
  }

  Widget createNew({Key? key, required AppModel app, required String id, int? privilegeLevel, Map<String, dynamic>? parameters, String? value, DropdownButtonChanged? trigger, bool? optional}) {

    if (id == "apps")
      return DropdownButtonComponent(app: app, componentId: id, value: value, privilegeLevel: privilegeLevel, trigger: trigger, optional: optional);

    if (id == "appBars")
      return DropdownButtonComponent(app: app, componentId: id, value: value, privilegeLevel: privilegeLevel, trigger: trigger, optional: optional);

    if (id == "appPolicys")
      return DropdownButtonComponent(app: app, componentId: id, value: value, privilegeLevel: privilegeLevel, trigger: trigger, optional: optional);

    if (id == "dialogs")
      return DropdownButtonComponent(app: app, componentId: id, value: value, privilegeLevel: privilegeLevel, trigger: trigger, optional: optional);

    if (id == "drawers")
      return DropdownButtonComponent(app: app, componentId: id, value: value, privilegeLevel: privilegeLevel, trigger: trigger, optional: optional);

    if (id == "gridViews")
      return DropdownButtonComponent(app: app, componentId: id, value: value, privilegeLevel: privilegeLevel, trigger: trigger, optional: optional);

    if (id == "homeMenus")
      return DropdownButtonComponent(app: app, componentId: id, value: value, privilegeLevel: privilegeLevel, trigger: trigger, optional: optional);

    if (id == "members")
      return DropdownButtonComponent(app: app, componentId: id, value: value, privilegeLevel: privilegeLevel, trigger: trigger, optional: optional);

    if (id == "memberDashboards")
      return DropdownButtonComponent(app: app, componentId: id, value: value, privilegeLevel: privilegeLevel, trigger: trigger, optional: optional);

    if (id == "memberPublicInfos")
      return DropdownButtonComponent(app: app, componentId: id, value: value, privilegeLevel: privilegeLevel, trigger: trigger, optional: optional);

    if (id == "menuDefs")
      return DropdownButtonComponent(app: app, componentId: id, value: value, privilegeLevel: privilegeLevel, trigger: trigger, optional: optional);

    if (id == "pages")
      return DropdownButtonComponent(app: app, componentId: id, value: value, privilegeLevel: privilegeLevel, trigger: trigger, optional: optional);

    return Text("Id $id not found");
  }
}


class ListComponent extends StatelessWidget with HasFab {
  final AppModel app;
  final String? componentId;
  Widget? widget;
  int? privilegeLevel;

  @override
  Widget? fab(BuildContext context){
    if ((widget != null) && (widget is HasFab)) {
      HasFab hasFab = widget as HasFab;
      return hasFab.fab(context);
    }
    return null;
  }

  ListComponent({required this.app, this.privilegeLevel, this.componentId}) {
    initWidget();
  }

  @override
  Widget build(BuildContext context) {

    if (componentId == 'apps') return _appBuild(context);
    if (componentId == 'appBars') return _appBarBuild(context);
    if (componentId == 'appPolicys') return _appPolicyBuild(context);
    if (componentId == 'dialogs') return _dialogBuild(context);
    if (componentId == 'drawers') return _drawerBuild(context);
    if (componentId == 'gridViews') return _gridViewBuild(context);
    if (componentId == 'homeMenus') return _homeMenuBuild(context);
    if (componentId == 'members') return _memberBuild(context);
    if (componentId == 'memberDashboards') return _memberDashboardBuild(context);
    if (componentId == 'memberPublicInfos') return _memberPublicInfoBuild(context);
    if (componentId == 'menuDefs') return _menuDefBuild(context);
    if (componentId == 'pages') return _pageBuild(context);
    return Text('Component with componentId == $componentId not found');
  }

  void initWidget() {
    if (componentId == 'apps') widget = AppListWidget(app: app);
    if (componentId == 'appBars') widget = AppBarListWidget(app: app);
    if (componentId == 'appPolicys') widget = AppPolicyListWidget(app: app);
    if (componentId == 'dialogs') widget = DialogListWidget(app: app);
    if (componentId == 'drawers') widget = DrawerListWidget(app: app);
    if (componentId == 'gridViews') widget = GridViewListWidget(app: app);
    if (componentId == 'homeMenus') widget = HomeMenuListWidget(app: app);
    if (componentId == 'members') widget = MemberListWidget(app: app);
    if (componentId == 'memberDashboards') widget = MemberDashboardListWidget(app: app);
    if (componentId == 'memberPublicInfos') widget = MemberPublicInfoListWidget(app: app);
    if (componentId == 'menuDefs') widget = MenuDefListWidget(app: app);
    if (componentId == 'pages') widget = PageListWidget(app: app);
  }

  Widget _appBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppListBloc>(
          create: (context) => AppListBloc(
            eliudQuery: EliudQuery(theConditions: [
              EliudQueryCondition('conditions.privilegeLevelRequired', isEqualTo: privilegeLevel ?? 0),
              EliudQueryCondition('appId', isEqualTo: app.documentID),]
            ),
            appRepository: appRepository()!,
          )..add(LoadAppList()),
        )
      ],
      child: widget!,
    );
  }

  Widget _appBarBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppBarListBloc>(
          create: (context) => AppBarListBloc(
            eliudQuery: EliudQuery(theConditions: [
              EliudQueryCondition('conditions.privilegeLevelRequired', isEqualTo: privilegeLevel ?? 0),
              EliudQueryCondition('appId', isEqualTo: app.documentID),]
            ),
            appBarRepository: appBarRepository(appId: app.documentID)!,
          )..add(LoadAppBarList()),
        )
      ],
      child: widget!,
    );
  }

  Widget _appPolicyBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppPolicyListBloc>(
          create: (context) => AppPolicyListBloc(
            eliudQuery: EliudQuery(theConditions: [
              EliudQueryCondition('conditions.privilegeLevelRequired', isEqualTo: privilegeLevel ?? 0),
              EliudQueryCondition('appId', isEqualTo: app.documentID),]
            ),
            appPolicyRepository: appPolicyRepository(appId: app.documentID)!,
          )..add(LoadAppPolicyList()),
        )
      ],
      child: widget!,
    );
  }

  Widget _dialogBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DialogListBloc>(
          create: (context) => DialogListBloc(
            eliudQuery: EliudQuery(theConditions: [
              EliudQueryCondition('conditions.privilegeLevelRequired', isEqualTo: privilegeLevel ?? 0),
              EliudQueryCondition('appId', isEqualTo: app.documentID),]
            ),
            dialogRepository: dialogRepository(appId: app.documentID)!,
          )..add(LoadDialogList()),
        )
      ],
      child: widget!,
    );
  }

  Widget _drawerBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DrawerListBloc>(
          create: (context) => DrawerListBloc(
            eliudQuery: EliudQuery(theConditions: [
              EliudQueryCondition('conditions.privilegeLevelRequired', isEqualTo: privilegeLevel ?? 0),
              EliudQueryCondition('appId', isEqualTo: app.documentID),]
            ),
            drawerRepository: drawerRepository(appId: app.documentID)!,
          )..add(LoadDrawerList()),
        )
      ],
      child: widget!,
    );
  }

  Widget _gridViewBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GridViewListBloc>(
          create: (context) => GridViewListBloc(
            eliudQuery: EliudQuery(theConditions: [
              EliudQueryCondition('conditions.privilegeLevelRequired', isEqualTo: privilegeLevel ?? 0),
              EliudQueryCondition('appId', isEqualTo: app.documentID),]
            ),
            gridViewRepository: gridViewRepository(appId: app.documentID)!,
          )..add(LoadGridViewList()),
        )
      ],
      child: widget!,
    );
  }

  Widget _homeMenuBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeMenuListBloc>(
          create: (context) => HomeMenuListBloc(
            eliudQuery: EliudQuery(theConditions: [
              EliudQueryCondition('conditions.privilegeLevelRequired', isEqualTo: privilegeLevel ?? 0),
              EliudQueryCondition('appId', isEqualTo: app.documentID),]
            ),
            homeMenuRepository: homeMenuRepository(appId: app.documentID)!,
          )..add(LoadHomeMenuList()),
        )
      ],
      child: widget!,
    );
  }

  Widget _memberBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MemberListBloc>(
          create: (context) => MemberListBloc(
            eliudQuery: EliudQuery(theConditions: [
              EliudQueryCondition('conditions.privilegeLevelRequired', isEqualTo: privilegeLevel ?? 0),
              EliudQueryCondition('appId', isEqualTo: app.documentID),]
            ),
            memberRepository: memberRepository()!,
          )..add(LoadMemberList()),
        )
      ],
      child: widget!,
    );
  }

  Widget _memberDashboardBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MemberDashboardListBloc>(
          create: (context) => MemberDashboardListBloc(
            eliudQuery: EliudQuery(theConditions: [
              EliudQueryCondition('conditions.privilegeLevelRequired', isEqualTo: privilegeLevel ?? 0),
              EliudQueryCondition('appId', isEqualTo: app.documentID),]
            ),
            memberDashboardRepository: memberDashboardRepository(appId: app.documentID)!,
          )..add(LoadMemberDashboardList()),
        )
      ],
      child: widget!,
    );
  }

  Widget _memberPublicInfoBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MemberPublicInfoListBloc>(
          create: (context) => MemberPublicInfoListBloc(
            eliudQuery: EliudQuery(theConditions: [
              EliudQueryCondition('conditions.privilegeLevelRequired', isEqualTo: privilegeLevel ?? 0),
              EliudQueryCondition('appId', isEqualTo: app.documentID),]
            ),
            memberPublicInfoRepository: memberPublicInfoRepository()!,
          )..add(LoadMemberPublicInfoList()),
        )
      ],
      child: widget!,
    );
  }

  Widget _menuDefBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MenuDefListBloc>(
          create: (context) => MenuDefListBloc(
            eliudQuery: EliudQuery(theConditions: [
              EliudQueryCondition('conditions.privilegeLevelRequired', isEqualTo: privilegeLevel ?? 0),
              EliudQueryCondition('appId', isEqualTo: app.documentID),]
            ),
            menuDefRepository: menuDefRepository(appId: app.documentID)!,
          )..add(LoadMenuDefList()),
        )
      ],
      child: widget!,
    );
  }

  Widget _pageBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PageListBloc>(
          create: (context) => PageListBloc(
            eliudQuery: EliudQuery(theConditions: [
              EliudQueryCondition('conditions.privilegeLevelRequired', isEqualTo: privilegeLevel ?? 0),
              EliudQueryCondition('appId', isEqualTo: app.documentID),]
            ),
            pageRepository: pageRepository(appId: app.documentID)!,
          )..add(LoadPageList()),
        )
      ],
      child: widget!,
    );
  }

}


typedef Changed(String? value, int? privilegeLevel);

class DropdownButtonComponent extends StatelessWidget {
  final AppModel app;
  final String? componentId;
  final String? value;
  final Changed? trigger;
  final bool? optional;
  int? privilegeLevel;

  DropdownButtonComponent({required this.app, this.componentId, this.privilegeLevel, this.value, this.trigger, this.optional});

  @override
  Widget build(BuildContext context) {

    if (componentId == 'apps') return _appBuild(context);
    if (componentId == 'appBars') return _appBarBuild(context);
    if (componentId == 'appPolicys') return _appPolicyBuild(context);
    if (componentId == 'dialogs') return _dialogBuild(context);
    if (componentId == 'drawers') return _drawerBuild(context);
    if (componentId == 'gridViews') return _gridViewBuild(context);
    if (componentId == 'homeMenus') return _homeMenuBuild(context);
    if (componentId == 'members') return _memberBuild(context);
    if (componentId == 'memberDashboards') return _memberDashboardBuild(context);
    if (componentId == 'memberPublicInfos') return _memberPublicInfoBuild(context);
    if (componentId == 'menuDefs') return _menuDefBuild(context);
    if (componentId == 'pages') return _pageBuild(context);
    return Text('Component with componentId == $componentId not found');
  }


  Widget _appBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppListBloc>(
          create: (context) => AppListBloc(
            eliudQuery: EliudQuery(theConditions: [
              EliudQueryCondition('conditions.privilegeLevelRequired', isEqualTo: privilegeLevel ?? 0),
              EliudQueryCondition('appId', isEqualTo: app.documentID),]
            ),
            appRepository: appRepository()!,
          )..add(LoadAppList()),
        )
      ],
      child: AppDropdownButtonWidget(app: app, value: value, privilegeLevel: privilegeLevel, trigger: trigger, optional: optional),
    );
  }

  Widget _appBarBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppBarListBloc>(
          create: (context) => AppBarListBloc(
            eliudQuery: EliudQuery(theConditions: [
              EliudQueryCondition('conditions.privilegeLevelRequired', isEqualTo: privilegeLevel ?? 0),
              EliudQueryCondition('appId', isEqualTo: app.documentID),]
            ),
            appBarRepository: appBarRepository(appId: app.documentID)!,
          )..add(LoadAppBarList()),
        )
      ],
      child: AppBarDropdownButtonWidget(app: app, value: value, privilegeLevel: privilegeLevel, trigger: trigger, optional: optional),
    );
  }

  Widget _appPolicyBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppPolicyListBloc>(
          create: (context) => AppPolicyListBloc(
            eliudQuery: EliudQuery(theConditions: [
              EliudQueryCondition('conditions.privilegeLevelRequired', isEqualTo: privilegeLevel ?? 0),
              EliudQueryCondition('appId', isEqualTo: app.documentID),]
            ),
            appPolicyRepository: appPolicyRepository(appId: app.documentID)!,
          )..add(LoadAppPolicyList()),
        )
      ],
      child: AppPolicyDropdownButtonWidget(app: app, value: value, privilegeLevel: privilegeLevel, trigger: trigger, optional: optional),
    );
  }

  Widget _dialogBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DialogListBloc>(
          create: (context) => DialogListBloc(
            eliudQuery: EliudQuery(theConditions: [
              EliudQueryCondition('conditions.privilegeLevelRequired', isEqualTo: privilegeLevel ?? 0),
              EliudQueryCondition('appId', isEqualTo: app.documentID),]
            ),
            dialogRepository: dialogRepository(appId: app.documentID)!,
          )..add(LoadDialogList()),
        )
      ],
      child: DialogDropdownButtonWidget(app: app, value: value, privilegeLevel: privilegeLevel, trigger: trigger, optional: optional),
    );
  }

  Widget _drawerBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DrawerListBloc>(
          create: (context) => DrawerListBloc(
            eliudQuery: EliudQuery(theConditions: [
              EliudQueryCondition('conditions.privilegeLevelRequired', isEqualTo: privilegeLevel ?? 0),
              EliudQueryCondition('appId', isEqualTo: app.documentID),]
            ),
            drawerRepository: drawerRepository(appId: app.documentID)!,
          )..add(LoadDrawerList()),
        )
      ],
      child: DrawerDropdownButtonWidget(app: app, value: value, privilegeLevel: privilegeLevel, trigger: trigger, optional: optional),
    );
  }

  Widget _gridViewBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GridViewListBloc>(
          create: (context) => GridViewListBloc(
            eliudQuery: EliudQuery(theConditions: [
              EliudQueryCondition('conditions.privilegeLevelRequired', isEqualTo: privilegeLevel ?? 0),
              EliudQueryCondition('appId', isEqualTo: app.documentID),]
            ),
            gridViewRepository: gridViewRepository(appId: app.documentID)!,
          )..add(LoadGridViewList()),
        )
      ],
      child: GridViewDropdownButtonWidget(app: app, value: value, privilegeLevel: privilegeLevel, trigger: trigger, optional: optional),
    );
  }

  Widget _homeMenuBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeMenuListBloc>(
          create: (context) => HomeMenuListBloc(
            eliudQuery: EliudQuery(theConditions: [
              EliudQueryCondition('conditions.privilegeLevelRequired', isEqualTo: privilegeLevel ?? 0),
              EliudQueryCondition('appId', isEqualTo: app.documentID),]
            ),
            homeMenuRepository: homeMenuRepository(appId: app.documentID)!,
          )..add(LoadHomeMenuList()),
        )
      ],
      child: HomeMenuDropdownButtonWidget(app: app, value: value, privilegeLevel: privilegeLevel, trigger: trigger, optional: optional),
    );
  }

  Widget _memberBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MemberListBloc>(
          create: (context) => MemberListBloc(
            eliudQuery: EliudQuery(theConditions: [
              EliudQueryCondition('conditions.privilegeLevelRequired', isEqualTo: privilegeLevel ?? 0),
              EliudQueryCondition('appId', isEqualTo: app.documentID),]
            ),
            memberRepository: memberRepository()!,
          )..add(LoadMemberList()),
        )
      ],
      child: MemberDropdownButtonWidget(app: app, value: value, privilegeLevel: privilegeLevel, trigger: trigger, optional: optional),
    );
  }

  Widget _memberDashboardBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MemberDashboardListBloc>(
          create: (context) => MemberDashboardListBloc(
            eliudQuery: EliudQuery(theConditions: [
              EliudQueryCondition('conditions.privilegeLevelRequired', isEqualTo: privilegeLevel ?? 0),
              EliudQueryCondition('appId', isEqualTo: app.documentID),]
            ),
            memberDashboardRepository: memberDashboardRepository(appId: app.documentID)!,
          )..add(LoadMemberDashboardList()),
        )
      ],
      child: MemberDashboardDropdownButtonWidget(app: app, value: value, privilegeLevel: privilegeLevel, trigger: trigger, optional: optional),
    );
  }

  Widget _memberPublicInfoBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MemberPublicInfoListBloc>(
          create: (context) => MemberPublicInfoListBloc(
            eliudQuery: EliudQuery(theConditions: [
              EliudQueryCondition('conditions.privilegeLevelRequired', isEqualTo: privilegeLevel ?? 0),
              EliudQueryCondition('appId', isEqualTo: app.documentID),]
            ),
            memberPublicInfoRepository: memberPublicInfoRepository()!,
          )..add(LoadMemberPublicInfoList()),
        )
      ],
      child: MemberPublicInfoDropdownButtonWidget(app: app, value: value, privilegeLevel: privilegeLevel, trigger: trigger, optional: optional),
    );
  }

  Widget _menuDefBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MenuDefListBloc>(
          create: (context) => MenuDefListBloc(
            eliudQuery: EliudQuery(theConditions: [
              EliudQueryCondition('conditions.privilegeLevelRequired', isEqualTo: privilegeLevel ?? 0),
              EliudQueryCondition('appId', isEqualTo: app.documentID),]
            ),
            menuDefRepository: menuDefRepository(appId: app.documentID)!,
          )..add(LoadMenuDefList()),
        )
      ],
      child: MenuDefDropdownButtonWidget(app: app, value: value, privilegeLevel: privilegeLevel, trigger: trigger, optional: optional),
    );
  }

  Widget _pageBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PageListBloc>(
          create: (context) => PageListBloc(
            eliudQuery: EliudQuery(theConditions: [
              EliudQueryCondition('conditions.privilegeLevelRequired', isEqualTo: privilegeLevel ?? 0),
              EliudQueryCondition('appId', isEqualTo: app.documentID),]
            ),
            pageRepository: pageRepository(appId: app.documentID)!,
          )..add(LoadPageList()),
        )
      ],
      child: PageDropdownButtonWidget(app: app, value: value, privilegeLevel: privilegeLevel, trigger: trigger, optional: optional),
    );
  }

}


