import 'package:eliud_core/model/app_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../frontend/has_divider.dart';
import '../../../frontend/has_split.dart';

class DefaultSplitImpl implements HasSplit {
//  final FrontEndStyle _frontEndStyle;

  DefaultSplitImpl(/*this._frontEndStyle*/);

  @override
  Widget splitView(AppModel app, BuildContext context, Widget container1,
      Widget container2, double ratio, double minRatio, double maxRatio) {
    return Row(
      children: [
        Expanded(child: container1),
        verticalDivider(app, context, 5),
        Expanded(child: container2),
      ],
    );
  }
}
