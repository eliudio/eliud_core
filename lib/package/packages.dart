import 'package.dart';

class Packages {
  static Packages? _instance;
  Packages._internal();

  static Packages instance() {
    _instance ??= Packages._internal();

    return _instance!;
  }

  static List<Package> registeredPackages = [];

  void registerPackage(Package package) {
    // don't add duplicates
    for (int i = 0; i < registeredPackages.length; i++) {
      if (registeredPackages[i].packageName == package.packageName) return;
    }

    // register
    registeredPackages.add(package);
  }
}
