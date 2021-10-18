import 'dart:typed_data';
import 'package:eliud_core/model/member_medium_model.dart';
import 'package:eliud_core/model/platform_medium_model.dart';
import 'package:eliud_core/style/frontend/has_progress_indicator.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class PlatformImageModelWidget extends StatefulWidget {
  final PlatformMediumModel memberMediumModel;
  final double? width;
  final double? height;
  final bool showThumbnail;
  final Widget? defaultWidget;

  const PlatformImageModelWidget({Key? key, required this.memberMediumModel, this.width, this.height, required this.showThumbnail, this.defaultWidget, }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _PlatformImageModelState();
  }
}

class _PlatformImageModelState extends State<PlatformImageModelWidget> {
  @override
  Widget build(BuildContext context) {
    var url;
    if (widget.showThumbnail) {
      url = widget.memberMediumModel.urlThumbnail!;
    } else {
      url = widget.memberMediumModel.url!;
    }
    if ((url == null) && (widget.defaultWidget != null)) {
      return widget.defaultWidget!;
    }
    return Image.network(
      url,
      width: widget.width,
      height: widget.height,
    );
  }
}
