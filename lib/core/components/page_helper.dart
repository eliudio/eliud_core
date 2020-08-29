import 'package:eliud_core/tools/action_model.dart';

class PageHelper {
  static bool isActivePage(String currentPage, ActionModel action) {
    if (action is GotoPage) {
      return action.pageID == currentPage;
    }
    return false;
  }
}
