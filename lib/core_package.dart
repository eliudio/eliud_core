import 'dart:async';

import 'package:eliud_core/editors/blocking_dashboard_component_editor.dart';
import 'package:eliud_core/editors/member_dashboard_component_editor.dart';
import 'package:eliud_core/extensions/blocking_dashboard_component.dart';
import 'package:eliud_core/extensions/member_dashboard_component.dart';
import 'package:eliud_core/registry_api_impl.dart';
import 'package:eliud_core_helpers/query/query_tools.dart';
import 'package:eliud_core/access/access_bloc.dart';
import 'package:eliud_core_main/apis/apis.dart';
import 'package:eliud_core_model/model/abstract_repository_singleton.dart';
import 'package:eliud_core_model/model/access_model.dart';
import 'package:eliud_core_main/model/app_model.dart';
import 'package:eliud_core_model/model/component_registry.dart';
import 'package:eliud_core_main/model/member_model.dart';
import 'package:eliud_core_model/model/repository_singleton.dart';
import 'package:eliud_core_main/apis/style/_default/default_style_family.dart';
import 'package:eliud_core_main/apis/style/style_registry.dart';
import 'package:eliud_core/wizards/blocking_dashboard_dialog_wizard.dart';
import 'package:eliud_core/wizards/login_logout_wizard.dart';
import 'package:eliud_core/wizards/member_dashboard_dialog_wizard.dart';
import 'package:eliud_core_main/tools/main_abstract_repository_singleton.dart'
  as toolmainrepo;
import 'package:eliud_core_main/tools/main_repository_singleton.dart'
    as toolmainrepoimpl;
import 'package:eliud_core_main/model/abstract_repository_singleton.dart'
  as otherrepo;
import 'package:eliud_core_main/model/repository_singleton.dart'
  as otherrepoimpl;
import 'package:eliud_core_main/tools/etc/member_collection_info.dart';
import 'package:eliud_core_main/wizards/registry/wizard_api_impl.dart';
import 'package:eliud_core_main/apis/action_api/actions/action_model_api_impl.dart';

import 'access/access_event.dart';
import 'core/navigate/router_api_impl.dart';
import 'core_api_impl.dart';

import 'core_package_stub.dart'
    if (dart.library.io) 'core_mobile_package.dart'
    if (dart.library.html) 'core_web_package.dart';
import 'eliud.dart';
import 'package/package.dart';

class PrivilegeInfo {
  final PrivilegeLevel privilege;
  final bool blocked;

  PrivilegeInfo(this.privilege, this.blocked);

  List<Object?> get props => [privilege, blocked];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PrivilegeInfo &&
          privilege == other.privilege &&
          blocked == other.blocked &&
          runtimeType == other.runtimeType;

  @override
  int get hashCode => blocked.hashCode ^ privilege.hashCode;
}

abstract class CorePackage extends Package {
  static final String mustBeLoggedIn = 'MustBeLoggedOn';

  CorePackage() : super('eliud_core');

  final Map<String, StreamSubscription<AccessModel?>> subscription = {};
  final Map<String, PrivilegeInfo?> statePRIVILEGE = {};

  /*
   * Register depending packages
   */
  @override
  void registerDependencies(Eliud eliud) {}

  @override
  void init() {
    // Register the apis this package implements
    Apis.apis().registerCoreApi(CoreApiImpl());
    Apis.apis().registerRegistryApi(RegistryApiImpl());
    Apis.apis().registerRouterApi(RouterApiImpl());
    Apis.apis().registerActionModelApi(ActionModelApiImpl());
    Apis.apis().registerWizardApi(WizardApiImpl());

    // Register the components this package implements
    ComponentRegistry().init(
      BlockingDashboardComponentConstructorDefault(),
      BlockingDashboardComponentEditorConstructor(),
      MemberDashboardComponentConstructorDefault(),
      MemberDashboardComponentEditorConstructor(),
    );

    // Register the wizards this package implements
    Apis.apis().getWizardApi().register(MemberDashboardDialogWizard());
    Apis.apis().getWizardApi().register(BlockingDashboardDialogWizard());
    Apis.apis().getWizardApi().register(LoginWizard());
    Apis.apis().getWizardApi().register(LogoutWizard());

    // Initialise the repositories of this package
    AbstractRepositorySingleton.singleton = RepositorySingleton();
    toolmainrepo.AbstractMainRepositorySingleton.singleton =
        toolmainrepoimpl.MainRepositorySingleton();

    otherrepo.AbstractRepositorySingleton.singleton = otherrepoimpl.RepositorySingleton();

    // Register the styles this package implements
    StyleRegistry.registry().registerStyleFamily(DefaultStyleFamily.instance());
  }

  @override
  Future<List<PackageConditionDetails>>? getAndSubscribe(
      AccessBloc accessBloc,
      AppModel app,
      MemberModel? member,
      bool isOwner,
      bool? isBlocked,
      PrivilegeLevel? privilegeLevel) {
    var appId = app.documentID;
    subscription[appId]?.cancel();
    if (member != null) {
      final c = Completer<List<PackageConditionDetails>>();
      subscription[appId] =
          accessRepository(appId: appId)!.listenTo(member.documentID, (value) {
        if (value != null) {
          var newPrivilegeInfo = PrivilegeInfo(
              value.privilegeLevel ?? PrivilegeLevel.noPrivilege,
              value.blocked ?? false);
          if (!c.isCompleted) {
            // the first time we ignore because a) privilege is handled by the calling mechanism b) the condition itself is determined below
            statePRIVILEGE[appId] = newPrivilegeInfo;
          } else {
            // subsequent calls we get this trigger, it's when the date has changed. Now add the event to the bloc
            if (newPrivilegeInfo != statePRIVILEGE[appId]) {
              statePRIVILEGE[appId] = newPrivilegeInfo;
              accessBloc.add(PrivilegeChangedEvent(
                  app, newPrivilegeInfo.privilege, newPrivilegeInfo.blocked));
            }
          }
        }
      });
    } else {
      statePRIVILEGE[appId] = null;
    }
    return Future.value([
      PackageConditionDetails(
          packageName: packageName,
          conditionName: mustBeLoggedIn,
          value: (member != null))
    ]);
  }

/*  @override
  Future<List<PackageConditionDetails>>? getAndSubscribe(AccessBloc accessBloc, AppModel app, MemberModel? member, bool isOwner, bool? isBlocked, PrivilegeLevel? privilegeLevel) {
    return Future.value([
      PackageConditionDetails(
          packageName: packageName,
          conditionName: MUST_BE_LOGGED_ON,
          value:  (member != null))
    ]);
  }*/

  static EliudQuery getMemberAccessQuery(String? appId, String? memberId) {
    return EliudQuery(theConditions: [
      EliudQueryCondition(DocumentIdField(), isEqualTo: memberId)
    ]);
  }

  @override
  List<String> retrieveAllPackageConditions() {
    return [mustBeLoggedIn];
  }

  @override
  List<MemberCollectionInfo> getMemberCollectionInfo() =>
      AbstractRepositorySingleton.collections;

  static CorePackage instance() => getCorePackage();
}
