import 'package:eliud_core_model/access/access_bloc.dart';
import 'package:eliud_core_model/access/state/access_determined.dart';
import 'package:eliud_core_model/access/state/access_state.dart';
import 'package:eliud_core_model/editor/editor_base_bloc/editor_base_event.dart';
import 'package:eliud_core_model/editor/editor_base_bloc/editor_base_state.dart';
import 'package:eliud_core_model/model/app_model.dart';
import 'package:eliud_core_model/model/grid_view_model.dart';
import 'package:eliud_core_model/style/frontend/has_container.dart';
import 'package:eliud_core_model/style/frontend/has_dialog.dart';
import 'package:eliud_core_model/style/frontend/has_dialog_field.dart';
import 'package:eliud_core_model/style/frontend/has_list_tile.dart';
import 'package:eliud_core_model/style/frontend/has_progress_indicator.dart';
import 'package:eliud_core_model/style/frontend/has_text.dart';
import 'package:eliud_core_model/tools/etc/random.dart';
import 'package:eliud_core/tools/widgets/grid_view/widgets/grid_view_grid_type_widget.dart';
import 'package:eliud_core/tools/widgets/grid_view/widgets/grid_view_scroll_direction_widget.dart';
import 'package:eliud_core/tools/widgets/grid_view/widgets/max_cross_axis_extent_type_widget.dart';
import 'package:eliud_core_model/tools/helpers/parse_helper.dart';
import 'package:eliud_core_model/widgets/helper_widgets/condition_simple_widget.dart';
import 'package:eliud_core_model/widgets/helper_widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/grid_view_bloc.dart';

class GridViewDashboard {
  static void updateGridView(AppModel app, BuildContext context, model) {
    _openIt(app, context, false, model.copyWith());
  }

  static void deleteGridView(AppModel app, BuildContext context, model) {
    // ask for confirmation. Very dangerous
  }

  static void addGridView(AppModel app, BuildContext context) {
    _openIt(
      app,
      context,
      true,
      GridViewModel(
        appId: app.documentID,
        documentID: newRandomKey(),
      ),
    );
  }

  static void _openIt(
      AppModel app, BuildContext context, bool create, GridViewModel model) {
    openComplexDialog(
      app,
      context,
      '${app.documentID}/gridView',
      title: create ? 'Create GridView' : 'Update GridView',
      includeHeading: false,
      widthFraction: .9,
      child: BlocProvider<GridViewDashboardBloc>(
          create: (context) => GridViewDashboardBloc(
                app.documentID,
                (_, __) {},
              )..add(EditorBaseInitialise<GridViewModel>(model)),
          child: GridViewDashboardWidget(
            app: app,
          )),
    );
  }
}

class GridViewDashboardWidget extends StatefulWidget {
  final AppModel app;

  const GridViewDashboardWidget({
    super.key,
    required this.app,
  });

  @override
  State<StatefulWidget> createState() => _GridViewDashboardWidgetState();
}

