import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/dialog_list_bloc.dart';
import 'package:eliud_core/model/dialog_list_event.dart';
import 'package:eliud_core/model/dialog_list_state.dart';
import 'package:eliud_core/model/page_list_bloc.dart';
import 'package:eliud_core/model/page_list_event.dart';
import 'package:eliud_core/model/page_list_state.dart';
import 'package:eliud_core/style/frontend/has_button.dart';
import 'package:eliud_core/style/frontend/has_container.dart';
import 'package:eliud_core/style/frontend/has_dialog.dart';
import 'package:eliud_core/style/frontend/has_divider.dart';
import 'package:eliud_core/style/frontend/has_progress_indicator.dart';
import 'package:eliud_core/style/frontend/has_tabs.dart';
import 'package:eliud_core/style/frontend/has_text.dart';
import 'package:eliud_core/tools/action/action_model.dart';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/widgets.dart';

import '../header_widget.dart';

typedef void ActionSelected(ActionModel? action);

class SelectActionWidget extends StatefulWidget {
  final AppModel app;
  final ActionModel? action;
  final ActionSelected actionSelected;

  const SelectActionWidget(
      {Key? key,
      required this.app,
      required this.action,
      required this.actionSelected})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _SelectActionWidgetState();
}

class _SelectActionWidgetState extends State<SelectActionWidget> {
  @override
  Widget build(BuildContext context) {
    return topicContainer(
      widget.app,
      context,
      title: 'Action',
      collapsible: true,
      collapsed: true,
      children: [
        Center(
            child: text(widget.app, context,
                widget.action != null ? widget.action.toString() : 'none')),
        Row(children: [
          Spacer(),
          button(widget.app, context, label: 'Select', onPressed: () {
            SelectActionDialog.openIt(
                context, widget.app, widget.actionSelected);
          }),
          Spacer(),
          button(widget.app, context, label: 'Clear', onPressed: () {
            widget.actionSelected(null);
          }),
          Spacer(),
        ]),
      ],
    );
  }
}

class SelectActionDialog extends StatefulWidget {
  final AppModel app;
  final ActionSelected actionSelected;

  SelectActionDialog._({
    required this.app,
    required this.actionSelected,
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SelectActionDialogState();
  }

  static void openIt(
    BuildContext context,
    AppModel app,
    ActionSelected actionSelected,
  ) {
    openFlexibleDialog(app, context, app.documentID! + '/_selectaction',
        includeHeading: false,
        widthFraction: .8,
        child: SelectActionDialog._(app: app, actionSelected: actionSelected));
  }
}

class _SelectActionDialogState extends State<SelectActionDialog>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  final List<String> items = ['Pages', 'Dialogs'];
  final int active = 0;
  GlobalKey? currentVisible = GlobalKey();

  @override
  void initState() {
    var size = items.length;
    _tabController = TabController(vsync: this, length: size);
    _tabController!.addListener(_handleTabSelection);
    _tabController!.index = active;

    super.initState();
  }

  @override
  void dispose() {
    if (_tabController != null) {
      _tabController!.dispose();
    }
    super.dispose();
  }

  void _handleTabSelection() {
    if ((_tabController != null) && (_tabController!.indexIsChanging)) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    var app = widget.app;
    var appId = app.documentID!;
    return MultiBlocProvider(
        providers: [
          BlocProvider<PageListBloc>(
            create: (context) => PageListBloc(
//              eliudQuery: EliudQuery(theConditions: [EliudQueryCondition('conditions.privilegeLevelRequired', isLessThan: 100)]),
              pageRepository: pageRepository(appId: appId)!,
            )..add(LoadPageList()),
          ),
          BlocProvider<DialogListBloc>(
            create: (context) => DialogListBloc(
              dialogRepository: dialogRepository(appId: appId)!,
            )..add(LoadDialogList()),
          ),
        ],
        child: ListView(shrinkWrap: true, physics: ScrollPhysics(), children: [
          HeaderWidget(
            app: widget.app,
            cancelAction: () async {
              return true;
            },
            title: 'Select page or dialog',
          ),
          divider(widget.app, context),
          Column(children: [
            tabBar(app, context, items: items, tabController: _tabController!),
            if (_tabController!.index == 0)
              Container(
                  height: height(),
                  child: BlocBuilder<PageListBloc, PageListState>(
                      builder: (context, state) {
                    if ((state is PageListLoaded) && (state.values != null)) {
                      var pages = state.values!;
                      return ListView(children: [
                        Container(
                            height: 200,
                            child: ListView.builder(
                                shrinkWrap: true,
                                physics: const ScrollPhysics(),
                                itemCount: pages.length,
                                itemBuilder: (context, position) {
                                  var page = pages[position];
                                  return GestureDetector(
                                      child: ListTile(
                                          title: text(
                                              app, context, page!.documentID!)),
                                      onTap: () {
                                        widget.actionSelected(GotoPage(app,
                                            pageID: page.documentID!));
                                        Navigator.pop(context);
                                      });
                                })),
                      ], shrinkWrap: true, physics: const ScrollPhysics());
                    } else {
                      return progressIndicator(app, context);
                    }
                  })),
            if (_tabController!.index == 1)
              Container(
                  height: height(),
                  child: BlocBuilder<DialogListBloc, DialogListState>(
                      builder: (context, state) {
                    if ((state is DialogListLoaded) && (state.values != null)) {
                      var dialogs = state.values!;
                      return ListView(children: [
                        Container(
                            height: 200,
                            child: ListView.builder(
                                shrinkWrap: true,
                                physics: const ScrollPhysics(),
                                itemCount: dialogs.length,
                                itemBuilder: (context, position) {
                                  var dialog = dialogs[position];
                                  return GestureDetector(
                                      child: ListTile(
                                          title: text(app, context,
                                              dialog!.documentID!)),
                                      onTap: () {
                                        widget.actionSelected(OpenDialog(app,
                                            dialogID: dialog.documentID!));
                                        Navigator.pop(context);
                                      });
                                })),
                      ], shrinkWrap: true, physics: const ScrollPhysics());
                    } else {
                      return progressIndicator(app, context);
                    }
                  })),
          ])
        ]));
  }

  double height() => 250; //(widget.widgetHeight / 2);
}
