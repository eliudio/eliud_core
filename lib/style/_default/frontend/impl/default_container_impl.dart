import 'package:eliud_core/style/frontend/frontend_style.dart';
import 'package:eliud_core/style/frontend/has_container.dart';
import 'package:eliud_core/style/frontend/has_divider.dart';
import 'package:eliud_core/style/frontend/has_text.dart';
import 'package:flutter/material.dart';

class DefaultContainerImpl implements HasContainer {
  @override
  Widget actionContainer(BuildContext context,
      {required Widget child, double? height, double? width}) {
    return child;
  }

  @override
  Widget topicContainer(BuildContext context,
      {required List<Widget> children,
      DecorationImage? image,
      double? height,
      double? width,
      String? title,
      bool? collapsible,
      bool? collapsed = false}) {
    if (title != null) {
      var newChildren = [text(context, title), divider(context)];
      newChildren.addAll(children);
      children = newChildren;
    }
    return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          image: image,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        ));
  }

  @override
  Widget simpleTopicContainer(BuildContext context,
      {required List<Widget> children,
      DecorationImage? image,
      double? height,
      double? width}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }
}
