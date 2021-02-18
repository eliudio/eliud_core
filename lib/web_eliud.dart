import 'package:eliud_core/eliud.dart';
import 'package:eliud_core/platform/platform.dart';
import 'package:eliud_core/platform/storage_platform.dart';
import 'package:eliud_core/platform/web.dart';
import 'package:eliud_core/platform/web_storage_platform.dart';

class WebEliud extends Eliud {
  @override
  AbstractPlatform getPlatform() {
    return Web();
  }

  @override
  void init() {
    // initialise the platform
    AbstractStoragePlatform.platform = WebStoragePlatform();
    AbstractPlatform.platform = Web();
  }
}
