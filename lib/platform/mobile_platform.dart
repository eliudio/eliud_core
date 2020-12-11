import 'package:cached_network_image/cached_network_image.dart';
import 'package:eliud_core/platform/platform.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_repository_singleton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MobilePlatform extends AbstractPlatform {
  MobilePlatform();

  @override
  @protected
  ImageProvider getImageProviderOnPlatform(String url) {
    if (url != null) {
      return NetworkImage(url);
/*
      return CachedNetworkImageProvider(
        url,
      );
*/
    } else {
      return null;
    }
  }

  @override
  @protected
  Widget getImageOnPlatform({String imageUrl, double height, double width, BoxFit fit, Alignment alignment}) {
    Widget widget = CachedNetworkImage(
      fit: fit,
      height: height,
      width: width,
      placeholder: (context, url) =>
          Center(child: CircularProgressIndicator()),
      imageUrl: imageUrl,
      alignment: (alignment == null) ?  Alignment.center : alignment,
    );
    return widget;
  }

  @override
  void init() {
    AbstractRepositorySingleton.singleton = RepositorySingleton();
    AbstractMainRepositorySingleton.singleton = MainRepositorySingleton();
  }
}
