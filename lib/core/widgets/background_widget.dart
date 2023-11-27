import 'package:eliud_core_helpers/helpers/parse_helper.dart';
import 'package:eliud_core_main/apis/style/frontend/has_container.dart';
import 'package:eliud_core_main/apis/style/frontend/has_dialog_field.dart';
import 'package:eliud_core_main/model/app_model.dart';
import 'package:eliud_core_main/model/background_model.dart';
import 'package:eliud_core_main/model/border_radius_model.dart';
import 'package:eliud_core_main/model/decoration_color_model.dart';
import 'package:eliud_core_main/model/edge_insets_geometry_model.dart';
import 'package:eliud_core_main/apis/style/frontend/has_list_tile.dart';
import 'package:flutter/material.dart';

import 'background_widgets/border_radius_widget.dart';
import 'background_widgets/decoration_color_list_widget.dart';
import 'background_widgets/edge_insets_geometry_widget.dart';
import 'background_widgets/gradient_position_widget.dart';
import 'background_widgets/image_widget.dart';
import 'background_widgets/shadow_widget.dart';

class BackgroundWidget extends StatefulWidget {
  final AppModel app;
  final BackgroundModel value;
  final String label;
  final String memberId;
  final bool withTopicContainer;

  BackgroundWidget({
    super.key,
    required this.app,
    required this.label,
    required this.value,
    required this.memberId,
    this.withTopicContainer = true,
  });

  @override
  State<BackgroundWidget> createState() => _BackgroundWidgetWidgetState();
}

class _BackgroundWidgetWidgetState extends State<BackgroundWidget> {
  @override
  void initState() {
    widget.value.decorationColors ??= [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.withTopicContainer) {
      return topicContainer(widget.app, context,
          title: widget.label,
          collapsible: true,
          collapsed: true,
          children: children());
    } else {
      return ListView(
          shrinkWrap: true, physics: ScrollPhysics(), children: children());
    }
  }

