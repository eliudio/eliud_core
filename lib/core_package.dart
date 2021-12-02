import 'dart:async';

import 'package:eliud_core/model/access_model.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/component_registry.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/package/package.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_repository_singleton.dart';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'core/blocs/access/access_bloc.dart';
import 'model/abstract_repository_singleton.dart';
import 'model/repository_singleton.dart';

abstract class CorePackage extends Package {
  static final String MUST_BE_LOGGED_ON = 'MustBeLoggedOn';

  CorePackage() : super('eliud_core');

  @override
  void init() {
    ComponentRegistry().init();

    AbstractRepositorySingleton.singleton = RepositorySingleton();
    AbstractMainRepositorySingleton.singleton = MainRepositorySingleton();
  }

  @override
  Future<List<PackageConditionDetails>>? getAndSubscribe(AccessBloc accessBloc, AppModel app, MemberModel? member, bool isOwner, bool? isBlocked, PrivilegeLevel? privilegeLevel) {
    return Future.value([
      PackageConditionDetails(
          packageName: packageName,
          conditionName: MUST_BE_LOGGED_ON,
          value:  (member != null))
    ]);
  }

  @override
  List<String> retrieveAllPackageConditions() {
    return [
      MUST_BE_LOGGED_ON
    ];
  }

  @override
  List<MemberCollectionInfo> getMemberCollectionInfo() => AbstractRepositorySingleton.collections;
}
