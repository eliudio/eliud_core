import 'package:eliud_core/core/editor/editor_base_bloc/editor_base_bloc.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/member_dashboard_model.dart';
import 'package:eliud_core/model/storage_conditions_model.dart';
import 'package:eliud_core/tools/component/component_spec.dart';
import 'package:eliud_core/tools/random.dart';

class MemberDashboardBloc
    extends EditorBaseBloc<MemberDashboardModel> {

  MemberDashboardBloc(String appId, EditorFeedback feedback)
      : super(appId, memberDashboardRepository(appId: appId)!, feedback);

  @override
  MemberDashboardModel newInstance(StorageConditionsModel conditions) {
    return MemberDashboardModel(
      appId: appId,
      documentID: newRandomKey(),
      conditions: StorageConditionsModel(
          privilegeLevelRequired:
          PrivilegeLevelRequiredSimple.NoPrivilegeRequiredSimple),
    );
  }

  @override
  MemberDashboardModel setDefaultConditions(MemberDashboardModel t, StorageConditionsModel conditions) {
    return t.copyWith(conditions: conditions);
  }
}
