/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 model/admin_app.dart
                       
 This code is generated. This is read only. Don't touch!

*/


import 'package:eliud_core/tools/admin_app_base.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';

import 'package:eliud_core/model/menu_def_model.dart';
import 'package:eliud_core/model/page_model.dart';
import 'package:eliud_core/model/app_bar_model.dart';
import 'package:eliud_core/model/body_component_model.dart';
import 'package:eliud_core/model/drawer_model.dart';
import 'package:eliud_core/model/menu_item_model.dart';
import 'package:eliud_core/model/home_menu_model.dart';

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

class AdminApp extends AdminAppInstallerBase {
  final String appId;
  final DrawerModel _drawer;
  final DrawerModel _endDrawer;
  final AppBarModel _appBar;
  final HomeMenuModel _homeMenu;
  final RgbModel menuItemColor;
  final RgbModel selectedMenuItemColor;
  final RgbModel backgroundColor;
  
  AdminApp(this.appId, this._drawer, this._endDrawer, this._appBar, this._homeMenu, this.menuItemColor, this.selectedMenuItemColor, this.backgroundColor);


  PageModel _appsPages() {
    List<BodyComponentModel> components = [];
    components.add(BodyComponentModel(
      documentID: "internalWidget-apps", componentName: "eliud_core_internalWidgets", componentId: "apps"));
    PageModel page = PageModel(
        conditions: ConditionsModel(
          privilegeLevelRequired: PrivilegeLevelRequired.OwnerPrivilegeRequired,
          packageCondition: null,
          conditionOverride: null,
        ),
        appId: appId,
        documentID: "eliud_core_apps_page",
        title: "Apps",
        drawer: _drawer,
        endDrawer: _endDrawer,
        appBar: _appBar,
        homeMenu: _homeMenu,
        bodyComponents: components,
        layout: PageLayout.OnlyTheFirstComponent
    );
    return page;
  }


  PageModel _appBarsPages() {
    List<BodyComponentModel> components = [];
    components.add(BodyComponentModel(
      documentID: "internalWidget-appBars", componentName: "eliud_core_internalWidgets", componentId: "appBars"));
    PageModel page = PageModel(
        conditions: ConditionsModel(
          privilegeLevelRequired: PrivilegeLevelRequired.OwnerPrivilegeRequired,
          packageCondition: null,
          conditionOverride: null,
        ),
        appId: appId,
        documentID: "eliud_core_appbars_page",
        title: "AppBars",
        drawer: _drawer,
        endDrawer: _endDrawer,
        appBar: _appBar,
        homeMenu: _homeMenu,
        bodyComponents: components,
        layout: PageLayout.OnlyTheFirstComponent
    );
    return page;
  }


  PageModel _appPolicysPages() {
    List<BodyComponentModel> components = [];
    components.add(BodyComponentModel(
      documentID: "internalWidget-appPolicys", componentName: "eliud_core_internalWidgets", componentId: "appPolicys"));
    PageModel page = PageModel(
        conditions: ConditionsModel(
          privilegeLevelRequired: PrivilegeLevelRequired.OwnerPrivilegeRequired,
          packageCondition: null,
          conditionOverride: null,
        ),
        appId: appId,
        documentID: "eliud_core_apppolicys_page",
        title: "AppPolicys",
        drawer: _drawer,
        endDrawer: _endDrawer,
        appBar: _appBar,
        homeMenu: _homeMenu,
        bodyComponents: components,
        layout: PageLayout.OnlyTheFirstComponent
    );
    return page;
  }


  PageModel _backgroundsPages() {
    List<BodyComponentModel> components = [];
    components.add(BodyComponentModel(
      documentID: "internalWidget-backgrounds", componentName: "eliud_core_internalWidgets", componentId: "backgrounds"));
    PageModel page = PageModel(
        conditions: ConditionsModel(
          privilegeLevelRequired: PrivilegeLevelRequired.OwnerPrivilegeRequired,
          packageCondition: null,
          conditionOverride: null,
        ),
        appId: appId,
        documentID: "eliud_core_backgrounds_page",
        title: "Backgrounds",
        drawer: _drawer,
        endDrawer: _endDrawer,
        appBar: _appBar,
        homeMenu: _homeMenu,
        bodyComponents: components,
        layout: PageLayout.OnlyTheFirstComponent
    );
    return page;
  }


