import 'package:eliud_core/model/public_medium_model.dart';
import 'package:flutter/cupertino.dart';

class PublicImageModelWidget extends StatefulWidget {
  final PublicMediumModel publicMediumModel;
  final double? width;
  final double? height;
  final bool showThumbnail;
  final Widget? defaultWidget;

  const PublicImageModelWidget({
    super.key,
    required this.publicMediumModel,
    this.width,
    this.height,
    required this.showThumbnail,
    this.defaultWidget,
  });

  @override
  State<StatefulWidget> createState() {
    return _PublicImageModelState();
  }
}

class _PublicImageModelState extends State<PublicImageModelWidget> {
  @override
  Widget build(BuildContext context) {
    String? url;
    if (widget.showThumbnail) {
      url = widget.publicMediumModel.urlThumbnail;
    } else {
      url = widget.publicMediumModel.url;
    }
    if (url == null) {
      if (widget.defaultWidget != null) {
        return widget.defaultWidget!;
      }
    } else {
      return Image.network(
        url,
        width: widget.width,
        height: widget.height,
      );
    }
    throw Exception("Could not determine url");
  }
}
