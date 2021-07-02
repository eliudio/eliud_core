import 'package:eliud_core/default_style/frontend/impl/eliud_button_impl.dart';
import 'package:eliud_core/default_style/frontend/impl/eliud_list_tile_impl.dart';
import 'package:eliud_core/default_style/frontend/impl/eliud_tabs_impl.dart';
import 'package:eliud_core/style/frontend/frontend_style.dart';
import 'package:eliud_core/style/frontend/has_app.dart';
import 'package:eliud_core/style/frontend/has_appbar.dart';
import 'package:eliud_core/style/frontend/has_bottom_navigation_bar.dart';
import 'package:eliud_core/style/frontend/has_button.dart';
import 'package:eliud_core/style/frontend/has_container.dart';
import 'package:eliud_core/style/frontend/has_dialog.dart';
import 'package:eliud_core/style/frontend/has_dialog_field.dart';
import 'package:eliud_core/style/frontend/has_dialog_widget.dart';
import 'package:eliud_core/style/frontend/has_divider.dart';
import 'package:eliud_core/style/frontend/has_drawer.dart';
import 'package:eliud_core/style/frontend/has_icon.dart';
import 'package:eliud_core/style/frontend/has_list_tile.dart';
import 'package:eliud_core/style/frontend/has_menu.dart';
import 'package:eliud_core/style/frontend/has_page_body.dart';
import 'package:eliud_core/style/frontend/has_profile_photo.dart';
import 'package:eliud_core/style/frontend/has_progress_indicator.dart';
import 'package:eliud_core/style/frontend/has_style.dart';
import 'package:eliud_core/style/frontend/has_table.dart';
import 'package:eliud_core/style/frontend/has_tabs.dart';
import 'package:eliud_core/style/frontend/has_text.dart';
import 'package:eliud_core/style/frontend/has_text_form_field.dart';

import '../eliud_style.dart';
import 'impl/eliud_app_impl.dart';
import 'impl/eliud_appbar_impl.dart';
import 'impl/eliud_bottom_navigation_bar_impl.dart';
import 'impl/eliud_container_impl.dart';
import 'impl/eliud_dialog_field_impl.dart';
import 'impl/eliud_dialog_impl.dart';
import 'impl/eliud_dialog_widget_impl.dart';
import 'impl/eliud_divider_impl.dart';
import 'impl/eliud_drawer_impl.dart';
import 'impl/eliud_icon_impl.dart';
import 'impl/eliud_menu_impl.dart';
import 'impl/eliud_page_body_impl.dart';
import 'impl/eliud_profile_photo_impl.dart';
import 'impl/eliud_progress_indicator_impl.dart';
import 'impl/eliud_style_impl.dart';
import 'impl/eliud_table_impl.dart';
import 'impl/eliud_text_form_field_impl.dart';
import 'impl/eliud_text_impl.dart';

class EliudFrontEndStyle implements FrontEndStyle {
  final EliudStyle _eliudStyle;
  late HasPageBody eliudPageBodyImpl;
  late HasMenu eliudMenuImpl;
  late HasDrawer eliudDrawerImpl;
  late HasBottomNavigationBar eliudBottomNavigationBarImpl;
  late HasAppBar eliudAppBarImpl;
  late HasProfilePhoto eliudProfilePhotoImpl;
  late HasContainer eliudContainerImpl;
  late HasProgressIndicator eliudProgressIndicatorImpl;
  late HasApp eliudAppImpl;
  late HasListTile eliudListTileImpl;
  late HasDialogField eliudDialogFieldImpl;
  late HasDialog eliudDialogImpl;
  late HasDialogWidget eliudDialogWidgetImpl;
  late HasButton eliudButtonImpl;
  late HasText eliudTextImpl;
  late HasTable eliudTableImpl;
  late HasTexFormField eliudTextFormFieldImpl;
  late HasStyle eliudStyleImpl;
  late HasIcon eliudIconImpl;
  late HasDivider eliudDividerImpl;
  late HasTabs eliudTabsImpl;

  EliudFrontEndStyle(this._eliudStyle) {
    eliudPageBodyImpl = EliudPageBodyImpl(_eliudStyle);
    eliudMenuImpl = EliudMenuImpl(_eliudStyle);
    eliudDrawerImpl = EliudDrawerImpl(_eliudStyle);
    eliudBottomNavigationBarImpl = EliudBottomNavigationBarImpl(_eliudStyle);
    eliudAppBarImpl = EliudAppBarImpl(_eliudStyle);
    eliudProfilePhotoImpl = EliudProfilePhotoImpl(_eliudStyle);
    eliudContainerImpl = EliudContainerImpl(_eliudStyle);
    eliudProgressIndicatorImpl = EliudProgressIndicatorImpl(_eliudStyle);
    eliudAppImpl = EliudAppImpl(_eliudStyle);
    eliudListTileImpl = EliudListTileImpl(_eliudStyle);
    eliudDialogFieldImpl = EliudDialogFieldImpl(_eliudStyle);
    eliudDialogImpl = EliudDialogImpl(_eliudStyle);
    eliudDialogWidgetImpl = EliudDialogWidgetImpl(_eliudStyle);
    eliudButtonImpl = EliudButtonImpl(_eliudStyle);
    eliudTextImpl = EliudTextImpl(_eliudStyle);
    eliudTableImpl = EliudTableImpl(_eliudStyle);
    eliudTextFormFieldImpl = EliudTextFormFieldImpl(_eliudStyle);
    eliudStyleImpl = EliudStyleImpl(_eliudStyle);
    eliudIconImpl = EliudIconImpl(_eliudStyle);
    eliudDividerImpl = EliudDividerImpl(_eliudStyle);
    eliudTabsImpl = EliudTabsImpl(_eliudStyle);
  }

  @override
  HasAppBar appBarStyle() => eliudAppBarImpl;

  @override
  HasApp appStyle() => eliudAppImpl;

  @override
  HasBottomNavigationBar bottomNavigationBarStyle() => eliudBottomNavigationBarImpl;

  @override
  HasButton buttonStyle() => eliudButtonImpl;

  @override
  HasContainer containerStyle() => eliudContainerImpl;

  @override
  HasDialogField dialogFieldStyle() => eliudDialogFieldImpl;

  @override
  HasDialog dialogStyle() => eliudDialogImpl;

  @override
  HasDialogWidget dialogWidgetStyle() => eliudDialogWidgetImpl;

  @override
  HasDivider dividerStyle() => eliudDividerImpl;

  @override
  HasDrawer drawerStyle() => eliudDrawerImpl;

  @override
  HasIcon iconStyle() => eliudIconImpl;

  @override
  HasListTile listTileStyle() => eliudListTileImpl;

  @override
  HasMenu menuStyle() => eliudMenuImpl;

  @override
  HasPageBody pageBodyStyle() => eliudPageBodyImpl;

  @override
  HasProfilePhoto profilePhotoStyle() => eliudProfilePhotoImpl;

  @override
  HasProgressIndicator progressIndicatorStyle() => eliudProgressIndicatorImpl;

  @override
  HasTable tableStyle() => eliudTableImpl;

  @override
  HasTexFormField texFormFieldStyle() => eliudTextFormFieldImpl;

  @override
  HasText textStyle() => eliudTextImpl;

  @override
  HasStyle textStyleStyle() => eliudStyleImpl;

  @override
  HasTabs tabsStyle() => eliudTabsImpl;
}