  PageModel _countrysPages() {
    List<BodyComponentModel> components = [];
    components.add(BodyComponentModel(
      documentID: "internalWidget-countrys", componentName: "eliud_core_internalWidgets", componentId: "countrys"));
    PageModel page = PageModel(
        conditions: ConditionsModel(
          privilegeLevelRequired: PrivilegeLevelRequired.OwnerPrivilegeRequired,
          packageCondition: null,
          conditionOverride: null,
        ),
        appId: appId,
        documentID: "eliud_core_countrys_page",
        title: "Countrys",
        drawer: _drawer,
        endDrawer: _endDrawer,
        appBar: _appBar,
        homeMenu: _homeMenu,
        bodyComponents: components,
        layout: PageLayout.OnlyTheFirstComponent
    );
    return page;
  }


  PageModel _dialogsPages() {
    List<BodyComponentModel> components = [];
    components.add(BodyComponentModel(
      documentID: "internalWidget-dialogs", componentName: "eliud_core_internalWidgets", componentId: "dialogs"));
    PageModel page = PageModel(
        conditions: ConditionsModel(
          privilegeLevelRequired: PrivilegeLevelRequired.OwnerPrivilegeRequired,
          packageCondition: null,
          conditionOverride: null,
        ),
        appId: appId,
        documentID: "eliud_core_dialogs_page",
        title: "Dialogs",
        drawer: _drawer,
        endDrawer: _endDrawer,
        appBar: _appBar,
        homeMenu: _homeMenu,
        bodyComponents: components,
        layout: PageLayout.OnlyTheFirstComponent
    );
    return page;
  }


  PageModel _drawersPages() {
    List<BodyComponentModel> components = [];
    components.add(BodyComponentModel(
      documentID: "internalWidget-drawers", componentName: "eliud_core_internalWidgets", componentId: "drawers"));
    PageModel page = PageModel(
        conditions: ConditionsModel(
          privilegeLevelRequired: PrivilegeLevelRequired.OwnerPrivilegeRequired,
          packageCondition: null,
          conditionOverride: null,
        ),
        appId: appId,
        documentID: "eliud_core_drawers_page",
        title: "Drawers",
        drawer: _drawer,
        endDrawer: _endDrawer,
        appBar: _appBar,
        homeMenu: _homeMenu,
        bodyComponents: components,
        layout: PageLayout.OnlyTheFirstComponent
    );
    return page;
  }


  PageModel _fontsPages() {
    List<BodyComponentModel> components = [];
    components.add(BodyComponentModel(
      documentID: "internalWidget-fonts", componentName: "eliud_core_internalWidgets", componentId: "fonts"));
    PageModel page = PageModel(
        conditions: ConditionsModel(
          privilegeLevelRequired: PrivilegeLevelRequired.OwnerPrivilegeRequired,
          packageCondition: null,
          conditionOverride: null,
        ),
        appId: appId,
        documentID: "eliud_core_fonts_page",
        title: "Fonts",
        drawer: _drawer,
        endDrawer: _endDrawer,
        appBar: _appBar,
        homeMenu: _homeMenu,
        bodyComponents: components,
        layout: PageLayout.OnlyTheFirstComponent
    );
    return page;
  }


  PageModel _gridViewsPages() {
    List<BodyComponentModel> components = [];
    components.add(BodyComponentModel(
      documentID: "internalWidget-gridViews", componentName: "eliud_core_internalWidgets", componentId: "gridViews"));
    PageModel page = PageModel(
        conditions: ConditionsModel(
          privilegeLevelRequired: PrivilegeLevelRequired.OwnerPrivilegeRequired,
          packageCondition: null,
          conditionOverride: null,
        ),
        appId: appId,
        documentID: "eliud_core_gridviews_page",
        title: "GridViews",
        drawer: _drawer,
        endDrawer: _endDrawer,
        appBar: _appBar,
        homeMenu: _homeMenu,
        bodyComponents: components,
        layout: PageLayout.OnlyTheFirstComponent
    );
    return page;
  }


  PageModel _homeMenusPages() {
    List<BodyComponentModel> components = [];
    components.add(BodyComponentModel(
      documentID: "internalWidget-homeMenus", componentName: "eliud_core_internalWidgets", componentId: "homeMenus"));
    PageModel page = PageModel(
        conditions: ConditionsModel(
          privilegeLevelRequired: PrivilegeLevelRequired.OwnerPrivilegeRequired,
          packageCondition: null,
          conditionOverride: null,
        ),
        appId: appId,
        documentID: "eliud_core_homemenus_page",
        title: "HomeMenus",
        drawer: _drawer,
        endDrawer: _endDrawer,
        appBar: _appBar,
        homeMenu: _homeMenu,
        bodyComponents: components,
        layout: PageLayout.OnlyTheFirstComponent
    );
    return page;
  }


