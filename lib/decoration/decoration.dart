import 'package:eliud_core/model/home_menu_model.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/app_bar_model.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/body_component_model.dart';
import 'package:eliud_core/model/dialog_model.dart';
import 'package:eliud_core/model/drawer_model.dart';
import 'package:eliud_core/model/page_model.dart';
import 'package:flutter/cupertino.dart';

/*
   * Allows the package to decorate the components. This can for example be used to allow a decoration to decide to allow to update the interface ("eliud_decor_app")
   * or adjust the style ("eliud_decor_style).
   */
abstract class Decoration extends Equatable {
  Widget decorateAppBar(Key? key, Widget appBar, AppBarModel model);
  Widget decorateDrawer(Key? key, Widget drawer, DrawerModel model);
  Widget decorateBottomNavigationBar(Key? key, Widget bottomNavigationBar, HomeMenuModel model);
  Widget decorateApp(Key? key, Widget app, AppModel model);
  Widget decoratePage(Key? key, Widget page, PageModel model);
  Widget decorateDialog(Key? key, Widget dialog, DialogModel model);
  Widget decorateBodyComponent(Key? key, Widget bodyComponent, BodyComponentModel model);
}
