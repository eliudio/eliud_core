/* Interface for AdminApp */

import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/menu_def_model.dart';

abstract class AdminAppInstallerBase {
  Future<void> run();
}

abstract class AdminAppMenuInstallerBase {
  Future<MenuDefModel> menu(AppModel app);
}

abstract class AdminAppWiperBase {
  Future<void> deleteAll(String appID);
}