  PageModel _membersPages() {
    List<BodyComponentModel> components = [];
    components.add(BodyComponentModel(
      documentID: "internalWidget-members", componentName: "eliud_core_internalWidgets", componentId: "members"));
    PageModel page = PageModel(
        conditions: ConditionsModel(
          privilegeLevelRequired: PrivilegeLevelRequired.OwnerPrivilegeRequired,
          packageCondition: null,
          conditionOverride: null,
        ),
        appId: appId,
        documentID: "eliud_core_members_page",
        title: "Members",
        drawer: _drawer,
        endDrawer: _endDrawer,
        appBar: _appBar,
        homeMenu: _homeMenu,
        bodyComponents: components,
        layout: PageLayout.OnlyTheFirstComponent
    );
    return page;
  }


  PageModel _memberDashboardsPages() {
    List<BodyComponentModel> components = [];
    components.add(BodyComponentModel(
      documentID: "internalWidget-memberDashboards", componentName: "eliud_core_internalWidgets", componentId: "memberDashboards"));
    PageModel page = PageModel(
        conditions: ConditionsModel(
          privilegeLevelRequired: PrivilegeLevelRequired.OwnerPrivilegeRequired,
          packageCondition: null,
          conditionOverride: null,
        ),
        appId: appId,
        documentID: "eliud_core_memberdashboards_page",
        title: "MemberDashboards",
        drawer: _drawer,
        endDrawer: _endDrawer,
        appBar: _appBar,
        homeMenu: _homeMenu,
        bodyComponents: components,
        layout: PageLayout.OnlyTheFirstComponent
    );
    return page;
  }


  PageModel _memberPublicInfosPages() {
    List<BodyComponentModel> components = [];
    components.add(BodyComponentModel(
      documentID: "internalWidget-memberPublicInfos", componentName: "eliud_core_internalWidgets", componentId: "memberPublicInfos"));
    PageModel page = PageModel(
        conditions: ConditionsModel(
          privilegeLevelRequired: PrivilegeLevelRequired.OwnerPrivilegeRequired,
          packageCondition: null,
          conditionOverride: null,
        ),
        appId: appId,
        documentID: "eliud_core_memberpublicinfos_page",
        title: "MemberPublicInfos",
        drawer: _drawer,
        endDrawer: _endDrawer,
        appBar: _appBar,
        homeMenu: _homeMenu,
        bodyComponents: components,
        layout: PageLayout.OnlyTheFirstComponent
    );
    return page;
  }


  PageModel _menuDefsPages() {
    List<BodyComponentModel> components = [];
    components.add(BodyComponentModel(
      documentID: "internalWidget-menuDefs", componentName: "eliud_core_internalWidgets", componentId: "menuDefs"));
    PageModel page = PageModel(
        conditions: ConditionsModel(
          privilegeLevelRequired: PrivilegeLevelRequired.OwnerPrivilegeRequired,
          packageCondition: null,
          conditionOverride: null,
        ),
        appId: appId,
        documentID: "eliud_core_menudefs_page",
        title: "MenuDefs",
        drawer: _drawer,
        endDrawer: _endDrawer,
        appBar: _appBar,
        homeMenu: _homeMenu,
        bodyComponents: components,
        layout: PageLayout.OnlyTheFirstComponent
    );
    return page;
  }


  PageModel _pagesPages() {
    List<BodyComponentModel> components = [];
    components.add(BodyComponentModel(
      documentID: "internalWidget-pages", componentName: "eliud_core_internalWidgets", componentId: "pages"));
    PageModel page = PageModel(
        conditions: ConditionsModel(
          privilegeLevelRequired: PrivilegeLevelRequired.OwnerPrivilegeRequired,
          packageCondition: null,
          conditionOverride: null,
        ),
        appId: appId,
        documentID: "eliud_core_pages_page",
        title: "Pages",
        drawer: _drawer,
        endDrawer: _endDrawer,
        appBar: _appBar,
        homeMenu: _homeMenu,
        bodyComponents: components,
        layout: PageLayout.OnlyTheFirstComponent
    );
    return page;
  }


