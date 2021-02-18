import 'package:eliud_core/eliud.dart';
import 'package:eliud_core/platform/mobile_storage_platform.dart';
import 'package:eliud_core/platform/platform.dart';

import 'package:eliud_core/platform/mobile_platform.dart';
import 'package:eliud_core/platform/storage_platform.dart';

class MobileEliud extends Eliud {
  @override
  AbstractPlatform getPlatform() {
    return MobilePlatform();
  }

  @override
  void init() {
    // initialise the platform
    AbstractStoragePlatform.platform = MobileStoragePlatform();
    AbstractPlatform.platform = MobilePlatform();
  }
}
