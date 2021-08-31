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

  @override
  Widget decorateApp(BuildContext context, Key? key, Widget app, AppModel model) {
    var decoratedWidget = app;
    for (var registeredDecoration in registeredDecorations) {
      decoratedWidget = registeredDecoration.decorateApp(context, key, decoratedWidget, model);
    }
    return decoratedWidget;
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
  Widget decorateDialog(BuildContext context, Key? key, Widget dialog, DialogModel model) {
    var decoratedWidget = dialog;
    for (var registeredDecoration in registeredDecorations) {
      decoratedWidget = registeredDecoration.decorateDialog(context, key, decoratedWidget, model);
    }
    return decoratedWidget;
  }

  @override
  Widget decorateDrawer(BuildContext context, Key? key, Widget drawer, DrawerModel model) {
    var decoratedWidget = drawer;
    for (var registeredDecoration in registeredDecorations) {
      decoratedWidget = registeredDecoration.decorateDrawer(context, key, decoratedWidget, model);
    }
    return decoratedWidget;
  }

  @override
  Widget decoratePage(BuildContext context, Key? key, Widget page, PageModel model) {
    var decoratedWidget = page;
    for (var registeredDecoration in registeredDecorations) {
      decoratedWidget = registeredDecoration.decoratePage(context, key, decoratedWidget, model);
    }
    return decoratedWidget;
  }

  @override
  List<Object?> get props => [];

  @override
  Widget decorateBottomNavigationBar(BuildContext context, Key? key, Widget bottomNavigationBar, HomeMenuModel model) {
    var decoratedWidget = bottomNavigationBar;
    for (var registeredDecoration in registeredDecorations) {
      decoratedWidget = registeredDecoration.decorateBottomNavigationBar(context, key, decoratedWidget, model);
    }
    return decoratedWidget;
  }
}
