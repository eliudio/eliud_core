import 'package:eliud_core/style/shared/has_appbar.dart';
import 'package:eliud_core/style/shared/has_bottom_navigation_bar.dart';
import 'package:eliud_core/style/shared/has_button.dart';
import 'package:eliud_core/style/shared/has_divider.dart';
import 'package:eliud_core/style/shared/has_drawer.dart';
import 'package:eliud_core/style/shared/has_icon.dart';
import 'package:eliud_core/style/shared/has_menu.dart';
import 'package:eliud_core/style/shared/has_page_body.dart';
import 'package:eliud_core/style/shared/has_profile_photo.dart';
import 'package:eliud_core/style/shared/has_style.dart';
import 'package:eliud_core/style/shared/has_table.dart';
import 'package:eliud_core/style/shared/has_text.dart';
import 'package:eliud_core/style/shared/has_text_form_field.dart';
import 'package:flutter/cupertino.dart';

abstract class FrontEndStyle implements
    HasTexFormField,
    HasDivider,
    HasButton,
    HasText,
    HasStyle,
    HasIcon,
    HasTable,
    HasAppBar,
    HasDrawer,
    HasMenu,
    HasBottomNavigationBar,
    HasPageBody,
    HasProfilePhoto {
  Widget container(BuildContext context, {Widget child});
}