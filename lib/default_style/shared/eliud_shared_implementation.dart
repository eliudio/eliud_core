import 'package:eliud_core/model/icon_model.dart';
import 'package:eliud_core/style/shared/has_button.dart';
import 'package:eliud_core/style/shared/has_divider.dart';
import 'package:eliud_core/style/shared/has_icon.dart';
import 'package:eliud_core/style/shared/has_style.dart';
import 'package:eliud_core/style/shared/has_table.dart';
import 'package:eliud_core/style/shared/has_text.dart';
import 'package:eliud_core/style/shared/has_text.dart';
import 'package:eliud_core/style/shared/has_text_form_field.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:flutter/material.dart';

import '../eliud_style.dart';

abstract class EliudSharedImplementation
    implements HasTexFormField, HasDivider, HasButton, HasText, HasStyle, HasIcon, HasTable {
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
    return buttonWithChild(context, icon: icon, child: Text(label), onPressed: onPressed);
  }

  @override
  Widget buttonWithChild(BuildContext context,
      {Icon? icon, required Widget child, VoidCallback? onPressed}) {
    if (icon != null) {
      return ElevatedButton.icon(
        onPressed: onPressed,
        icon: icon!,
        label: child,
      );
    } else {
      return ElevatedButton(
        onPressed: onPressed,
        child: child,
      );
    }
  }

  @override
  Widget text(BuildContext context, String data, {TextAlign? textAlign, int? maxLines, bool? softWrap}) {
    return Text(data,
        textAlign: textAlign,
        maxLines: maxLines,
        softWrap: softWrap,
        style: FontTools.textStyle(
            _eliudStyle.eliudStyleAttributesModel.fontText));
  }

  @override
  Widget highLight1(BuildContext context, String data, {TextAlign? textAlign, int? maxLines, bool? softWrap }) {
    return Text(data,
        textAlign: textAlign,
        maxLines: maxLines,
        softWrap: softWrap,
        style: FontTools.textStyle(
            _eliudStyle.eliudStyleAttributesModel.fontHighlight1));
  }

  @override
  Widget highLight2(BuildContext context, String data, {TextAlign? textAlign, int? maxLines, bool? softWrap }) {
    return Text(data,
        textAlign: textAlign,
        maxLines: maxLines,
        softWrap: softWrap,
        style: FontTools.textStyle(
            _eliudStyle.eliudStyleAttributesModel.fontHighlight2));
  }

  @override
  Widget h1(BuildContext context, String data, {TextAlign? textAlign, int? maxLines, bool? softWrap }) {
    return Text(data,
        textAlign: textAlign,
        maxLines: maxLines,
        softWrap: softWrap,
        style: FontTools.textStyle(
            _eliudStyle.eliudStyleAttributesModel.h1));
  }

  @override
  Widget h2(BuildContext context, String data, {TextAlign? textAlign, int? maxLines, bool? softWrap }) {
    return Text(data,
        textAlign: textAlign,
        maxLines: maxLines,
        softWrap: softWrap,
        style: FontTools.textStyle(
            _eliudStyle.eliudStyleAttributesModel.h2));
  }

  @override
  Widget h3(BuildContext context, String data, {TextAlign? textAlign, int? maxLines, bool? softWrap }) {
    return Text(data,
        textAlign: textAlign,
        maxLines: maxLines,
        softWrap: softWrap,
        style: FontTools.textStyle(
            _eliudStyle.eliudStyleAttributesModel.h3));
  }

  @override
  Widget h4(BuildContext context, String data, {TextAlign? textAlign, int? maxLines, bool? softWrap }) {
    return Text(data,
        textAlign: textAlign,
        maxLines: maxLines,
        softWrap: softWrap,
        style: FontTools.textStyle(
            _eliudStyle.eliudStyleAttributesModel.h4));
  }

  @override
  Widget h5(BuildContext context, String data, {TextAlign? textAlign, int? maxLines, bool? softWrap }) {
    return Text(data,
        textAlign: textAlign,
        maxLines: maxLines,
        softWrap: softWrap,
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
  Widget h1Icon(BuildContext context, {required IconModel icon, String? semanticLabel}) {
    var style = FontTools.textStyle(_eliudStyle.eliudStyleAttributesModel.h1);
    return IconHelper.getIconFromModelWithFlutterColor(iconModel: icon, color: style != null ? style.color : null, semanticLabel: semanticLabel);
  }

  @override
  Widget h2Icon(BuildContext context, {required IconModel icon, String? semanticLabel}) {
    var style = FontTools.textStyle(_eliudStyle.eliudStyleAttributesModel.h2);
    return IconHelper.getIconFromModelWithFlutterColor(iconModel: icon, color: style != null ? style.color : null, semanticLabel: semanticLabel);
  }

  @override
  Widget h3Icon(BuildContext context, {required IconModel icon, String? semanticLabel}) {
    var style = FontTools.textStyle(_eliudStyle.eliudStyleAttributesModel.h3);
    return IconHelper.getIconFromModelWithFlutterColor(iconModel: icon, color: style != null ? style.color : null, semanticLabel: semanticLabel);
  }

  @override
  Widget h4Icon(BuildContext context, {required IconModel icon, String? semanticLabel}) {
    var style = FontTools.textStyle(_eliudStyle.eliudStyleAttributesModel.h4);
    return IconHelper.getIconFromModelWithFlutterColor(iconModel: icon, color: style != null ? style.color : null, semanticLabel: semanticLabel);
  }

  @override
  Widget h5Icon(BuildContext context, {required IconModel icon, String? semanticLabel}) {
    var style = FontTools.textStyle(_eliudStyle.eliudStyleAttributesModel.h5);
    return IconHelper.getIconFromModelWithFlutterColor(iconModel: icon, color: style != null ? style.color : null, semanticLabel: semanticLabel);
  }

  @override
  Widget h1Icon2(BuildContext context, {required IconData iconData, String? semanticLabel}) {
    var style = FontTools.textStyle(_eliudStyle.eliudStyleAttributesModel.h1);
    return IconHelper.getIcon(iconData: iconData, color: style != null ? style.color : null, semanticLabel: semanticLabel);
  }

  @override
  Widget h2Icon2(BuildContext context, {required IconData iconData, String? semanticLabel}) {
    var style = FontTools.textStyle(_eliudStyle.eliudStyleAttributesModel.h2);
    return IconHelper.getIcon(iconData: iconData, color: style != null ? style.color : null, semanticLabel: semanticLabel);
  }

  @override
  Widget h3Icon2(BuildContext context, {required IconData iconData, String? semanticLabel}) {
    var style = FontTools.textStyle(_eliudStyle.eliudStyleAttributesModel.h3);
    return IconHelper.getIcon(iconData: iconData, color: style != null ? style.color : null, semanticLabel: semanticLabel);
  }

  @override
  Widget h4Icon2(BuildContext context, {required IconData iconData, String? semanticLabel}) {
    var style = FontTools.textStyle(_eliudStyle.eliudStyleAttributesModel.h4);
    return IconHelper.getIcon(iconData: iconData, color: style != null ? style.color : null, semanticLabel: semanticLabel);
  }

  @override
  Widget h5Icon2(BuildContext context, {required IconData iconData, String? semanticLabel}) {
    var style = FontTools.textStyle(_eliudStyle.eliudStyleAttributesModel.h5);
    return IconHelper.getIcon(iconData: iconData, color: style != null ? style.color : null, semanticLabel: semanticLabel);
  }

  @override
  Widget table(BuildContext context, {required List<TableRow> children}) {
    return Table(
      defaultColumnWidth: IntrinsicColumnWidth(),
      border: TableBorder.symmetric(inside: BorderSide(color: RgbHelper.color(rgbo: _eliudStyle.eliudStyleAttributesModel.dividerColor))),
      children: children,
    );
  }

}
