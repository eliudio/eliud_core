import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/style/frontend/has_button.dart';
import 'package:eliud_core/style/frontend/has_container.dart';
import 'package:eliud_core/style/frontend/has_dialog.dart';
import 'package:eliud_core/style/frontend/has_divider.dart';
import 'package:eliud_core/style/frontend/has_list_tile.dart';
import 'package:eliud_core/style/frontend/has_progress_indicator.dart';
import 'package:eliud_core/style/frontend/has_tabs.dart';
import 'package:eliud_core/style/frontend/has_text.dart';
import 'package:eliud_core/tools/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/widgets.dart';

typedef ListContentProvider = Widget Function(
    BuildContext context, List<dynamic> items);
typedef NoContentProvider = Widget Function(
  BuildContext context,
);
typedef ChangePrivilegeEventCallback = void Function(
    BuildContext context, int privilegeLevel);

class SelectWidget<T> extends StatefulWidget {
  final AppModel app;
  final String title;
  final String selectTitle;
  final T? currentlySelected;
  final Widget Function(dynamic item) displayItemFunction;
  final void Function(dynamic? selected) selectedCallback;
  final void Function(dynamic? selected)? updateCallback;
  final void Function(dynamic? selected)? deleteCallback;
  final VoidCallback? addCallback;
  final Widget Function(ListContentProvider contentsLoaded,
      NoContentProvider contentsNotLoaded) blocBuilder;
  final BlocProvider Function() blocProviderProvider;
  final ChangePrivilegeEventCallback? changePrivilegeEventCallback;
  final int? containerPrivilege;

  const SelectWidget(
      {Key? key,
      required this.app,
      required this.currentlySelected,
      required this.selectedCallback,
      required this.title,
      required this.selectTitle,
      required this.displayItemFunction,
      required this.blocBuilder,
      required this.blocProviderProvider,
      this.changePrivilegeEventCallback,
      this.containerPrivilege,
      this.updateCallback,
      this.deleteCallback,
      this.addCallback})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _SelectWidgetState();
}

class _SelectWidgetState extends State<SelectWidget> {
  @override
  Widget build(BuildContext context) {
    return topicContainer(
      widget.app,
      context,
      title: widget.title,
      collapsible: true,
      collapsed: true,
      children: [
        Center(
            child: widget.currentlySelected == null
                ? text(widget.app, context, 'none')
                : widget.displayItemFunction(widget.currentlySelected)),
        Row(children: [
          Spacer(),
          button(widget.app, context, label: 'Choose', onPressed: () {
            SelectDialog.openIt(
                context,
                widget.app,
                widget.selectedCallback,
                widget.updateCallback,
                widget.deleteCallback,
                widget.addCallback,
                widget.displayItemFunction,
                widget.blocBuilder,
                widget.blocProviderProvider,
                widget.selectTitle,
                widget.changePrivilegeEventCallback,
                widget.containerPrivilege);
          }),
          if (widget.updateCallback != null) Spacer(),
          if ((widget.updateCallback != null) &&
              (widget.currentlySelected != null))
            button(widget.app, context,
                label: 'Update',
                onPressed: () =>
                    widget.updateCallback!(widget.currentlySelected)),
          Spacer(),
          button(widget.app, context, label: 'Clear', onPressed: () {
            widget.selectedCallback(null);
          }),
          Spacer(),
        ]),
      ],
    );
  }
}

class SelectDialog<T> extends StatefulWidget {
  final AppModel app;
  final String selectTitle;
  final void Function(T? selected) selectedCallback;
  final void Function(dynamic? selected)? updateCallback;
  final void Function(dynamic? selected)? deleteCallback;
  final VoidCallback? addCallback;
  final Widget Function(T item) displayItemFunction;
  final Widget Function(ListContentProvider contentsLoaded,
      NoContentProvider contentsNotLoaded) blocBuilder;
  final BlocProvider Function() blocProviderProvider;
  final ChangePrivilegeEventCallback? changePrivilegeEventCallback;
  final int? containerPrivilege;

