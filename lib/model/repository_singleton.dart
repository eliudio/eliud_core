/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 model/repository_singleton.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'abstract_repository_singleton.dart';
import 'dart:collection';
import '../model/access_firestore.dart';
import '../model/access_repository.dart';
import '../model/access_cache.dart';
import '../model/app_firestore.dart';
import '../model/app_repository.dart';
import '../model/app_cache.dart';
import '../model/app_bar_firestore.dart';
import '../model/app_bar_repository.dart';
import '../model/app_bar_cache.dart';
import '../model/app_entry_pages_repository.dart';
import '../model/app_entry_pages_cache.dart';
import '../model/background_firestore.dart';
import '../model/background_repository.dart';
import '../model/background_cache.dart';
import '../model/body_component_repository.dart';
import '../model/body_component_cache.dart';
import '../model/country_firestore.dart';
import '../model/country_repository.dart';
import '../model/country_cache.dart';
import '../model/decoration_color_repository.dart';
import '../model/decoration_color_cache.dart';
import '../model/dialog_firestore.dart';
import '../model/dialog_repository.dart';
import '../model/dialog_cache.dart';
import '../model/drawer_firestore.dart';
import '../model/drawer_repository.dart';
import '../model/drawer_cache.dart';
import '../model/font_firestore.dart';
import '../model/font_repository.dart';
import '../model/font_cache.dart';
import '../model/grid_view_firestore.dart';
import '../model/grid_view_repository.dart';
import '../model/grid_view_cache.dart';
import '../model/home_menu_firestore.dart';
import '../model/home_menu_repository.dart';
import '../model/home_menu_cache.dart';
import '../model/image_repository.dart';
import '../model/image_cache.dart';
import '../model/member_repository.dart';
import '../model/member_cache.dart';
import '../model/member_subscription_repository.dart';
import '../model/member_subscription_cache.dart';
import '../model/menu_def_firestore.dart';
import '../model/menu_def_repository.dart';
import '../model/menu_def_cache.dart';
import '../model/menu_item_repository.dart';
import '../model/menu_item_cache.dart';
import '../model/page_firestore.dart';
import '../model/page_repository.dart';
import '../model/page_cache.dart';
import '../model/pos_size_firestore.dart';
import '../model/pos_size_repository.dart';
import '../model/pos_size_cache.dart';
import '../model/shadow_firestore.dart';
import '../model/shadow_repository.dart';
import '../model/shadow_cache.dart';

import '../model/app_model.dart';
import '../model/app_bar_model.dart';
import '../model/app_entry_pages_model.dart';
import '../model/background_model.dart';
import '../model/dialog_model.dart';
import '../model/drawer_model.dart';
import '../model/home_menu_model.dart';
import '../model/member_model.dart';
import '../model/member_subscription_model.dart';
import '../model/page_model.dart';

class RepositorySingleton extends AbstractRepositorySingleton {
    var _appBarRepository = HashMap<String, AppBarRepository>();
    var _backgroundRepository = HashMap<String, BackgroundRepository>();
    var _countryRepository = CountryCache(CountryFirestore());
    var _dialogRepository = HashMap<String, DialogRepository>();
    var _drawerRepository = HashMap<String, DrawerRepository>();
    var _fontRepository = HashMap<String, FontRepository>();
    var _gridViewRepository = HashMap<String, GridViewRepository>();
    var _homeMenuRepository = HashMap<String, HomeMenuRepository>();
    var _menuDefRepository = HashMap<String, MenuDefRepository>();
    var _pageRepository = HashMap<String, PageRepository>();
    var _posSizeRepository = HashMap<String, PosSizeRepository>();
    var _shadowRepository = HashMap<String, ShadowRepository>();

    AppBarRepository appBarRepository(String appId) {
      if (_appBarRepository[appId] == null) _appBarRepository[appId] = AppBarCache(AppBarFirestore(appId));
      return _appBarRepository[appId];
    }
    BackgroundRepository backgroundRepository(String appId) {
      if (_backgroundRepository[appId] == null) _backgroundRepository[appId] = BackgroundCache(BackgroundFirestore(appId));
      return _backgroundRepository[appId];
    }
    CountryRepository countryRepository() {
      return _countryRepository;
    }
    DialogRepository dialogRepository(String appId) {
      if (_dialogRepository[appId] == null) _dialogRepository[appId] = DialogCache(DialogFirestore(appId));
      return _dialogRepository[appId];
    }
    DrawerRepository drawerRepository(String appId) {
      if (_drawerRepository[appId] == null) _drawerRepository[appId] = DrawerCache(DrawerFirestore(appId));
      return _drawerRepository[appId];
    }
    FontRepository fontRepository(String appId) {
      if (_fontRepository[appId] == null) _fontRepository[appId] = FontCache(FontFirestore(appId));
      return _fontRepository[appId];
    }
    GridViewRepository gridViewRepository(String appId) {
      if (_gridViewRepository[appId] == null) _gridViewRepository[appId] = GridViewCache(GridViewFirestore(appId));
      return _gridViewRepository[appId];
    }
    HomeMenuRepository homeMenuRepository(String appId) {
      if (_homeMenuRepository[appId] == null) _homeMenuRepository[appId] = HomeMenuCache(HomeMenuFirestore(appId));
      return _homeMenuRepository[appId];
    }
    MenuDefRepository menuDefRepository(String appId) {
      if (_menuDefRepository[appId] == null) _menuDefRepository[appId] = MenuDefCache(MenuDefFirestore(appId));
      return _menuDefRepository[appId];
    }
    PageRepository pageRepository(String appId) {
      if (_pageRepository[appId] == null) _pageRepository[appId] = PageCache(PageFirestore(appId));
      return _pageRepository[appId];
    }
    PosSizeRepository posSizeRepository(String appId) {
      if (_posSizeRepository[appId] == null) _posSizeRepository[appId] = PosSizeCache(PosSizeFirestore(appId));
      return _posSizeRepository[appId];
    }
    ShadowRepository shadowRepository(String appId) {
      if (_shadowRepository[appId] == null) _shadowRepository[appId] = ShadowCache(ShadowFirestore(appId));
      return _shadowRepository[appId];
    }

}
