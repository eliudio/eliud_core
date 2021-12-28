import 'package:eliud_core/model/app_model.dart';

import '../helper/page_body_helper.dart';
import 'package:eliud_core/model/background_model.dart';
import 'package:eliud_core/model/grid_view_model.dart';
import 'package:eliud_core/style/frontend/frontend_style.dart';
import 'package:eliud_core/style/frontend/has_page_body.dart';
import 'package:flutter/material.dart';

class DefaultPageBodyImpl implements HasPageBody {
  final FrontEndStyle _frontEndStyle;

  DefaultPageBodyImpl(this._frontEndStyle);

  @override
  Widget pageBody(AppModel app, BuildContext context,
      {BackgroundModel? backgroundOverride,
      required List<Widget> components,
      Layout? layout,
      GridViewModel? gridView}) {
    return PageBodyHelper(_frontEndStyle).pageBody(app, context, components: components, layout: layout, gridView: gridView, background: backgroundOverride);
  }
}
