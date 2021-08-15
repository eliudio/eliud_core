import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';
import 'package:eliud_core/core/navigate/router.dart' as eliudrouter;
import 'package:eliud_core/core/tools/menu_item_mapper.dart';
import 'package:eliud_core/creator/widgets/creator_mode.dart';
import 'package:eliud_core/model/app_bar_model.dart';
import 'package:eliud_core/style/frontend/has_appbar.dart';
import 'package:eliud_core/style/frontend/types.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'package:eliud_core/tools/action/action_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EliudAppBar extends StatefulWidget {
  static String PAGE_TITLE_KEYWORD = "\${PAGE_TITLE}";

  final String? pageTitle;
  final String currentPage;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final String theTitle;
  final AppBarModel value;

  EliudAppBar(
      {Key? key,
      this.pageTitle,
      required this.currentPage,
      required this.scaffoldKey,
      required this.theTitle,
      required this.value})
      : super(key: key);

  @override
  _EliudAppBarState createState() => _EliudAppBarState();
}

class _EliudAppBarState extends State<EliudAppBar> {
  final GlobalKey _appBarKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var currentPage = widget.currentPage;
    var value = widget.value;
    var state = AccessBloc.getState(context);
    if (state is AppLoaded) {
      var app = state.app;
      var header = value.header!;
      var title = value.title;
      if ((title != null) && (widget.pageTitle != null) && (title.contains(EliudAppBar.PAGE_TITLE_KEYWORD))) {
        title = title.replaceAll(EliudAppBar.PAGE_TITLE_KEYWORD, widget.pageTitle!);
      }
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
          title: title,
          icon: value.icon,
          memberMediumModel: value.image,
          header: header);
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


      return CreatorMode.create(toDecorateKey: _appBarKey, label: 'AppBar', toDecorate: StyleRegistry.registry()
          .styleWithContext(context)
          .frontEndStyle().appBarStyle()
          .appBar(
            context,
            headerAttributes: headerAttributes,
            key: _appBarKey,
            backgroundOverride: value.backgroundOverride,
            menuBackgroundColorOverride: value.menuBackgroundColorOverride,
            iconColorOverride: value.iconColorOverride,
            selectedIconColorOverride: value.selectedIconColorOverride,
            pageName: widget.theTitle,
            items: items,
            openDrawer: () => widget.scaffoldKey.currentState!.openEndDrawer()
          ), edit: true,);
    } else {
      return Text('App not loaded');
    }
  }
}
