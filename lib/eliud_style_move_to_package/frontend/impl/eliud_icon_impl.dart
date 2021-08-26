import 'package:eliud_core/model/icon_model.dart';
import 'package:eliud_core/style/frontend/has_icon.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:flutter/material.dart';

import '../../eliud_style.dart';

class EliudIconImpl implements HasIcon {
  final EliudStyle _eliudStyle;

  EliudIconImpl(this._eliudStyle);

  @override
  Widget h1Icon(BuildContext context,
      {required IconModel icon, String? semanticLabel}) {
    var style = FontTools.textStyle(_eliudStyle.eliudStyleAttributesModel.h1);
    return IconHelper.getIconFromModelWithFlutterColor(
        iconModel: icon,
        color: style != null ? style.color : null,
        semanticLabel: semanticLabel);
  }

  @override
  Widget h2Icon(BuildContext context,
      {required IconModel icon, String? semanticLabel}) {
    var style = FontTools.textStyle(_eliudStyle.eliudStyleAttributesModel.h2);
    return IconHelper.getIconFromModelWithFlutterColor(
        iconModel: icon,
        color: style != null ? style.color : null,
        semanticLabel: semanticLabel);
  }

  @override
  Widget h3Icon(BuildContext context,
      {required IconModel icon, String? semanticLabel}) {
    var style = FontTools.textStyle(_eliudStyle.eliudStyleAttributesModel.h3);
    return IconHelper.getIconFromModelWithFlutterColor(
        iconModel: icon,
        color: style != null ? style.color : null,
        semanticLabel: semanticLabel);
  }

  @override
  Widget h4Icon(BuildContext context,
      {required IconModel icon, String? semanticLabel}) {
    var style = FontTools.textStyle(_eliudStyle.eliudStyleAttributesModel.h4);
    return IconHelper.getIconFromModelWithFlutterColor(
        iconModel: icon,
        color: style != null ? style.color : null,
        semanticLabel: semanticLabel);
  }

  @override
  Widget h5Icon(BuildContext context,
      {required IconModel icon, String? semanticLabel}) {
    var style = FontTools.textStyle(_eliudStyle.eliudStyleAttributesModel.h5);
    return IconHelper.getIconFromModelWithFlutterColor(
        iconModel: icon,
        color: style != null ? style.color : null,
        semanticLabel: semanticLabel);
  }

  @override
  Widget h1Icon2(BuildContext context,
      {required IconData iconData, String? semanticLabel}) {
    var style = FontTools.textStyle(_eliudStyle.eliudStyleAttributesModel.h1);
    return IconHelper.getIcon(
        iconData: iconData,
        color: style != null ? style.color : null,
        semanticLabel: semanticLabel);
  }

  @override
  Widget h2Icon2(BuildContext context,
      {required IconData iconData, String? semanticLabel}) {
    var style = FontTools.textStyle(_eliudStyle.eliudStyleAttributesModel.h2);
    return IconHelper.getIcon(
        iconData: iconData,
        color: style != null ? style.color : null,
        semanticLabel: semanticLabel);
  }

  @override
  Widget h3Icon2(BuildContext context,
      {required IconData iconData, String? semanticLabel}) {
    var style = FontTools.textStyle(_eliudStyle.eliudStyleAttributesModel.h3);
    return IconHelper.getIcon(
        iconData: iconData,
        color: style != null ? style.color : null,
        semanticLabel: semanticLabel);
  }

  @override
  Widget h4Icon2(BuildContext context,
      {required IconData iconData, String? semanticLabel}) {
    var style = FontTools.textStyle(_eliudStyle.eliudStyleAttributesModel.h4);
    return IconHelper.getIcon(
        iconData: iconData,
        color: style != null ? style.color : null,
        semanticLabel: semanticLabel);
  }

  @override
  Widget h5Icon2(BuildContext context,
      {required IconData iconData, String? semanticLabel}) {
    var style = FontTools.textStyle(_eliudStyle.eliudStyleAttributesModel.h5);
    return IconHelper.getIcon(
        iconData: iconData,
        color: style != null ? style.color : null,
        semanticLabel: semanticLabel);
  }
}
