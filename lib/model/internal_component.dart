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


import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/tools/component_constructor.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:eliud_core/tools/has_fab.dart';


import 'package:eliud_core/model/app_list_bloc.dart';
import 'package:eliud_core/model/app_list.dart';
import 'package:eliud_core/model/app_dropdown_button.dart';
import 'package:eliud_core/model/app_list_event.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_core/model/entity_export.dart';

import 'package:eliud_core/model/app_bar_list_bloc.dart';
import 'package:eliud_core/model/app_bar_list.dart';
import 'package:eliud_core/model/app_bar_dropdown_button.dart';
import 'package:eliud_core/model/app_bar_list_event.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_core/model/entity_export.dart';

import 'package:eliud_core/model/background_list_bloc.dart';
import 'package:eliud_core/model/background_list.dart';
import 'package:eliud_core/model/background_dropdown_button.dart';
import 'package:eliud_core/model/background_list_event.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_core/model/entity_export.dart';

import 'package:eliud_core/model/country_list_bloc.dart';
import 'package:eliud_core/model/country_list.dart';
import 'package:eliud_core/model/country_dropdown_button.dart';
import 'package:eliud_core/model/country_list_event.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_core/model/entity_export.dart';

import 'package:eliud_core/model/drawer_list_bloc.dart';
import 'package:eliud_core/model/drawer_list.dart';
import 'package:eliud_core/model/drawer_dropdown_button.dart';
import 'package:eliud_core/model/drawer_list_event.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_core/model/entity_export.dart';

import 'package:eliud_core/model/font_list_bloc.dart';
import 'package:eliud_core/model/font_list.dart';
import 'package:eliud_core/model/font_dropdown_button.dart';
import 'package:eliud_core/model/font_list_event.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_core/model/entity_export.dart';

import 'package:eliud_core/model/grid_view_list_bloc.dart';
import 'package:eliud_core/model/grid_view_list.dart';
import 'package:eliud_core/model/grid_view_dropdown_button.dart';
import 'package:eliud_core/model/grid_view_list_event.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_core/model/entity_export.dart';

import 'package:eliud_core/model/home_menu_list_bloc.dart';
import 'package:eliud_core/model/home_menu_list.dart';
import 'package:eliud_core/model/home_menu_dropdown_button.dart';
import 'package:eliud_core/model/home_menu_list_event.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_core/model/entity_export.dart';

import 'package:eliud_core/model/image_list_bloc.dart';
import 'package:eliud_core/model/image_list.dart';
import 'package:eliud_core/model/image_dropdown_button.dart';
import 'package:eliud_core/model/image_list_event.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_core/model/entity_export.dart';

import 'package:eliud_core/model/member_list_bloc.dart';
import 'package:eliud_core/model/member_list.dart';
import 'package:eliud_core/model/member_dropdown_button.dart';
import 'package:eliud_core/model/member_list_event.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_core/model/entity_export.dart';

import 'package:eliud_core/model/menu_def_list_bloc.dart';
import 'package:eliud_core/model/menu_def_list.dart';
import 'package:eliud_core/model/menu_def_dropdown_button.dart';
import 'package:eliud_core/model/menu_def_list_event.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_core/model/entity_export.dart';

import 'package:eliud_core/model/page_list_bloc.dart';
import 'package:eliud_core/model/page_list.dart';
import 'package:eliud_core/model/page_dropdown_button.dart';
import 'package:eliud_core/model/page_list_event.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_core/model/entity_export.dart';

import 'package:eliud_core/model/pos_size_list_bloc.dart';
import 'package:eliud_core/model/pos_size_list.dart';
import 'package:eliud_core/model/pos_size_dropdown_button.dart';
import 'package:eliud_core/model/pos_size_list_event.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_core/model/entity_export.dart';

import 'package:eliud_core/model/shadow_list_bloc.dart';
import 'package:eliud_core/model/shadow_list.dart';
import 'package:eliud_core/model/shadow_dropdown_button.dart';
import 'package:eliud_core/model/shadow_list_event.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_core/model/entity_export.dart';

class ListComponentFactory implements ComponentConstructor {
  Widget createNew({String id, Map<String, String> parameters}) {
    return ListComponent(componentId: id);
  }
}


typedef DropdownButtonChanged(String value);

class DropdownButtonComponentFactory implements ComponentDropDown {

  bool supports(String id) {

    if (id == "apps") return true;
    if (id == "appBars") return true;
    if (id == "backgrounds") return true;
    if (id == "countrys") return true;
    if (id == "drawers") return true;
    if (id == "fonts") return true;
    if (id == "gridViews") return true;
    if (id == "homeMenus") return true;
    if (id == "images") return true;
    if (id == "members") return true;
    if (id == "menuDefs") return true;
    if (id == "pages") return true;
    if (id == "posSizes") return true;
    if (id == "shadows") return true;
    return false;
  }

