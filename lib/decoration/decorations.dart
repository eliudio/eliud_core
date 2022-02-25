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
  CreateWidget createDecoratedAppBar(AppModel app, BuildContext context, Key? key, CreateWidget createAppBar, AppBarModel model) {
    var createWidget = createAppBar;
    for (var registeredDecoration in registeredDecorations) {
      createWidget = registeredDecoration.createDecoratedAppBar(app, context, key, createWidget, model);
    }

    return createWidget;
  }

  @override
  CreateWidget createDecoratedBodyComponent(AppModel app, BuildContext context, Key? key, CreateWidget createBodyComponent, BodyComponentModel model) {
    var createWidget = createBodyComponent;
    for (var registeredDecoration in registeredDecorations) {
      createWidget = registeredDecoration.createDecoratedBodyComponent(app, context, key, createWidget, model);
    }

    return createWidget;
  }

  @override
  CreateWidget createDecoratedDrawer(AppModel app, BuildContext context, DecorationDrawerType decorationDrawerType, Key? originalDrawerKey, CreateWidget createOriginalDrawer, DrawerModel model) {
    var createWidget = createOriginalDrawer;
    for (var registeredDecoration in registeredDecorations) {
      createWidget = registeredDecoration.createDecoratedDrawer(app, context, decorationDrawerType, originalDrawerKey, createWidget, model);
    }

    return createWidget;
  }

  @override
  CreateWidget createDecoratedBottomNavigationBar(AppModel app, BuildContext context, Key? originalBottomNavigationBarKey, CreateWidget createBottomNavigationBar, HomeMenuModel model) {
    var createWidget = createBottomNavigationBar;
    for (var registeredDecoration in registeredDecorations) {
      createWidget = registeredDecoration.createDecoratedBottomNavigationBar(app, context, originalBottomNavigationBarKey, createWidget, model);
    }

    return createWidget;
  }

  @override
  CreateWidget createDecoratedPage(AppModel app, BuildContext context, Key? originalPageKey, CreateWidget createOriginalPage, PageModel model) {
    var createWidget = createOriginalPage;
    for (var registeredDecoration in registeredDecorations) {
      createWidget = registeredDecoration.createDecoratedPage(app, context, originalPageKey, createWidget, model);
    }

    return createWidget;
  }

  @override
  CreateWidget createDecoratedErrorPage(AppModel app, BuildContext context, Key? originalPageKey, CreateWidget createOriginalPage) {
    var createWidget = createOriginalPage;
    for (var registeredDecoration in registeredDecorations) {
      createWidget = registeredDecoration.createDecoratedErrorPage(app, context, originalPageKey, createWidget);
    }

    return createWidget;
  }

  @override
  CreateWidget createDecoratedApp(AppModel app, BuildContext context, Key? originalAppkey, CreateWidget createOriginalApp, AppModel model) {
    var createWidget = createOriginalApp;
    for (var registeredDecoration in registeredDecorations) {
      createWidget = registeredDecoration.createDecoratedApp(app, context, originalAppkey, createWidget, model);
    }

    return createWidget;
  }

  @override
  CreateWidget createDecoratedDialog(AppModel app, BuildContext context, Key? originalDialogKey, CreateWidget createOriginalDialog, DialogModel model) {
    var createWidget = createOriginalDialog;
    for (var registeredDecoration in registeredDecorations) {
      createWidget = registeredDecoration.createDecoratedDialog(app, context, originalDialogKey, createWidget, model);
    }

    return createWidget;
  }

}
