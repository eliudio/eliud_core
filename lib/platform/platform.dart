import 'package:eliud_core/core/global_data.dart';
import 'package:eliud_core/model/image_model.dart';
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

  ImageProvider getImageProvider(ImageModel image) {
    if (image == null) return null;
    if (image.source != SourceImage.YourProfilePhoto) {
      return getImageProviderOnPlatform(image.imageURLOriginal);
    } else {
      String photoURL = GlobalData.memberProfilePhoto();
      if (photoURL != null)
        return getImageProviderOnPlatform(photoURL);
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

  Widget getImage({ImageModel image, double height, double width, BoxFit fit}) {
    String url = (image.source != SourceImage.YourProfilePhoto) ? image.imageURLOriginal : GlobalData.memberProfilePhoto();
    return getImageOnPlatform(imageUrl: url,
        height: height,
        width: width,
        fit: fit);
  }

  Widget getThumbnail({ImageModel image, double height, double width, BoxFit fit}) {
    String url = (image.source != SourceImage.YourProfilePhoto) ? image.imageURLOriginal : GlobalData.memberProfilePhoto();
    return getImageOnPlatform(imageUrl: url,
        height: height,
        width: width,
        fit: fit);
  }

  void initRepository(String appID);
}
