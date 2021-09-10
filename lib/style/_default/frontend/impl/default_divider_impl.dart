import 'package:eliud_core/model/icon_model.dart';
import 'package:eliud_core/style/frontend/has_divider.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:flutter/material.dart';

class DefaultDividerImpl
    implements HasDivider {
  @override
  Widget divider(BuildContext context) {
    return Divider(
        height: 1.0,
        thickness: 1.0,
    );
  }

  Widget verticalDivider(BuildContext context, double height) {
    return Container(height: height, width: 1,);
  }

}
