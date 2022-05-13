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
import 'package:eliud_core/style/frontend/has_page_route_builder.dart';
import 'package:eliud_core/style/frontend/has_profile_photo.dart';
import 'package:eliud_core/style/frontend/has_progress_indicator.dart';
import 'package:eliud_core/style/frontend/has_split.dart';
import 'package:eliud_core/style/frontend/has_style.dart';
import 'package:eliud_core/style/frontend/has_table.dart';
import 'package:eliud_core/style/frontend/has_tabs.dart';
import 'package:eliud_core/style/frontend/has_text.dart';
import 'package:eliud_core/style/frontend/has_text_form_field.dart';

import 'impl/default_button_impl.dart';
import 'impl/default_list_tile_impl.dart';
import 'impl/default_page_route_builder_impl.dart';
import 'impl/default_split_impl.dart';
import 'impl/default_tabs_impl.dart';
import 'impl/default_app_impl.dart';
import 'impl/default_appbar_impl.dart';
import 'impl/default_bottom_navigation_bar_impl.dart';
import 'impl/default_container_impl.dart';
import 'impl/default_dialog_field_impl.dart';
import 'impl/default_dialog_impl.dart';
import 'impl/default_dialog_widget_impl.dart';
import 'impl/default_divider_impl.dart';
import 'impl/default_drawer_impl.dart';
import 'impl/default_icon_impl.dart';
import 'impl/default_menu_impl.dart';
import 'impl/default_page_body_impl.dart';
import 'impl/default_profile_photo_impl.dart';
import 'impl/default_progress_indicator_impl.dart';
import 'impl/default_table_impl.dart';
import 'impl/default_style_impl.dart';
import 'impl/default_text_form_field_impl.dart';
import 'impl/default_text_impl.dart';

class DefaultFrontEndStyle implements FrontEndStyle {
  late HasPageBody defaultPageBodyImpl;
  late HasMenu defaultMenuImpl;
  late HasDrawer defaultDrawerImpl;
  late HasBottomNavigationBar defaultBottomNavigationBarImpl;
  late HasAppBar defaultAppBarImpl;
  late HasProfilePhoto defaultProfilePhotoImpl;
  late HasContainer defaultContainerImpl;
  late HasProgressIndicator defaultProgressIndicatorImpl;
  late HasApp defaultAppImpl;
  late HasListTile defaultListTileImpl;
  late HasDialogField defaultDialogFieldImpl;
  late HasDialog defaultDialogImpl;
  late HasDialogWidget defaultDialogWidgetImpl;
  late HasButton defaultButtonImpl;
  late HasText defaultTextImpl;
  late HasTable defaultTableImpl;
  late HasTexFormField defaultTextFormFieldImpl;
  late HasStyle defaultStyleImpl;
  late HasIcon defaultIconImpl;
  late HasDivider defaultDividerImpl;
  late HasTabs defaultTabsImpl;
  late HasSplit defaultSplitImpl;
  late HasPageRouteBuilder defaultPageRouteBuilderImpl;

  DefaultFrontEndStyle() {
    defaultPageBodyImpl = DefaultPageBodyImpl(this);
    defaultMenuImpl = DefaultMenuImpl(this);
    defaultDrawerImpl = DefaultDrawerImpl(this);
    defaultBottomNavigationBarImpl = DefaultBottomNavigationBarImpl(this);
    defaultAppBarImpl = DefaultAppBarImpl(this);
    defaultProfilePhotoImpl = DefaultProfilePhotoImpl();
    defaultContainerImpl = DefaultContainerImpl();
    defaultProgressIndicatorImpl = DefaultProgressIndicatorImpl();
    defaultAppImpl = DefaultAppImpl();
    defaultListTileImpl = DefaultListTileImpl();
    defaultDialogFieldImpl = DefaultDialogFieldImpl();
    defaultDialogImpl = DefaultDialogImpl(this);
    defaultDialogWidgetImpl = DefaultDialogWidgetImpl(this);
    defaultButtonImpl = DefaultButtonImpl(this);
    defaultTextImpl = DefaultTextImpl();
    defaultTableImpl = DefaultTableImpl();
    defaultTextFormFieldImpl = DefaultTextFormFieldImpl(this);
    defaultStyleImpl = DefaultStyleImpl();
    defaultIconImpl = DefaultIconImpl();
    defaultDividerImpl = DefaultDividerImpl();
    defaultTabsImpl = DefaultTabsImpl(this);
    defaultTabsImpl = DefaultTabsImpl(this);
    defaultSplitImpl = DefaultSplitImpl(this);
    defaultPageRouteBuilderImpl = DefaultPageRouteBuilderImpl();
  }

  @override
  HasAppBar appBarStyle() => defaultAppBarImpl;

  @override
  HasApp appStyle() => defaultAppImpl;

  @override
  HasBottomNavigationBar bottomNavigationBarStyle() => defaultBottomNavigationBarImpl;

  @override
  HasButton buttonStyle() => defaultButtonImpl;

  @override
  HasContainer containerStyle() => defaultContainerImpl;

  @override
  HasDialogField dialogFieldStyle() => defaultDialogFieldImpl;

  @override
  HasDialog dialogStyle() => defaultDialogImpl;

  @override
  HasDialogWidget dialogWidgetStyle() => defaultDialogWidgetImpl;

  @override
  HasDivider dividerStyle() => defaultDividerImpl;

  @override
  HasDrawer drawerStyle() => defaultDrawerImpl;

  @override
  HasIcon iconStyle() => defaultIconImpl;

  @override
  HasListTile listTileStyle() => defaultListTileImpl;

  @override
  HasMenu menuStyle() => defaultMenuImpl;

  @override
  HasPageBody pageBodyStyle() => defaultPageBodyImpl;

  @override
  HasProfilePhoto profilePhotoStyle() => defaultProfilePhotoImpl;

  @override
  HasProgressIndicator progressIndicatorStyle() => defaultProgressIndicatorImpl;

  @override
  HasTable tableStyle() => defaultTableImpl;

  @override
  HasTexFormField texFormFieldStyle() => defaultTextFormFieldImpl;

  @override
  HasText textStyle() => defaultTextImpl;

  @override
  HasStyle textStyleStyle() => defaultStyleImpl;

  @override
  HasTabs tabsStyle() => defaultTabsImpl;

  @override
  HasPageRouteBuilder pageRoutBuilder() => defaultPageRouteBuilderImpl;

  @override
  HasSplit splitStyle() => defaultSplitImpl;
}

