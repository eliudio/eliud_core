import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/page_model.dart';
import 'package:eliud_core/style/frontend/has_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

typedef PageLayoutCallback = Function(
    PageLayout pageLayout);

class PageLayoutWidget extends StatefulWidget {
  PageLayoutCallback pageLayoutCallback;
  final PageLayout pageLayout;
  final AppModel app;
  PageLayoutWidget(
      {Key? key,
        required this.app,
        required this.pageLayoutCallback,
        required this.pageLayout})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _PageLayoutWidgetState();
  }
}

class _PageLayoutWidgetState extends State<PageLayoutWidget> {
  int? _heightTypeSelectedRadioTile;

  void initState() {
    super.initState();
    _heightTypeSelectedRadioTile = widget.pageLayout.index;
  }

  String heighttTypeLandscapeStringValue(PageLayout? pageLayout) {
    switch (pageLayout) {
      case PageLayout.ListView:
        return 'List';
      case PageLayout.GridView:
        return 'Grid';
      case PageLayout.OnlyTheFirstComponent:
        return 'Only first';
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
      getPrivilegeOption(PageLayout.ListView),
      getPrivilegeOption(PageLayout.GridView),
      getPrivilegeOption(PageLayout.OnlyTheFirstComponent),
    ], shrinkWrap: true, physics: ScrollPhysics());
  }
}
