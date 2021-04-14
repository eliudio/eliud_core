import 'dart:convert';

import 'package:camera/camera.dart';
import 'package:eliud_core/platform/storage_platform.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'mobile/camera.dart';

class CameraUtility {

  static CameraUtility? _instance;

  CameraUtility._internal() {
  }

  static CameraUtility? utility() {
    _instance ??= CameraUtility._internal();

    return _instance;
  }
}

class MobileStoragePlatform extends AbstractStoragePlatform {
  List<CameraDescription> cameras = [];

  MobileStoragePlatform() {
    WidgetsFlutterBinding.ensureInitialized();
    // retrieve cameras but don't wait... it'll be there in time
    availableCameras().then((values) => cameras = values);
  }

  @override
  void takeMedium(BuildContext context, String? appId, feedbackFunction, String? memberId, List<String>? readAccess) {
    // todo: don't initialise the cameras like this, but do it lazy. create the camerexamplehome after it has been initialised lazy or imediatly when available
    if (cameras != null) {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (_) =>  CameraExampleHome(appId, cameras, feedbackFunction, memberId, readAccess)),
      );
    } else {
      // alert
    }
  }

  @override
  void uploadMedium(BuildContext context, String? appId, feedbackFunction, String? memberId, List<String>? readAccess) {
    // TODO: implement uploadMedium
  }
}