  Widget createNew({String id, Map<String, String> parameters, String value, DropdownButtonChanged trigger, bool optional}) {

    if (id == "apps")
      return DropdownButtonComponent(componentId: id, value: value, trigger: trigger, optional: optional);

    if (id == "appBars")
      return DropdownButtonComponent(componentId: id, value: value, trigger: trigger, optional: optional);

    if (id == "backgrounds")
      return DropdownButtonComponent(componentId: id, value: value, trigger: trigger, optional: optional);

    if (id == "countrys")
      return DropdownButtonComponent(componentId: id, value: value, trigger: trigger, optional: optional);

    if (id == "drawers")
      return DropdownButtonComponent(componentId: id, value: value, trigger: trigger, optional: optional);

    if (id == "fonts")
      return DropdownButtonComponent(componentId: id, value: value, trigger: trigger, optional: optional);

    if (id == "gridViews")
      return DropdownButtonComponent(componentId: id, value: value, trigger: trigger, optional: optional);

    if (id == "homeMenus")
      return DropdownButtonComponent(componentId: id, value: value, trigger: trigger, optional: optional);

    if (id == "images")
      return DropdownButtonComponent(componentId: id, value: value, trigger: trigger, optional: optional);

    if (id == "members")
      return DropdownButtonComponent(componentId: id, value: value, trigger: trigger, optional: optional);

    if (id == "menuDefs")
      return DropdownButtonComponent(componentId: id, value: value, trigger: trigger, optional: optional);

    if (id == "pages")
      return DropdownButtonComponent(componentId: id, value: value, trigger: trigger, optional: optional);

    if (id == "posSizes")
      return DropdownButtonComponent(componentId: id, value: value, trigger: trigger, optional: optional);

    if (id == "shadows")
      return DropdownButtonComponent(componentId: id, value: value, trigger: trigger, optional: optional);

    return null;
  }
}


class ListComponent extends StatelessWidget with HasFab {
  final String componentId;
  Widget widget;

  @override
  Widget fab(BuildContext context){
    if ((widget != null) && (widget is HasFab)) {
      HasFab hasFab = widget as HasFab;
      return hasFab.fab(context);
    }
    return null;
  }

  ListComponent({this.componentId}) {
    initWidget();
  }

  @override
  Widget build(BuildContext context) {

    if (componentId == 'apps') return _appBuild(context);
    if (componentId == 'appBars') return _appBarBuild(context);
    if (componentId == 'backgrounds') return _backgroundBuild(context);
    if (componentId == 'countrys') return _countryBuild(context);
    if (componentId == 'drawers') return _drawerBuild(context);
    if (componentId == 'fonts') return _fontBuild(context);
    if (componentId == 'gridViews') return _gridViewBuild(context);
    if (componentId == 'homeMenus') return _homeMenuBuild(context);
    if (componentId == 'images') return _imageBuild(context);
    if (componentId == 'members') return _memberBuild(context);
    if (componentId == 'menuDefs') return _menuDefBuild(context);
    if (componentId == 'pages') return _pageBuild(context);
    if (componentId == 'posSizes') return _posSizeBuild(context);
    if (componentId == 'shadows') return _shadowBuild(context);
    return Text('Component with componentId == $componentId not found');
  }

  Widget initWidget() {
    if (componentId == 'apps') widget = AppListWidget();
    if (componentId == 'appBars') widget = AppBarListWidget();
    if (componentId == 'backgrounds') widget = BackgroundListWidget();
    if (componentId == 'countrys') widget = CountryListWidget();
    if (componentId == 'drawers') widget = DrawerListWidget();
    if (componentId == 'fonts') widget = FontListWidget();
    if (componentId == 'gridViews') widget = GridViewListWidget();
    if (componentId == 'homeMenus') widget = HomeMenuListWidget();
    if (componentId == 'images') widget = ImageListWidget();
    if (componentId == 'members') widget = MemberListWidget();
    if (componentId == 'menuDefs') widget = MenuDefListWidget();
    if (componentId == 'pages') widget = PageListWidget();
    if (componentId == 'posSizes') widget = PosSizeListWidget();
    if (componentId == 'shadows') widget = ShadowListWidget();
  }

