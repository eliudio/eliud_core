import 'dart:async';

import 'package:eliud_core/model/access_model.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/component_registry.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/package/package.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_repository_singleton.dart';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'model/abstract_repository_singleton.dart';
import 'model/repository_singleton.dart';

abstract class CorePackage extends Package {
  static final String MUST_BE_LOGGED_ON = 'MustBeLoggedOn';

  MemberModel? stateMemberModel;
  late StreamSubscription<List<MemberModel?>> subscription;

  CorePackage() : super('eliud_core');

  void _setState(MemberModel? currentMember) {
    if (stateMemberModel != currentMember) {
      stateMemberModel = currentMember;
    }
  }

  // The member subscription is an extra luxury to make sure member data is up to date
  // But, I'm actually unsure this subscription should happen.
  void resubscribe(AppModel app, MemberModel? currentMember) {
    var appId = app.documentID;
    if (currentMember != null) {
      subscription = memberRepository(appId: appId)!.listenWithDetails((list) {
        if (list.isNotEmpty) {
          _setState(list.first);
        } else {
          _setState(null);
        }
      }, eliudQuery: getMemberQuery(
          appId, currentMember.documentID));
    }
  }

  static EliudQuery getMemberQuery(String? appId, String? memberId) {
    return EliudQuery(
        theConditions: [EliudQueryCondition(
            DocumentIdField(),
            isEqualTo: memberId
        )]
    );
  }

  @override
  void init() {
    ComponentRegistry().init();

    AbstractRepositorySingleton.singleton = RepositorySingleton();
    AbstractMainRepositorySingleton.singleton = MainRepositorySingleton();
  }

  @override
  Future<bool?> isConditionOk(String packageCondition, AppModel app, MemberModel? member, bool isOwner, bool? isBlocked, PrivilegeLevel? privilegeLevel) async {
    if (packageCondition == MUST_BE_LOGGED_ON) {
      return (member != null);
    }
    return null;
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
