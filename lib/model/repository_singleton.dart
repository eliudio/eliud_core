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
import '../model/app_firestore.dart';
import '../model/app_repository.dart';
import '../model/app_cache.dart';
import '../model/app_bar_firestore.dart';
import '../model/app_bar_repository.dart';
import '../model/app_bar_cache.dart';
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
import '../model/member_firestore.dart';
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
import '../model/background_model.dart';
import '../model/drawer_model.dart';
import '../model/home_menu_model.dart';
import '../model/member_model.dart';
import '../model/member_subscription_model.dart';
import '../model/page_model.dart';

class RepositorySingleton extends AbstractRepositorySingleton {
    var _appBarRepository = HashMap<String, AppBarRepository>();
    var _backgroundRepository = HashMap<String, BackgroundRepository>();
    var _countryRepository = CountryCache(CountryFirestore());
    var _drawerRepository = HashMap<String, DrawerRepository>();
    var _fontRepository = HashMap<String, FontRepository>();
    var _gridViewRepository = HashMap<String, GridViewRepository>();
    var _homeMenuRepository = HashMap<String, HomeMenuRepository>();
    var _memberRepository = MemberCache(MemberFirestore());
    var _menuDefRepository = HashMap<String, MenuDefRepository>();
    var _pageRepository = HashMap<String, PageRepository>();
    var _posSizeRepository = HashMap<String, PosSizeRepository>();
    var _shadowRepository = HashMap<String, ShadowRepository>();

    AppBarRepository appBarRepository(String appID) {
      if (_appBarRepository[appID] == null) _appBarRepository[appID] = AppBarCache(AppBarFirestore(appID));
      return _appBarRepository[appID];
    }
    BackgroundRepository backgroundRepository(String appID) {
      if (_backgroundRepository[appID] == null) _backgroundRepository[appID] = BackgroundCache(BackgroundFirestore(appID));
      return _backgroundRepository[appID];
    }
    CountryRepository countryRepository() {
      return _countryRepository;
    }
    DrawerRepository drawerRepository(String appID) {
      if (_drawerRepository[appID] == null) _drawerRepository[appID] = DrawerCache(DrawerFirestore(appID));
      return _drawerRepository[appID];
    }
    FontRepository fontRepository(String appID) {
      if (_fontRepository[appID] == null) _fontRepository[appID] = FontCache(FontFirestore(appID));
      return _fontRepository[appID];
    }
    GridViewRepository gridViewRepository(String appID) {
      if (_gridViewRepository[appID] == null) _gridViewRepository[appID] = GridViewCache(GridViewFirestore(appID));
      return _gridViewRepository[appID];
    }
    HomeMenuRepository homeMenuRepository(String appID) {
      if (_homeMenuRepository[appID] == null) _homeMenuRepository[appID] = HomeMenuCache(HomeMenuFirestore(appID));
      return _homeMenuRepository[appID];
    }
    MemberRepository memberRepository() {
      return _memberRepository;
    }
    MenuDefRepository menuDefRepository(String appID) {
      if (_menuDefRepository[appID] == null) _menuDefRepository[appID] = MenuDefCache(MenuDefFirestore(appID));
      return _menuDefRepository[appID];
    }
    PageRepository pageRepository(String appID) {
      if (_pageRepository[appID] == null) _pageRepository[appID] = PageCache(PageFirestore(appID));
      return _pageRepository[appID];
    }
    PosSizeRepository posSizeRepository(String appID) {
      if (_posSizeRepository[appID] == null) _posSizeRepository[appID] = PosSizeCache(PosSizeFirestore(appID));
      return _posSizeRepository[appID];
    }
    ShadowRepository shadowRepository(String appID) {
      if (_shadowRepository[appID] == null) _shadowRepository[appID] = ShadowCache(ShadowFirestore(appID));
      return _shadowRepository[appID];
    }

}
