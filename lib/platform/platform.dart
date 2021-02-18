import 'package:eliud_core/core/access/bloc/access_state.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/image_model.dart';
import 'package:eliud_core/model/repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_repository_singleton.dart';
import 'package:flutter/cupertino.dart';
import 'package:transparent_image/transparent_image.dart';

abstract class AbstractPlatform {
  static AbstractPlatform platform;

  @protected
  Widget getImageOnPlatform({String imageUrl, double height, double width, BoxFit fit, Alignment alignment});

  Widget getImageFromURL({String url, double height, double width, BoxFit fit, Alignment alignment}) {
    return FadeInImage.memoryNetwork(
      placeholder: kTransparentImage,
      image: url,
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
    );
  }

  Widget getImage(AccessState state, {ImageModel image, double height, double width, BoxFit fit}) {
    if (image == null) return null;
    return getImageOnPlatform(imageUrl: image.imageURLOriginal,
        height: height,
        width: width,
        fit: fit);
  }

  void init() {
    AbstractRepositorySingleton.singleton = RepositorySingleton();
    AbstractMainRepositorySingleton.singleton = MainRepositorySingleton();
  }
}
