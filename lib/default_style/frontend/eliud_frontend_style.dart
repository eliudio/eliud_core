import 'package:eliud_core/default_style/frontend/impl/eliud_list_tile_impl.dart';
import 'package:eliud_core/default_style/shared/eliud_shared_implementation.dart';
import 'package:eliud_core/model/background_model.dart';
import 'package:eliud_core/model/grid_view_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/model/member_public_info_model.dart';
import 'package:eliud_core/model/rgb_model.dart';
import 'package:eliud_core/style/frontend/frontend_style.dart';
import 'package:eliud_core/style/shared/has_appbar.dart';
import 'package:eliud_core/style/shared/has_drawer.dart';
import 'package:eliud_core/style/shared/has_page_body.dart';
import 'package:eliud_core/style/shared/has_profile_photo.dart';
import 'package:eliud_core/style/shared/types.dart';
import 'package:flutter/material.dart';

import '../eliud_style.dart';
import 'impl/eliud_app_impl.dart';
import 'impl/eliud_appbar_impl.dart';
import 'impl/eliud_bottom_navigation_bar_impl.dart';
import 'impl/eliud_container_impl.dart';
import 'impl/eliud_drawer_impl.dart';
import 'impl/eliud_menu_impl.dart';
import 'impl/eliud_page_body_impl.dart';
import 'impl/eliud_profile_photo_impl.dart';
import 'impl/eliud_progress_indicator_impl.dart';

class EliudFrontEndStyle extends EliudSharedImplementation
    implements FrontEndStyle {
  final EliudStyle _eliudStyle;
  late EliudPageBodyImpl eliudPageBodyImpl;
  late EliudMenuImpl eliudMenuImpl;
  late EliudDrawerImpl eliudDrawerImpl;
  late EliudBottomNavigationBarImpl eliudBottomNavigationBarImpl;
  late EliudAppBarImpl eliudAppBarImpl;
  late EliudProfilePhotoImpl eliudProfilePhotoImpl;
  late EliudContainerImpl eliudContainerImpl;
  late EliudProgressIndicatorImpl eliudProgressIndicatorImpl;
  late EliudAppImpl eliudAppImpl;
  late EliudListTileImpl eliudListTileImpl;

  EliudFrontEndStyle(this._eliudStyle) : super(_eliudStyle) {
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
        headerAttributes: headerAttributes,
        pageName: pageName,
        items: items,
        backgroundOverride: backgroundOverride,
        menuBackgroundColorOverride: menuBackgroundColorOverride,
        selectedIconColorOverride: selectedIconColorOverride,
        iconColorOverride: iconColorOverride,
        openDrawer: openDrawer);
  }

  @override
  Widget getProfilePhotoButtonFromCurrentMember(BuildContext context,
      {RgbModel? iconColor, required double radius, VoidCallback? onPressed}) {
    return eliudProfilePhotoImpl.getProfilePhotoButtonFromCurrentMember(context,
        radius: radius, iconColor: iconColor, onPressed: onPressed);
  }

  @override
  Widget getProfilePhotoButtonFromMember(BuildContext context,
      {MemberModel? member,
      required double radius,
      RgbModel? iconColor,
      VoidCallback? onPressed}) {
    return eliudProfilePhotoImpl.getProfilePhotoButtonFromMember(context,
        radius: radius,
        member: member,
        iconColor: iconColor,
        onPressed: onPressed);
  }

  @override
  Widget getProfilePhotoButtonFromURL(BuildContext context,
      {String? url,
      required double radius,
      RgbModel? iconColor,
      VoidCallback? onPressed}) {
    return eliudProfilePhotoImpl.getProfilePhotoButtonFromURL(context,
        radius: radius, url: url, iconColor: iconColor, onPressed: onPressed);
  }

  @override
  Widget getProfilePhotoButtonFromPublicMember(BuildContext context,
      {MemberPublicInfoModel? member,
      required double radius,
      RgbModel? iconColor,
      VoidCallback? onPressed}) {
    return eliudProfilePhotoImpl.getProfilePhotoButtonFromPublicMember(context,
        radius: radius,
        member: member,
        iconColor: iconColor,
        onPressed: onPressed);
  }

  @override
  Widget getProfilePhotoButtonFromExternalProvider(BuildContext context,
      {required ExternalProfileURLProvider externalProfileURLProvider,
      BackupProfileURLProvider? fallBackURLProvider,
      required double radius,
      RgbModel? iconColor,
      VoidCallback? onPressed}) {
    return eliudProfilePhotoImpl.getProfilePhotoButtonFromExternalProvider(
        context,
        radius: radius,
        externalProfileURLProvider: externalProfileURLProvider,
        fallBackURLProvider: fallBackURLProvider,
        iconColor: iconColor,
        onPressed: onPressed);
  }

  @override
  Widget actionContainer(BuildContext context, {required Widget child, double? height, double? width}) {
    return eliudContainerImpl.actionContainer(context, child: child, height: height, width: width);
  }

  @override
  Widget topicContainer(BuildContext context, {required List<Widget> children, DecorationImage? image, double? height, double? width}) {
    return eliudContainerImpl.topicContainer(context, children: children, image: image, height: height, width: width);
  }

  @override
  Widget simpleTopicContainer(BuildContext context, {required List<Widget> children, DecorationImage? image, double? height, double? width}) {
    return eliudContainerImpl.simpleTopicContainer(context, children: children, image: image, height: height, width: width);
  }

  @override
  Widget progressIndicator(BuildContext context, {Animation<Color>? valueColor}) {
    return eliudProgressIndicatorImpl.progressIndicator(context, valueColor: valueColor);
  }

  @override
  Widget app({GlobalKey<NavigatorState>? navigatorKey, GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey, String? initialRoute, RouteFactory? onGenerateRoute, RouteFactory? onUnknownRoute, required String title}) {
    return eliudAppImpl.app(navigatorKey: navigatorKey, scaffoldMessengerKey: scaffoldMessengerKey, initialRoute: initialRoute, onGenerateRoute: onGenerateRoute, onUnknownRoute: onUnknownRoute, title: title);
  }

  @override
  Widget getListTile(BuildContext context, {Widget? leading, Widget? title, Widget? subtitle, bool? isThreeLine}) {
    return eliudListTileImpl.getListTile(context, leading: leading, title: title, subtitle: subtitle, isThreeLine: isThreeLine);
  }

}
