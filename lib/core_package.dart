import 'dart:async';

import 'package:eliud_core/model/access_model.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/component_registry.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/package/package.dart';
import 'package:eliud_core/style/_default/default_style_family.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_repository_singleton.dart';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/wizards/blocking_dashboard_dialog_wizard.dart';
import 'package:eliud_core/wizards/login_logout_wizard.dart';
import 'package:eliud_core/wizards/member_dashboard_dialog_wizard.dart';
import 'core/blocs/access/access_bloc.dart';
import 'core/blocs/access/access_event.dart';
import 'core/wizards/registry/registry.dart';
import 'eliud.dart';
import 'model/abstract_repository_singleton.dart';
import 'model/repository_singleton.dart';

import 'core_package_stub.dart'
    if (dart.library.io) 'core_mobile_package.dart'
    if (dart.library.html) 'core_web_package.dart';

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
    ComponentRegistry().init();

    // wizards
    NewAppWizardRegistry.registry().register(MemberDashboardDialogWizard());
    NewAppWizardRegistry.registry().register(BlockingDashboardDialogWizard());
    NewAppWizardRegistry.registry().register(LoginWizard());
    NewAppWizardRegistry.registry().register(LogoutWizard());

    AbstractRepositorySingleton.singleton = RepositorySingleton();
    AbstractMainRepositorySingleton.singleton = MainRepositorySingleton();

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
