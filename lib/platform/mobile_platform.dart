import 'package:cached_network_image/cached_network_image.dart';
import 'package:eliud_core/core/widgets/progress_indicator.dart';
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
  Widget getImageOnPlatform({String imageUrl, double height, double width, BoxFit fit, Alignment alignment}) {
    Widget widget = CachedNetworkImage(imageUrl: imageUrl,
      fit: fit,
      height: height,
      width: width,
      alignment: (alignment == null) ?  Alignment.center : alignment,
      placeholder: (context, url) =>
          Center(child: DelayedCircularProgressIndicator()),
    );
/*
    Widget widget = Image.network(imageUrl,
      fit: fit,
      height: height,
      width: width,
      alignment: (alignment == null) ?  Alignment.center : alignment,
    );
*/
    return widget;
  }
}
