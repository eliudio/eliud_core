import 'package:eliud_core_main/apis/action_api/action_model.dart';
import 'package:eliud_core_main/apis/action_api/actions/goto_page.dart';
import 'package:eliud_core_main/model/dialog_model.dart';
import 'package:eliud_core_main/model/page_model.dart';
import 'package:eliud_core_main/apis/style/frontend/has_page_body.dart';

class PageHelper {
  static bool isActivePage(String? currentPage, ActionModel? action) {
    if (action is GotoPage) {
      return action.pageID == currentPage;
    }
    return false;
  }
}

Layout fromPageLayout(PageLayout? pageLayout) {
  switch (pageLayout) {
    case PageLayout.gridView:
      return Layout.gridView;
    case PageLayout.listView:
      return Layout.listView;
    case PageLayout.onlyTheFirstComponent:
      return Layout.onlyTheFirstComponent;
    case PageLayout.unknown:
      return Layout.unknown;
    case null:
      break;
  }
  return Layout.unknown;
}

Layout fromDialogLayout(DialogLayout? dialogLayout) {
  switch (dialogLayout) {
    case DialogLayout.gridView:
      return Layout.gridView;
    case DialogLayout.listView:
      return Layout.listView;
    case DialogLayout.onlyTheFirstComponent:
      return Layout.onlyTheFirstComponent;
    case DialogLayout.unknown:
      return Layout.unknown;
    case null:
      break;
  }
  return Layout.unknown;
}
