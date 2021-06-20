import 'package:eliud_core/model/icon_model.dart';
import 'package:eliud_core/style/frontend/has_text.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:flutter/material.dart';

import '../../eliud_style.dart';

class EliudTextImpl
    implements HasText {
  final EliudStyle _eliudStyle;

  EliudTextImpl(this._eliudStyle);

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

}
