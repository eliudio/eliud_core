import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/style/frontend/has_container.dart';
import 'package:flutter/material.dart';

class Utils {
  static getSizedBox({double? width, double? height}) {
    return SizedBox(
      height: height,
      width: width,
    );
  }

  static Widget getShrinkedListView(AppModel app, BuildContext context, List<Widget> widgets) {
    return topicContainer(app, context, children: [
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
