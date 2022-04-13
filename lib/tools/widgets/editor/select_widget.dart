import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/style/frontend/has_button.dart';
import 'package:eliud_core/style/frontend/has_container.dart';
import 'package:eliud_core/style/frontend/has_dialog.dart';
import 'package:eliud_core/style/frontend/has_divider.dart';
import 'package:eliud_core/style/frontend/has_list_tile.dart';
import 'package:eliud_core/style/frontend/has_progress_indicator.dart';
import 'package:eliud_core/style/frontend/has_text.dart';
import 'package:eliud_core/tools/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/widgets.dart';

typedef ListContentProvider = Widget Function(List<dynamic> items);
typedef NoContentProvider = Widget Function();

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
                widget.selectTitle);
          }),
          if (widget.updateCallback != null) Spacer(),
          if (widget.updateCallback != null)
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

  SelectDialog._({
    required this.app,
    required this.selectedCallback,
    required this.displayItemFunction,
    required this.blocBuilder,
    required this.blocProviderProvider,
    required this.selectTitle,
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
  ) {
    openFlexibleDialog(app, context, app.documentID! + '/_select',
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
        ));
  }
}

/*
 */

class _SelectDialogState extends State<SelectDialog> {
  @override
  Widget build(BuildContext context) {
    var app = widget.app;
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
                child: widget.blocBuilder((items) {
                  return ListView(children: [
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
                                trailing: PopupMenuButton<int>(
                                    child: Icon(Icons.more_vert),
                                    elevation: 10,
                                    itemBuilder: (context) => [
                                          PopupMenuItem(
                                            value: 1,
                                            child: text(
                                                widget.app, context, 'Select'),
                                          ),
                                          if (widget.updateCallback != null)
                                            PopupMenuItem(
                                              value: 2,
                                              child: text(widget.app, context,
                                                  'Update'),
                                            ),
                                          if (widget.deleteCallback != null)
                                            PopupMenuItem(
                                              value: 3,
                                              child: text(widget.app, context,
                                                  'Delete'),
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
                }, () => progressIndicator(app, context))),
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
