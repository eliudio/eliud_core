import 'package:eliud_core/model/background_model.dart';
import 'package:eliud_core/model/grid_view_model.dart';
import 'package:eliud_core/model/icon_model.dart';
import 'package:eliud_core/model/menu_item_model.dart';
import 'package:eliud_core/model/rgb_model.dart';
import 'package:flutter/material.dart';

abstract class HasTexFormField {
  Widget textFormField(
      BuildContext context,
      {required bool readOnly, String? initialValue, FormFieldValidator<String>? validator, TextInputType? keyboardType, IconData icon, String? labelText, String? hintText, int? maxLines, ValueChanged<String>? onChanged, TextEditingController? textEditingController,});
}

abstract class HasDivider {
  Widget divider(BuildContext context);
}

abstract class HasButton {
  Widget button(BuildContext context, {Icon? icon, required String label, VoidCallback? onPressed});
  Widget buttonWithChild(BuildContext context, {Icon? icon, required Widget child, VoidCallback? onPressed});
}

abstract class HasStyle {
  TextStyle? styleText(BuildContext context);
  TextStyle? styleHighLight1(BuildContext context);
  TextStyle? styleHighLight2(BuildContext context);
  TextStyle? styleH1(BuildContext context);
  TextStyle? styleH2(BuildContext context);
  TextStyle? styleH3(BuildContext context);
  TextStyle? styleH4(BuildContext context);
  TextStyle? styleH5(BuildContext context);
}

abstract class HasText {
  Widget text(BuildContext context, String data, {TextAlign? textAlign, int? maxLines, bool? softWrap, });
  Widget highLight1(BuildContext context, String data, {TextAlign? textAlign, int? maxLines, bool? softWrap, });
  Widget highLight2(BuildContext context, String data, {TextAlign? textAlign, int? maxLines, bool? softWrap, });
  Widget h1(BuildContext context, String data, {TextAlign? textAlign, int? maxLines, bool? softWrap, });
  Widget h2(BuildContext context, String data, {TextAlign? textAlign, int? maxLines, bool? softWrap, });
  Widget h3(BuildContext context, String data, {TextAlign? textAlign, int? maxLines, bool? softWrap, });
  Widget h4(BuildContext context, String data, {TextAlign? textAlign, int? maxLines, bool? softWrap, });
  Widget h5(BuildContext context, String data, {TextAlign? textAlign, int? maxLines, bool? softWrap, });
}

abstract class HasIcon {
  Widget h1Icon(BuildContext context, {required IconModel icon, String? semanticLabel});
  Widget h2Icon(BuildContext context, {required IconModel icon, String? semanticLabel});
  Widget h3Icon(BuildContext context, {required IconModel icon, String? semanticLabel});
  Widget h4Icon(BuildContext context, {required IconModel icon, String? semanticLabel});
  Widget h5Icon(BuildContext context, {required IconModel icon, String? semanticLabel});

  Widget h1Icon2(BuildContext context, {required IconData iconData, String? semanticLabel});
  Widget h2Icon2(BuildContext context, {required IconData iconData, String? semanticLabel});
  Widget h3Icon2(BuildContext context, {required IconData iconData, String? semanticLabel});
  Widget h4Icon2(BuildContext context, {required IconData iconData, String? semanticLabel});
  Widget h5Icon2(BuildContext context, {required IconData iconData, String? semanticLabel});
}

abstract class HasTable {
  Widget table(BuildContext context, {required List<TableRow> children});
}

abstract class HasAppBar {
  PreferredSizeWidget appBarWithWidget(BuildContext context, {required Widget title, List<Widget>? actions, IconThemeData? iconTheme, BackgroundModel? backgroundOverride});
  PreferredSizeWidget appBarWithString(BuildContext context, {required String title, List<Widget>? actions, IconThemeData? iconTheme, BackgroundModel? backgroundOverride});
}

enum DrawerType { Left, Right }

class DrawerHeader1Attributes {
  final double? height;
  final String text;
  final BackgroundModel? backgroundOverride;

  DrawerHeader1Attributes(this.height, this.text, this.backgroundOverride);
}

class DrawerHeader2Attributes {
  final double? height;
  final String text;

  DrawerHeader2Attributes(this.height, this.text);
}

class DrawerItemAttributes {
  final MenuItemModel menuItemModel;
  final bool isActive;

  DrawerItemAttributes(this.menuItemModel, this.isActive);
}

abstract class HasDrawer {
  Drawer drawer(BuildContext context,
      {String? currentPage, required DrawerType drawerType, DrawerHeader1Attributes? header1, DrawerHeader2Attributes? header2, BackgroundModel? backgroundOverride, required List<DrawerItemAttributes> items});
}

class BottomNavigationBarItemAttributes {
  final String label;
  final bool isActive;
  final IconModel icon;

  BottomNavigationBarItemAttributes(this.label, this.icon, this.isActive);
}

abstract class HasBottomNavigationBar {
  Widget bottomNavigatorBar(BuildContext context,
      {required List<BottomNavigationBarItemAttributes> items,
        BackgroundModel? background,
        ValueChanged<int>? onTap});
}

enum Layout {
  GridView, ListView, OnlyTheFirstComponent, Unknown
}

abstract class HasPageBody {
  Widget pageBody(BuildContext context, {BackgroundModel? backgroundOverride, required List<Widget> components, Layout? layout, GridViewModel? gridView});
}

class MenuItemAttributes {
  final int value;
  final String label;
  final bool isActive;

  MenuItemAttributes(this.value, this.label, this.isActive);
}

typedef MenuItemSelected = void Function(int selected);

abstract class HasMenu {
  Future<void> openMenu(BuildContext context, {required RelativeRect position, required List<MenuItemAttributes> menuItems, MenuItemSelected? onSelected, RgbModel? popupMenuBackgroundColorOverride});
}
