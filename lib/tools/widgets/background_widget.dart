import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/background_model.dart';
import 'package:eliud_core/model/decoration_color_model.dart';
import 'package:eliud_core/style/frontend/has_container.dart';
import 'package:eliud_core/style/frontend/has_list_tile.dart';
import 'package:flutter/material.dart';

import '../../model/border_radius_model.dart';
import '../../style/frontend/has_dialog_field.dart';
import '../helpers/parse_helper.dart';
import 'background_widgets/border_radius_widget.dart';
import 'background_widgets/decoration_color_list_widget.dart';
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
    Key? key,
    required this.app,
    required this.label,
    required this.value,
    required this.memberId,
    this.withTopicContainer = true,
  }) : super(key: key);

  @override
  _BackgroundWidgetWidgetState createState() => _BackgroundWidgetWidgetState();
}

class _BackgroundWidgetWidgetState extends State<BackgroundWidget> {
  @override
  void initState() {
    if (widget.value.decorationColors == null)
      widget.value.decorationColors = [];
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
        shrinkWrap: true,
        physics: ScrollPhysics(),
        children: children()
      );
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
                          if (widget.value.borderRadius == null) {
                            widget.value.borderRadius = BorderRadiusModel(
                              borderRadiusType: BorderRadiusType.Circular,
                              circularValue: 1,
                              ellipticalX: 1,
                              ellipticalY: 1,
                            );
                          }
                        } else {
                          widget.value.borderRadius = null;
                        }
                      });
                    }),
                if (widget.value.borderRadius != null)
                  BorderRadiusTypeWidget(
                    app: widget.app,
                    borderRadiusTypeCallback:
                        (BorderRadiusType borderRadiusType) {
                      setState(() {
                        widget.value.borderRadius!.borderRadiusType =
                            borderRadiusType;
                      });
                    },
                    borderRadiusType:
                    widget.value.borderRadius!.borderRadiusType ??
                        BorderRadiusType.Circular,
                  ),
                if ((widget.value.borderRadius != null) && (widget.value.borderRadius!.borderRadiusType == BorderRadiusType.Circular))
                  getListTile(context, widget.app,
                      leading: Icon(Icons.description),
                      title: dialogField(
                        widget.app,
                        context,
                        initialValue: widget.value.borderRadius!.circularValue.toString(),
                        valueChanged: (value) {
                          widget.value.borderRadius!.circularValue = double_parse(value);
                        },
                        maxLines: 1,
                        decoration: const InputDecoration(
                          hintText: 'Circular Radius',
                          labelText: 'Circular Radius',
                        ),
                      )),
                if ((widget.value.borderRadius != null) && (widget.value.borderRadius!.borderRadiusType == BorderRadiusType.Elliptical))
                  getListTile(context, widget.app,
                      leading: Icon(Icons.description),
                      title: dialogField(
                        widget.app,
                        context,
                        initialValue: widget.value.borderRadius!.ellipticalX.toString(),
                        valueChanged: (value) {
                          widget.value.borderRadius!.ellipticalX = double_parse(value);
                        },
                        maxLines: 1,
                        decoration: const InputDecoration(
                          hintText: 'Elliptical X',
                          labelText: 'Elliptical X',
                        ),
                      )),
                if ((widget.value.borderRadius != null) && (widget.value.borderRadius!.borderRadiusType == BorderRadiusType.Elliptical))
                  getListTile(context, widget.app,
                      leading: Icon(Icons.description),
                      title: dialogField(
                        widget.app,
                        context,
                        initialValue: widget.value.borderRadius!.ellipticalY.toString(),
                        valueChanged: (value) {
                          widget.value.borderRadius!.ellipticalY = double_parse(value);
                        },
                        maxLines: 1,
                        decoration: const InputDecoration(
                          hintText: 'Elliptical Y',
                          labelText: 'Elliptical Y',
                        ),
                      )),
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
