import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/platform_medium_model.dart';
import 'package:eliud_core/style/frontend/has_container.dart';
import 'package:eliud_core/style/frontend/has_list_tile.dart';
import 'package:eliud_core/style/frontend/has_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'condition_simple_widget.dart';

class PlatformMediumWidget extends StatefulWidget {
  final PlatformMediumModel platformMediumModel;
  final AppModel app;
  PlatformMediumWidget({Key? key, required this.app, required this.platformMediumModel})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _PlatformMediumWidgetState();
  }
}

class _PlatformMediumWidgetState extends State<PlatformMediumWidget> {
  @override
  Widget build(BuildContext context) {
    var image = widget.platformMediumModel;
    return topicContainer(widget.app, context,
        title: 'Image',
        collapsible: true,
        collapsed: true,
        children: [
          topicContainer(widget.app, context,
              title: 'Image',
              collapsible: true,
              collapsed: true,
              children: [
                Image.network(
                  image.url!,
                  //            height: height,
                )
              ]),
          topicContainer(widget.app, context,
              title: 'General',
              collapsible: true,
              collapsed: true,
              children: [
                getListTile(context, widget.app,
                    leading: Icon(Icons.vpn_key),
                    title: text(widget.app, context, image.documentID!)),
                getListTile(context, widget.app,
                    leading: text(widget.app, context, 'author ID'),
                    title: text(widget.app, context, image.authorId!)),
              ]),
          topicContainer(widget.app, context,
              title: 'Size',
              collapsible: true,
              collapsed: true,
              children: [
                getListTile(context, widget.app,
                    leading: text(widget.app, context, 'thumbnail height'),
                    title: text(
                        widget.app,
                        context,
                        image.thumbnailHeight != null
                            ? image.thumbnailHeight.toString()
                            : '')),
                getListTile(context, widget.app,
                    leading: text(widget.app, context, 'thumbnail width'),
                    title: text(
                        widget.app,
                        context,
                        image.thumbnailWidth != null
                            ? image.thumbnailWidth.toString()
                            : '')),
                getListTile(context, widget.app,
                    leading: text(widget.app, context, 'height'),
                    title: text(
                        widget.app,
                        context,
                        image.mediumHeight != null
                            ? image.mediumHeight.toString()
                            : '')),
                getListTile(context, widget.app,
                    leading: text(widget.app, context, 'width'),
                    title: text(
                        widget.app,
                        context,
                        image.mediumWidth != null
                            ? image.mediumWidth.toString()
                            : '')),
              ]),
          topicContainer(widget.app, context,
              title: 'Links',
              collapsible: true,
              collapsed: true,
              children: [
                getListTile(context, widget.app,
                    leading: text(widget.app, context, 'url'),
                    title: text(widget.app, context, image.url ?? '')),
                getListTile(context, widget.app,
                    leading: text(widget.app, context, 'url thumbnail'),
                    title: text(widget.app, context, image.urlThumbnail ?? '')),
                getListTile(context, widget.app,
                    leading: text(widget.app, context, 'ref'),
                    title: text(widget.app, context, image.ref ?? '')),
                getListTile(context, widget.app,
                    leading: text(widget.app, context, 'ref thumbail'),
                    title: text(widget.app, context, image.refThumbnail ?? '')),
              ]),
          topicContainer(widget.app, context,
              title: 'Conditions',
              collapsible: true,
              collapsed: true,
              children: [
                ConditionsSimpleWidget(
                  app: widget.app,
                  value: image.conditions!,
                  readOnly: true,
                ),
              ]),
        ]);
  }
}