  Widget _appBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppListBloc>(
          create: (context) => AppListBloc(
            appRepository: appRepository(),
          )..add(LoadAppList()),
        )
      ],
      child: widget,
    );
  }

  Widget _appBarBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppBarListBloc>(
          create: (context) => AppBarListBloc(
            appBarRepository: appBarRepository(appId: AccessBloc.appId(context)),
          )..add(LoadAppBarList()),
        )
      ],
      child: widget,
    );
  }

  Widget _backgroundBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BackgroundListBloc>(
          create: (context) => BackgroundListBloc(
            backgroundRepository: backgroundRepository(appId: AccessBloc.appId(context)),
          )..add(LoadBackgroundList()),
        )
      ],
      child: widget,
    );
  }

  Widget _countryBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CountryListBloc>(
          create: (context) => CountryListBloc(
            countryRepository: countryRepository(),
          )..add(LoadCountryList()),
        )
      ],
      child: widget,
    );
  }

  Widget _drawerBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DrawerListBloc>(
          create: (context) => DrawerListBloc(
            drawerRepository: drawerRepository(appId: AccessBloc.appId(context)),
          )..add(LoadDrawerList()),
        )
      ],
      child: widget,
    );
  }

  Widget _fontBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FontListBloc>(
          create: (context) => FontListBloc(
            fontRepository: fontRepository(appId: AccessBloc.appId(context)),
          )..add(LoadFontList()),
        )
      ],
      child: widget,
    );
  }

  Widget _gridViewBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GridViewListBloc>(
          create: (context) => GridViewListBloc(
            gridViewRepository: gridViewRepository(appId: AccessBloc.appId(context)),
          )..add(LoadGridViewList()),
        )
      ],
      child: widget,
    );
  }

  Widget _homeMenuBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeMenuListBloc>(
          create: (context) => HomeMenuListBloc(
            homeMenuRepository: homeMenuRepository(appId: AccessBloc.appId(context)),
          )..add(LoadHomeMenuList()),
        )
      ],
      child: widget,
    );
  }

  Widget _imageBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ImageListBloc>(
          create: (context) => ImageListBloc(
            imageRepository: imageRepository(appId: AccessBloc.appId(context)),
          )..add(LoadImageList()),
        )
      ],
      child: widget,
    );
  }

  Widget _memberBuild(BuildContext context) {
    var accessBloc = AccessBloc.getBloc(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider<MemberListBloc>(
          create: (context) => MemberListBloc(accessBloc,
            memberRepository: memberRepository(),
          )..add(LoadMemberList()),
        )
      ],
      child: widget,
    );
  }

  Widget _menuDefBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MenuDefListBloc>(
          create: (context) => MenuDefListBloc(
            menuDefRepository: menuDefRepository(appId: AccessBloc.appId(context)),
          )..add(LoadMenuDefList()),
        )
      ],
      child: widget,
    );
  }

  Widget _pageBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PageListBloc>(
          create: (context) => PageListBloc(
            pageRepository: pageRepository(appId: AccessBloc.appId(context)),
          )..add(LoadPageList()),
        )
      ],
      child: widget,
    );
  }

  Widget _posSizeBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PosSizeListBloc>(
          create: (context) => PosSizeListBloc(
            posSizeRepository: posSizeRepository(appId: AccessBloc.appId(context)),
          )..add(LoadPosSizeList()),
        )
      ],
      child: widget,
    );
  }

  Widget _shadowBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ShadowListBloc>(
          create: (context) => ShadowListBloc(
            shadowRepository: shadowRepository(appId: AccessBloc.appId(context)),
          )..add(LoadShadowList()),
        )
      ],
      child: widget,
    );
  }

}


typedef Changed(String value);

class DropdownButtonComponent extends StatelessWidget {
  final String componentId;
  final String value;
  final Changed trigger;
  final bool optional;

  DropdownButtonComponent({this.componentId, this.value, this.trigger, this.optional});

  @override
  Widget build(BuildContext context) {

    if (componentId == 'apps') return _appBuild(context);
    if (componentId == 'appBars') return _appBarBuild(context);
    if (componentId == 'backgrounds') return _backgroundBuild(context);
    if (componentId == 'countrys') return _countryBuild(context);
    if (componentId == 'drawers') return _drawerBuild(context);
    if (componentId == 'fonts') return _fontBuild(context);
    if (componentId == 'gridViews') return _gridViewBuild(context);
    if (componentId == 'homeMenus') return _homeMenuBuild(context);
    if (componentId == 'images') return _imageBuild(context);
    if (componentId == 'members') return _memberBuild(context);
    if (componentId == 'menuDefs') return _menuDefBuild(context);
    if (componentId == 'pages') return _pageBuild(context);
    if (componentId == 'posSizes') return _posSizeBuild(context);
    if (componentId == 'shadows') return _shadowBuild(context);
    return Text('Component with componentId == $componentId not found');
  }


