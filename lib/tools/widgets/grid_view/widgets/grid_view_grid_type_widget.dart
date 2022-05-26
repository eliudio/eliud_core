import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/grid_view_model.dart';
import 'package:eliud_core/style/frontend/has_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

typedef GridViewGridTypeCallback = Function(
    GridViewGridType gridViewGridType);

class GridViewGridTypeWidget extends StatefulWidget {
  GridViewGridTypeCallback gridViewGridTypeCallback;
  final GridViewGridType gridViewGridType;
  final AppModel app;
  GridViewGridTypeWidget(
      {Key? key,
        required this.app,
        required this.gridViewGridTypeCallback,
        required this.gridViewGridType})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _GridViewGridTypeWidgetState();
  }
}

class _GridViewGridTypeWidgetState extends State<GridViewGridTypeWidget> {
  int? _heightTypeSelectedRadioTile;

  void initState() {
    super.initState();
    _heightTypeSelectedRadioTile = widget.gridViewGridType.index;
  }

  String heighttTypeLandscapeStringValue(GridViewGridType? gridViewGridType) {
    switch (gridViewGridType) {
      case GridViewGridType.Count:
        return 'Count';
      case GridViewGridType.Extent:
        return 'Extent';
    }
    return '?';
  }

  void setSelection(int? val) {
    setState(() {
      _heightTypeSelectedRadioTile = val;
      widget.gridViewGridTypeCallback(toGridViewGridType(val));
    });
  }

  Widget getPrivilegeOption(GridViewGridType? gridViewGridType) {
    if (gridViewGridType == null) return Text("?");
    var stringValue = heighttTypeLandscapeStringValue(gridViewGridType);
    return Center(
        child: radioListTile(
            widget.app,
            context,
            gridViewGridType.index,
            _heightTypeSelectedRadioTile,
            stringValue,
            null,
                (dynamic val) => setSelection(val)));
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      getPrivilegeOption(GridViewGridType.Extent),
      getPrivilegeOption(GridViewGridType.Count)
    ], shrinkWrap: true, physics: ScrollPhysics());
  }
}
