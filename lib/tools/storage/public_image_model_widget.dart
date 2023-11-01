import 'package:eliud_core/model/public_medium_model.dart';
import 'package:flutter/cupertino.dart';

class PublicImageModelWidget extends StatefulWidget {
  final PublicMediumModel publicMediumModel;
  final double? width;
  final double? height;
  final bool showThumbnail;
  final Widget? defaultWidget;

  const PublicImageModelWidget({Key? key, required this.publicMediumModel, this.width, this.height, required this.showThumbnail, this.defaultWidget, }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _PublicImageModelState();
  }
}

class _PublicImageModelState extends State<PublicImageModelWidget> {
  @override
  Widget build(BuildContext context) {
    var url;
    if (widget.showThumbnail) {
      url = widget.publicMediumModel.urlThumbnail!;
    } else {
      url = widget.publicMediumModel.url!;
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
