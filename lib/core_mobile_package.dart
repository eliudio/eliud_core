import 'package:eliud_core/eliud.dart';
import 'package:eliud_core/platform/mobile_storage_platform.dart';
import 'package:eliud_core/platform/storage_platform.dart';

import 'core_package.dart';

class CoreMobilePackage extends CorePackage {
  @override
  void init() {
    super.init();
    // initialise the platform
    AbstractStoragePlatform.platform = MobileStoragePlatform();
  }
}
