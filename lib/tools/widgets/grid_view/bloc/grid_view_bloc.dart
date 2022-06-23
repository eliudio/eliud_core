import 'package:eliud_core/core/blocs/access/state/access_determined.dart';
import 'package:eliud_core/core/blocs/access/state/access_state.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/grid_view_model.dart';
import 'package:eliud_core/model/storage_conditions_model.dart';
import 'package:eliud_core/style/frontend/has_container.dart';
import 'package:eliud_core/style/frontend/has_dialog.dart';
import 'package:eliud_core/style/frontend/has_dialog_field.dart';
import 'package:eliud_core/style/frontend/has_list_tile.dart';
import 'package:eliud_core/style/frontend/has_progress_indicator.dart';
import 'package:eliud_core/style/frontend/has_text.dart';
import 'package:eliud_core/tools/component/component_spec.dart';
import 'package:eliud_core/tools/random.dart';
import 'package:eliud_core/tools/widgets/condition_simple_widget.dart';
import 'package:eliud_core/tools/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:eliud_core/core/editor/editor_base_bloc/editor_base_bloc.dart';
import 'package:eliud_core/core/editor/editor_base_bloc/editor_base_event.dart';
import 'package:eliud_core/core/editor/editor_base_bloc/editor_base_state.dart';

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
