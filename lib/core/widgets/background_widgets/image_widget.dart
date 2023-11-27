import 'package:eliud_core_main/apis/apis.dart';
import 'package:eliud_core_main/apis/medium/access_rights.dart';
import 'package:eliud_core_main/apis/style/frontend/has_button.dart';
import 'package:eliud_core_main/apis/style/frontend/has_container.dart';
import 'package:eliud_core_main/apis/style/frontend/has_dialog.dart';
import 'package:eliud_core_main/apis/style/frontend/has_progress_indicator.dart';
import 'package:eliud_core_main/apis/style/frontend/has_text.dart';
import 'package:eliud_core_main/model/app_model.dart';
import 'package:eliud_core_main/model/background_model.dart';
import 'package:eliud_core_main/model/public_medium_model.dart';
import 'package:flutter/material.dart';

class ImageWidget extends StatefulWidget {
  final AppModel app;
  final BackgroundModel backgroundModel;
  final String label;
  final String ownerId;

  ImageWidget({
    super.key,
    required this.app,
    required this.label,
    required this.backgroundModel,
    required this.ownerId,
  });

  @override
  State<ImageWidget> createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  double? _progress;
  PublicMediumModel? backgroundImage;

  @override
  Widget build(BuildContext context) {
    return topicContainer(widget.app, context,
        title: widget.label,
        collapsible: true,
        collapsed: true,
        children: [_content(context)]);
  }

  Widget _content(BuildContext context) {
    if (_progress != null) {
      return progressIndicatorWithValue(widget.app, context, value: _progress!);
    } else if (widget.backgroundModel.useProfilePhotoAsBackground ?? false) {
      return Row(
        children: [
          Spacer(),
          text(widget.app, context, 'Using member profile photo as background'),
          Spacer(),
          button(widget.app, context, label: 'Remove', onPressed: () {
            openAckNackDialog(widget.app, context,
                '${widget.app.documentID}/_removepprofilephoto',
                title: 'Confirm',
                message: 'Remove profile photo as background?',
                onSelection: (value) async {
              if (value == 0) {
                setState(() {
                  widget.backgroundModel.useProfilePhotoAsBackground = false;
                  widget.backgroundModel.backgroundImage = null;
                });
              }
            });
          }),
          Spacer(),
        ],
      );
    } else if (widget.backgroundModel.backgroundImage != null) {
      return Row(children: [
        Spacer(),
        Image.network(
          widget.backgroundModel.backgroundImage!.url!,
          width: 100,
        ),
        Spacer(),
        button(widget.app, context, label: 'Remove', onPressed: () {
          openAckNackDialog(
              widget.app, context, '${widget.app.documentID}/_removephoto',
              title: 'Confirm',
              message: 'Remove photo?', onSelection: (value) async {
            if (value == 0) {
              setState(() {
                widget.backgroundModel.useProfilePhotoAsBackground = false;
                widget.backgroundModel.backgroundImage = null;
              });
            }
          });
        }),
        Spacer(),
      ]);
    } else {
      return Row(
        children: [
          Spacer(),
          if (Apis.apis().getMediumApi().hasCamera())
            GestureDetector(
                child: Icon(Icons.photo_camera),
                onTap: () {
                  Apis.apis().getMediumApi().takePhoto(
                      context, widget.app, () => PublicMediumAccessRights(),
                      (photo) {
                    setState(() {
                      _progress = null;
                      widget.backgroundModel.useProfilePhotoAsBackground =
                          false;
                      widget.backgroundModel.backgroundImage = photo;
                    });
                  }, (progress) {
                    setState(() {
                      _progress = progress;
                    });
                  }, allowCrop: false);
                }),
          if (Apis.apis().getMediumApi().hasCamera()) Spacer(),
          GestureDetector(
              child: Icon(Icons.upload),
              onTap: () {
                Apis.apis().getMediumApi().uploadPhoto(
                    context, widget.app, () => PublicMediumAccessRights(),
                    (photo) {
                  setState(() {
                    _progress = null;
                    widget.backgroundModel.useProfilePhotoAsBackground = false;
                    widget.backgroundModel.backgroundImage = photo;
                  });
                }, (progress) {
                  setState(() {
                    _progress = progress;
                  });
                }, allowCrop: false);
              }),
          Spacer(),
          button(widget.app, context,
              label: 'Use member profile photo as background', onPressed: () {
            setState(() {
              widget.backgroundModel.useProfilePhotoAsBackground = true;
            });
          }),
          Spacer(),
        ],
      );
    }
  }
}

/*
            }
            if (choice == 1) {
              AbstractMediumPlatform.platform!.uploadPhoto(
                  context,
                  app,
                  ownerId,
                  () => MemberMediumAccessRights(accessibleByFunction().item1,
                      accessibleByMembers: accessibleByFunction().item2),
                  photoFeedbackFunction,
                  photoFeedbackProgress,
                  allowCrop: allowCrop);
            }
 */
