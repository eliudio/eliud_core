import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/grid_view_model.dart';
import 'package:eliud_core/model/storage_conditions_model.dart';
import 'package:eliud_core/tools/component/component_spec.dart';
import 'package:eliud_core/tools/random.dart';

import 'package:eliud_core/core/editor/editor_base_bloc/editor_base_bloc.dart';

import '../../../../model/grid_view_entity.dart';

class GridViewDashboardBloc extends EditorBaseBloc<GridViewModel, GridViewEntity> {
  GridViewDashboardBloc(String appId, EditorFeedback feedback)
      : super(appId, gridViewRepository(appId: appId)!, feedback);

  @override
  GridViewModel newInstance(StorageConditionsModel conditions) {
    return GridViewModel(
        documentID: newRandomKey(),
        appId: appId,
        name: 'Gridview 4 columns',
        type: GridViewGridType.Count,
        crossAxisCount: 4,
        childAspectRatio: 1,
        padding: 4,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        scrollDirection: GridViewScrollDirection.Horizontal,
        conditions: conditions);
  }

  @override
  GridViewModel setDefaultValues(
      GridViewModel t, StorageConditionsModel conditions) {
    return t.copyWith(
      name: t.name ?? 'Gridview',
      type: t.type ?? GridViewGridType.Count,
      crossAxisCount: t.crossAxisCount ?? 4,
      childAspectRatio: t.childAspectRatio ?? 1,
      padding: t.padding ?? 4,
      mainAxisSpacing: t.mainAxisSpacing ?? 4,
      crossAxisSpacing: t.crossAxisSpacing ?? 4,
      scrollDirection: t.scrollDirection ?? GridViewScrollDirection.Horizontal,
      appId: t.appId,
      conditions: t.conditions ?? conditions,
    );
  }
}
