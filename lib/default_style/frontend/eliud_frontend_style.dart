import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/default_style/frontend/impl/eliud_profile_photo.dart';
import 'package:eliud_core/default_style/shared/eliud_shared_implementation.dart';
import 'package:eliud_core/model/background_model.dart';
import 'package:eliud_core/model/grid_view_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/model/rgb_model.dart';
import 'package:eliud_core/style/frontend/frontend_style.dart';
import 'package:eliud_core/style/shared/has_appbar.dart';
import 'package:eliud_core/style/shared/has_drawer.dart';
import 'package:eliud_core/style/shared/has_page_body.dart';
import 'package:eliud_core/style/shared/types.dart';
import 'package:flutter/material.dart';

import '../eliud_style.dart';
import 'impl/eliud_appbar_impl.dart';
import 'impl/eliud_bottom_navigation_bar_impl.dart';
import 'impl/eliud_drawer_impl.dart';
import 'impl/eliud_menu_impl.dart';
import 'impl/eliud_page_body_impl.dart';

class EliudFrontEndStyle extends EliudSharedImplementation
    implements FrontEndStyle {
  final EliudStyle _eliudStyle;
  late EliudPageBodyImpl eliudPageBodyImpl;
  late EliudMenuImpl eliudMenuImpl;
  late EliudDrawerImpl eliudDrawerImpl;
  late EliudBottomNavigationBarImpl eliudBottomNavigationBarImpl;
  late EliudAppBarImpl eliudAppBarImpl;
  late EliudProfilePhotoImpl eliudProfilePhotoImpl;

  EliudFrontEndStyle(this._eliudStyle) : super(_eliudStyle) {
    eliudPageBodyImpl = EliudPageBodyImpl(_eliudStyle);
    eliudMenuImpl = EliudMenuImpl(_eliudStyle);
    eliudDrawerImpl = EliudDrawerImpl(_eliudStyle);
    eliudBottomNavigationBarImpl = EliudBottomNavigationBarImpl(_eliudStyle);
    eliudAppBarImpl = EliudAppBarImpl(_eliudStyle);
    eliudProfilePhotoImpl = EliudProfilePhotoImpl(_eliudStyle);
  }

  @override
  Widget container(BuildContext context, {Widget? child}) {
    var accessState = AccessBloc.getState(context);
    return Container(
        height: double.infinity, width: double.infinity, child: child);
  }

  @override
  Widget bottomNavigationBar(
    BuildContext context, {
    BackgroundModel? backgroundOverride,
    RgbModel? popupMenuBackgroundColorOverride,
    required List<AbstractMenuItemAttributes> items,
  }) {
    return eliudBottomNavigationBarImpl.bottomNavigationBar(context,
        backgroundOverride: backgroundOverride,
        popupMenuBackgroundColorOverride: popupMenuBackgroundColorOverride,
        items: items);
  }

  @override
  Widget pageBody(BuildContext context,
      {BackgroundModel? backgroundOverride,
      required List<Widget> components,
      Layout? layout,
      GridViewModel? gridView}) {
    return eliudPageBodyImpl.pageBody(context,
        backgroundOverride: backgroundOverride,
        components: components,
        layout: layout,
        gridView: gridView);
  }

  @override
  Future<void> openMenu(BuildContext context,
      {required RelativeRect position,
      required List<AbstractMenuItemAttributes> menuItems,
      RgbModel? popupMenuBackgroundColorOverride}) {
    return eliudMenuImpl.openMenu(context,
        position: position,
        menuItems: menuItems,
        popupMenuBackgroundColorOverride: popupMenuBackgroundColorOverride);
  }

  @override
  Drawer drawer(BuildContext context,
      {required DrawerType drawerType,
      DrawerHeader1Attributes? header1,
      DrawerHeader2Attributes? header2,
      BackgroundModel? backgroundOverride,
      RgbModel? popupMenuBackgroundColorOverride,
      required List<AbstractMenuItemAttributes> items}) {
    return eliudDrawerImpl.drawer(context,
        drawerType: drawerType,
        header1: header1,
        header2: header2,
        backgroundOverride: backgroundOverride,
        popupMenuBackgroundColorOverride: popupMenuBackgroundColorOverride,
        items: items);
  }

  @override
  PreferredSizeWidget appBar(BuildContext context,
      {required AppbarHeaderAttributes headerAttributes,
        required String pageName,
        List<AbstractMenuItemAttributes>? items,
        BackgroundModel? backgroundOverride,
        RgbModel? menuBackgroundColorOverride,
        RgbModel? selectedIconColorOverride,
        RgbModel? iconColorOverride,
        VoidCallback? openDrawer}) {
    return eliudAppBarImpl.appBar(context,
        headerAttributes:headerAttributes,
        pageName: pageName,
        items: items,
        backgroundOverride: backgroundOverride,
        menuBackgroundColorOverride: menuBackgroundColorOverride,
        selectedIconColorOverride: selectedIconColorOverride,
        iconColorOverride: iconColorOverride,
        openDrawer:openDrawer);
  }

  @override
  Widget getProfilePhotoButtonFromCurrentMember(
      BuildContext context, RgbModel? iconColor, VoidCallback? onPressed) {
    return eliudProfilePhotoImpl.getProfilePhotoButtonFromCurrentMember(
        context, iconColor, onPressed);
  }

  @override
  Widget getProfilePhotoButtonFromMember(BuildContext context,
      MemberModel? member, RgbModel? iconColor, VoidCallback? onPressed) {
    return eliudProfilePhotoImpl.getProfilePhotoButtonFromMember(
        context, member, iconColor, onPressed);
  }

  @override
  Widget getProfilePhotoButtonFromURL(BuildContext context, String? url,
      RgbModel? iconColor, VoidCallback? onPressed) {
    return eliudProfilePhotoImpl.getProfilePhotoButtonFromURL(
        context, url, iconColor, onPressed);
  }
}