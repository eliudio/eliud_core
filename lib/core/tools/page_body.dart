import 'package:eliud_core/core/access/bloc/access_state.dart';
import 'package:eliud_core/model/background_model.dart';
import 'package:eliud_core/model/dialog_model.dart';
import 'package:eliud_core/model/grid_view_model.dart';
import 'package:eliud_core/model/page_model.dart';
import 'package:eliud_core/style/frontend/has_page_body.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'component_info.dart';

Layout fromPageLayout(PageLayout? pageLayout) {
  switch (pageLayout) {
    case PageLayout.GridView: return Layout.GridView;
    case PageLayout.ListView: return Layout.ListView;
    case PageLayout.OnlyTheFirstComponent: return Layout.OnlyTheFirstComponent;
    case PageLayout.Unknown: return Layout.Unknown;
  }
  return Layout.Unknown;
}

Layout fromDialogLayout(DialogLayout? dialogLayout) {
  switch (dialogLayout) {
    case DialogLayout.GridView: return Layout.GridView;
    case DialogLayout.ListView: return Layout.ListView;
    case DialogLayout.OnlyTheFirstComponent: return Layout.OnlyTheFirstComponent;
    case DialogLayout.Unknown: return Layout.Unknown;
  }
  return Layout.Unknown;
}

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
    return theBody(context, widget.componentInfo.state, backgroundOverride:widget.componentInfo.backgroundOverride, components: widget.componentInfo.widgets, layout:widget.componentInfo.layout,
        gridView: widget.componentInfo.gridView);
  }

  Widget theBody(BuildContext context,
      AccessState accessState,
      {BackgroundModel? backgroundOverride,
        required List<Widget> components,
        Layout? layout,
        GridViewModel? gridView
      }) {
    return StyleRegistry.registry().styleWithContext(context).frontEndStyle().pageBodyStyle().pageBody(context, backgroundOverride: backgroundOverride,
        components: components, layout: layout, gridView: gridView);
  }

}