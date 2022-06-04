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
import '../model/app_policy_repository.dart';
import '../model/app_policy_item_repository.dart';
import '../model/backend_request_repository.dart';
import '../model/body_component_repository.dart';
import '../model/decoration_color_repository.dart';
import '../model/dialog_repository.dart';
import '../model/drawer_repository.dart';
import '../model/grid_view_repository.dart';
import '../model/home_menu_repository.dart';
import '../model/member_repository.dart';
import '../model/member_dashboard_repository.dart';
import '../model/member_medium_repository.dart';
import '../model/member_medium_container_repository.dart';
import '../model/member_public_info_repository.dart';
import '../model/member_subscription_repository.dart';
import '../model/menu_def_repository.dart';
import '../model/menu_item_repository.dart';
import '../model/page_repository.dart';
import '../model/platform_medium_repository.dart';
import '../model/public_medium_repository.dart';
import 'package:eliud_core/core/blocs/access/repo/user_repository.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/package/package.dart';

AccessRepository? accessRepository({ String? appId }) => AbstractRepositorySingleton.singleton.accessRepository(appId);
AppBarRepository? appBarRepository({ String? appId }) => AbstractRepositorySingleton.singleton.appBarRepository(appId);
AppPolicyRepository? appPolicyRepository({ String? appId }) => AbstractRepositorySingleton.singleton.appPolicyRepository(appId);
BackendRequestRepository? backendRequestRepository({ String? appId }) => AbstractRepositorySingleton.singleton.backendRequestRepository(appId);
DialogRepository? dialogRepository({ String? appId }) => AbstractRepositorySingleton.singleton.dialogRepository(appId);
DrawerRepository? drawerRepository({ String? appId }) => AbstractRepositorySingleton.singleton.drawerRepository(appId);
GridViewRepository? gridViewRepository({ String? appId }) => AbstractRepositorySingleton.singleton.gridViewRepository(appId);
HomeMenuRepository? homeMenuRepository({ String? appId }) => AbstractRepositorySingleton.singleton.homeMenuRepository(appId);
MemberDashboardRepository? memberDashboardRepository({ String? appId }) => AbstractRepositorySingleton.singleton.memberDashboardRepository(appId);
MemberMediumRepository? memberMediumRepository({ String? appId }) => AbstractRepositorySingleton.singleton.memberMediumRepository(appId);
MemberPublicInfoRepository? memberPublicInfoRepository({ String? appId }) => AbstractRepositorySingleton.singleton.memberPublicInfoRepository();
MenuDefRepository? menuDefRepository({ String? appId }) => AbstractRepositorySingleton.singleton.menuDefRepository(appId);
PageRepository? pageRepository({ String? appId }) => AbstractRepositorySingleton.singleton.pageRepository(appId);
PlatformMediumRepository? platformMediumRepository({ String? appId }) => AbstractRepositorySingleton.singleton.platformMediumRepository(appId);
PublicMediumRepository? publicMediumRepository({ String? appId }) => AbstractRepositorySingleton.singleton.publicMediumRepository();

abstract class AbstractRepositorySingleton {
  static List<MemberCollectionInfo> collections = [
    MemberCollectionInfo('access', 'documentID'),
    MemberCollectionInfo('membermedium', 'authorId'),
  ];
  static late AbstractRepositorySingleton singleton;

  AccessRepository? accessRepository(String? appId);
  AppBarRepository? appBarRepository(String? appId);
  AppPolicyRepository? appPolicyRepository(String? appId);
  BackendRequestRepository? backendRequestRepository(String? appId);
  DialogRepository? dialogRepository(String? appId);
  DrawerRepository? drawerRepository(String? appId);
  GridViewRepository? gridViewRepository(String? appId);
  HomeMenuRepository? homeMenuRepository(String? appId);
  MemberDashboardRepository? memberDashboardRepository(String? appId);
  MemberMediumRepository? memberMediumRepository(String? appId);
  MemberPublicInfoRepository? memberPublicInfoRepository();
  MenuDefRepository? menuDefRepository(String? appId);
  PageRepository? pageRepository(String? appId);
  PlatformMediumRepository? platformMediumRepository(String? appId);
  PublicMediumRepository? publicMediumRepository();

  void flush(String? appId) {
    accessRepository(appId)!.flush();
    appBarRepository(appId)!.flush();
    appPolicyRepository(appId)!.flush();
    backendRequestRepository(appId)!.flush();
    dialogRepository(appId)!.flush();
    drawerRepository(appId)!.flush();
    gridViewRepository(appId)!.flush();
    homeMenuRepository(appId)!.flush();
    memberDashboardRepository(appId)!.flush();
    memberMediumRepository(appId)!.flush();
    menuDefRepository(appId)!.flush();
    pageRepository(appId)!.flush();
    platformMediumRepository(appId)!.flush();
  }
}
