import 'package:flutter/material.dart';

class Utils {
  static getSizedBox({double? width, double? height}) {
    return SizedBox(
      height: height,
      width: width,
    );
  }

  static Widget getShrinkedListView(List<Widget> widgets) {
    return ListView.builder(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return widgets[index];
      },
      itemCount: widgets.length,
    );

  }
}
