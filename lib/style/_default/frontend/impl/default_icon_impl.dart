import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/icon_model.dart';
import 'package:eliud_core/style/frontend/has_icon.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:flutter/material.dart';

class DefaultIconImpl implements HasIcon {
  @override
  Widget h1Icon(AppModel app, BuildContext context,
      {required IconModel icon, String? semanticLabel}) {
    return IconHelper.getIconFromModelWithFlutterColor(
        iconModel: icon,
        semanticLabel: semanticLabel);
  }

  @override
  Widget h2Icon(AppModel app, BuildContext context,
      {required IconModel icon, String? semanticLabel}) => h1Icon(app, context, icon: icon, semanticLabel: semanticLabel);

  @override
  Widget h3Icon(AppModel app, BuildContext context,
      {required IconModel icon, String? semanticLabel}) => h1Icon(app, context, icon: icon, semanticLabel: semanticLabel);

  @override
  Widget h4Icon(AppModel app, BuildContext context,
      {required IconModel icon, String? semanticLabel}) => h1Icon(app, context, icon: icon, semanticLabel: semanticLabel);

  @override
  Widget h5Icon(AppModel app, BuildContext context,
      {required IconModel icon, String? semanticLabel}) => h1Icon(app, context, icon: icon, semanticLabel: semanticLabel);

  @override
  Widget h1Icon2(AppModel app, BuildContext context,
      {required IconData iconData, String? semanticLabel}) {
    return IconHelper.getIcon(
        iconData: iconData,
        semanticLabel: semanticLabel);
  }

  @override
  Widget h2Icon2(AppModel app, BuildContext context,
      {required IconData iconData, String? semanticLabel}) => h1Icon2(app, context, iconData: iconData, semanticLabel: semanticLabel);

  @override
  Widget h3Icon2(AppModel app, BuildContext context,
      {required IconData iconData, String? semanticLabel})  => h1Icon2(app, context, iconData: iconData, semanticLabel: semanticLabel);

  @override
  Widget h4Icon2(AppModel app, BuildContext context,
      {required IconData iconData, String? semanticLabel})  => h1Icon2(app, context, iconData: iconData, semanticLabel: semanticLabel);

  @override
  Widget h5Icon2(AppModel app, BuildContext context,
      {required IconData iconData, String? semanticLabel})  => h1Icon2(app, context, iconData: iconData, semanticLabel: semanticLabel);
}
