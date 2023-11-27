import 'package:eliud_core_helpers/helpers/parse_helper.dart';
import 'package:eliud_core_main/apis/style/frontend/has_container.dart';
import 'package:eliud_core_main/apis/style/frontend/has_dialog_field.dart';
import 'package:eliud_core_main/apis/style/frontend/has_list_tile.dart';
import 'package:eliud_core_main/model/app_model.dart';
import 'package:eliud_core_main/model/edge_insets_geometry_model.dart';
import 'package:flutter/material.dart';

class EdgeInsetsGeometryWidget extends StatefulWidget {
  final AppModel app;
  final EdgeInsetsGeometryModel edgeInsetsGeometryModel;

  EdgeInsetsGeometryWidget({
    super.key,
    required this.app,
    required this.edgeInsetsGeometryModel,
  });

  @override
  State<EdgeInsetsGeometryWidget> createState() => _EdgeInsetsGeometryState();
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
      doubleField(widget.edgeInsetsGeometryModel.top,
          (value) => widget.edgeInsetsGeometryModel.top = value, 'Top', 'Top'),
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
          valueChanged: (value) => valueChanged(doubleParse(value)),
          keyboardType: TextInputType.numberWithOptions(
            signed: false,
          ),
          decoration: InputDecoration(
            hintText: hint,
            labelText: label,
          ),
        ));
  }

  Widget inContainer(BuildContext context, String label, List<Widget> widgets) {
    return topicContainer(widget.app, context,
        title: label, collapsible: true, collapsed: true, children: widgets);
  }
}
