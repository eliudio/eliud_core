import 'package:flutter/material.dart';

import '../style_registry.dart';

abstract class HasContainer {
  // Format a topic, e.g. a post in a box / container
  Widget topicContainer(BuildContext context,
      {required List<Widget> children,
      DecorationImage? image,
      double? height,
      double? width,
      String? title,
      bool? collapsible,
      bool? collapsed = false});

  // Format a topic. Similar to topicContainer, but simpler, without too much decoration
  Widget simpleTopicContainer(BuildContext context,
      {required List<Widget> children,
      DecorationImage? image,
      double? height,
      double? width});

  // Format an action, e.g. a button, icon, combobox in a container
  Widget actionContainer(BuildContext context,
      {required Widget child, double? height, double? width});
}

Widget topicContainer(BuildContext context,
        {required List<Widget> children,
        DecorationImage? image,
        double? height,
        double? width,
        String? title,
        bool? collapsible,
        bool? collapsed = false}) =>
    StyleRegistry.registry()
        .styleWithContext(context)
        .frontEndStyle()
        .containerStyle()
        .topicContainer(context,
            children: children,
            image: image,
            height: height,
            width: width,
            title: title,
            collapsible: collapsible,
            collapsed: collapsed);

Widget simpleTopicContainer(BuildContext context,
        {required List<Widget> children,
        DecorationImage? image,
        double? height,
        double? width}) =>
    StyleRegistry.registry()
        .styleWithContext(context)
        .frontEndStyle()
        .containerStyle()
        .simpleTopicContainer(context,
            children: children, image: image, height: height, width: width);

Widget actionContainer(BuildContext context,
        {required Widget child, double? height, double? width}) =>
    StyleRegistry.registry()
        .styleWithContext(context)
        .frontEndStyle()
        .containerStyle()
        .actionContainer(context, child: child, height: height, width: width);
