import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/icon_model.dart';
import 'package:flutter/material.dart';

import '../style_registry.dart';

abstract class HasIcon {
  Widget h1Icon(AppModel app, BuildContext context,
      {required IconModel icon, String? semanticLabel});
  Widget h2Icon(AppModel app, BuildContext context,
      {required IconModel icon, String? semanticLabel});
  Widget h3Icon(AppModel app, BuildContext context,
      {required IconModel icon, String? semanticLabel});
  Widget h4Icon(AppModel app, BuildContext context,
      {required IconModel icon, String? semanticLabel});
  Widget h5Icon(AppModel app, BuildContext context,
      {required IconModel icon, String? semanticLabel});

  Widget h1Icon2(AppModel app, BuildContext context,
      {required IconData iconData, String? semanticLabel});
  Widget h2Icon2(AppModel app, BuildContext context,
      {required IconData iconData, String? semanticLabel});
  Widget h3Icon2(AppModel app, BuildContext context,
      {required IconData iconData, String? semanticLabel});
  Widget h4Icon2(AppModel app, BuildContext context,
      {required IconData iconData, String? semanticLabel});
  Widget h5Icon2(AppModel app, BuildContext context,
      {required IconData iconData, String? semanticLabel});
}

Widget h1Icon(AppModel app, BuildContext context,
        {required IconModel icon, String? semanticLabel}) =>
    StyleRegistry.registry()
        .styleWithApp(app)
        .frontEndStyle()
        .iconStyle()
        .h1Icon(app, context, icon: icon, semanticLabel: semanticLabel);

Widget h2Icon(AppModel app, BuildContext context,
        {required IconModel icon, String? semanticLabel}) =>
    StyleRegistry.registry()
        .styleWithApp(app)
        .frontEndStyle()
        .iconStyle()
        .h2Icon(app, context, icon: icon, semanticLabel: semanticLabel);

Widget h3Icon(AppModel app, BuildContext context,
        {required IconModel icon, String? semanticLabel}) =>
    StyleRegistry.registry()
        .styleWithApp(app)
        .frontEndStyle()
        .iconStyle()
        .h3Icon(app, context, icon: icon, semanticLabel: semanticLabel);

Widget h4Icon(AppModel app, BuildContext context,
        {required IconModel icon, String? semanticLabel}) =>
    StyleRegistry.registry()
        .styleWithApp(app)
        .frontEndStyle()
        .iconStyle()
        .h4Icon(app, context, icon: icon, semanticLabel: semanticLabel);

Widget h5Icon(AppModel app, BuildContext context,
        {required IconModel icon, String? semanticLabel}) =>
    StyleRegistry.registry()
        .styleWithApp(app)
        .frontEndStyle()
        .iconStyle()
        .h5Icon(app, context, icon: icon, semanticLabel: semanticLabel);

Widget h1Icon2(AppModel app, BuildContext context,
        {required IconData iconData, String? semanticLabel}) =>
    StyleRegistry.registry()
        .styleWithApp(app)
        .frontEndStyle()
        .iconStyle()
        .h1Icon2(app, context,
            iconData: iconData, semanticLabel: semanticLabel);

Widget h2Icon2(AppModel app, BuildContext context,
        {required IconData iconData, String? semanticLabel}) =>
    StyleRegistry.registry()
        .styleWithApp(app)
        .frontEndStyle()
        .iconStyle()
        .h2Icon2(app, context,
            iconData: iconData, semanticLabel: semanticLabel);

Widget h3Icon2(AppModel app, BuildContext context,
        {required IconData iconData, String? semanticLabel}) =>
    StyleRegistry.registry()
        .styleWithApp(app)
        .frontEndStyle()
        .iconStyle()
        .h3Icon2(app, context,
            iconData: iconData, semanticLabel: semanticLabel);

Widget h4Icon2(AppModel app, BuildContext context,
        {required IconData iconData, String? semanticLabel}) =>
    StyleRegistry.registry()
        .styleWithApp(app)
        .frontEndStyle()
        .iconStyle()
        .h4Icon2(app, context,
            iconData: iconData, semanticLabel: semanticLabel);

Widget h5Icon2(AppModel app, BuildContext context,
        {required IconData iconData, String? semanticLabel}) =>
    StyleRegistry.registry()
        .styleWithApp(app)
        .frontEndStyle()
        .iconStyle()
        .h5Icon2(app, context,
            iconData: iconData, semanticLabel: semanticLabel);
