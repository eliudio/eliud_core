import 'package:eliud_core/model/dialog_model.dart';
import 'package:eliud_core/model/page_model.dart';
import 'package:eliud_core/style/frontend/has_page_body.dart';
import 'package:eliud_core/tools/action/action_model.dart';

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
    case PageLayout.GridView:
      return Layout.GridView;
    case PageLayout.ListView:
      return Layout.ListView;
    case PageLayout.OnlyTheFirstComponent:
      return Layout.OnlyTheFirstComponent;
    case PageLayout.Unknown:
      return Layout.Unknown;
  }
  return Layout.Unknown;
}

Layout fromDialogLayout(DialogLayout? dialogLayout) {
  switch (dialogLayout) {
    case DialogLayout.GridView:
      return Layout.GridView;
    case DialogLayout.ListView:
      return Layout.ListView;
    case DialogLayout.OnlyTheFirstComponent:
      return Layout.OnlyTheFirstComponent;
    case DialogLayout.Unknown:
      return Layout.Unknown;
  }
  return Layout.Unknown;
}
