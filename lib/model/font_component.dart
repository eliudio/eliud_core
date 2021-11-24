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


import 'package:eliud_core/model/font_component_bloc.dart';
import 'package:eliud_core/model/font_component_event.dart';
import 'package:eliud_core/model/font_model.dart';
import 'package:eliud_core/model/font_repository.dart';
import 'package:eliud_core/model/font_component_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'abstract_repository_singleton.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';

abstract class AbstractFontComponent extends StatelessWidget {
  static String componentName = "fonts";
  final String theAppId;
  final String fontId;

  AbstractFontComponent({Key? key, required this.theAppId, required this.fontId}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FontComponentBloc> (
          create: (context) => FontComponentBloc(
            fontRepository: fontRepository(appId: theAppId)!)
        ..add(FetchFontComponent(id: fontId)),
      child: _fontBlockBuilder(context),
    );
  }

  Widget _fontBlockBuilder(BuildContext context) {
    return BlocBuilder<FontComponentBloc, FontComponentState>(builder: (context, state) {
      if (state is FontComponentLoaded) {
        if (state.value == null) {
          return AlertWidget(title: "Error", content: 'No Font defined');
        } else {
          return yourWidget(context, state.value);
        }
      } else if (state is FontComponentPermissionDenied) {
        return Icon(
          Icons.highlight_off,
          color: Colors.red,
          size: 30.0,
        );
      } else if (state is FontComponentError) {
        return AlertWidget(title: 'Error', content: state.message);
      } else {
        return Center(
          child: StyleRegistry.registry().styleWithContext(context).frontEndStyle().progressIndicatorStyle().progressIndicator(context),
        );
      }
    });
  }

  Widget yourWidget(BuildContext context, FontModel value);
}

