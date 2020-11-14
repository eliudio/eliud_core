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

AppBarRepository appBarRepository({ String appID }) => AbstractRepositorySingleton.singleton.appBarRepository(appID);
BackgroundRepository backgroundRepository({ String appID }) => AbstractRepositorySingleton.singleton.backgroundRepository(appID);
CountryRepository countryRepository({ String appID }) => AbstractRepositorySingleton.singleton.countryRepository();
DrawerRepository drawerRepository({ String appID }) => AbstractRepositorySingleton.singleton.drawerRepository(appID);
FontRepository fontRepository({ String appID }) => AbstractRepositorySingleton.singleton.fontRepository(appID);
GridViewRepository gridViewRepository({ String appID }) => AbstractRepositorySingleton.singleton.gridViewRepository(appID);
HomeMenuRepository homeMenuRepository({ String appID }) => AbstractRepositorySingleton.singleton.homeMenuRepository(appID);
MemberRepository memberRepository({ String appID }) => AbstractRepositorySingleton.singleton.memberRepository();
MenuDefRepository menuDefRepository({ String appID }) => AbstractRepositorySingleton.singleton.menuDefRepository(appID);
PageRepository pageRepository({ String appID }) => AbstractRepositorySingleton.singleton.pageRepository(appID);
PosSizeRepository posSizeRepository({ String appID }) => AbstractRepositorySingleton.singleton.posSizeRepository(appID);
ShadowRepository shadowRepository({ String appID }) => AbstractRepositorySingleton.singleton.shadowRepository(appID);

abstract class AbstractRepositorySingleton {
  static AbstractRepositorySingleton singleton;

  AppBarRepository appBarRepository(String appID);
  BackgroundRepository backgroundRepository(String appID);
  CountryRepository countryRepository();
  DrawerRepository drawerRepository(String appID);
  FontRepository fontRepository(String appID);
  GridViewRepository gridViewRepository(String appID);
  HomeMenuRepository homeMenuRepository(String appID);
  MemberRepository memberRepository();
  MenuDefRepository menuDefRepository(String appID);
  PageRepository pageRepository(String appID);
  PosSizeRepository posSizeRepository(String appID);
  ShadowRepository shadowRepository(String appID);

  void flush(String appID) {
    appBarRepository(appID).flush();
    backgroundRepository(appID).flush();
    countryRepository().flush();
    drawerRepository(appID).flush();
    fontRepository(appID).flush();
    gridViewRepository(appID).flush();
    homeMenuRepository(appID).flush();
    memberRepository().flush();
    menuDefRepository(appID).flush();
    pageRepository(appID).flush();
    posSizeRepository(appID).flush();
    shadowRepository(appID).flush();
  }
}
