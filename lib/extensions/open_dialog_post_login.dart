import 'package:flutter/cupertino.dart';

import '../core/blocs/access/access_event.dart';
import '../core/navigate/router.dart' as eliudRouter;
import '../core/registry.dart';
import '../model/app_model.dart';
import 'package:eliud_core/tools/action/action_model.dart';

class OpenDialogPostLogin extends PostLoginAction {
  String dialogID;
  OpenDialogPostLogin({required this.dialogID, required AppModel app}) : super(app: app);

  void runTheAction() {
    var context = Registry.navigatorKey.currentContext;
    if (context != null) {
      eliudRouter.Router.navigateTo(
          context,
          OpenDialog(app, dialogID: dialogID));
    } else {
      print("OpenDialogPostLogin has no context so can't open the dialog");
    }
  }
}
