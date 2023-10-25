import 'package:eliud_core/core/editor/editor_base_bloc/editor_base_bloc.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/blocking_dashboard_model.dart';
import 'package:eliud_core/model/storage_conditions_model.dart';
import 'package:eliud_core/tools/component/component_spec.dart';
import 'package:eliud_core/tools/random.dart';

import '../../model/blocking_dashboard_entity.dart';

class BlockingDashboardBloc
    extends EditorBaseBloc<BlockingDashboardModel, BlockingDashboardEntity > {

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
  BlockingDashboardModel setDefaultValues(BlockingDashboardModel t, StorageConditionsModel conditions) {
    return t.copyWith(conditions: t.conditions ?? conditions);
  }
}