  PageModel _posSizesPages() {
    List<BodyComponentModel> components = [];
    components.add(BodyComponentModel(
      documentID: "internalWidget-posSizes", componentName: "eliud_core_internalWidgets", componentId: "posSizes"));
    PageModel page = PageModel(
        conditions: ConditionsModel(
          privilegeLevelRequired: PrivilegeLevelRequired.OwnerPrivilegeRequired,
          packageCondition: null,
          conditionOverride: null,
        ),
        appId: appId,
        documentID: "eliud_core_possizes_page",
        title: "PosSizes",
        drawer: _drawer,
        endDrawer: _endDrawer,
        appBar: _appBar,
        homeMenu: _homeMenu,
        bodyComponents: components,
        layout: PageLayout.OnlyTheFirstComponent
    );
    return page;
  }


  PageModel _shadowsPages() {
    List<BodyComponentModel> components = [];
    components.add(BodyComponentModel(
      documentID: "internalWidget-shadows", componentName: "eliud_core_internalWidgets", componentId: "shadows"));
    PageModel page = PageModel(
        conditions: ConditionsModel(
          privilegeLevelRequired: PrivilegeLevelRequired.OwnerPrivilegeRequired,
          packageCondition: null,
          conditionOverride: null,
        ),
        appId: appId,
        documentID: "eliud_core_shadows_page",
        title: "Shadows",
        drawer: _drawer,
        endDrawer: _endDrawer,
        appBar: _appBar,
        homeMenu: _homeMenu,
        bodyComponents: components,
        layout: PageLayout.OnlyTheFirstComponent
    );
    return page;
  }


  PageModel _platformMediumsPages() {
    List<BodyComponentModel> components = [];
    components.add(BodyComponentModel(
      documentID: "internalWidget-platformMediums", componentName: "eliud_core_internalWidgets", componentId: "platformMediums"));
    PageModel page = PageModel(
        conditions: ConditionsModel(
          privilegeLevelRequired: PrivilegeLevelRequired.OwnerPrivilegeRequired,
          packageCondition: null,
          conditionOverride: null,
        ),
        appId: appId,
        documentID: "eliud_core_platformmediums_page",
        title: "PlatformMediums",
        drawer: _drawer,
        endDrawer: _endDrawer,
        appBar: _appBar,
        homeMenu: _homeMenu,
        bodyComponents: components,
        layout: PageLayout.OnlyTheFirstComponent
    );
    return page;
  }


  Future<void> _setupAdminPages() {

    return pageRepository(appId: appId)!.add(_appsPages())

        .then((_) => pageRepository(appId: appId)!.add(_appBarsPages()))

        .then((_) => pageRepository(appId: appId)!.add(_appPolicysPages()))

        .then((_) => pageRepository(appId: appId)!.add(_backgroundsPages()))

        .then((_) => pageRepository(appId: appId)!.add(_countrysPages()))

        .then((_) => pageRepository(appId: appId)!.add(_dialogsPages()))

        .then((_) => pageRepository(appId: appId)!.add(_drawersPages()))

        .then((_) => pageRepository(appId: appId)!.add(_fontsPages()))

        .then((_) => pageRepository(appId: appId)!.add(_gridViewsPages()))

        .then((_) => pageRepository(appId: appId)!.add(_homeMenusPages()))

        .then((_) => pageRepository(appId: appId)!.add(_membersPages()))

        .then((_) => pageRepository(appId: appId)!.add(_memberDashboardsPages()))

        .then((_) => pageRepository(appId: appId)!.add(_memberPublicInfosPages()))

        .then((_) => pageRepository(appId: appId)!.add(_menuDefsPages()))

        .then((_) => pageRepository(appId: appId)!.add(_pagesPages()))

        .then((_) => pageRepository(appId: appId)!.add(_posSizesPages()))

        .then((_) => pageRepository(appId: appId)!.add(_shadowsPages()))

        .then((_) => pageRepository(appId: appId)!.add(_platformMediumsPages()))

    ;
  }

  @override
  Future<void> run() async {
    return _setupAdminPages();
  }


}

class AdminMenu extends AdminAppMenuInstallerBase {

