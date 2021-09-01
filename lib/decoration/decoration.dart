import 'package:eliud_core/model/home_menu_model.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/app_bar_model.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/body_component_model.dart';
import 'package:eliud_core/model/dialog_model.dart';
import 'package:eliud_core/model/drawer_model.dart';
import 'package:eliud_core/model/page_model.dart';
import 'package:flutter/cupertino.dart';

typedef CreateWidget = Widget Function();

/*
   * Allows the package to decorate the components. This can for example be used to allow a decoration to decide to allow to update the interface ("eliud_decor_app")
   * or adjust the style ("eliud_decor_style).
   */
abstract class Decoration {
  CreateWidget createDecoratedAppBar(BuildContext context, Key? originalAppBarKey, CreateWidget createOriginalAppBar, AppBarModel model);
  CreateWidget createDecoratedDrawer(BuildContext context, Key? originalDrawerKey, CreateWidget createOriginalDrawer, DrawerModel model);
  CreateWidget createDecoratedBottomNavigationBar(BuildContext context, Key? originalBottomNavigationBarKey, CreateWidget createBottomNavigationBar, HomeMenuModel model);
  CreateWidget createDecoratedApp(BuildContext context, Key? originalAppkey, CreateWidget createOriginalApp, AppModel model);
  CreateWidget createDecoratedPage(BuildContext context, Key? originalPageKey, CreateWidget createOriginalPage, PageModel model);
  CreateWidget createDecoratedDialog(BuildContext context, Key? originalDialogKey, CreateWidget createOriginalDialog, DialogModel model);
  CreateWidget createDecoratedBodyComponent(BuildContext context, Key? originalBodyComponentKey, CreateWidget bodyComponent, BodyComponentModel model);
}
