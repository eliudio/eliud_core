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

import 'package:eliud_core/model/page_component_bloc.dart';
import 'package:eliud_core/model/page_component_event.dart';
import 'package:eliud_core/model/page_model.dart';
import 'package:eliud_core/model/page_repository.dart';
import 'package:eliud_core/model/page_component_state.dart';

abstract class AbstractPageComponent extends StatelessWidget {
  static String componentName = "pages";
  final String pageID;

  AbstractPageComponent({this.pageID});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PageBloc> (
          create: (context) => PageBloc(
            pageRepository: getPageRepository())
        ..add(FetchPage(id: pageID)),
      child: _pageBlockBuilder(context),
    );
  }

  Widget _pageBlockBuilder(BuildContext context) {
    return BlocBuilder<PageBloc, PageState>(builder: (context, state) {
      if (state is PageLoaded) {
        if (state.value == null) {
          return alertWidget(title: 'Error', content: 'No page defined');
        } else {
          return yourWidget(context, state.value);
        }
      } else if (state is PageError) {
        return alertWidget(title: 'Error', content: state.message);
      } else {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }

  Widget yourWidget(BuildContext context, PageModel value);
  Widget alertWidget({ title: String, content: String});
  PageRepository getPageRepository();
}


