import 'package:eliud_core/package/package.dart';

class Packages {
  static Packages? _instance;
  Packages._internal();

  static Packages instance() {
    _instance ??= Packages._internal();

    return _instance!;
  }

  static List<Package> registeredPackages = [];

  void registerPackage(package) {
    registeredPackages.add(package);
  }
}
