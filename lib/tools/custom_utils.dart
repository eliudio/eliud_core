import 'package:eliud_core/style/style_registry.dart';
import 'package:flutter/material.dart';

class Utils {
  static getSizedBox({double? width, double? height}) {
    return SizedBox(
      height: height,
      width: width,
    );
  }

  static Widget getShrinkedListView(BuildContext context, List<Widget> widgets) {
    return StyleRegistry.registry().styleWithContext(context).frontEndStyle().topicContainer(context, children: [
    ListView.builder(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return widgets[index];
      },
      itemCount: widgets.length,
    )]);
  }
}
