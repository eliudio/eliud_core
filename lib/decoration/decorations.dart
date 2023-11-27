import 'package:eliud_core/decoration/decoration.dart';
import 'package:eliud_core_main/model/app_bar_model.dart';
import 'package:eliud_core_main/model/app_model.dart';
import 'package:eliud_core_main/model/body_component_model.dart';
import 'package:eliud_core_main/model/dialog_model.dart';
import 'package:eliud_core_main/model/drawer_model.dart';
import 'package:eliud_core_main/model/home_menu_model.dart';
import 'package:eliud_core_main/model/page_model.dart';
import 'package:flutter/cupertino.dart' as cu;
//import 'package:flutter/src/widgets/framework.dart';

typedef CreateWidget = cu.Widget Function();

class Decorations extends Decoration {
  static Decorations? _instance;
  Decorations._internal();

  static Decorations instance() {
    _instance ??= Decorations._internal();

    return _instance!;
  }

  static List<Decoration> registeredDecorations = [];

  void registerDecoration(decoration) {
    registeredDecorations.add(decoration);
  }

  // return nesting of CreateWidget
  @override
  CreateWidget createDecoratedAppBar(
      AppModel app,
      cu.BuildContext context,
      cu.Key? originalAppBarKey,
      CreateWidget createOriginalAppBar,
      AppBarModel model) {
    var createWidget = createOriginalAppBar;
    for (var registeredDecoration in registeredDecorations) {
      createWidget = registeredDecoration.createDecoratedAppBar(
          app, context, originalAppBarKey, createWidget, model);
    }

    return createWidget;
  }

  @override
  CreateWidget createDecoratedBodyComponent(
      AppModel app,
      cu.BuildContext context,
      cu.Key? originalBodyComponentKey,
      CreateWidget bodyComponent,
      BodyComponentModel model) {
    var createWidget = bodyComponent;
    for (var registeredDecoration in registeredDecorations) {
      createWidget = registeredDecoration.createDecoratedBodyComponent(
          app, context, originalBodyComponentKey, createWidget, model);
    }

    return createWidget;
  }

  @override
  CreateWidget createDecoratedDrawer(
      AppModel app,
      cu.BuildContext context,
      DecorationDrawerType decorationDrawerType,
      cu.Key? originalDrawerKey,
      CreateWidget createOriginalDrawer,
      DrawerModel model) {
    var createWidget = createOriginalDrawer;
    for (var registeredDecoration in registeredDecorations) {
      createWidget = registeredDecoration.createDecoratedDrawer(app, context,
          decorationDrawerType, originalDrawerKey, createWidget, model);
    }

    return createWidget;
  }

  @override
  CreateWidget createDecoratedBottomNavigationBar(
      AppModel app,
      cu.BuildContext context,
      cu.Key? originalBottomNavigationBarKey,
      CreateWidget createBottomNavigationBar,
      HomeMenuModel model) {
    var createWidget = createBottomNavigationBar;
    for (var registeredDecoration in registeredDecorations) {
      createWidget = registeredDecoration.createDecoratedBottomNavigationBar(
          app, context, originalBottomNavigationBarKey, createWidget, model);
    }

    return createWidget;
  }

  @override
  CreateWidget createDecoratedPage(
      AppModel app,
      cu.BuildContext context,
      cu.Key? originalPageKey,
      CreateWidget createOriginalPage,
      PageModel model) {
    var createWidget = createOriginalPage;
    for (var registeredDecoration in registeredDecorations) {
      createWidget = registeredDecoration.createDecoratedPage(
          app, context, originalPageKey, createWidget, model);
    }

    return createWidget;
  }

  @override
  CreateWidget createDecoratedErrorPage(AppModel app, cu.BuildContext context,
      cu.Key? originalPageKey, CreateWidget createOriginalPage) {
    var createWidget = createOriginalPage;
    for (var registeredDecoration in registeredDecorations) {
      createWidget = registeredDecoration.createDecoratedErrorPage(
          app, context, originalPageKey, createWidget);
    }

    return createWidget;
  }

  @override
  CreateWidget createDecoratedApp(AppModel app, cu.BuildContext context,
      cu.Key? originalAppkey, CreateWidget createOriginalApp, AppModel model) {
    var createWidget = createOriginalApp;
    for (var registeredDecoration in registeredDecorations) {
      createWidget = registeredDecoration.createDecoratedApp(
          app, context, originalAppkey, createWidget, model);
    }

    return createWidget;
  }

  @override
  CreateWidget createDecoratedDialog(
      AppModel app,
      cu.BuildContext context,
      cu.Key? originalDialogKey,
      CreateWidget createOriginalDialog,
      DialogModel model) {
    var createWidget = createOriginalDialog;
    for (var registeredDecoration in registeredDecorations) {
      createWidget = registeredDecoration.createDecoratedDialog(
          app, context, originalDialogKey, createWidget, model);
    }

    return createWidget;
  }
}
