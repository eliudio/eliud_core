import 'package:eliud_core/model/icon_model.dart';
import 'package:flutter/material.dart';

import '../style_registry.dart';

abstract class HasIcon {
  Widget h1Icon(BuildContext context,
      {required IconModel icon, String? semanticLabel});
  Widget h2Icon(BuildContext context,
      {required IconModel icon, String? semanticLabel});
  Widget h3Icon(BuildContext context,
      {required IconModel icon, String? semanticLabel});
  Widget h4Icon(BuildContext context,
      {required IconModel icon, String? semanticLabel});
  Widget h5Icon(BuildContext context,
      {required IconModel icon, String? semanticLabel});

  Widget h1Icon2(BuildContext context,
      {required IconData iconData, String? semanticLabel});
  Widget h2Icon2(BuildContext context,
      {required IconData iconData, String? semanticLabel});
  Widget h3Icon2(BuildContext context,
      {required IconData iconData, String? semanticLabel});
  Widget h4Icon2(BuildContext context,
      {required IconData iconData, String? semanticLabel});
  Widget h5Icon2(BuildContext context,
      {required IconData iconData, String? semanticLabel});
}

Widget h1Icon(BuildContext context,
        {required IconModel icon, String? semanticLabel}) =>
    StyleRegistry.registry()
        .styleWithContext(context)
        .frontEndStyle()
        .iconStyle()
        .h1Icon(context, icon: icon, semanticLabel: semanticLabel);

Widget h2Icon(BuildContext context,
        {required IconModel icon, String? semanticLabel}) =>
    StyleRegistry.registry()
        .styleWithContext(context)
        .frontEndStyle()
        .iconStyle()
        .h2Icon(context, icon: icon, semanticLabel: semanticLabel);

Widget h3Icon(BuildContext context,
        {required IconModel icon, String? semanticLabel}) =>
    StyleRegistry.registry()
        .styleWithContext(context)
        .frontEndStyle()
        .iconStyle()
        .h3Icon(context, icon: icon, semanticLabel: semanticLabel);

Widget h4Icon(BuildContext context,
        {required IconModel icon, String? semanticLabel}) =>
    StyleRegistry.registry()
        .styleWithContext(context)
        .frontEndStyle()
        .iconStyle()
        .h4Icon(context, icon: icon, semanticLabel: semanticLabel);

Widget h5Icon(BuildContext context,
        {required IconModel icon, String? semanticLabel}) =>
    StyleRegistry.registry()
        .styleWithContext(context)
        .frontEndStyle()
        .iconStyle()
        .h5Icon(context, icon: icon, semanticLabel: semanticLabel);

Widget h1Icon2(BuildContext context,
        {required IconData iconData, String? semanticLabel}) =>
    StyleRegistry.registry()
        .styleWithContext(context)
        .frontEndStyle()
        .iconStyle()
        .h1Icon2(context, iconData: iconData, semanticLabel: semanticLabel);

Widget h2Icon2(BuildContext context,
        {required IconData iconData, String? semanticLabel}) =>
    StyleRegistry.registry()
        .styleWithContext(context)
        .frontEndStyle()
        .iconStyle()
        .h2Icon2(context, iconData: iconData, semanticLabel: semanticLabel);

Widget h3Icon2(BuildContext context,
        {required IconData iconData, String? semanticLabel}) =>
    StyleRegistry.registry()
        .styleWithContext(context)
        .frontEndStyle()
        .iconStyle()
        .h3Icon2(context, iconData: iconData, semanticLabel: semanticLabel);

Widget h4Icon2(BuildContext context,
        {required IconData iconData, String? semanticLabel}) =>
    StyleRegistry.registry()
        .styleWithContext(context)
        .frontEndStyle()
        .iconStyle()
        .h4Icon2(context, iconData: iconData, semanticLabel: semanticLabel);

Widget h5Icon2(BuildContext context,
        {required IconData iconData, String? semanticLabel}) =>
    StyleRegistry.registry()
        .styleWithContext(context)
        .frontEndStyle()
        .iconStyle()
        .h5Icon2(context, iconData: iconData, semanticLabel: semanticLabel);
