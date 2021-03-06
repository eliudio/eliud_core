import 'package:eliud_core/model/access_model.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_repository_singleton.dart';
import 'package:eliud_core/tools/query/query_tools.dart';



import 'core/access/bloc/access_event.dart';
import 'model/abstract_repository_singleton.dart';
import 'model/repository_singleton.dart';
import 'package/package_with_subscription.dart';

class CorePackage extends PackageWithSubscription {
  static final String MUST_BE_LOGGED_ON = 'MustBeLoggedOn';

  MemberModel stateMemberModel;

  void _setState(MemberModel currentMember) {
    if (stateMemberModel != currentMember) {
      stateMemberModel = currentMember;
      accessBloc.add(MemberUpdated(stateMemberModel));
    }
  }

  @override
  // The member subscription is an extra luxury to make sure member data is up to date
  // But, I'm actually unsure this subscription should happen.
  void resubscribe(AppModel app, MemberModel currentMember) {
    var appId = app.documentID;
    if (currentMember != null) {
      subscription = memberRepository(appId: appId).listenWithDetails((list) {
        if (list.isNotEmpty) {
          _setState(list.first);
        } else {
          _setState(null);
        }
      }, eliudQuery: getMemberQuery(
          appId, currentMember.documentID));
    } else {
      _setState(null);
    }
  }
  
  void unsubscribe() {
    super.unsubscribe();
    _setState(null);
  }

  static EliudQuery getMemberQuery(String appId, String memberId) {
    return EliudQuery(
        theConditions: [EliudQueryCondition(
            DocumentIdField(),
            isEqualTo: memberId
        )]
    );
  }

  @override
  void init() {
    AbstractRepositorySingleton.singleton = RepositorySingleton();
    AbstractMainRepositorySingleton.singleton = MainRepositorySingleton();
  }

  @override
  Future<bool> isConditionOk(String packageCondition, AppModel app, MemberModel member, bool isOwner, bool isBlocked, PrivilegeLevel privilegeLevel) async {
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
}
