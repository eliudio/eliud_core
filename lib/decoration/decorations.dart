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
  Widget decorateApp(BuildContext context, Key? key, Widget app, AppModel model) {
    var decoratedWidget = app;
    for (var registeredDecoration in registeredDecorations) {
      decoratedWidget = registeredDecoration.decorateApp(context, key, decoratedWidget, model);
    }
    return decoratedWidget;
  }

  @override
  Widget decorateAppBar(BuildContext context, Key? key, Widget appBar, AppBarModel model) {
    var decoratedWidget = appBar;
    for (var registeredDecoration in registeredDecorations) {
      decoratedWidget = registeredDecoration.decorateAppBar(context, key, decoratedWidget, model);
    }
    return decoratedWidget;
  }

  @override
  Widget decorateBodyComponent(BuildContext context, Key? key, Widget bodyComponent, BodyComponentModel model) {
    var decoratedWidget = bodyComponent;
    for (var registeredDecoration in registeredDecorations) {
      decoratedWidget = registeredDecoration.decorateBodyComponent(context, key, decoratedWidget, model);
    }
    return decoratedWidget;
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