  Widget _appBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppListBloc>(
          create: (context) => AppListBloc(
            appRepository: appRepository(),
          )..add(LoadAppList()),
        )
      ],
      child: AppDropdownButtonWidget(value: value, trigger: trigger, optional: optional),
    );
  }

  Widget _appBarBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppBarListBloc>(
          create: (context) => AppBarListBloc(
            appBarRepository: appBarRepository(appId: AccessBloc.appId(context)),
          )..add(LoadAppBarList()),
        )
      ],
      child: AppBarDropdownButtonWidget(value: value, trigger: trigger, optional: optional),
    );
  }

  Widget _backgroundBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BackgroundListBloc>(
          create: (context) => BackgroundListBloc(
            backgroundRepository: backgroundRepository(appId: AccessBloc.appId(context)),
          )..add(LoadBackgroundList()),
        )
      ],
      child: BackgroundDropdownButtonWidget(value: value, trigger: trigger, optional: optional),
    );
  }

  Widget _countryBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CountryListBloc>(
          create: (context) => CountryListBloc(
            countryRepository: countryRepository(),
          )..add(LoadCountryList()),
        )
      ],
      child: CountryDropdownButtonWidget(value: value, trigger: trigger, optional: optional),
    );
  }

  Widget _drawerBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DrawerListBloc>(
          create: (context) => DrawerListBloc(
            drawerRepository: drawerRepository(appId: AccessBloc.appId(context)),
          )..add(LoadDrawerList()),
        )
      ],
      child: DrawerDropdownButtonWidget(value: value, trigger: trigger, optional: optional),
    );
  }

  Widget _fontBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FontListBloc>(
          create: (context) => FontListBloc(
            fontRepository: fontRepository(appId: AccessBloc.appId(context)),
          )..add(LoadFontList()),
        )
      ],
      child: FontDropdownButtonWidget(value: value, trigger: trigger, optional: optional),
    );
  }

  Widget _gridViewBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GridViewListBloc>(
          create: (context) => GridViewListBloc(
            gridViewRepository: gridViewRepository(appId: AccessBloc.appId(context)),
          )..add(LoadGridViewList()),
        )
      ],
      child: GridViewDropdownButtonWidget(value: value, trigger: trigger, optional: optional),
    );
  }

  Widget _homeMenuBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeMenuListBloc>(
          create: (context) => HomeMenuListBloc(
            homeMenuRepository: homeMenuRepository(appId: AccessBloc.appId(context)),
          )..add(LoadHomeMenuList()),
        )
      ],
      child: HomeMenuDropdownButtonWidget(value: value, trigger: trigger, optional: optional),
    );
  }

  Widget _imageBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ImageListBloc>(
          create: (context) => ImageListBloc(
            imageRepository: imageRepository(appId: AccessBloc.appId(context)),
          )..add(LoadImageList()),
        )
      ],
      child: ImageDropdownButtonWidget(value: value, trigger: trigger, optional: optional),
    );
  }

  Widget _memberBuild(BuildContext context) {
    var accessBloc = AccessBloc.getBloc(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider<MemberListBloc>(
          create: (context) => MemberListBloc(accessBloc,
            memberRepository: memberRepository(),
          )..add(LoadMemberList()),
        )
      ],
      child: MemberDropdownButtonWidget(value: value, trigger: trigger, optional: optional),
    );
  }

  Widget _menuDefBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MenuDefListBloc>(
          create: (context) => MenuDefListBloc(
            menuDefRepository: menuDefRepository(appId: AccessBloc.appId(context)),
          )..add(LoadMenuDefList()),
        )
      ],
      child: MenuDefDropdownButtonWidget(value: value, trigger: trigger, optional: optional),
    );
  }

  Widget _pageBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PageListBloc>(
          create: (context) => PageListBloc(
            pageRepository: pageRepository(appId: AccessBloc.appId(context)),
          )..add(LoadPageList()),
        )
      ],
      child: PageDropdownButtonWidget(value: value, trigger: trigger, optional: optional),
    );
  }

  Widget _posSizeBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PosSizeListBloc>(
          create: (context) => PosSizeListBloc(
            posSizeRepository: posSizeRepository(appId: AccessBloc.appId(context)),
          )..add(LoadPosSizeList()),
        )
      ],
      child: PosSizeDropdownButtonWidget(value: value, trigger: trigger, optional: optional),
    );
  }

  Widget _shadowBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ShadowListBloc>(
          create: (context) => ShadowListBloc(
            shadowRepository: shadowRepository(appId: AccessBloc.appId(context)),
          )..add(LoadShadowList()),
        )
      ],
      child: ShadowDropdownButtonWidget(value: value, trigger: trigger, optional: optional),
    );
  }

}


