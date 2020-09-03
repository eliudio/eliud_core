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
import 'package:eliud_core/tools/action_model.dart';

import 'package:eliud_core/model/menu_def_model.dart';
import 'package:eliud_core/model/page_model.dart';
import 'package:eliud_core/model/app_bar_model.dart';
import 'package:eliud_core/model/body_component_model.dart';
import 'package:eliud_core/model/drawer_model.dart';
import 'package:eliud_core/model/menu_item_model.dart';
import 'package:eliud_core/model/home_menu_model.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_core/model/entity_export.dart';

class AdminApp extends AdminAppInstallerBase {
  final String appID;
  final DrawerModel _drawer;
  final DrawerModel _endDrawer;
  final AppBarModel _appBar;
  final HomeMenuModel _homeMenu;
  final RgbModel menuItemColor;
  final RgbModel selectedMenuItemColor;
  final RgbModel backgroundColor;
  
  AdminApp(this.appID, this._drawer, this._endDrawer, this._appBar, this._homeMenu, this.menuItemColor, this.selectedMenuItemColor, this.backgroundColor);


  Future<MenuDefModel> menu(String appID) async {
    List<MenuItemModel> menuItems = List<MenuItemModel>();

    menuItems.add(
      MenuItemModel(
        documentID: "Apps",
        text: "Apps",
        description: "Apps",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action: GotoPage(pageID: "appspage"))
    );


    menuItems.add(
      MenuItemModel(
        documentID: "AppBars",
        text: "AppBars",
        description: "AppBars",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action: GotoPage(pageID: "appbarspage"))
    );


    menuItems.add(
      MenuItemModel(
        documentID: "Backgrounds",
        text: "Backgrounds",
        description: "Backgrounds",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action: GotoPage(pageID: "backgroundspage"))
    );


    menuItems.add(
      MenuItemModel(
        documentID: "Countrys",
        text: "Countrys",
        description: "Countrys",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action: GotoPage(pageID: "countryspage"))
    );


    menuItems.add(
      MenuItemModel(
        documentID: "Drawers",
        text: "Drawers",
        description: "Drawers",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action: GotoPage(pageID: "drawerspage"))
    );


    menuItems.add(
      MenuItemModel(
        documentID: "Fonts",
        text: "Fonts",
        description: "Fonts",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action: GotoPage(pageID: "fontspage"))
    );


    menuItems.add(
      MenuItemModel(
        documentID: "GridViews",
        text: "GridViews",
        description: "GridViews",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action: GotoPage(pageID: "gridviewspage"))
    );


    menuItems.add(
      MenuItemModel(
        documentID: "HomeMenus",
        text: "HomeMenus",
        description: "HomeMenus",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action: GotoPage(pageID: "homemenuspage"))
    );


    menuItems.add(
      MenuItemModel(
        documentID: "Images",
        text: "Images",
        description: "Images",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action: GotoPage(pageID: "imagespage"))
    );


    menuItems.add(
      MenuItemModel(
        documentID: "Members",
        text: "Members",
        description: "Members",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action: GotoPage(pageID: "memberspage"))
    );


    menuItems.add(
      MenuItemModel(
        documentID: "MenuDefs",
        text: "MenuDefs",
        description: "MenuDefs",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action: GotoPage(pageID: "menudefspage"))
    );


    menuItems.add(
      MenuItemModel(
        documentID: "Pages",
        text: "Pages",
        description: "Pages",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action: GotoPage(pageID: "pagespage"))
    );


    menuItems.add(
      MenuItemModel(
        documentID: "PosSizes",
        text: "PosSizes",
        description: "PosSizes",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action: GotoPage(pageID: "possizespage"))
    );


    menuItems.add(
      MenuItemModel(
        documentID: "Shadows",
        text: "Shadows",
        description: "Shadows",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action: GotoPage(pageID: "shadowspage"))
    );


    MenuDefModel menu = MenuDefModel(
      admin: true,
      documentID: "eliud_core_admin_menu",
      appId: appID,
      name: "Menu Definition 1",
      menuItems: menuItems
    );
    await menuDefRepository().add(menu);
    return menu;
  }


