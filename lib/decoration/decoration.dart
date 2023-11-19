import 'package:eliud_core_model/model/home_menu_model.dart';
import 'package:eliud_core_model/model/app_bar_model.dart';
import 'package:eliud_core_model/model/app_model.dart';
import 'package:eliud_core_model/model/body_component_model.dart';
import 'package:eliud_core_model/model/dialog_model.dart';
import 'package:eliud_core_model/model/drawer_model.dart';
import 'package:eliud_core_model/model/page_model.dart';
import 'package:flutter/cupertino.dart';

typedef CreateWidget = Widget Function();

/*
   * Allows the package to decorate the components. This can for example be used to allow a decoration to decide to allow to update the interface
   * or adjust the style, e.g. eliud_pkg_create.
   */
enum DecorationDrawerType { left, right }

abstract class Decoration {
  CreateWidget createDecoratedAppBar(
      AppModel app,
      BuildContext context,
      Key? originalAppBarKey,
      CreateWidget createOriginalAppBar,
      AppBarModel model);
  CreateWidget createDecoratedDrawer(
      AppModel app,
      BuildContext context,
      DecorationDrawerType decorationDrawerType,
      Key? originalDrawerKey,
      CreateWidget createOriginalDrawer,
      DrawerModel model);
  CreateWidget createDecoratedBottomNavigationBar(
      AppModel app,
      BuildContext context,
      Key? originalBottomNavigationBarKey,
      CreateWidget createBottomNavigationBar,
      HomeMenuModel model);
  CreateWidget createDecoratedApp(AppModel app, BuildContext context,
      Key? originalAppkey, CreateWidget createOriginalApp, AppModel model);
  CreateWidget createDecoratedErrorPage(AppModel app, BuildContext context,
      Key? originalPageKey, CreateWidget createOriginalPage);
  CreateWidget createDecoratedPage(AppModel app, BuildContext context,
      Key? originalPageKey, CreateWidget createOriginalPage, PageModel model);
  CreateWidget createDecoratedDialog(
      AppModel app,
      BuildContext context,
      Key? originalDialogKey,
      CreateWidget createOriginalDialog,
      DialogModel model);
  CreateWidget createDecoratedBodyComponent(
      AppModel app,
      BuildContext context,
      Key? originalBodyComponentKey,
      CreateWidget bodyComponent,
      BodyComponentModel model);
}
