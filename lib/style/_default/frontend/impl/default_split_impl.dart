import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/style/frontend/frontend_style.dart';
import 'package:eliud_core/style/frontend/has_dialog.dart';
import 'package:eliud_core/style/frontend/types.dart';
import 'package:eliud_core/style/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../frontend/has_split.dart';
import '../helper/dialog/dialog_helper.dart';

class DefaultSplitImpl implements HasSplit {
  final FrontEndStyle _frontEndStyle;

  DefaultSplitImpl(this._frontEndStyle);

  @override
  Widget splitView(AppModel app, BuildContext context, Widget container1, Widget container2, double ratio, double minRatio, double maxRatio) {
    return Column(children: [
      container1, container2,
    ],);
  }

}
