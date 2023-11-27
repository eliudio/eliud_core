import 'package:eliud_core_main/apis/action_api/actions/open_dialog.dart';

import '../access/access_event.dart';
import '../core/navigate/router.dart' as er;
import '../core/registry.dart';

class OpenDialogPostLogin extends PostLoginAction {
  String dialogID;
  OpenDialogPostLogin({required this.dialogID, required super.app});

  @override
  void runTheAction() {
    var context = Registry.navigatorKey.currentContext;
    if (context != null) {
      er.Router.navigateTo(context, OpenDialog(app, dialogID: dialogID));
    } else {
      print("OpenDialogPostLogin has no context so can't open the dialog");
    }
  }
}
