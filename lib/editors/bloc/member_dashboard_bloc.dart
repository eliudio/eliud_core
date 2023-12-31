import 'package:eliud_core_main/apis/registryapi/component/component_spec.dart';
import 'package:eliud_core_main/model/storage_conditions_model.dart';
import 'package:eliud_core_model/model/abstract_repository_singleton.dart';
import 'package:eliud_core_model/model/member_dashboard_entity.dart';
import 'package:eliud_core_model/model/member_dashboard_model.dart';
import 'package:eliud_core_helpers/etc/random.dart';
import 'package:eliud_core_main/editor/editor_base_bloc/editor_base_bloc.dart';

class MemberDashboardBloc
    extends EditorBaseBloc<MemberDashboardModel, MemberDashboardEntity> {
  MemberDashboardBloc(String appId, EditorFeedback feedback)
      : super(appId, memberDashboardRepository(appId: appId)!, feedback);

  @override
  MemberDashboardModel newInstance(StorageConditionsModel conditions) {
    return MemberDashboardModel(
      appId: appId,
      documentID: newRandomKey(),
      description: 'Member dashboard',
      conditions: conditions,
    );
  }

  @override
  MemberDashboardModel setDefaultValues(
      MemberDashboardModel t, StorageConditionsModel conditions) {
    return t.copyWith(conditions: t.conditions ?? conditions);
  }
}
