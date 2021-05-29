
import 'dart:typed_data';

import 'package:eliud_core/core/widgets/progress_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class FbStorageImage extends StatefulWidget {
  final String ref;
  final double? width;
  final double? height;

  const FbStorageImage({Key? key, required this.ref, this.width, this.height, }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FbStorageImageState();
  }
}

class _FbStorageImageState extends State<FbStorageImage> {
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
          return Center(child: DelayedCircularProgressIndicator());
        });
  }
}