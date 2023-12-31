import 'package:eliud_core_main/apis/registryapi/component/component_spec.dart';
import 'package:eliud_core_main/model/storage_conditions_model.dart';
import 'package:eliud_core_model/model/abstract_repository_singleton.dart';
import 'package:eliud_core_model/model/blocking_dashboard_entity.dart';
import 'package:eliud_core_model/model/blocking_dashboard_model.dart';
import 'package:eliud_core_helpers/etc/random.dart';
import 'package:eliud_core_main/editor/editor_base_bloc/editor_base_bloc.dart';

class BlockingDashboardBloc
    extends EditorBaseBloc<BlockingDashboardModel, BlockingDashboardEntity> {
  BlockingDashboardBloc(String appId, EditorFeedback feedback)
      : super(appId, blockingDashboardRepository(appId: appId)!, feedback);

  @override
  BlockingDashboardModel newInstance(StorageConditionsModel conditions) {
    return BlockingDashboardModel(
      appId: appId,
      documentID: newRandomKey(),
      description: 'Blocked members',
      conditions: conditions,
    );
  }

  @override
  BlockingDashboardModel setDefaultValues(
      BlockingDashboardModel t, StorageConditionsModel conditions) {
    return t.copyWith(conditions: t.conditions ?? conditions);
  }
}