class _GridViewDashboardWidgetState extends State<GridViewDashboardWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccessBloc, AccessState>(
        builder: (aContext, accessState) {
      if (accessState is AccessDetermined) {
        return BlocBuilder<GridViewDashboardBloc,
                EditorBaseState<GridViewModel>>(
            builder: (ppContext, gridViewState) {
          if (gridViewState is EditorBaseInitialised<GridViewModel>) {
            return ListView(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                children: [
                  HeaderWidget(
                    app: widget.app,
                    title: 'GridView',
                    okAction: () async {
                      await BlocProvider.of<GridViewDashboardBloc>(context)
                          .save(EditorBaseApplyChanges<GridViewModel>(
                              model: gridViewState.model));
                      return true;
                    },
                    cancelAction: () async {
                      return true;
                    },
                  ),
                  topicContainer(widget.app, context,
                      title: 'General',
                      collapsible: true,
                      collapsed: true,
                      children: [
                        getListTile(context, widget.app,
                            leading: Icon(Icons.vpn_key),
                            title: text(widget.app, context,
                                gridViewState.model.documentID)),
                        getListTile(context, widget.app,
                            leading: Icon(Icons.description),
                            title: dialogField(
                              widget.app,
                              context,
                              initialValue: gridViewState.model.name,
                              valueChanged: (value) {
                                gridViewState.model.name = value;
                              },
                              maxLines: 1,
                              decoration: const InputDecoration(
                                hintText: 'Name',
                                labelText: 'Name',
                              ),
                            )),
                      ]),
                  topicContainer(widget.app, context,
                      title: 'Grid specifications',
                      collapsible: true,
                      collapsed: true,
                      children: [
                        topicContainer(widget.app, context,
                            title: 'Scroll direction',
                            collapsible: true,
                            collapsed: true,
                            children: [
                              GridViewScrollDirectionWidget(
                                app: widget.app,
                                gridViewScrollDirection:
                                    gridViewState.model.scrollDirection ??
                                        GridViewScrollDirection.vertical,
                                gridViewScrollDirectionCallback:
                                    (GridViewScrollDirection
                                        gridViewScrollDirection) {
                                  setState(() {
                                    gridViewState.model.scrollDirection =
                                        gridViewScrollDirection;
                                  });
                                },
                              ),
                            ]),
                        topicContainer(widget.app, context,
                            title: 'Grid type',
                            collapsible: true,
                            collapsed: true,
                            children: [
                              GridViewGridTypeWidget(
                                app: widget.app,
                                gridViewGridType: gridViewState.model.type ??
                                    GridViewGridType.extent,
                                gridViewGridTypeCallback:
                                    (GridViewGridType gridViewGridType) {
                                  setState(() {
                                    gridViewState.model.type = gridViewGridType;
                                  });
                                },
                              ),
                            ]),
                        topicContainer(widget.app, context,
                            title: 'Max Cross Axis Extent Type',
                            collapsible: true,
                            collapsed: true,
                            children: [
                              MaxCrossAxisExtentTypeWidget(
                                app: widget.app,
                                maxCrossAxisExtentType: gridViewState
                                        .model.maxCrossAxisExtentType ??
                                    MaxCrossAxisExtentType.absolute,
                                maxCrossAxisExtentTypeCallback:
                                    (MaxCrossAxisExtentType
                                        maxCrossAxisExtentType) {
                                  setState(() {
                                    gridViewState.model.maxCrossAxisExtentType =
                                        maxCrossAxisExtentType;
                                  });
                                },
                              ),
                            ]),
                        topicContainer(widget.app, context,
                            title: 'Other grid specifications',
                            collapsible: true,
                            collapsed: true,
                            children: [
                              getListTile(context, widget.app,
                                  leading: Icon(Icons.description),
                                  title: dialogField(
                                    widget.app,
                                    context,
                                    initialValue: gridViewState
                                        .model.crossAxisCount
                                        .toString(),
                                    valueChanged: (value) {
                                      gridViewState.model.crossAxisCount =
                                          intParse(value);
                                    },
                                    maxLines: 1,
                                    decoration: const InputDecoration(
                                      labelText: 'Cross Axis Count',
                                      hintText:
                                          'Amount of components cross axis',
                                    ),
                                  )),
                              if (gridViewState.model.maxCrossAxisExtentType ==
                                  MaxCrossAxisExtentType.absolute)
                                getListTile(context, widget.app,
                                    leading: Icon(Icons.description),
                                    title: dialogField(
                                      widget.app,
                                      context,
                                      initialValue: gridViewState
                                          .model.absoluteMaxCrossAxisExtent
                                          .toString(),
                                      valueChanged: (value) {
                                        gridViewState.model
                                                .absoluteMaxCrossAxisExtent =
                                            doubleParse(value);
                                      },
                                      maxLines: 1,
                                      decoration: const InputDecoration(
                                        hintText: 'MaxCrossAxisExtent',
                                        labelText: 'Max Cross Axis Extent',
                                      ),
                                    )),
                              if (gridViewState.model.maxCrossAxisExtentType ==
                                  MaxCrossAxisExtentType.relative)
                                getListTile(context, widget.app,
                                    leading: Icon(Icons.description),
                                    title: dialogField(
                                      widget.app,
                                      context,
                                      initialValue: gridViewState
                                          .model.relativeMaxCrossAxisExtent
                                          .toString(),
                                      valueChanged: (value) {
                                        gridViewState.model
                                                .relativeMaxCrossAxisExtent =
                                            doubleParse(value);
                                      },
                                      maxLines: 1,
                                      decoration: const InputDecoration(
                                        hintText: 'MaxCrossAxisExtent',
                                        labelText: 'Max Cross Axis Extent',
                                      ),
                                    )),
                              getListTile(context, widget.app,
                                  leading: Icon(Icons.description),
                                  title: dialogField(
                                    widget.app,
                                    context,
                                    initialValue: gridViewState
                                        .model.childAspectRatio
                                        .toString(),
                                    valueChanged: (value) {
                                      gridViewState.model.childAspectRatio =
                                          doubleParse(value);
                                    },
                                    maxLines: 1,
                                    decoration: const InputDecoration(
                                      labelText: 'Child Aspect Ratio',
                                      hintText: 'Child Aspect Ratio',
                                    ),
                                  )),
                              getListTile(context, widget.app,
                                  leading: Icon(Icons.description),
                                  title: dialogField(
                                    widget.app,
                                    context,
                                    initialValue: gridViewState
                                        .model.crossAxisSpacing
                                        .toString(),
                                    valueChanged: (value) {
                                      gridViewState.model.padding =
                                          doubleParse(value);
                                    },
                                    maxLines: 1,
                                    decoration: const InputDecoration(
                                      labelText: 'Padding',
                                      hintText: 'Padding',
                                    ),
                                  )),
                              getListTile(context, widget.app,
                                  leading: Icon(Icons.description),
                                  title: dialogField(
                                    widget.app,
                                    context,
                                    initialValue: gridViewState
                                        .model.mainAxisSpacing
                                        .toString(),
                                    valueChanged: (value) {
                                      gridViewState.model.mainAxisSpacing =
                                          doubleParse(value);
                                    },
                                    maxLines: 1,
                                    decoration: const InputDecoration(
                                      labelText: 'Main Axis Spacing',
                                      hintText: 'Main Axis Spacing',
                                    ),
                                  )),
                              getListTile(context, widget.app,
                                  leading: Icon(Icons.description),
                                  title: dialogField(
                                    widget.app,
                                    context,
                                    initialValue: gridViewState
                                        .model.crossAxisSpacing
                                        .toString(),
                                    valueChanged: (value) {
                                      gridViewState.model.crossAxisSpacing =
                                          doubleParse(value);
                                    },
                                    maxLines: 1,
                                    decoration: const InputDecoration(
                                      labelText: 'Cross Axis Spacing',
                                      hintText: 'Cross Axis Spacing',
                                    ),
                                  )),
                            ]),
                      ]),
                  topicContainer(widget.app, context,
                      title: 'Condition',
                      collapsible: true,
                      collapsed: true,
                      children: [
                        getListTile(context, widget.app,
                            leading: Icon(Icons.security),
                            title: ConditionsSimpleWidget(
                              app: widget.app,
                              value: gridViewState.model.conditions!,
                            )),
                      ]),
                ]);
          } else {
            return progressIndicator(widget.app, context);
          }
        });
      } else {
        return progressIndicator(widget.app, context);
      }
    });
  }
}