  PageModel _appsPages() {
    List<BodyComponentModel> components = List();
    components.add(BodyComponentModel(
      documentID: "internalWidget-apps", componentName: "internalWidgets", componentId: "apps"));
    PageModel page = PageModel(
        conditional: PageCondition.AdminOnly,
        appId: appID,
        documentID: "appspage",
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
    List<BodyComponentModel> components = List();
    components.add(BodyComponentModel(
      documentID: "internalWidget-appBars", componentName: "internalWidgets", componentId: "appBars"));
    PageModel page = PageModel(
        conditional: PageCondition.AdminOnly,
        appId: appID,
        documentID: "appbarspage",
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


  PageModel _backgroundsPages() {
    List<BodyComponentModel> components = List();
    components.add(BodyComponentModel(
      documentID: "internalWidget-backgrounds", componentName: "internalWidgets", componentId: "backgrounds"));
    PageModel page = PageModel(
        conditional: PageCondition.AdminOnly,
        appId: appID,
        documentID: "backgroundspage",
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
    List<BodyComponentModel> components = List();
    components.add(BodyComponentModel(
      documentID: "internalWidget-countrys", componentName: "internalWidgets", componentId: "countrys"));
    PageModel page = PageModel(
        conditional: PageCondition.AdminOnly,
        appId: appID,
        documentID: "countryspage",
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


  PageModel _drawersPages() {
    List<BodyComponentModel> components = List();
    components.add(BodyComponentModel(
      documentID: "internalWidget-drawers", componentName: "internalWidgets", componentId: "drawers"));
    PageModel page = PageModel(
        conditional: PageCondition.AdminOnly,
        appId: appID,
        documentID: "drawerspage",
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
    List<BodyComponentModel> components = List();
    components.add(BodyComponentModel(
      documentID: "internalWidget-fonts", componentName: "internalWidgets", componentId: "fonts"));
    PageModel page = PageModel(
        conditional: PageCondition.AdminOnly,
        appId: appID,
        documentID: "fontspage",
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
    List<BodyComponentModel> components = List();
    components.add(BodyComponentModel(
      documentID: "internalWidget-gridViews", componentName: "internalWidgets", componentId: "gridViews"));
    PageModel page = PageModel(
        conditional: PageCondition.AdminOnly,
        appId: appID,
        documentID: "gridviewspage",
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
    List<BodyComponentModel> components = List();
    components.add(BodyComponentModel(
      documentID: "internalWidget-homeMenus", componentName: "internalWidgets", componentId: "homeMenus"));
    PageModel page = PageModel(
        conditional: PageCondition.AdminOnly,
        appId: appID,
        documentID: "homemenuspage",
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


  PageModel _imagesPages() {
    List<BodyComponentModel> components = List();
    components.add(BodyComponentModel(
      documentID: "internalWidget-images", componentName: "internalWidgets", componentId: "images"));
    PageModel page = PageModel(
        conditional: PageCondition.AdminOnly,
        appId: appID,
        documentID: "imagespage",
        title: "Images",
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
    List<BodyComponentModel> components = List();
    components.add(BodyComponentModel(
      documentID: "internalWidget-members", componentName: "internalWidgets", componentId: "members"));
    PageModel page = PageModel(
        conditional: PageCondition.AdminOnly,
        appId: appID,
        documentID: "memberspage",
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


  PageModel _menuDefsPages() {
    List<BodyComponentModel> components = List();
    components.add(BodyComponentModel(
      documentID: "internalWidget-menuDefs", componentName: "internalWidgets", componentId: "menuDefs"));
    PageModel page = PageModel(
        conditional: PageCondition.AdminOnly,
        appId: appID,
        documentID: "menudefspage",
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
    List<BodyComponentModel> components = List();
    components.add(BodyComponentModel(
      documentID: "internalWidget-pages", componentName: "internalWidgets", componentId: "pages"));
    PageModel page = PageModel(
        conditional: PageCondition.AdminOnly,
        appId: appID,
        documentID: "pagespage",
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
    List<BodyComponentModel> components = List();
    components.add(BodyComponentModel(
      documentID: "internalWidget-posSizes", componentName: "internalWidgets", componentId: "posSizes"));
    PageModel page = PageModel(
        conditional: PageCondition.AdminOnly,
        appId: appID,
        documentID: "possizespage",
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
    List<BodyComponentModel> components = List();
    components.add(BodyComponentModel(
      documentID: "internalWidget-shadows", componentName: "internalWidgets", componentId: "shadows"));
    PageModel page = PageModel(
        conditional: PageCondition.AdminOnly,
        appId: appID,
        documentID: "shadowspage",
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


  Future<void> _setupAdminPages() {

    return pageRepository().add(_appsPages())

        .then((_) => pageRepository().add(_appBarsPages()))

        .then((_) => pageRepository().add(_backgroundsPages()))

        .then((_) => pageRepository().add(_countrysPages()))

        .then((_) => pageRepository().add(_drawersPages()))

        .then((_) => pageRepository().add(_fontsPages()))

        .then((_) => pageRepository().add(_gridViewsPages()))

        .then((_) => pageRepository().add(_homeMenusPages()))

        .then((_) => pageRepository().add(_imagesPages()))

        .then((_) => pageRepository().add(_membersPages()))

        .then((_) => pageRepository().add(_menuDefsPages()))

        .then((_) => pageRepository().add(_pagesPages()))

        .then((_) => pageRepository().add(_posSizesPages()))

        .then((_) => pageRepository().add(_shadowsPages()))

    ;
  }

  @override
  Future<void> run() async {
    return _setupAdminPages();
  }


}

class AdminAppWiper extends AdminAppWiperBase {

  @override
  Future<void> deleteAll(String appID) async {
    await appBarRepository().deleteAll();
    await backgroundRepository().deleteAll();
    await countryRepository().deleteAll();
    await drawerRepository().deleteAll();
    await fontRepository().deleteAll();
    await gridViewRepository().deleteAll();
    await homeMenuRepository().deleteAll();
    await imageRepository().deleteAll();
    await menuDefRepository().deleteAll();
    await pageRepository().deleteAll();
    await posSizeRepository().deleteAll();
    await shadowRepository().deleteAll();
    ;
  }


}

