/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 model/abstract_repository_singleton.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import '../model/app_repository.dart';
import '../model/app_bar_repository.dart';
import '../model/background_repository.dart';
import '../model/body_component_repository.dart';
import '../model/country_repository.dart';
import '../model/decoration_color_repository.dart';
import '../model/drawer_repository.dart';
import '../model/font_repository.dart';
import '../model/grid_view_repository.dart';
import '../model/home_menu_repository.dart';
import '../model/image_repository.dart';
import '../model/member_repository.dart';
import '../model/member_subscription_repository.dart';
import '../model/menu_def_repository.dart';
import '../model/menu_item_repository.dart';
import '../model/page_repository.dart';
import '../model/pos_size_repository.dart';
import '../model/shadow_repository.dart';
import 'package:eliud_core/core/access/bloc/user_repository.dart';
import 'package:eliud_core/tools/types.dart';

AppBarRepository appBarRepository() => AbstractRepositorySingleton.singleton.appBarRepository();
BackgroundRepository backgroundRepository() => AbstractRepositorySingleton.singleton.backgroundRepository();
CountryRepository countryRepository() => AbstractRepositorySingleton.singleton.countryRepository();
DrawerRepository drawerRepository() => AbstractRepositorySingleton.singleton.drawerRepository();
FontRepository fontRepository() => AbstractRepositorySingleton.singleton.fontRepository();
GridViewRepository gridViewRepository() => AbstractRepositorySingleton.singleton.gridViewRepository();
HomeMenuRepository homeMenuRepository() => AbstractRepositorySingleton.singleton.homeMenuRepository();
MemberRepository memberRepository() => AbstractRepositorySingleton.singleton.memberRepository();
MenuDefRepository menuDefRepository() => AbstractRepositorySingleton.singleton.menuDefRepository();
PageRepository pageRepository() => AbstractRepositorySingleton.singleton.pageRepository();
PosSizeRepository posSizeRepository() => AbstractRepositorySingleton.singleton.posSizeRepository();
ShadowRepository shadowRepository() => AbstractRepositorySingleton.singleton.shadowRepository();

abstract class AbstractRepositorySingleton {
  static AbstractRepositorySingleton singleton;

  AppBarRepository appBarRepository();
  BackgroundRepository backgroundRepository();
  CountryRepository countryRepository();
  DrawerRepository drawerRepository();
  FontRepository fontRepository();
  GridViewRepository gridViewRepository();
  HomeMenuRepository homeMenuRepository();
  MemberRepository memberRepository();
  MenuDefRepository menuDefRepository();
  PageRepository pageRepository();
  PosSizeRepository posSizeRepository();
  ShadowRepository shadowRepository();

  void flush() {
    appBarRepository().flush();
    backgroundRepository().flush();
    countryRepository().flush();
    drawerRepository().flush();
    fontRepository().flush();
    gridViewRepository().flush();
    homeMenuRepository().flush();
    memberRepository().flush();
    menuDefRepository().flush();
    pageRepository().flush();
    posSizeRepository().flush();
    shadowRepository().flush();
  }
}
