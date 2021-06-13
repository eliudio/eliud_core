import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/model/access_model.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/background_model.dart';
import 'package:eliud_core/model/font_model.dart';
import 'package:eliud_core/model/icon_model.dart';
import 'package:eliud_core/model/rgb_model.dart';
import 'package:eliud_core/style/frontend/frontend_form_style.dart';
import 'package:eliud_core/style/shared/interfaces.dart';
import 'package:eliud_core/style/shared/types.dart';
import 'package:eliud_core/tools/enums.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:eliud_core/core/navigate/navigate_bloc.dart';
import 'package:eliud_core/model/member_model.dart';

import '../eliud_style.dart';

abstract class EliudSharedImplementation
    implements HasTexFormField, HasDivider, HasButton, HasText, HasStyle, HasIcon, HasTable, HasAppBar {
  final EliudStyle _eliudStyle;

  EliudSharedImplementation(this._eliudStyle);

  @override
  Widget textFormField(
    BuildContext context, {
    required bool readOnly,
    String? initialValue,
    FormFieldValidator<String>? validator,
    TextInputType? keyboardType,
    IconData? icon,
    String? labelText,
    String? hintText,
    int? maxLines,
    ValueChanged<String>? onChanged,
    TextEditingController? textEditingController,
  }) {
    return TextFormField(
        style: TextStyle(
            color: RgbHelper.color(
                rgbo:
                    _eliudStyle.eliudStyleAttributesModel.formFieldTextColor)),
        readOnly: readOnly,
        onChanged: onChanged,
        controller: textEditingController,
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: RgbHelper.color(
                      rgbo: _eliudStyle
                          .eliudStyleAttributesModel.formFieldTextColor))),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: RgbHelper.color(
                      rgbo: _eliudStyle
                          .eliudStyleAttributesModel.formFieldFocusColor))),
          icon: icon == null
              ? null
              : Icon(icon,
                  color: RgbHelper.color(
                      rgbo: _eliudStyle
                          .eliudStyleAttributesModel.formFieldHeaderColor)),
          labelText: labelText,
        ),
        keyboardType: TextInputType.text,
        validator: validator,
        initialValue: initialValue);
  }

  @override
  Widget divider(BuildContext context) {
    return Divider(
        height: 1.0,
        thickness: 1.0,
        color: RgbHelper.color(
            rgbo: _eliudStyle.eliudStyleAttributesModel.dividerColor));
  }

  @override
  Widget button(BuildContext context,
      {Icon? icon, required String label, VoidCallback? onPressed}) {
    if (icon != null) {
      return ElevatedButton.icon(
        onPressed: onPressed,
        icon: icon!,
        label: Text(label),
      );
    } else {
      return ElevatedButton(
        onPressed: onPressed,
        child: Text(label),
      );
    }
  }

  @override
  Widget text(BuildContext context, String data, {TextAlign? textAlign, }) {
    return Text(data,
        textAlign: textAlign,
        style: FontTools.textStyle(
            _eliudStyle.eliudStyleAttributesModel.fontText));
  }

  @override
  Widget highLight1(BuildContext context, String data, {TextAlign? textAlign, }) {
    return Text(data,
        textAlign: textAlign,
        style: FontTools.textStyle(
            _eliudStyle.eliudStyleAttributesModel.fontHighlight1));
  }

  @override
  Widget highLight2(BuildContext context, String data, {TextAlign? textAlign, }) {
    return Text(data,
        textAlign: textAlign,
        style: FontTools.textStyle(
            _eliudStyle.eliudStyleAttributesModel.fontHighlight2));
  }

  @override
  Widget h1(BuildContext context, String data, {TextAlign? textAlign, }) {
    return Text(data,
        textAlign: textAlign,
        style: FontTools.textStyle(
            _eliudStyle.eliudStyleAttributesModel.h1));
  }

  @override
  Widget h2(BuildContext context, String data, {TextAlign? textAlign, }) {
    return Text(data,
        textAlign: textAlign,
        style: FontTools.textStyle(
            _eliudStyle.eliudStyleAttributesModel.h2));
  }

  @override
  Widget h3(BuildContext context, String data, {TextAlign? textAlign, }) {
    return Text(data,
        textAlign: textAlign,
        style: FontTools.textStyle(
            _eliudStyle.eliudStyleAttributesModel.h3));
  }

  @override
  Widget h4(BuildContext context, String data, {TextAlign? textAlign, }) {
    return Text(data,
        textAlign: textAlign,
        style: FontTools.textStyle(
            _eliudStyle.eliudStyleAttributesModel.h4));
  }

  @override
  Widget h5(BuildContext context, String data, {TextAlign? textAlign, }) {
    return Text(data,
        textAlign: textAlign,
        style: FontTools.textStyle(
            _eliudStyle.eliudStyleAttributesModel.h5));
  }

  @override
  TextStyle? styleText(BuildContext context) {
    return FontTools.textStyle(
        _eliudStyle.eliudStyleAttributesModel.fontText);
  }

  @override
  TextStyle? styleHighLight1(BuildContext context) {
    return FontTools.textStyle(
        _eliudStyle.eliudStyleAttributesModel.fontHighlight1);
  }

  @override
  TextStyle? styleHighLight2(BuildContext context) {
    return FontTools.textStyle(
        _eliudStyle.eliudStyleAttributesModel.fontHighlight2);
  }

  @override
  TextStyle? styleH1(BuildContext context) {
    return FontTools.textStyle(
        _eliudStyle.eliudStyleAttributesModel.h1);
  }

  @override
  TextStyle? styleH2(BuildContext context) {
    return FontTools.textStyle(
        _eliudStyle.eliudStyleAttributesModel.h2);
  }

  @override
  TextStyle? styleH3(BuildContext context) {
    return FontTools.textStyle(
        _eliudStyle.eliudStyleAttributesModel.h3);
  }

  @override
  TextStyle? styleH4(BuildContext context) {
    return FontTools.textStyle(
        _eliudStyle.eliudStyleAttributesModel.h4);
  }

  @override
  TextStyle? styleH5(BuildContext context) {
    return FontTools.textStyle(
        _eliudStyle.eliudStyleAttributesModel.h5);
  }

  @override
  Widget h1Icon(BuildContext context, IconModel icon, {TextAlign? textAlign, }) {
    var style = FontTools.textStyle(_eliudStyle.eliudStyleAttributesModel.h1);
    return IconHelper.getIconFromModelWithFlutterColor(iconModel: icon, color: style != null ? style.color : null);
  }

  @override
  Widget h2Icon(BuildContext context, IconModel icon, {TextAlign? textAlign, }) {
    var style = FontTools.textStyle(_eliudStyle.eliudStyleAttributesModel.h2);
    return IconHelper.getIconFromModelWithFlutterColor(iconModel: icon, color: style != null ? style.color : null);
  }

  @override
  Widget h3Icon(BuildContext context, IconModel icon, {TextAlign? textAlign, }) {
    var style = FontTools.textStyle(_eliudStyle.eliudStyleAttributesModel.h3);
    return IconHelper.getIconFromModelWithFlutterColor(iconModel: icon, color: style != null ? style.color : null);
  }

  @override
  Widget h4Icon(BuildContext context, IconModel icon, {TextAlign? textAlign, }) {
    var style = FontTools.textStyle(_eliudStyle.eliudStyleAttributesModel.h4);
    return IconHelper.getIconFromModelWithFlutterColor(iconModel: icon, color: style != null ? style.color : null);
  }

  @override
  Widget h5Icon(BuildContext context, IconModel icon, {TextAlign? textAlign, }) {
    var style = FontTools.textStyle(_eliudStyle.eliudStyleAttributesModel.h5);
    return IconHelper.getIconFromModelWithFlutterColor(iconModel: icon, color: style != null ? style.color : null);
  }

  @override
  Widget table(BuildContext context, {required List<TableRow> children}) {
    return Table(
      defaultColumnWidth: IntrinsicColumnWidth(),
      border: TableBorder.symmetric(inside: BorderSide(color: RgbHelper.color(rgbo: _eliudStyle.eliudStyleAttributesModel.dividerColor))),
      children: children,
    );
  }


  @override
  PreferredSizeWidget appBarWithString(BuildContext context, {required String title, List<Widget>? actions, IconThemeData? iconTheme, BackgroundModel? background}) {
    var accessState = AccessBloc.getState(context);
    return appBarWithWidget(context, title: Text(title,
        style: TextStyle(
            color: RgbHelper.color(
                rgbo: _eliudStyle
                    .eliudStyleAttributesModel.formAppBarTextColor))),
        actions: actions,
        iconTheme: iconTheme,
        background: background);
  }


  @override
  PreferredSizeWidget appBarWithWidget(BuildContext context, {required Widget title, List<Widget>? actions, IconThemeData? iconTheme, BackgroundModel? background}) {
    var accessState = AccessBloc.getState(context);
    return AppBar(
      title: title,
      actions: actions,
      iconTheme: iconTheme,
      flexibleSpace: Container(
          decoration: BoxDecorationHelper.boxDecoration(accessState,
              _eliudStyle.eliudStyleAttributesModel.formAppBarBackground)),
    );

  }
}
