import 'dart:typed_data';
import 'package:eliud_core/model/member_medium_model.dart';
import 'package:eliud_core/model/platform_medium_model.dart';
import 'package:eliud_core/style/frontend/has_progress_indicator.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class MemberImageModelWidget extends StatefulWidget {
  final MemberMediumModel memberMediumModel;
  final double? width;
  final double? height;
  final bool showThumbnail;
  final Widget? defaultWidget;

  const MemberImageModelWidget({Key? key, required this.memberMediumModel, this.width, this.height, required this.showThumbnail, this.defaultWidget, }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MemberImageModelState();
  }
}

class _MemberImageModelState extends State<MemberImageModelWidget> {
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

// This doesn't seem to work as it seems sometimes the wrong image is picked up. Weird
class FbStorageImageDoesntWork extends StatefulWidget {
  final String ref;
  final double? width;
  final double? height;

  const FbStorageImageDoesntWork({Key? key, required this.ref, this.width, this.height, }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FbStorageImageState();
  }
}

class _FbStorageImageState extends State<FbStorageImageDoesntWork> {
  Future<Uint8List?>? future;

  @override
  void initState() {
    future = firebase_storage.FirebaseStorage.instance.ref(widget.ref).getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Uint8List?>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data != null) {
              return Image.memory(snapshot.data!, width: widget.width, height: widget.height,);
            } else {
              return Image.asset(
                  "assets/manypixels_co/404_Page_Not_Found _Flatline.png",
                  package: "eliud_pkg_feed");
            }
          }
          return progressIndicator(context);
        });
  }
}