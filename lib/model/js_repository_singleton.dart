/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 model/js_repository_singleton.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'abstract_repository_singleton.dart';
import '../model/app_js_firestore.dart';
import '../model/app_repository.dart';
import '../model/app_cache.dart';
import '../model/app_bar_js_firestore.dart';
import '../model/app_bar_repository.dart';
import '../model/app_bar_cache.dart';
import '../model/background_js_firestore.dart';
import '../model/background_repository.dart';
import '../model/background_cache.dart';
import '../model/body_component_repository.dart';
import '../model/body_component_cache.dart';
import '../model/country_js_firestore.dart';
import '../model/country_repository.dart';
import '../model/country_cache.dart';
import '../model/decoration_color_repository.dart';
import '../model/decoration_color_cache.dart';
import '../model/drawer_js_firestore.dart';
import '../model/drawer_repository.dart';
import '../model/drawer_cache.dart';
import '../model/font_js_firestore.dart';
import '../model/font_repository.dart';
import '../model/font_cache.dart';
import '../model/grid_view_js_firestore.dart';
import '../model/grid_view_repository.dart';
import '../model/grid_view_cache.dart';
import '../model/home_menu_js_firestore.dart';
import '../model/home_menu_repository.dart';
import '../model/home_menu_cache.dart';
import '../model/image_repository.dart';
import '../model/image_cache.dart';
import '../model/member_js_firestore.dart';
import '../model/member_repository.dart';
import '../model/member_cache.dart';
import '../model/member_subscription_repository.dart';
import '../model/member_subscription_cache.dart';
import '../model/menu_def_js_firestore.dart';
import '../model/menu_def_repository.dart';
import '../model/menu_def_cache.dart';
import '../model/menu_item_repository.dart';
import '../model/menu_item_cache.dart';
import '../model/page_js_firestore.dart';
import '../model/page_repository.dart';
import '../model/page_cache.dart';
import '../model/pos_size_js_firestore.dart';
import '../model/pos_size_repository.dart';
import '../model/pos_size_cache.dart';
import '../model/shadow_js_firestore.dart';
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

class JsRepositorySingleton extends AbstractRepositorySingleton {
  JsRepositorySingleton(String appID) {
    _appBarRepository = AppBarCache(AppBarJsFirestore(appID));
    _backgroundRepository = BackgroundCache(BackgroundJsFirestore(appID));
    _countryRepository = CountryCache(CountryJsFirestore());
    _drawerRepository = DrawerCache(DrawerJsFirestore(appID));
    _fontRepository = FontCache(FontJsFirestore(appID));
    _gridViewRepository = GridViewCache(GridViewJsFirestore(appID));
    _homeMenuRepository = HomeMenuCache(HomeMenuJsFirestore(appID));
    _memberRepository = MemberCache(MemberJsFirestore());
    _menuDefRepository = MenuDefCache(MenuDefJsFirestore(appID));
    _pageRepository = PageCache(PageJsFirestore(appID));
    _posSizeRepository = PosSizeCache(PosSizeJsFirestore(appID));
    _shadowRepository = ShadowCache(ShadowJsFirestore(appID));
  }
  AppBarRepository appBarRepository() => _appBarRepository;
  AppBarRepository _appBarRepository;
  BackgroundRepository backgroundRepository() => _backgroundRepository;
  BackgroundRepository _backgroundRepository;
  CountryRepository countryRepository() => _countryRepository;
  CountryRepository _countryRepository;
  DrawerRepository drawerRepository() => _drawerRepository;
  DrawerRepository _drawerRepository;
  FontRepository fontRepository() => _fontRepository;
  FontRepository _fontRepository;
  GridViewRepository gridViewRepository() => _gridViewRepository;
  GridViewRepository _gridViewRepository;
  HomeMenuRepository homeMenuRepository() => _homeMenuRepository;
  HomeMenuRepository _homeMenuRepository;
  MemberRepository memberRepository() => _memberRepository;
  MemberRepository _memberRepository;
  MenuDefRepository menuDefRepository() => _menuDefRepository;
  MenuDefRepository _menuDefRepository;
  PageRepository pageRepository() => _pageRepository;
  PageRepository _pageRepository;
  PosSizeRepository posSizeRepository() => _posSizeRepository;
  PosSizeRepository _posSizeRepository;
  ShadowRepository shadowRepository() => _shadowRepository;
  ShadowRepository _shadowRepository;

}
