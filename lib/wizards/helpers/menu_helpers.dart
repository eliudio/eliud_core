import 'package:eliud_core/core_package.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/display_conditions_model.dart';
import 'package:eliud_core/model/icon_model.dart';
import 'package:eliud_core/model/menu_item_model.dart';
import 'package:eliud_core/tools/action/action_model.dart';
import 'package:flutter/material.dart';

menuItem(AppModel app, pageID, text, IconData iconData) => MenuItemModel(
    documentID: pageID,
    text: text,
    description: text,
    icon: IconModel(
        codePoint: iconData.codePoint, fontFamily: Icons.settings.fontFamily),
    action: GotoPage(app, pageID: pageID));
