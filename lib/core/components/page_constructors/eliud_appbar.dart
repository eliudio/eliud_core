import 'package:eliud_core/core/components/page_constructors/blocs/appbar/extended_app_bar_component_event.dart';
import 'package:eliud_core/core/navigate/router.dart' as eliudrouter;
import 'package:eliud_core/core/tools/menu_item_mapper.dart';
import 'package:eliud_core/decoration/decorations.dart';
import 'package:eliud_core/model/app_bar_model.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/model/menu_def_model.dart';
import 'package:eliud_core/style/frontend/has_appbar.dart';
import 'package:eliud_core/style/frontend/has_progress_indicator.dart';
import 'package:eliud_core/style/frontend/types.dart';
import 'package:eliud_core/tools/action/action_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/appbar/extended_app_bar_component_bloc.dart';
import 'blocs/appbar/extended_app_bar_component_state.dart';

class EliudAppBar extends StatefulWidget {
  static String PAGE_TITLE_KEYWORD = "\${PAGE_TITLE}";

  final AppModel app;
  final MemberModel? member;
  final String? pageTitle;
  final String currentPage;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final String theTitle;
  final AppBarModel value;
  final AppModel? playstoreApp;

  EliudAppBar(
      {Key? key,
      this.pageTitle,
      required this.app,
      required this.playstoreApp,
      required this.member,
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
    var app = widget.app;
    return BlocProvider<ExtendedAppBarComponentBloc>(
        create: (context) => ExtendedAppBarComponentBloc()
          ..add(ExtendedAppBarInitEvent(value: widget.value)),
        child: BlocBuilder<ExtendedAppBarComponentBloc,
            ExtendedAppBarComponentState>(builder: (context, state) {
          if (state is ExtendedAppBarComponentLoaded) {
              return EliudAppBarWithItems(state: state, pageTitle: widget.pageTitle, app: widget.app, playstoreApp: widget.playstoreApp, member: widget.member, currentPage: widget.currentPage, theTitle: widget.theTitle, scaffoldKey: widget.scaffoldKey, );
          } else {
            return progressIndicator(app, context);
          }
        }));
  }
}



class EliudAppBarWithItems extends StatefulWidget {
  final String? pageTitle;
  final ExtendedAppBarComponentLoaded state;
  final AppModel app;
  final String currentPage;
  final MemberModel? member;
  final AppModel? playstoreApp;
  final String theTitle;
  final GlobalKey<ScaffoldState> scaffoldKey;

  EliudAppBarWithItems(
      {Key? key, required this.state,
        this.pageTitle,
        required this.app,
        required this.playstoreApp,
        required this.member,
        required this.currentPage,
        required this.scaffoldKey,
        required this.theTitle,
      })
      : super(key: key);

  @override
  _EliudAppBarWithItemsState createState() => _EliudAppBarWithItemsState();
}

class _EliudAppBarWithItemsState extends State<EliudAppBarWithItems> {
  final GlobalKey _appBarKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    var value = widget.state.value;
    var currentPage = widget.currentPage;
    var app = widget.app;

    var header = value.header!;
    var title = value.title;
    if ((title != null) &&
        (widget.pageTitle != null) &&
        (title.contains(EliudAppBar.PAGE_TITLE_KEYWORD))) {
      title = title.replaceAll(
          EliudAppBar.PAGE_TITLE_KEYWORD, widget.pageTitle!);
    }
    var icon = value.icon;
    var memberMediumModel = value.image;
    if ((header == HeaderSelection.Title) && (title == null)) {
      if (icon != null) {
        header = HeaderSelection.Icon;
      } else {
        header = HeaderSelection.Image;
      }
    } else if ((header == HeaderSelection.Image) &&
        (icon == null)) {
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


    return FutureBuilder<List<AbstractMenuItemAttributes>>(
        future: mapMenu(context, value.iconMenu!,
            widget.member, currentPage),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var items = snapshot.data!;
            return Decorations.instance()
                .createDecoratedAppBar(app, context, _appBarKey, () {
              return appBar(app, context,
                  headerAttributes: headerAttributes,
                  member: widget.member,
                  key: _appBarKey,
                  backgroundOverride: value.backgroundOverride,
                  menuBackgroundColorOverride:
                  value.menuBackgroundColorOverride,
                  iconColorOverride: value.iconColorOverride,
                  selectedIconColorOverride:
                  value.selectedIconColorOverride,
                  pageName: widget.theTitle,
                  items: items,
                  openDrawer: () =>
                      widget.scaffoldKey.currentState!.openEndDrawer());
            }, value)();
          } else {
            return Decorations.instance()
                .createDecoratedAppBar(app, context, _appBarKey, () {
              return appBar(app, context,
                  headerAttributes: headerAttributes,
                  member: widget.member,
                  key: _appBarKey,
                  backgroundOverride: value.backgroundOverride,
                  menuBackgroundColorOverride:
                  value.menuBackgroundColorOverride,
                  iconColorOverride: value.iconColorOverride,
                  selectedIconColorOverride:
                  value.selectedIconColorOverride,
                  pageName: widget.theTitle,
                  items: [],
                  openDrawer: () =>
                      widget.scaffoldKey.currentState!.openEndDrawer());
            }, value)();
          }
        });
  }

  Future<List<AbstractMenuItemAttributes>> mapMenu(BuildContext context, MenuDefModel menu, MemberModel? member, String? currentPage) async {
    var items = await MenuItemMapper.mapMenu(context, menu, member, currentPage);
    var playStoreApp = widget.playstoreApp;
    if ((playStoreApp != null) &&
        (playStoreApp.logo != null) &&
        (playStoreApp.logo!.url != null) &&
        (widget.app.documentID != playStoreApp.documentID)) {
      items.add(MenuItemAttributes(
          isActive: false,
          onTap: () => eliudrouter.Router.navigateTo(
              context,
              SwitchApp(widget.app,
                  toAppID: playStoreApp.documentID)),
          imageURL: playStoreApp.logo!.url));
    }
    return items;
  }
}