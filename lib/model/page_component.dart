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
import 'package:eliud_core/model/page_repository.dart';
import 'package:eliud_core/model/page_component_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'abstract_repository_singleton.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';

abstract class AbstractPageComponent extends StatelessWidget {
  static String componentName = "pages";
  final String theAppId;
  final String pageId;

  AbstractPageComponent({Key? key, required this.theAppId, required this.pageId}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PageComponentBloc> (
          create: (context) => PageComponentBloc(
            pageRepository: pageRepository(appId: theAppId)!)
        ..add(FetchPageComponent(id: pageId)),
      child: _pageBlockBuilder(context),
    );
  }

  Widget _pageBlockBuilder(BuildContext context) {
    return BlocBuilder<PageComponentBloc, PageComponentState>(builder: (context, state) {
      if (state is PageComponentLoaded) {
        if (state.value == null) {
          return AlertWidget(title: "Error", content: 'No Page defined');
        } else {
          return yourWidget(context, state.value);
        }
      } else if (state is PageComponentPermissionDenied) {
        return Icon(
          Icons.highlight_off,
          color: Colors.red,
          size: 30.0,
        );
      } else if (state is PageComponentError) {
        return AlertWidget(title: 'Error', content: state.message);
      } else {
        return Center(
          child: StyleRegistry.registry().styleWithContext(context).frontEndStyle().progressIndicatorStyle().progressIndicator(context),
        );
      }
    });
  }

  Widget yourWidget(BuildContext context, PageModel value);
}

