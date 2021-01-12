import 'package:eliud_core/core/access/bloc/access_state.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/image_model.dart';
import 'package:eliud_core/model/repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_repository_singleton.dart';
import 'package:flutter/cupertino.dart';

abstract class AbstractPlatform {
  static AbstractPlatform platform;

  @protected
  ImageProvider getImageProviderOnPlatform(String url);
  @protected
  Widget getImageOnPlatform({String imageUrl, double height, double width, BoxFit fit, Alignment alignment});

  ImageProvider getImageProviderFromURL(String url) {
    return getImageProviderOnPlatform(url);
  }

  ImageProvider getImageProvider(AccessState state, ImageModel image) {
    if (image == null) return null;
    if (image.source != SourceImage.YourProfilePhoto) return getImageProviderOnPlatform(image.imageURLOriginal);
    if (state is LoggedIn) {
      var photoURL = state.memberProfilePhoto();
      if (photoURL != null) {
        return getImageProviderOnPlatform(photoURL);
      }
    }
    return null;
  }

  Widget getImageFromURL({String url, double height, double width, BoxFit fit, Alignment alignment}) {
    return getImageOnPlatform(imageUrl: url,
        height: height,
        width: width,
        fit: fit,
        alignment: alignment);
  }

  Widget getImage(AccessState state, {ImageModel image, double height, double width, BoxFit fit}) {
    if (image == null) return null;
    if (image.source == SourceImage.YourProfilePhoto) {
      if (state is LoggedIn) {
        return getImageOnPlatform(imageUrl: state.memberProfilePhoto(),
            height: height,
            width: width,
            fit: fit);
      } else {
        return Text('Not logged on');
      }
    } else {
      return getImageOnPlatform(imageUrl: image.imageURLOriginal,
          height: height,
          width: width,
          fit: fit);
    }
  }

  Widget getThumbnail(AccessState state, {ImageModel image, double height, double width, BoxFit fit}) {
    if (state is LoggedIn) {
      var url = (image.source != SourceImage.YourProfilePhoto) ? image
          .imageURLOriginal : state.memberProfilePhoto();
      return getImageOnPlatform(imageUrl: url,
          height: height,
          width: width,
          fit: fit);
    } else {
      return Text('Not logged on');
    }
  }

  void init() {
    AbstractRepositorySingleton.singleton = RepositorySingleton();
    AbstractMainRepositorySingleton.singleton = MainRepositorySingleton();
  }
}