  SelectDialog._({
    required this.app,
    required this.selectedCallback,
    required this.displayItemFunction,
    required this.blocBuilder,
    required this.blocProviderProvider,
    required this.selectTitle,
    this.changePrivilegeEventCallback,
    this.containerPrivilege,
    this.updateCallback,
    this.deleteCallback,
    this.addCallback,
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SelectDialogState();
  }

  static void openIt<T>(
    BuildContext context,
    AppModel app,
    Function(dynamic? selected) selectedCallback,
    Function(dynamic? selected)? updateCallback,
    Function(dynamic? selected)? deleteCallback,
    VoidCallback? addCallback,
    Widget Function(T item) displayItemFunction,
    Widget Function(ListContentProvider contentsLoaded,
            NoContentProvider contentsNotLoaded)
        blocBuilder,
    BlocProvider Function() blocProviderProvider,
    String selectTitle,
    ChangePrivilegeEventCallback? changePrivilegeEventCallback,
    int? containerPrivilege,
  ) {
    openFlexibleDialog(app, context, app.documentID + '/_select',
        includeHeading: false,
        widthFraction: .8,
        child: SelectDialog<T>._(
          app: app,
          displayItemFunction: displayItemFunction,
          selectedCallback: selectedCallback,
          updateCallback: updateCallback,
          deleteCallback: deleteCallback,
          addCallback: addCallback,
          blocBuilder: blocBuilder,
          blocProviderProvider: blocProviderProvider,
          selectTitle: selectTitle,
          changePrivilegeEventCallback: changePrivilegeEventCallback,
          containerPrivilege: containerPrivilege,
        ));
  }
}

/*
 */

class _SelectDialogState extends State<SelectDialog>
    with TickerProviderStateMixin {
  TabController? _privilegeTabController;
  final List<String> _privilegeItems = ['No', 'L1', 'L2', 'Owner'];
  final int _initialPrivilege = 0;
  int _currentPrivilege = 0;
  late BuildContext insideContext;

  @override
  void initState() {
    if (widget.changePrivilegeEventCallback != null) {
      var _privilegeASize = _privilegeItems.length;
      _privilegeTabController =
          TabController(vsync: this, length: _privilegeASize);
      _privilegeTabController!.addListener(_handlePrivilegeTabSelection);
      _privilegeTabController!.index = _initialPrivilege;
    }

    super.initState();
  }

  @override
  void dispose() {
    if (_privilegeTabController != null) {
      _privilegeTabController!.dispose();
    }
    super.dispose();
  }

  void _handlePrivilegeTabSelection() {
    if ((_privilegeTabController != null) &&
        (_privilegeTabController!.indexIsChanging)) {
      _currentPrivilege = _privilegeTabController!.index;
      widget.changePrivilegeEventCallback!(insideContext, _currentPrivilege);
    }
  }

  @override
  Widget build(BuildContext context) {
    var app = widget.app;
    var newPrivilegeItems = <Widget>[];
    if (widget.changePrivilegeEventCallback != null) {
      var children = <Widget>[];
      var i = 0;
      for (var privilegeItem in _privilegeItems) {
        newPrivilegeItems.add(Wrap(children: [
          ((widget.containerPrivilege != null) &&
                  (i <= widget.containerPrivilege!))
              ? Icon(Icons.check)
              : Icon(Icons.close),
          Container(width: 2),
          text(widget.app, context, privilegeItem)
        ]));
        i++;
      }
    }
    return MultiBlocProvider(
        providers: [
          widget.blocProviderProvider(),
        ],
        child: ListView(shrinkWrap: true, physics: ScrollPhysics(), children: [
          HeaderWidget(
            app: widget.app,
            cancelAction: () async {
              return true;
            },
            title: widget.selectTitle,
          ),
          divider(widget.app, context),
          ListView(shrinkWrap: true, physics: ScrollPhysics(), children: [
            Container(
                height: height(),
                child: widget.blocBuilder((context, items) {
                  insideContext = context;
                  return ListView(children: [
                    if (_privilegeTabController != null)
                      tabBar2(widget.app, context,
                          items: newPrivilegeItems,
                          tabController: _privilegeTabController!),
                    Container(
                        height: 200,
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),
                            itemCount: items.length,
                            itemBuilder: (context, position) {
                              var item = items[position];
                              return getListTile(
                                context,
                                widget.app,
                                trailing:
                                    popupMenuButton<int>(widget.app, context,
                                        child: Icon(Icons.more_vert),
                                        itemBuilder: (context) => [
                                              popupMenuItem(
                                                widget.app,
                                                context,
                                                value: 1,
                                                label: 'Select',
                                              ),
                                              if (widget.updateCallback != null)
                                                popupMenuItem(
                                                  widget.app,
                                                  context,
                                                  value: 2,
                                                  label: 'Update',
                                                ),
                                              if (widget.deleteCallback != null)
                                                popupMenuItem(
                                                  widget.app,
                                                  context,
                                                  value: 3,
                                                  label: 'Delete',
                                                ),
                                            ],
                                        onSelected: (selectedValue) {
                                          if (selectedValue == 1) {
                                            widget.selectedCallback(item);
                                            Navigator.pop(context);
                                          } else if (selectedValue == 2) {
                                            widget.updateCallback!(item);
                                          } else if (selectedValue == 3) {
                                            widget.deleteCallback!(item);
                                          }
                                        }),
                                title: widget.displayItemFunction(item!),
                              );
                            })),
                  ], shrinkWrap: true, physics: const ScrollPhysics());
                },
                    (
                      context,
                    ) =>
                        progressIndicator(app, context))),
            if (widget.addCallback != null)
              Column(children: [
                divider(widget.app, context),
                Center(
                    child: iconButton(
                  widget.app,
                  context,
                  onPressed: () {
                    widget.addCallback!();
                  },
                  icon: Icon(Icons.add),
                ))
              ])
          ])
        ]));
  }

  double height() => 250; //(widget.widgetHeight / 2);
}
