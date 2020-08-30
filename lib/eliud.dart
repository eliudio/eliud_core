import 'package:eliud_core/core/global_data.dart';
import 'package:eliud_core/extensions/member_profile_component.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/platform/platform.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/tools/registry.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/navigate/navigate_bloc.dart';
import 'model/member_model.dart';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

import 'model/abstract_repository_singleton.dart';
import 'model/js_repository_singleton.dart';
import 'model/repository_singleton.dart';
import 'model/component_registry.dart';
import 'platform/mobile_platform.dart';
import 'platform/web.dart';

bool isWeb() {
  return kIsWeb;
}

bool isMobile() {
  return ((Platform.isAndroid) || (Platform.isIOS));
}

abstract class Plugin {
  /*
   * Initialise your plugin. You can use isWeb() or isMobile() to determine the context of your plugin.
   * Return this. It simplifiest the initialising app to use it.
   */
  void init();

  /*
   * Initialise your repositories with the provided appID. This method is called at startup as well when switching app
   */
  void initRepository(String appID);

  /*
   * Plugins can depend on the highest level of the app to provide a bloc. A plugin can do this by implementing this method.
   */
  BlocProvider createMainBloc(NavigatorBloc navigatorBloc);

  /*
   * To determine if a page is accessible, the page condition can be indicated as a "PluginDecides" condition.
   * The plugin should respond:
   *
   * false: not applicable to this plugin
   * true: accessible
   * false: not accessible
   *
   * For example: for a shop the cart page is accessible only if items are in the basket. Only the Shop plugin should implement this
   * and return true / false depending on items in the basket.
   */
  Future<bool> isConditionOk(String pluginCondition, AppModel app, MemberModel member, bool isOwner);
}

class Eliud {

  static void register(Plugin plugin) {
    GlobalData.registerPlugin(plugin);
  }

  static Future<AppModel> _init(String appID) async {
    if (isWeb()) {
      AbstractPlatform.platform = Web();
    } else if (isMobile()) {
      AbstractPlatform.platform = MobilePlatform();
    } else {
      throw 'Platform not yet supported';
    }
    ComponentRegistry().init();

    AbstractPlatform.platform.initRepository(appID);
    var app = await AbstractMainRepositorySingleton.singleton.appRepository().get(appID);
    if (app == null) {
      print('App with appID $appID does not exist');
      return null;
    }
    // Initialise custom extensions:
    Registry.registry().register(componentName: MemberProfileConstructorDefault.MEMBER_PROFILE_COMPONENT_IDENTIFIER, componentConstructor: MemberProfileConstructorDefault());

    GlobalData.registeredPlugins.forEach((plugin) {
      plugin.init();
      plugin.initRepository(appID);
    });

    return app;
  }

  static bool isPlayStore;
  static AppModel app;

 // asPlayStore flag allows to run the playstore app where people can use it to switch to other apps, create apps, ....
  // Ones in the other app, then can switch back to thePlayStoreApp
  // ThePlayStoreApp is the application which serves as the playstore and which you want to run
  // An icon will be available in the appBar to go to theMinkeyApp
  static void init(String appId, bool asPlaystore) async {
    isPlayStore = asPlaystore;
    app = await _init(appId);
  }

  // Run the application wihtout playstore
  // appId is the application you want to start and therefore not be null.
  static void run() {
    if (isPlayStore) {
      GlobalData.playStoreApp = app;
      if (GlobalData.playStoreApp != null) {
        runApp(Registry.registry().application(id: app.documentID));
      }
    } else {
      if (app != null) {
        runApp(Registry.registry().application(id: app.documentID));
      }
    }
  }
}
