import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/grid_view_list_bloc.dart';
import 'package:eliud_core/model/grid_view_list_event.dart';
import 'package:eliud_core/model/grid_view_list_state.dart';
import 'package:eliud_core/model/grid_view_model.dart';
import 'package:eliud_core/model/storage_conditions_model.dart';
import 'package:eliud_core/style/frontend/has_text.dart';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/tools/widgets/editor/select_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'grid_view_dashboard.dart';

Widget selectGridViewWidget(
    BuildContext context,
    AppModel app,
    StorageConditionsModel? containerStorageConditions,
    GridViewModel? gridView,
    Function(dynamic selected) selectedCallback) {
  return SelectWidget<GridViewModel>(
    app: app,
    currentlySelected: gridView,
    title: 'GridView',
    selectTitle: 'Select gridView',
    displayItemFunction: (item) =>
        text(app, context, item.documentID + ' - ' + (item.name ?? '?')),
    blocProviderProvider: () => BlocProvider<GridViewListBloc>(
      create: (context) => GridViewListBloc(
        eliudQuery: getComponentSelectorQuery(0, app.documentID),
        gridViewRepository: gridViewRepository(appId: app.documentID)!,
      )..add(LoadGridViewList()),
    ),
    blocBuilder: (contentsLoaded, contentsNotLoaded) {
      return BlocBuilder<GridViewListBloc, GridViewListState>(
          builder: (context, state) {
        if ((state is GridViewListLoaded) && (state.values != null)) {
          return contentsLoaded(context, state.values!);
        } else {
          return contentsNotLoaded(
            context,
          );
        }
      });
    },
    containerPrivilege: containerStorageConditions == null ||
        containerStorageConditions.privilegeLevelRequired == null
        ? 0
        : containerStorageConditions.privilegeLevelRequired!.index,
    selectedCallback: selectedCallback,
    addCallback: () => GridViewDashboard.addGridView(app, context),
    deleteCallback: null,
    updateCallback: (item) =>
        GridViewDashboard.updateGridView(app, context, item),
    changePrivilegeEventCallback: (BuildContext context, int privilegeLevel) {
      BlocProvider.of<GridViewListBloc>(context).add(GridViewChangeQuery(
          newQuery:
              getComponentSelectorQuery(privilegeLevel, app.documentID)));
    },
  );
}
