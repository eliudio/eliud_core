import 'package:eliud_core/eliud.dart';
import 'package:eliud_core/platform/platform.dart';
import 'package:eliud_core/platform/web.dart';

class WebEliud extends Eliud {
  @override
  AbstractPlatform getPlatform() {
    return Web();
  }
}
