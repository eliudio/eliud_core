/* Interface for AdminApp */

import 'package:eliud_core/model/menu_def_model.dart';

abstract class AdminAppInstallerBase {
  Future<void> run();
}

abstract class AdminAppMenuInstallerBase {
  Future<MenuDefModel> menu(String appID);
}

abstract class AdminAppWiperBase {
  Future<void> deleteAll(String appID);
}
