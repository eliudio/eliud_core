import 'package:eliud_core/extensions/member_profile_component.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/platform/platform.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/tools/registry.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Eliud {
  static AppModel playStoreApp; // The playstore app. If null, then no playstore app available.

  // Should I add a playstoreApp-app
  static String addPlayStoreApp(AppModel currentApp) {
    if (playStoreApp == null) return null;
    if (currentApp.documentID == playStoreApp.documentID) return null;
    return playStoreApp.documentID;
  }

  static Future<AppModel> _init(String appID) async {
    AbstractPlatform.platform.initRepository(appID);
    var app = await AbstractMainRepositorySingleton.singleton.appRepository().get(appID);
    if (app == null) {
      print('App with appID $appID does not exist');
      return null;
    }
    // Initialise custom extensions:
    Registry.registry().register(componentName: MemberProfileConstructorDefault.MEMBER_PROFILE_COMPONENT_IDENTIFIER, componentConstructor: MemberProfileConstructorDefault());
    return app;
  }

  // Run the playstore app where people can use it to switch to other apps, create apps, .... Ones in the other app, then can switch back to thePlayStoreApp
  // ThePlayStoreApp is the application which serves as the playstore and which you want to run
  // An icon will be available in the appBar to go to theMinkeyApp
  static void runPlaystoreApp(String thePlayStoreApp) async {
    playStoreApp = await _init(thePlayStoreApp);
    if (playStoreApp != null) {
      runApp(Registry.registry().application(id: thePlayStoreApp));
    }
  }

  // Run the application wihtout playstore
  // appId is the application you want to start and therefore not be null.
  static void runEliudApp(String appID) async {
    var app = await _init(appID);
    if (app != null) {
      runApp(Registry.registry().application(id: appID));
    }
  }
}
