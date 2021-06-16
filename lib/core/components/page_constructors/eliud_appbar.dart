import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';
import 'package:eliud_core/core/navigate/router.dart' as eliudrouter;
import 'package:eliud_core/core/tools/menu_item_mapper.dart';
import 'package:eliud_core/model/app_bar_model.dart';
import 'package:eliud_core/style/shared/has_appbar.dart';
import 'package:eliud_core/style/shared/types.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'package:eliud_core/tools/action/action_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EliudAppBar extends StatefulWidget {
  final String currentPage;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final String theTitle;
  final AppBarModel value;

  const EliudAppBar(
      {Key? key,
      required this.currentPage,
      required this.scaffoldKey,
      required this.theTitle,
      required this.value})
      : super(key: key);

  @override
  _EliudAppBarState createState() => _EliudAppBarState();
}

class _EliudAppBarState extends State<EliudAppBar> {
  @override
  Widget build(BuildContext context) {
    var currentPage = widget.currentPage;
    var value = widget.value;
    var state = AccessBloc.getState(context);
    if (state is AppLoaded) {
      var app = state.app;
      var header = value.header!;
      var title = value.title;
      var icon = value.icon;
      var memberMediumModel = value.image;
      if ((header == HeaderSelection.Title) && (title == null)) {
        if (icon != null) {
          header = HeaderSelection.Icon;
        } else {
          header = HeaderSelection.Image;
        }
      } else if ((header == HeaderSelection.Image) && (icon == null)) {
        if (title != null) {
          header = HeaderSelection.Title;
        } else {
          header = HeaderSelection.Image;
        }
      } else if ((header == HeaderSelection.Image) &&
          (memberMediumModel == null)) {
        if (title != null) {
          header = HeaderSelection.Title;
        } else {
          header = HeaderSelection.Icon;
        }
      }
      var headerAttributes = AppbarHeaderAttributes(
          title: value.title,
          icon: value.icon,
          memberMediumModel: value.image,
          header: value.header!);
      var items = MenuItemMapper.mapMenu(
              context, value.iconMenu!, state.getMember(), currentPage) ??
          [];

      // We should probably consider to introduce an internal action for app store and allow this to be configured as part of the app. The issue to consider however is that
      var playStoreApp = state.playStoreApp;
      if ((playStoreApp != null) &&
          (app.documentID != playStoreApp.documentID)) {
        items.add(MenuItemAttributes(
            isActive: false,
            onTap: () => eliudrouter.Router.navigateTo(context,
                SwitchApp(app.documentID, toAppID: playStoreApp.documentID)),
            imageURL: playStoreApp.logoURL));
      }


      return StyleRegistry.registry()
          .styleWithContext(context)
          .frontEndStyle()
          .appBar(
            context,
            headerAttributes: headerAttributes,
            backgroundOverride: value.backgroundOverride,
            menuBackgroundColorOverride: value.menuBackgroundColorOverride,
            iconColorOverride: value.iconColorOverride,
            selectedIconColorOverride: value.selectedIconColorOverride,
            pageName: widget.theTitle,
            items: items,
            openDrawer: () => widget.scaffoldKey.currentState!.openEndDrawer()
          );
    } else {
      return Text('App not loaded');
    }
  }
}
