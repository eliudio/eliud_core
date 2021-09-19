import 'package:eliud_core/model/member_medium_model.dart';
import 'package:eliud_core/style/frontend/has_dialog_widget.dart';
import 'package:eliud_core/style/frontend/has_progress_indicator.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'package:eliud_core/tools/storage/medium_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MemberMediumDialog extends StatefulWidget {
  final double? width;
  final String? title;
  final MemberMediumModel memberMediumModel;

  MemberMediumDialog({
    Key? key,
    this.title,
    required this.memberMediumModel,
    this.width,
  }) : super(key: key);

  @override
  _MemberMediumState createState() => _MemberMediumState();
}

class _MemberMediumState extends State<MemberMediumDialog> {
  static double height(BuildContext context) =>
      MediaQuery.of(context).size.height * 1;

  Future<List<MediumInfo>> buildImagesList() async {
    var memberMediumModel = widget.memberMediumModel;
    var appId = memberMediumModel.appId;
    return await ChainOfMediumModels.getChainOfMediumInfo(
        appId, memberMediumModel);
  }

  @override
  Widget build(BuildContext context) {
    return complexDialog(context, title: widget.title!, child: FutureBuilder<List<MediumInfo>>(
        future: buildImagesList(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
                width: widget.width,
                height: height(context) - 130,
                child: getAllImages(context, snapshot.data!));
          } else {
            return progressIndicator(context);
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
        return Image.network(infos[index].url!,
            width: infos[index].width!.toDouble(),
            height: infos[index].height!.toDouble());
      },
    );
  }
}
