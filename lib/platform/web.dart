import 'package:eliud_core/platform/platform.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/js_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_js_repository_singleton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Web extends AbstractPlatform {
  @override
  @protected
  ImageProvider getImageProviderOnPlatform(String url) {
    return NetworkImage(url);
  }

  @override
  @protected
  Widget getImageOnPlatform(
      {String imageUrl,
      double height,
      double width,
      BoxFit fit,
      Alignment alignment}) {
    return Image.network(
      imageUrl,
      fit: fit,
      height: height,
      width: width,
      alignment: alignment == null ? Alignment.center : alignment,
    );
  }

  @override
  void init() {
    AbstractRepositorySingleton.singleton = JsRepositorySingleton();
    AbstractMainRepositorySingleton.singleton = JsMainRepositorySingleton();
  }
}
