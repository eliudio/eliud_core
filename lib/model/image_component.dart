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
    return BlocProvider<ImageBloc> (
          create: (context) => ImageBloc(
            imageRepository: getImageRepository())
        ..add(FetchImage(id: imageID)),
      child: _imageBlockBuilder(context),
    );
  }

  Widget _imageBlockBuilder(BuildContext context) {
    return BlocBuilder<ImageBloc, ImageState>(builder: (context, state) {
      if (state is ImageLoaded) {
        if (state.value == null) {
          return alertWidget(title: 'Error', content: 'No image defined');
        } else {
          return yourWidget(context, state.value);
        }
      } else if (state is ImageError) {
        return alertWidget(title: 'Error', content: state.message);
      } else {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }

  Widget yourWidget(BuildContext context, ImageModel value);
  Widget alertWidget({ title: String, content: String});
  ImageRepository getImageRepository();
}