  List<Widget> children() {
    return [
      ImageWidget(
        app: widget.app,
        label: 'Background image',
        ownerId: widget.memberId,
        backgroundModel: widget.value,
      ),
      GradientPositionWidget(
        app: widget.app,
        groupValue: 0,
        label: 'Begin Gradient Position',
        value: widget.value.beginGradientPosition != null
            ? widget.value.beginGradientPosition!.index
            : 0,
        gradientPositionChanged: _setBeginGradientPosition,
      ),
      GradientPositionWidget(
        app: widget.app,
        groupValue: 1,
        label: 'End Gradient Position',
        value: widget.value.endGradientPosition != null
            ? widget.value.endGradientPosition!.index
            : 0,
        gradientPositionChanged: _setEndGradientPosition,
      ),
      DecorationColorListWidget(
        app: widget.app,
        label: 'Decoration colors',
        colorListChanged: _setColorListChanged,
        colors: widget.value.decorationColors!,
      ),
      topicContainer(widget.app, context,
          title: 'Border',
          collapsible: true,
          collapsed: true,
          children: [
            checkboxListTile(widget.app, context, 'With border',
                widget.value.border ?? false, _borderChanged),
          ]),
      topicContainer(widget.app, context,
          title: 'Border radius',
          collapsible: true,
          collapsed: true,
          children: [
            checkboxListTile(widget.app, context, 'With Border Radius',
                widget.value.borderRadius != null, (value) {
              setState(() {
                if (value!) {
                  widget.value.borderRadius ??= BorderRadiusModel(
                    borderRadiusType: BorderRadiusType.circular,
                    circularValue: 1,
                    ellipticalX: 1,
                    ellipticalY: 1,
                  );
                } else {
                  widget.value.borderRadius = null;
                }
              });
            }),
            if (widget.value.borderRadius != null)
              BorderRadiusTypeWidget(
                app: widget.app,
                borderRadiusTypeCallback: (BorderRadiusType borderRadiusType) {
                  setState(() {
                    widget.value.borderRadius!.borderRadiusType =
                        borderRadiusType;
                  });
                },
                borderRadiusType: widget.value.borderRadius!.borderRadiusType ??
                    BorderRadiusType.circular,
              ),
            if ((widget.value.borderRadius != null) &&
                (widget.value.borderRadius!.borderRadiusType ==
                    BorderRadiusType.circular))
              getListTile(context, widget.app,
                  leading: Icon(Icons.description),
                  title: dialogField(
                    widget.app,
                    context,
                    initialValue:
                        widget.value.borderRadius!.circularValue.toString(),
                    valueChanged: (value) {
                      widget.value.borderRadius!.circularValue =
                          doubleParse(value);
                    },
                    maxLines: 1,
                    decoration: const InputDecoration(
                      hintText: 'Circular Radius',
                      labelText: 'Circular Radius',
                    ),
                  )),
            if ((widget.value.borderRadius != null) &&
                (widget.value.borderRadius!.borderRadiusType ==
                    BorderRadiusType.elliptical))
              getListTile(context, widget.app,
                  leading: Icon(Icons.description),
                  title: dialogField(
                    widget.app,
                    context,
                    initialValue:
                        widget.value.borderRadius!.ellipticalX.toString(),
                    valueChanged: (value) {
                      widget.value.borderRadius!.ellipticalX =
                          doubleParse(value);
                    },
                    maxLines: 1,
                    decoration: const InputDecoration(
                      hintText: 'Elliptical X',
                      labelText: 'Elliptical X',
                    ),
                  )),
            if ((widget.value.borderRadius != null) &&
                (widget.value.borderRadius!.borderRadiusType ==
                    BorderRadiusType.elliptical))
              getListTile(context, widget.app,
                  leading: Icon(Icons.description),
                  title: dialogField(
                    widget.app,
                    context,
                    initialValue:
                        widget.value.borderRadius!.ellipticalY.toString(),
                    valueChanged: (value) {
                      widget.value.borderRadius!.ellipticalY =
                          doubleParse(value);
                    },
                    maxLines: 1,
                    decoration: const InputDecoration(
                      hintText: 'Elliptical Y',
                      labelText: 'Elliptical Y',
                    ),
                  )),
          ]),
      topicContainer(widget.app, context,
          title: 'Margin',
          collapsible: true,
          collapsed: true,
          children: [
            checkboxListTile(
                widget.app, context, 'With margin', widget.value.margin != null,
                (value) {
              setState(() {
                if (value!) {
                  widget.value.margin = EdgeInsetsGeometryModel(
                      left: 0, right: 0, top: 0, bottom: 0);
                } else {
                  widget.value.margin = null;
                }
              });
            }),
            if (widget.value.margin != null)
              EdgeInsetsGeometryWidget(
                app: widget.app,
                edgeInsetsGeometryModel: widget.value.margin!,
              )
          ]),
      topicContainer(widget.app, context,
          title: 'Padding',
          collapsible: true,
          collapsed: true,
          children: [
            checkboxListTile(widget.app, context, 'With padding',
                widget.value.padding != null, (value) {
              setState(() {
                if (value!) {
                  widget.value.padding = EdgeInsetsGeometryModel(
                      left: 0, right: 0, top: 0, bottom: 0);
                } else {
                  widget.value.padding = null;
                }
              });
            }),
            if (widget.value.padding != null)
              EdgeInsetsGeometryWidget(
                app: widget.app,
                edgeInsetsGeometryModel: widget.value.padding!,
              )
          ]),
      ShadowWidget(
        app: widget.app,
        label: 'Shadow',
        backgroundModel: widget.value,
      )
    ];
  }

  void _borderChanged(bool? value) {
    setState(() {
      widget.value.border = value;
    });
  }

  void _setBeginGradientPosition(int? value) {
    setState(() {
      widget.value.beginGradientPosition = toStartGradientPosition(value);
    });
  }

  void _setEndGradientPosition(int? value) {
    setState(() {
      widget.value.endGradientPosition = toEndGradientPosition(value);
    });
  }

  void _setColorListChanged(List<DecorationColorModel>? value) {
    setState(() {
      widget.value.decorationColors = value;
    });
  }
}
