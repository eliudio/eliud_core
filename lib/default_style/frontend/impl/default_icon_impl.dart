import 'package:eliud_core/model/icon_model.dart';
import 'package:eliud_core/style/frontend/has_icon.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:flutter/material.dart';

class DefaultIconImpl implements HasIcon {
  @override
  Widget h1Icon(BuildContext context,
      {required IconModel icon, String? semanticLabel}) {
    return IconHelper.getIconFromModelWithFlutterColor(
        iconModel: icon,
        semanticLabel: semanticLabel);
  }

  @override
  Widget h2Icon(BuildContext context,
      {required IconModel icon, String? semanticLabel}) => h1Icon(context, icon: icon, semanticLabel: semanticLabel);

  @override
  Widget h3Icon(BuildContext context,
      {required IconModel icon, String? semanticLabel}) => h1Icon(context, icon: icon, semanticLabel: semanticLabel);

  @override
  Widget h4Icon(BuildContext context,
      {required IconModel icon, String? semanticLabel}) => h1Icon(context, icon: icon, semanticLabel: semanticLabel);

  @override
  Widget h5Icon(BuildContext context,
      {required IconModel icon, String? semanticLabel}) => h1Icon(context, icon: icon, semanticLabel: semanticLabel);

  @override
  Widget h1Icon2(BuildContext context,
      {required IconData iconData, String? semanticLabel}) {
    return IconHelper.getIcon(
        iconData: iconData,
        semanticLabel: semanticLabel);
  }

  @override
  Widget h2Icon2(BuildContext context,
      {required IconData iconData, String? semanticLabel}) => h1Icon2(context, iconData: iconData, semanticLabel: semanticLabel);

  @override
  Widget h3Icon2(BuildContext context,
      {required IconData iconData, String? semanticLabel})  => h1Icon2(context, iconData: iconData, semanticLabel: semanticLabel);

  @override
  Widget h4Icon2(BuildContext context,
      {required IconData iconData, String? semanticLabel})  => h1Icon2(context, iconData: iconData, semanticLabel: semanticLabel);

  @override
  Widget h5Icon2(BuildContext context,
      {required IconData iconData, String? semanticLabel})  => h1Icon2(context, iconData: iconData, semanticLabel: semanticLabel);
}
