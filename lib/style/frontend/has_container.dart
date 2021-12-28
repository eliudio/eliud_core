import 'package:eliud_core/model/app_model.dart';
import 'package:flutter/material.dart';

import '../style_registry.dart';

abstract class HasContainer {
  // Format a topic, e.g. a post in a box / container
  Widget topicContainer(AppModel app, BuildContext context,
      {required List<Widget> children,
      DecorationImage? image,
      double? height,
      double? width,
      String? title,
      bool? collapsible,
      bool? collapsed = false});

  // Format a topic. Similar to topicContainer, but simpler, without too much decoration
  Widget simpleTopicContainer(AppModel app, BuildContext context,
      {required List<Widget> children,
      DecorationImage? image,
      double? height,
      double? width});

  // Format an action, e.g. a button, icon, combobox in a container
  Widget actionContainer(AppModel app, BuildContext context,
      {required Widget child, double? height, double? width});
}

Widget topicContainer(AppModel app, BuildContext context,
        {required List<Widget> children,
        DecorationImage? image,
        double? height,
        double? width,
        String? title,
        bool? collapsible,
        bool? collapsed = false}) =>
    StyleRegistry.registry()
        .styleWithApp(app)
        .frontEndStyle()
        .containerStyle()
        .topicContainer(app, context,
            children: children,
            image: image,
            height: height,
            width: width,
            title: title,
            collapsible: collapsible,
            collapsed: collapsed);

Widget simpleTopicContainer(AppModel app, BuildContext context,
        {required List<Widget> children,
        DecorationImage? image,
        double? height,
        double? width}) =>
    StyleRegistry.registry()
        .styleWithApp(app)
        .frontEndStyle()
        .containerStyle()
        .simpleTopicContainer(app, context,
            children: children, image: image, height: height, width: width);

Widget actionContainer(AppModel app, BuildContext context,
        {required Widget child, double? height, double? width}) =>
    StyleRegistry.registry()
        .styleWithApp(app)
        .frontEndStyle()
        .containerStyle()
        .actionContainer(app, context, child: child, height: height, width: width);
