import 'package:eliud_core_helpers/etc/random.dart';
import 'package:eliud_core_main/apis/registryapi/component/component_spec.dart';
import 'package:eliud_core_main/editor/editor_base_bloc/editor_base_bloc.dart';
import 'package:eliud_core_main/model/abstract_repository_singleton.dart';
import 'package:eliud_core_main/model/grid_view_entity.dart';
import 'package:eliud_core_main/model/grid_view_model.dart';
import 'package:eliud_core_main/model/storage_conditions_model.dart';

class GridViewDashboardBloc
    extends EditorBaseBloc<GridViewModel, GridViewEntity> {
  GridViewDashboardBloc(String appId, EditorFeedback feedback)
      : super(appId, gridViewRepository(appId: appId)!, feedback);

  @override
  GridViewModel newInstance(StorageConditionsModel conditions) {
    return GridViewModel(
        documentID: newRandomKey(),
        appId: appId,
        name: 'Gridview 4 columns',
        type: GridViewGridType.count,
        crossAxisCount: 4,
        childAspectRatio: 1,
        padding: 4,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        scrollDirection: GridViewScrollDirection.horizontal,
        conditions: conditions);
  }

  @override
  GridViewModel setDefaultValues(
      GridViewModel t, StorageConditionsModel conditions) {
    return t.copyWith(
      name: t.name ?? 'Gridview',
      type: t.type ?? GridViewGridType.count,
      crossAxisCount: t.crossAxisCount ?? 4,
      childAspectRatio: t.childAspectRatio ?? 1,
      padding: t.padding ?? 4,
      mainAxisSpacing: t.mainAxisSpacing ?? 4,
      crossAxisSpacing: t.crossAxisSpacing ?? 4,
      scrollDirection: t.scrollDirection ?? GridViewScrollDirection.horizontal,
      appId: t.appId,
      conditions: t.conditions ?? conditions,
    );
  }
}
