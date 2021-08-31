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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/style/style_registry.dart';

import 'package:eliud_core/model/page_component_bloc.dart';
import 'package:eliud_core/model/page_component_event.dart';
import 'package:eliud_core/model/page_model.dart';
import 'package:eliud_core/model/page_repository.dart';
import 'package:eliud_core/model/page_component_state.dart';

abstract class AbstractPageComponent extends StatelessWidget {
  static String componentName = "pages";
  final String? pageID;

  AbstractPageComponent({Key? key, this.pageID}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PageComponentBloc> (
          create: (context) => PageComponentBloc(
            pageRepository: getPageRepository(context))
        ..add(FetchPageComponent(id: pageID)),
      child: _pageBlockBuilder(context),
    );
  }

  Widget _pageBlockBuilder(BuildContext context) {
    return BlocBuilder<PageComponentBloc, PageComponentState>(builder: (context, state) {
      if (state is PageComponentLoaded) {
        if (state.value == null) {
          return alertWidget(title: 'Error', content: 'No Page defined');
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
        return alertWidget(title: 'Error', content: state.message);
      } else {
        return Center(
          child: StyleRegistry.registry().styleWithContext(context).frontEndStyle().progressIndicatorStyle().progressIndicator(context),
        );
      }
    });
  }

  Widget yourWidget(BuildContext context, PageModel? value);
  Widget alertWidget({ title: String, content: String});
  PageRepository getPageRepository(BuildContext context);
}

