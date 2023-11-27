import 'package:eliud_core_main/model/app_model.dart';
import 'package:eliud_core_main/model/page_model.dart';
import 'package:eliud_core_main/apis/style/frontend/has_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

typedef PageLayoutCallback = Function(PageLayout pageLayout);

class PageLayoutWidget extends StatefulWidget {
  final PageLayoutCallback pageLayoutCallback;
  final PageLayout pageLayout;
  final AppModel app;
  PageLayoutWidget(
      {super.key,
      required this.app,
      required this.pageLayoutCallback,
      required this.pageLayout});

  @override
  State<StatefulWidget> createState() {
    return _PageLayoutWidgetState();
  }
}

class _PageLayoutWidgetState extends State<PageLayoutWidget> {
  int? _heightTypeSelectedRadioTile;

  @override
  void initState() {
    super.initState();
    _heightTypeSelectedRadioTile = widget.pageLayout.index;
  }

  String heighttTypeLandscapeStringValue(PageLayout? pageLayout) {
    switch (pageLayout) {
      case PageLayout.listView:
        return 'List';
      case PageLayout.gridView:
        return 'Grid';
      case PageLayout.onlyTheFirstComponent:
        return 'Only first';
      case PageLayout.unknown:
        break;
      case null:
        break;
    }
    return '?';
  }

  void setSelection(int? val) {
    setState(() {
      _heightTypeSelectedRadioTile = val;
      widget.pageLayoutCallback(toPageLayout(val));
    });
  }

  Widget getPrivilegeOption(PageLayout? pageLayout) {
    if (pageLayout == null) return Text("?");
    var stringValue = heighttTypeLandscapeStringValue(pageLayout);
    return Center(
        child: radioListTile(
            widget.app,
            context,
            pageLayout.index,
            _heightTypeSelectedRadioTile,
            stringValue,
            null,
            (dynamic val) => setSelection(val)));
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      getPrivilegeOption(PageLayout.listView),
      getPrivilegeOption(PageLayout.gridView),
      getPrivilegeOption(PageLayout.onlyTheFirstComponent),
    ], shrinkWrap: true, physics: ScrollPhysics());
  }
}
