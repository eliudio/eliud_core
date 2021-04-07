import 'package:eliud_core/core/widgets/progress_indicator.dart';
import 'package:eliud_core/model/member_medium_model.dart';
import 'package:eliud_core/tools/storage/firestore_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:transparent_image/transparent_image.dart';

import 'dialog_helper.dart';

class MemberMediumDialog extends StatefulWidget {
  final double? width;
  final String? title;
  final MemberMediumModel? memberMediumModel;
  final Function? closeFunction;

  MemberMediumDialog({
    Key? key,
    this.title,
    this.memberMediumModel,
    this.closeFunction,
    this.width,
  }) : super(key: key);

  @override
  _MemberMediumState createState() => _MemberMediumState();
}

class _MemberMediumState extends State<MemberMediumDialog> {
  final DialogStateHelper dialogHelper = DialogStateHelper();
  static double height(BuildContext context) =>
      MediaQuery.of(context).size.height * 1;

  Future<List<MediumInfo>> buildImagesList() async {
    var memberMediumModel = widget.memberMediumModel!;
    var appId = memberMediumModel.appId;
    return await ChainOfMediumModels.getChainOfMediumInfo(appId, memberMediumModel);
  }

  @override
  Widget build(BuildContext context) {
    return dialogHelper.build(
      width: widget.width,
        title: widget.title!,
        buttons: dialogHelper.getCloseButton(context, widget.closeFunction),
        contents: FutureBuilder<List<MediumInfo>>(
            future: buildImagesList(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Container(width: widget.width, height : height(context) - 130, child: getAllImages(context, snapshot.data!));
              } else {
                return Center(
                  child: DelayedCircularProgressIndicator(),
                );
              }
            }));
  }

  Widget getAllImages(BuildContext context, List<MediumInfo> infos) {
    return ListView.builder(
      padding: EdgeInsets.all(0.0),
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemCount: infos.length,
      itemBuilder: (BuildContext context, int index) {
        return Image.network(
            infos[index].url!, width: infos[index].width!.toDouble(), height: infos[index].height!.toDouble()
            );
      },
    );
  }
}
