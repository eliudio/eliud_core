import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/grid_view_model.dart';
import 'package:eliud_core/style/frontend/has_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

typedef GridViewScrollDirectionCallback = Function(
    GridViewScrollDirection gridViewScrollDirection);

class GridViewScrollDirectionWidget extends StatefulWidget {
  GridViewScrollDirectionCallback gridViewScrollDirectionCallback;
  final GridViewScrollDirection gridViewScrollDirection;
  final AppModel app;
  GridViewScrollDirectionWidget(
      {Key? key,
        required this.app,
        required this.gridViewScrollDirectionCallback,
        required this.gridViewScrollDirection})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _GridViewScrollDirectionWidgetState();
  }
}

class _GridViewScrollDirectionWidgetState extends State<GridViewScrollDirectionWidget> {
  int? _heightTypeSelectedRadioTile;

  void initState() {
    super.initState();
    _heightTypeSelectedRadioTile = widget.gridViewScrollDirection.index;
  }

  String heighttTypeLandscapeStringValue(GridViewScrollDirection? gridViewScrollDirection) {
    switch (gridViewScrollDirection) {
      case GridViewScrollDirection.Vertical:
        return 'Vertical';
      case GridViewScrollDirection.Horizontal:
        return 'Horizontal';
    }
    return '?';
  }

  void setSelection(int? val) {
    setState(() {
      _heightTypeSelectedRadioTile = val;
      widget.gridViewScrollDirectionCallback(toGridViewScrollDirection(val));
    });
  }

  Widget getPrivilegeOption(GridViewScrollDirection? gridViewScrollDirection) {
    if (gridViewScrollDirection == null) return Text("?");
    var stringValue = heighttTypeLandscapeStringValue(gridViewScrollDirection);
    return Center(
        child: radioListTile(
            widget.app,
            context,
            gridViewScrollDirection.index,
            _heightTypeSelectedRadioTile,
            stringValue,
            null,
                (dynamic val) => setSelection(val)));
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      getPrivilegeOption(GridViewScrollDirection.Horizontal),
      getPrivilegeOption(GridViewScrollDirection.Vertical)
    ], shrinkWrap: true, physics: ScrollPhysics());
  }
}
