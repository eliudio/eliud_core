import 'package:eliud_core/decoration/decoration.dart';
import 'package:eliud_core/model/app_bar_model.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/body_component_model.dart';
import 'package:eliud_core/model/dialog_model.dart';
import 'package:eliud_core/model/drawer_model.dart';
import 'package:eliud_core/model/home_menu_model.dart';
import 'package:eliud_core/model/page_model.dart';
import 'package:flutter/src/widgets/framework.dart';

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
  Widget decorateApp(Key? key, Widget app, AppModel model) {
    var decoratedWidget = app;
    for (var registeredDecoration in registeredDecorations) {
      decoratedWidget = registeredDecoration.decorateApp(key, decoratedWidget, model);
    }
    return decoratedWidget;
  }

  @override
  Widget decorateAppBar(Key? key, Widget appBar, AppBarModel model) {
    var decoratedWidget = appBar;
    for (var registeredDecoration in registeredDecorations) {
      decoratedWidget = registeredDecoration.decorateAppBar(key, decoratedWidget, model);
    }
    return decoratedWidget;
  }

  @override
  Widget decorateBodyComponent(Key? key, Widget bodyComponent, BodyComponentModel model) {
    var decoratedWidget = bodyComponent;
    for (var registeredDecoration in registeredDecorations) {
      decoratedWidget = registeredDecoration.decorateBodyComponent(key, decoratedWidget, model);
    }
    return decoratedWidget;
  }

  @override
  Widget decorateDialog(Key? key, Widget dialog, DialogModel model) {
    var decoratedWidget = dialog;
    for (var registeredDecoration in registeredDecorations) {
      decoratedWidget = registeredDecoration.decorateDialog(key, decoratedWidget, model);
    }
    return decoratedWidget;
  }

  @override
  Widget decorateDrawer(Key? key, Widget drawer, DrawerModel model) {
    var decoratedWidget = drawer;
    for (var registeredDecoration in registeredDecorations) {
      decoratedWidget = registeredDecoration.decorateDrawer(key, decoratedWidget, model);
    }
    return decoratedWidget;
  }

  @override
  Widget decoratePage(Key? key, Widget page, PageModel model) {
    var decoratedWidget = page;
    for (var registeredDecoration in registeredDecorations) {
      decoratedWidget = registeredDecoration.decoratePage(key, decoratedWidget, model);
    }
    return decoratedWidget;
  }

  @override
  List<Object?> get props => [];

  @override
  Widget decorateBottomNavigationBar(Key? key, Widget bottomNavigationBar, HomeMenuModel model) {
    var decoratedWidget = bottomNavigationBar;
    for (var registeredDecoration in registeredDecorations) {
      decoratedWidget = registeredDecoration.decorateBottomNavigationBar(key, decoratedWidget, model);
    }
    return decoratedWidget;
  }
}
