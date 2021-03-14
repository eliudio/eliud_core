import 'package:eliud_core/core/widgets/progress_indicator.dart';
import 'package:eliud_core/model/member_medium_model.dart';
import 'package:eliud_core/tools/storage/firestore_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:transparent_image/transparent_image.dart';

import 'dialog_helper.dart';

class MemberMediumDialog extends StatefulWidget {
  final String title;
  final MemberMediumModel memberMediumModel;
  final Function closeFunction;

  MemberMediumDialog({
    Key key,
    this.title,
    this.memberMediumModel,
    this.closeFunction,
  }) : super(key: key);

  @override
  _MemberMediumState createState() => _MemberMediumState();
}

class _MemberMediumState extends State<MemberMediumDialog> {
  final DialogStateHelper dialogHelper = DialogStateHelper();

  Future<List<String>> buildImagesList() async {
    var memberMediumModel = widget.memberMediumModel;
    var appId = memberMediumModel.appId;
    return await ChainOfMediumModels.getChainOfUrls(appId, memberMediumModel);
  }

  @override
  Widget build(BuildContext context) {
    return dialogHelper.build(
        title: widget.title,
        buttons: dialogHelper.getCloseButton(context, widget.closeFunction),
        contents: FutureBuilder<List<String>>(
            future: buildImagesList(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return getAllImages(snapshot.data);
              } else {
                return Center(
                  child: DelayedCircularProgressIndicator(),
                );
              }
            }));
  }

  Widget getAllImages(List<String> urls) {
    return ListView.builder(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemCount: urls.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(height: 400, child: PhotoView(
            imageProvider: NetworkImage(urls[index]),
            backgroundDecoration: BoxDecoration(color: Colors.transparent)
        ));
      },
    );
  }
}

/*
class MemberMediumImage extends StatefulWidget {
  final MemberMediumModel memberMediumModel;

  MemberMediumImage({ Key key, this.memberMediumModel,
  }) : super(key: key);

  @override
  _MemberMediumState createState() => _MemberMediumState();
}

class _MemberMediumImageState extends State<MemberMediumImage> {
  @override
  Widget build(BuildContext context) {
  }
}*/
