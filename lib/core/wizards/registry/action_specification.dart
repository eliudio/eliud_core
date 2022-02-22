import 'package:eliud_core/core/wizards/registry/registry.dart';

class ActionSpecification {
  bool requiresAccessToLocalFileSystem;
  bool availableInLeftDrawer;
  bool availableInRightDrawer;
  bool availableInAppBar;
  bool availableInHomeMenu;
  bool available; // available but not from any menu

  ActionSpecification(
      {required this.requiresAccessToLocalFileSystem,
      required this.availableInLeftDrawer,
      required this.availableInRightDrawer,
      required this.availableInAppBar,
      required this.availableInHomeMenu,
      required this.available});

  bool shouldCreatePageDialogOrWorkflow() =>
      availableInLeftDrawer ||
      availableInRightDrawer ||
      availableInAppBar ||
      availableInHomeMenu ||
      available;

  /*
   * Do these specifications indacte we should generate the menu for a specific menu type?
   */
  bool should(MenuType type) =>
      (type == MenuType.leftDrawerMenu) && availableInLeftDrawer ||
      (type == MenuType.rightDrawerMenu) && availableInRightDrawer ||
      (type == MenuType.bottomNavBarMenu) && availableInHomeMenu ||
      (type == MenuType.appBarMenu) && availableInAppBar;
}
