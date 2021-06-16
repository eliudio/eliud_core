import 'package:eliud_core/model/icon_model.dart';
import 'package:flutter/material.dart';

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
