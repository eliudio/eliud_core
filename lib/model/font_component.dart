/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 font_component.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:eliud_core/model/font_component_bloc.dart';
import 'package:eliud_core/model/font_component_event.dart';
import 'package:eliud_core/model/font_model.dart';
import 'package:eliud_core/model/font_repository.dart';
import 'package:eliud_core/model/font_component_state.dart';

abstract class AbstractFontComponent extends StatelessWidget {
  static String componentName = "fonts";
  final String fontID;

  AbstractFontComponent({this.fontID});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FontComponentBloc> (
          create: (context) => FontComponentBloc(
            fontRepository: getFontRepository(context))
        ..add(FetchFontComponent(id: fontID)),
      child: _fontBlockBuilder(context),
    );
  }

  Widget _fontBlockBuilder(BuildContext context) {
    return BlocBuilder<FontComponentBloc, FontComponentState>(builder: (context, state) {
      if (state is FontComponentLoaded) {
        if (state.value == null) {
          return alertWidget(title: 'Error', content: 'No font defined');
        } else {
          return yourWidget(context, state.value);
        }
      } else if (state is FontComponentError) {
        return alertWidget(title: 'Error', content: state.message);
      } else {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }

  Widget yourWidget(BuildContext context, FontModel value);
  Widget alertWidget({ title: String, content: String});
  FontRepository getFontRepository(BuildContext context);
}


