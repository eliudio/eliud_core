import 'package:eliud_core/core/editor/editor_base_bloc/editor_base_bloc.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/member_dashboard_model.dart';
import 'package:eliud_core/model/storage_conditions_model.dart';
import 'package:eliud_core/tools/component/component_spec.dart';
import 'package:eliud_core/tools/random.dart';

import '../../model/member_dashboard_entity.dart';

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
