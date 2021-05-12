import 'package:eliud_core/platform/storage_platform.dart';
import 'package:eliud_core/tools/storage/firestore_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker_gallery_camera/image_picker_gallery_camera.dart';

class MobileStoragePlatform extends AbstractStoragePlatform {
  MobileStoragePlatform() {
    WidgetsFlutterBinding.ensureInitialized();
  }

  Future<void> pickImage(BuildContext context, String? appId, MediumAvailable? feedbackFunction, String? memberId, ImgSource source) async {
    var _image = await ImagePickerGC.pickImage(
      enableCloseButton: true,
      closeIcon: Icon(
        Icons.close,
        color: Colors.red,
        size: 12,
      ),
      context: context,
      source: source,
      barrierDismissible: true,
      cameraIcon: Icon(
        Icons.camera_alt,
        color: Colors.red,
      ),
    );
    var thumbnailInfo = await UploadFile.createThumbNailFromPhoto(_image.path);
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
