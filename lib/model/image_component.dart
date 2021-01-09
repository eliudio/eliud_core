/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 image_component.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/core/widgets/progress_indicator.dart';

import 'package:eliud_core/model/image_component_bloc.dart';
import 'package:eliud_core/model/image_component_event.dart';
import 'package:eliud_core/model/image_model.dart';
import 'package:eliud_core/model/image_repository.dart';
import 'package:eliud_core/model/image_component_state.dart';

abstract class AbstractImageComponent extends StatelessWidget {
  static String componentName = "images";
  final String imageID;

  AbstractImageComponent({this.imageID});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ImageComponentBloc> (
          create: (context) => ImageComponentBloc(
            imageRepository: getImageRepository(context))
        ..add(FetchImageComponent(id: imageID)),
      child: _imageBlockBuilder(context),
    );
  }

  Widget _imageBlockBuilder(BuildContext context) {
    return BlocBuilder<ImageComponentBloc, ImageComponentState>(builder: (context, state) {
      if (state is ImageComponentLoaded) {
        if (state.value == null) {
          return alertWidget(title: 'Error', content: 'No Image defined');
        } else {
          return yourWidget(context, state.value);
        }
      } else if (state is ImageComponentPermissionDenied) {
        return Icon(
          Icons.highlight_off,
          color: Colors.red,
          size: 30.0,
        );
      } else if (state is ImageComponentError) {
        return alertWidget(title: 'Error', content: state.message);
      } else {
        return Center(
          child: DelayedCircularProgressIndicator(),
        );
      }
    });
  }

  Widget yourWidget(BuildContext context, ImageModel value);
  Widget alertWidget({ title: String, content: String});
  ImageRepository getImageRepository(BuildContext context);
}

