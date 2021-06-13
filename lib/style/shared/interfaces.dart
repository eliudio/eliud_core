import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/model/access_model.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/background_model.dart';
import 'package:eliud_core/model/font_model.dart';
import 'package:eliud_core/model/grid_view_model.dart';
import 'package:eliud_core/model/icon_model.dart';
import 'package:eliud_core/model/rgb_model.dart';
import 'package:eliud_core/style/frontend/frontend_form_style.dart';
import 'package:eliud_core/style/shared/types.dart';
import 'package:eliud_core/tools/enums.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:eliud_core/core/navigate/navigate_bloc.dart';
import 'package:eliud_core/model/member_model.dart';

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
  Widget text(BuildContext context, String data, {TextAlign? textAlign, });
  Widget highLight1(BuildContext context, String data, {TextAlign? textAlign, });
  Widget highLight2(BuildContext context, String data, {TextAlign? textAlign, });
  Widget h1(BuildContext context, String data, {TextAlign? textAlign, });
  Widget h2(BuildContext context, String data, {TextAlign? textAlign, });
  Widget h3(BuildContext context, String data, {TextAlign? textAlign, });
  Widget h4(BuildContext context, String data, {TextAlign? textAlign, });
  Widget h5(BuildContext context, String data, {TextAlign? textAlign, });
}

abstract class HasIcon {
  Widget h1Icon(BuildContext context, IconModel icon, {TextAlign? textAlign, });
  Widget h2Icon(BuildContext context, IconModel icon, {TextAlign? textAlign, });
  Widget h3Icon(BuildContext context, IconModel icon, {TextAlign? textAlign, });
  Widget h4Icon(BuildContext context, IconModel icon, {TextAlign? textAlign, });
  Widget h5Icon(BuildContext context, IconModel icon, {TextAlign? textAlign, });
}

abstract class HasTable {
  Widget table(BuildContext context, {required List<TableRow> children});
}

abstract class HasAppBar {
  PreferredSizeWidget appBarWithWidget(BuildContext context, {required Widget title, List<Widget>? actions, IconThemeData? iconTheme, BackgroundModel? background});
  PreferredSizeWidget appBarWithString(BuildContext context, {required String title, List<Widget>? actions, IconThemeData? iconTheme, BackgroundModel? background});
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
