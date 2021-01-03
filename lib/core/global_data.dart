import 'package:eliud_core/package/package.dart';

class GlobalData {
  static List<Package> registeredPackages = List();

  static void registerPackage(package) {
    registeredPackages.add(package);
  }
}
