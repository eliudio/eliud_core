/*
import 'package:eliud_core/core/blocs/access/state/access_state.dart';
import 'package:eliud_core/model/background_model.dart';
import 'package:eliud_core/model/dialog_model.dart';
import 'package:eliud_core/model/grid_view_model.dart';
import 'package:eliud_core/model/page_model.dart';
import 'package:eliud_core/style/frontend/has_page_body.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'component_info.dart';

class PageBody extends StatefulWidget {
  final ComponentInfo componentInfo;

  PageBody({Key? key, required this.componentInfo}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _PageBodyState();
  }
}

class _PageBodyState extends State<PageBody> {
  @override
  Widget build(BuildContext context) {
    return theBody(context,
        backgroundOverride: widget.componentInfo.backgroundOverride,
        components: widget.componentInfo.widgets,
        layout: widget.componentInfo.layout,
        gridView: widget.componentInfo.gridView);
  }

  Widget theBody(BuildContext context,
      {BackgroundModel? backgroundOverride,
      required List<Widget> components,
      Layout? layout,
      GridViewModel? gridView}) {
    return  pageBody(context,
            backgroundOverride: backgroundOverride,
            components: components,
            layout: layout,
            gridView: gridView);
  }
}
*/
