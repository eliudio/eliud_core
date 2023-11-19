import 'package:eliud_core_model/access/access_event.dart';
import 'package:eliud_core_model/apis_impl/action/open_dialog.dart';
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