  Future<MenuDefModel> menu(String appId) async {
    var menuItems = <MenuItemModel>[];

    menuItems.add(
      MenuItemModel(
        documentID: "Apps",
        text: "Apps",
        description: "Apps",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action: GotoPage(appId, pageID: "eliud_core_apps_page"))
    );


    menuItems.add(
      MenuItemModel(
        documentID: "AppBars",
        text: "AppBars",
        description: "AppBars",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action: GotoPage(appId, pageID: "eliud_core_appbars_page"))
    );


    menuItems.add(
      MenuItemModel(
        documentID: "AppPolicys",
        text: "AppPolicys",
        description: "AppPolicys",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action: GotoPage(appId, pageID: "eliud_core_apppolicys_page"))
    );


    menuItems.add(
      MenuItemModel(
        documentID: "Backgrounds",
        text: "Backgrounds",
        description: "Backgrounds",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action: GotoPage(appId, pageID: "eliud_core_backgrounds_page"))
    );


    menuItems.add(
      MenuItemModel(
        documentID: "Countrys",
        text: "Countrys",
        description: "Countrys",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action: GotoPage(appId, pageID: "eliud_core_countrys_page"))
    );


    menuItems.add(
      MenuItemModel(
        documentID: "Dialogs",
        text: "Dialogs",
        description: "Dialogs",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action: GotoPage(appId, pageID: "eliud_core_dialogs_page"))
    );


    menuItems.add(
      MenuItemModel(
        documentID: "Drawers",
        text: "Drawers",
        description: "Drawers",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action: GotoPage(appId, pageID: "eliud_core_drawers_page"))
    );


    menuItems.add(
      MenuItemModel(
        documentID: "Fonts",
        text: "Fonts",
        description: "Fonts",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action: GotoPage(appId, pageID: "eliud_core_fonts_page"))
    );


    menuItems.add(
      MenuItemModel(
        documentID: "GridViews",
        text: "GridViews",
        description: "GridViews",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action: GotoPage(appId, pageID: "eliud_core_gridviews_page"))
    );


    menuItems.add(
      MenuItemModel(
        documentID: "HomeMenus",
        text: "HomeMenus",
        description: "HomeMenus",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action: GotoPage(appId, pageID: "eliud_core_homemenus_page"))
    );


    menuItems.add(
      MenuItemModel(
        documentID: "Members",
        text: "Members",
        description: "Members",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action: GotoPage(appId, pageID: "eliud_core_members_page"))
    );


    menuItems.add(
      MenuItemModel(
        documentID: "MemberDashboards",
        text: "MemberDashboards",
        description: "MemberDashboards",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action: GotoPage(appId, pageID: "eliud_core_memberdashboards_page"))
    );


    menuItems.add(
      MenuItemModel(
        documentID: "MemberPublicInfos",
        text: "MemberPublicInfos",
        description: "MemberPublicInfos",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action: GotoPage(appId, pageID: "eliud_core_memberpublicinfos_page"))
    );


    menuItems.add(
      MenuItemModel(
        documentID: "MenuDefs",
        text: "MenuDefs",
        description: "MenuDefs",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action: GotoPage(appId, pageID: "eliud_core_menudefs_page"))
    );


    menuItems.add(
      MenuItemModel(
        documentID: "Pages",
        text: "Pages",
        description: "Pages",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action: GotoPage(appId, pageID: "eliud_core_pages_page"))
    );


    menuItems.add(
      MenuItemModel(
        documentID: "PosSizes",
        text: "PosSizes",
        description: "PosSizes",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action: GotoPage(appId, pageID: "eliud_core_possizes_page"))
    );


    menuItems.add(
      MenuItemModel(
        documentID: "Shadows",
        text: "Shadows",
        description: "Shadows",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action: GotoPage(appId, pageID: "eliud_core_shadows_page"))
    );


    menuItems.add(
      MenuItemModel(
        documentID: "PlatformMediums",
        text: "PlatformMediums",
        description: "PlatformMediums",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action: GotoPage(appId, pageID: "eliud_core_platformmediums_page"))
    );


    MenuDefModel menu = MenuDefModel(
      admin: true,
      documentID: "eliud_core_admin_menu",
      appId: appId,
      name: "eliud_core",
      menuItems: menuItems
    );
    await menuDefRepository(appId: appId)!.add(menu);
    return menu;
  }
}

class AdminAppWiper extends AdminAppWiperBase {

  @override
  Future<void> deleteAll(String appId) async {
    await backgroundRepository()!.deleteAll();
    await countryRepository()!.deleteAll();
    await fontRepository()!.deleteAll();
    await memberPublicInfoRepository()!.deleteAll();
    await shadowRepository()!.deleteAll();
    ;
  }


}

