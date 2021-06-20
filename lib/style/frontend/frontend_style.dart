import 'has_app.dart';
import 'has_appbar.dart';
import 'has_bottom_navigation_bar.dart';
import 'has_button.dart';
import 'has_container.dart';
import 'has_dialog.dart';
import 'has_dialog_field.dart';
import 'has_dialog_widget.dart';
import 'has_divider.dart';
import 'has_drawer.dart';
import 'has_icon.dart';
import 'has_list_tile.dart';
import 'has_menu.dart';
import 'has_page_body.dart';
import 'has_profile_photo.dart';
import 'has_progress_indicator.dart';
import 'has_style.dart';
import 'has_table.dart';
import 'has_text.dart';
import 'has_text_form_field.dart';
import 'package:flutter/cupertino.dart';

abstract class FrontEndStyle {
    HasTexFormField texFormFieldStyle();
    HasDivider dividerStyle();
    HasButton buttonStyle();
    HasText textStyle();
    HasStyle textStyleStyle();
    HasIcon iconStyle();
    HasTable tableStyle();
    HasAppBar appBarStyle();
    HasDrawer drawerStyle();
    HasMenu menuStyle();
    HasBottomNavigationBar bottomNavigationBarStyle();
    HasPageBody pageBodyStyle();
    HasProfilePhoto profilePhotoStyle();
    HasContainer containerStyle();
    HasProgressIndicator progressIndicatorStyle();
    HasApp appStyle();
    HasListTile listTileStyle();
    HasDialog dialogStyle();
    HasDialogField dialogFieldStyle();
    HasDialogWidget dialogWidgetStyle();
}
