import 'package:eliud_core/model/platform_medium_model.dart';
import 'package:flutter/cupertino.dart';

class PlatformImageModelWidget extends StatefulWidget {
  final PlatformMediumModel platformMediumModel;
  final double? width;
  final double? height;
  final bool showThumbnail;
  final Widget? defaultWidget;

  const PlatformImageModelWidget({Key? key, required this.platformMediumModel, this.width, this.height, required this.showThumbnail, this.defaultWidget, }) : super(key: key);

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
      url = widget.platformMediumModel.urlThumbnail!;
    } else {
      url = widget.platformMediumModel.url!;
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
