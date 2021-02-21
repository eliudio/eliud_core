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

import '../model/access_repository.dart';
import '../model/app_repository.dart';
import '../model/app_bar_repository.dart';
import '../model/app_entry_pages_repository.dart';
import '../model/background_repository.dart';
import '../model/body_component_repository.dart';
import '../model/country_repository.dart';
import '../model/decoration_color_repository.dart';
import '../model/dialog_repository.dart';
import '../model/drawer_repository.dart';
import '../model/font_repository.dart';
import '../model/grid_view_repository.dart';
import '../model/home_menu_repository.dart';
import '../model/member_repository.dart';
import '../model/member_medium_repository.dart';
import '../model/member_subscription_repository.dart';
import '../model/menu_def_repository.dart';
import '../model/menu_item_repository.dart';
import '../model/page_repository.dart';
import '../model/pos_size_repository.dart';
import '../model/shadow_repository.dart';
import 'package:eliud_core/core/access/bloc/user_repository.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';

AccessRepository accessRepository({ String appId }) => AbstractRepositorySingleton.singleton.accessRepository(appId);
AppBarRepository appBarRepository({ String appId }) => AbstractRepositorySingleton.singleton.appBarRepository(appId);
BackgroundRepository backgroundRepository({ String appId }) => AbstractRepositorySingleton.singleton.backgroundRepository(appId);
CountryRepository countryRepository({ String appId }) => AbstractRepositorySingleton.singleton.countryRepository();
DialogRepository dialogRepository({ String appId }) => AbstractRepositorySingleton.singleton.dialogRepository(appId);
DrawerRepository drawerRepository({ String appId }) => AbstractRepositorySingleton.singleton.drawerRepository(appId);
FontRepository fontRepository({ String appId }) => AbstractRepositorySingleton.singleton.fontRepository(appId);
GridViewRepository gridViewRepository({ String appId }) => AbstractRepositorySingleton.singleton.gridViewRepository(appId);
HomeMenuRepository homeMenuRepository({ String appId }) => AbstractRepositorySingleton.singleton.homeMenuRepository(appId);
MemberMediumRepository memberMediumRepository({ String appId }) => AbstractRepositorySingleton.singleton.memberMediumRepository(appId);
MenuDefRepository menuDefRepository({ String appId }) => AbstractRepositorySingleton.singleton.menuDefRepository(appId);
PageRepository pageRepository({ String appId }) => AbstractRepositorySingleton.singleton.pageRepository(appId);
PosSizeRepository posSizeRepository({ String appId }) => AbstractRepositorySingleton.singleton.posSizeRepository(appId);
ShadowRepository shadowRepository({ String appId }) => AbstractRepositorySingleton.singleton.shadowRepository(appId);

abstract class AbstractRepositorySingleton {
  static AbstractRepositorySingleton singleton;

  AccessRepository accessRepository(String appId);
  AppBarRepository appBarRepository(String appId);
  BackgroundRepository backgroundRepository(String appId);
  CountryRepository countryRepository();
  DialogRepository dialogRepository(String appId);
  DrawerRepository drawerRepository(String appId);
  FontRepository fontRepository(String appId);
  GridViewRepository gridViewRepository(String appId);
  HomeMenuRepository homeMenuRepository(String appId);
  MemberMediumRepository memberMediumRepository(String appId);
  MenuDefRepository menuDefRepository(String appId);
  PageRepository pageRepository(String appId);
  PosSizeRepository posSizeRepository(String appId);
  ShadowRepository shadowRepository(String appId);

  void flush(String appId) {
    countryRepository().flush();
  }
}
