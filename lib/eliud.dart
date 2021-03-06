import 'package:eliud_core/core/global_data.dart';
import 'package:eliud_core/tools/registry.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:eliud_core/model/component_registry.dart';
import 'package/package.dart';

class Eliud {
  void register(Package package) {
    GlobalData.registerPackage(package);
  }

  void initRegistryAndPackages() {
    try {
      ComponentRegistry().init();

      var plugins = GlobalData.registeredPackages;
      for (var i = 0; i < plugins.length; i++) {
        var plugin = plugins[i];
        plugin.init();
      }

    } catch (error) {
      print (error);
    }
  }

  // Run the application without playstore
  // appId is the application you want to start and therefore not be null.
  // asPlayStore flag allows to run the playstore app where people can use it to switch to other apps, create apps, ....
  // Ones in the other app, then can switch back to thePlayStoreApp
  // ThePlayStoreApp is the application which serves as the playstore and which you want to run
  // An icon will be available in the appBar to go to theMinkeyApp
  void run(String appId, bool asPlaystore) async {
    runApp(Registry.registry().application(id: appId, asPlaystore: asPlaystore));
  }

}
