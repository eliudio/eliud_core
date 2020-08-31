import 'package:eliud_core/eliud.dart';
import 'package:eliud_core/platform/platform.dart';

import 'package:eliud_core/platform/mobile_platform.dart';

class MobileEliud extends Eliud {
  @override
  AbstractPlatform getPlatform() {
    return MobilePlatform();
  }
}
