import 'package:eliud_core/core/global_data.dart';
import 'package:eliud_core/extensions/member_profile_component.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/platform/platform.dart';
import 'package:eliud_core/tools/registry.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:eliud_core/core/navigate/navigate_bloc.dart';
import 'package:eliud_core/model/member_model.dart';

import 'package:eliud_core/model/component_registry.dart';

import 'core/access/bloc/access_bloc.dart';

abstract class Package {
  /*
   * Initialise your plugin. You can use isWeb() or isMobile() to determine the context of your plugin.
   * Initialise your repositories and any other platform specifics
   */
  void init();

  /*
   * Plugins can depend on the highest level of the app to provide a bloc. A plugin can do this by implementing this method.
   */
  BlocProvider  createMainBloc(NavigatorBloc navigatorBloc, AccessBloc accessBloc);

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
  Future<bool> isConditionOk(String pluginCondition, AppModel app, MemberModel member, bool isOwner, int privilegeLevel);

  List<String> retrieveAllPackageConditions();
}

abstract class Eliud {
  void register(Package package) {
    GlobalData.registerPackage(package);
  }

  void initRegistryAndPackages() {
    try {
      AbstractPlatform.platform = getPlatform();
      AbstractPlatform.platform.init();
      ComponentRegistry().init();

      // Initialise custom extensions:
      Registry.registry().register(
          componentName: MemberProfileConstructorDefault
              .MEMBER_PROFILE_COMPONENT_IDENTIFIER,
          componentConstructor: MemberProfileConstructorDefault());

      var plugins = GlobalData.registeredPackages;
      for (var i = 0; i < plugins.length; i++) {
        var plugin = plugins[i];
        plugin.init();
      }

    } catch (error) {
      print (error);
    }
  }

  // Run the application wihtout playstore
  // appId is the application you want to start and therefore not be null.
  // asPlayStore flag allows to run the playstore app where people can use it to switch to other apps, create apps, ....
  // Ones in the other app, then can switch back to thePlayStoreApp
  // ThePlayStoreApp is the application which serves as the playstore and which you want to run
  // An icon will be available in the appBar to go to theMinkeyApp
  void run(String appId, bool asPlaystore) async {
    runApp(Registry.registry().application(id: appId, asPlaystore: asPlaystore));
  }

  AbstractPlatform getPlatform();
}
