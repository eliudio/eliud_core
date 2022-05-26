import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/style/frontend/has_container.dart';
import 'package:eliud_core/style/frontend/has_dialog_field.dart';
import 'package:eliud_core/style/frontend/has_list_tile.dart';
import 'package:flutter/material.dart';

import '../../../model/edge_insets_geometry_model.dart';
import '../../helpers/parse_helper.dart';

class EdgeInsetsGeometryWidget extends StatefulWidget {
  final AppModel app;
  EdgeInsetsGeometryModel edgeInsetsGeometryModel;

  EdgeInsetsGeometryWidget({
    Key? key,
    required this.app,
    required this.edgeInsetsGeometryModel,
  }) : super(key: key);

  @override
  _EdgeInsetsGeometryState createState() => _EdgeInsetsGeometryState();
}

class _EdgeInsetsGeometryState extends State<EdgeInsetsGeometryWidget> {
  @override
  Widget build(BuildContext context) {
    return inContainer(context, 'Parameters', [
      doubleField(
          widget.edgeInsetsGeometryModel.left,
              (value) => widget.edgeInsetsGeometryModel.left = value,
          'Left',
          'Left'),
      doubleField(
          widget.edgeInsetsGeometryModel.right,
              (value) => widget.edgeInsetsGeometryModel.right = value,
          'Right',
          'Right'),
      doubleField(
          widget.edgeInsetsGeometryModel.top,
              (value) => widget.edgeInsetsGeometryModel.top = value,
          'Top',
          'Top'),
      doubleField(
          widget.edgeInsetsGeometryModel.bottom,
              (value) => widget.edgeInsetsGeometryModel.bottom = value,
          'Bottom',
          'Bottom'),
          ]);
  }

  Widget doubleField(double? initialValue, ValueChanged<double> valueChanged,
      String hint, String label) {
    return getListTile(context, widget.app,
        leading: Icon(Icons.description),
        title: dialogField(
          widget.app,
          context,
          initialValue: (initialValue ?? 0).toString(),
          valueChanged: (value) => valueChanged(double_parse(value)),
          keyboardType: TextInputType.numberWithOptions(signed: false, ),
          decoration: InputDecoration(
            hintText: hint,
            labelText: label,
          ),
        ));
  }

  Widget inContainer(BuildContext context, String label, List<Widget> widgets) {
    return topicContainer(widget.app, context,
        title: label,
        collapsible: true,
        collapsed: true,
        children: widgets);
  }

}
