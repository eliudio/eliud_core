import 'dart:io';

import 'package:eliud_core/platform/storage_platform.dart';
import 'package:eliud_core/tools/storage/firestore_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker_gallery_camera/image_picker_gallery_camera.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'dart:html' as html;

class WebStoragePlatform extends AbstractStoragePlatform {
  Future<void> pickImage(BuildContext context, String? appId, MediumAvailable? feedbackFunction, String? memberId, ImgSource source) async {
    html.File _image = await ImagePickerWeb.getImage(outputType: ImageType.file);
    print("step 2");
    print(_image.relativePath!);
    var thumbnailInfo = await UploadFile.createThumbNailFromPhoto(_image.relativePath!);
    print("step 3");
    if (thumbnailInfo.thumbNailData != null) {
      feedbackFunction!(thumbnailInfo);
    } else {
      print("Could't create thumbnail");
    }
  }

  @override
  void takePhoto(BuildContext context, String? appId, MediumAvailable? feedbackFunction, String? memberId) {
    pickImage(context, appId, feedbackFunction, memberId, ImgSource.Camera);
  }

  @override
  void takeVideo(BuildContext context, String? appId, MediumAvailable? feedbackFunction, String? memberId) {
  }

  @override
  void uploadPhoto(BuildContext context, String? appId, MediumAvailable? feedbackFunction, String? memberId) {
    pickImage(context, appId, feedbackFunction, memberId, ImgSource.Gallery);
  }

  @override
  void uploadVideo(BuildContext context, String? appId, MediumAvailable? feedbackFunction, String? memberId) {
  }

}
