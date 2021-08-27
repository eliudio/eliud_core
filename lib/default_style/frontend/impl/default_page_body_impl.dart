import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/default_style/frontend/helper/page_body_helper.dart';
import 'package:eliud_core/model/background_model.dart';
import 'package:eliud_core/model/grid_view_model.dart';
import 'package:eliud_core/style/frontend/frontend_style.dart';
import 'package:eliud_core/style/frontend/has_page_body.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:eliud_core/tools/grid_view_helper.dart';
import 'package:flutter/material.dart';

class DefaultPageBodyImpl implements HasPageBody {
  final FrontEndStyle _frontEndStyle;

  DefaultPageBodyImpl(this._frontEndStyle);

  @override
  Widget pageBody(BuildContext context,
      {BackgroundModel? backgroundOverride,
      required List<Widget> components,
      Layout? layout,
      GridViewModel? gridView}) {
    return PageBodyHelper(_frontEndStyle).pageBody(context, components: components, layout: layout, gridView: gridView, background: backgroundOverride);
  }
}
