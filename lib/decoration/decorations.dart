import 'package:eliud_core/decoration/decoration.dart';
import 'package:eliud_core/model/app_bar_model.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/body_component_model.dart';
import 'package:eliud_core/model/dialog_model.dart';
import 'package:eliud_core/model/drawer_model.dart';
import 'package:eliud_core/model/home_menu_model.dart';
import 'package:eliud_core/model/page_model.dart';
import 'package:flutter/src/widgets/framework.dart';

typedef CreateWidget = Widget Function();

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
  CreateWidget createDecoratedAppBar(BuildContext context, Key? key, CreateWidget createAppBar, AppBarModel model) {
    var createWidget = createAppBar;
    for (var registeredDecoration in registeredDecorations) {
      createWidget = registeredDecoration.createDecoratedAppBar(context, key, createWidget, model);
    }

    return createWidget;
  }

  @override
  CreateWidget createDecoratedBodyComponent(BuildContext context, Key? key, CreateWidget createBodyComponent, BodyComponentModel model) {
    var createWidget = createBodyComponent;
    for (var registeredDecoration in registeredDecorations) {
      createWidget = registeredDecoration.createDecoratedBodyComponent(context, key, createWidget, model);
    }

    return createWidget;
  }

  @override
  CreateWidget createDecoratedDrawer(BuildContext context, Key? originalDrawerKey, CreateWidget createOriginalDrawer, DrawerModel model) {
    var createWidget = createOriginalDrawer;
    for (var registeredDecoration in registeredDecorations) {
      createWidget = registeredDecoration.createDecoratedDrawer(context, originalDrawerKey, createWidget, model);
    }

    return createWidget;
  }

  @override
  CreateWidget createDecoratedBottomNavigationBar(BuildContext context, Key? originalBottomNavigationBarKey, CreateWidget createBottomNavigationBar, HomeMenuModel model) {
    var createWidget = createBottomNavigationBar;
    for (var registeredDecoration in registeredDecorations) {
      createWidget = registeredDecoration.createDecoratedBottomNavigationBar(context, originalBottomNavigationBarKey, createWidget, model);
    }

    return createWidget;
  }

  @override
  CreateWidget createDecoratedPage(BuildContext context, Key? originalPageKey, CreateWidget createOriginalPage, PageModel model) {
    var createWidget = createOriginalPage;
    for (var registeredDecoration in registeredDecorations) {
      createWidget = registeredDecoration.createDecoratedPage(context, originalPageKey, createWidget, model);
    }

    return createWidget;
  }

  @override
  CreateWidget createDecoratedApp(BuildContext context, Key? originalAppkey, CreateWidget createOriginalApp, AppModel model) {
    var createWidget = createOriginalApp;
    for (var registeredDecoration in registeredDecorations) {
      createWidget = registeredDecoration.createDecoratedApp(context, originalAppkey, createWidget, model);
    }

    return createWidget;
  }

  @override
  CreateWidget createDecoratedDialog(BuildContext context, Key? originalDialogKey, CreateWidget createOriginalDialog, DialogModel model) {
    var createWidget = createOriginalDialog;
    for (var registeredDecoration in registeredDecorations) {
      createWidget = registeredDecoration.createDecoratedDialog(context, originalDialogKey, createWidget, model);
    }

    return createWidget;
  }
}
