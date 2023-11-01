/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 page_component.dart
                       
 This code is generated. This is read only. Don't touch!

*/


import 'package:eliud_core/model/page_component_bloc.dart';
import 'package:eliud_core/model/page_component_event.dart';
import 'package:eliud_core/model/page_model.dart';
import 'package:eliud_core/model/page_component_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'abstract_repository_singleton.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/model/app_model.dart';

abstract class AbstractPageComponent extends StatelessWidget {
  static String componentName = "pages";
  final AppModel app;
  final String pageId;

  AbstractPageComponent({Key? key, required this.app, required this.pageId}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PageComponentBloc> (
          create: (context) => PageComponentBloc(
            pageRepository: pageRepository(appId: app.documentID)!)
        ..add(FetchPageComponent(id: pageId)),
      child: _pageBlockBuilder(context),
    );
  }

  Widget _pageBlockBuilder(BuildContext context) {
    return BlocBuilder<PageComponentBloc, PageComponentState>(builder: (context, state) {
      if (state is PageComponentLoaded) {
        return yourWidget(context, state.value);
      } else if (state is PageComponentPermissionDenied) {
        return Icon(
          Icons.highlight_off,
          color: Colors.red,
          size: 30.0,
        );
      } else if (state is PageComponentError) {
        return AlertWidget(app: app, title: 'Error', content: state.message);
      } else {
        return Center(
          child: StyleRegistry.registry().styleWithApp(app).frontEndStyle().progressIndicatorStyle().progressIndicator(app, context),
        );
      }
    });
  }

  Widget yourWidget(BuildContext context, PageModel value);
}

