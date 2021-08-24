import 'package:eliud_core/model/icon_model.dart';
import 'package:eliud_core/style/frontend/has_style.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:flutter/material.dart';

import '../../eliud_style.dart';

class EliudStyleImpl implements HasStyle {
  final EliudStyle _eliudStyle;

  EliudStyleImpl(this._eliudStyle);

  @override
  TextStyle? styleText(BuildContext context) {
    return FontTools.textStyle(_eliudStyle.eliudStyleAttributesModel.fontText);
  }

  @override
  TextStyle? styleSmallText(BuildContext context) {
    return FontTools.textStyle(_eliudStyle.eliudStyleAttributesModel.fontSmallText);
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
    return FontTools.textStyle(_eliudStyle.eliudStyleAttributesModel.h1);
  }

  @override
  TextStyle? styleH2(BuildContext context) {
    return FontTools.textStyle(_eliudStyle.eliudStyleAttributesModel.h2);
  }

  @override
  TextStyle? styleH3(BuildContext context) {
    return FontTools.textStyle(_eliudStyle.eliudStyleAttributesModel.h3);
  }

  @override
  TextStyle? styleH4(BuildContext context) {
    return FontTools.textStyle(_eliudStyle.eliudStyleAttributesModel.h4);
  }

  @override
  TextStyle? styleH5(BuildContext context) {
    return FontTools.textStyle(_eliudStyle.eliudStyleAttributesModel.h5);
  }
}
