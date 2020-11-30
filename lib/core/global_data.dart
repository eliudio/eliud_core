import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:eliud_core/core/access/bloc/access_state.dart';
import 'package:eliud_core/eliud.dart';

class GlobalData {
  static List<Package> registeredPackages = List();

  static void registerPackage(package) {
    registeredPackages.add(package);
  }
}
