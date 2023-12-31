import 'package:eliud_core/core/components/page_constructors/blocs/appbar/extended_app_bar_component_event.dart';
import 'package:eliud_core/core/navigate/router.dart' as eliudrouter;
import 'package:eliud_core/core/tools/menu_item_mapper.dart';
import 'package:eliud_core/decoration/decorations.dart';
import 'package:eliud_core_main/apis/action_api/actions/switch_app.dart';
import 'package:eliud_core_main/model/app_bar_model.dart';
import 'package:eliud_core_main/model/app_model.dart';
import 'package:eliud_core_main/model/icon_model.dart';
import 'package:eliud_core_main/model/member_model.dart';
import 'package:eliud_core_main/model/menu_def_model.dart';
import 'package:eliud_core_main/apis/style/frontend/has_appbar.dart';
import 'package:eliud_core_main/apis/style/frontend/has_progress_indicator.dart';
import 'package:eliud_core_main/apis/style/frontend/types.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/appbar/extended_app_bar_component_bloc.dart';
import 'blocs/appbar/extended_app_bar_component_state.dart';

class EliudAppBar extends StatefulWidget {
  static String pageTitleKeyword = "\${PAGE_TITLE}";

  final AppModel app;
  final MemberModel? member;
  final String? pageTitle;
  final String currentPage;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final String theTitle;
  final AppBarModel value;
  final AppModel? playstoreApp;

  EliudAppBar(
      {super.key,
      this.pageTitle,
      required this.app,
      required this.playstoreApp,
      required this.member,
      required this.currentPage,
      required this.scaffoldKey,
      required this.theTitle,
      required this.value});

  @override
  State<EliudAppBar> createState() => _EliudAppBarState();
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
            return EliudAppBarWithItems(
              state: state,
              pageTitle: widget.pageTitle,
              app: widget.app,
              playstoreApp: widget.playstoreApp,
              member: widget.member,
              currentPage: widget.currentPage,
              theTitle: widget.theTitle,
              scaffoldKey: widget.scaffoldKey,
            );
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

  EliudAppBarWithItems({
    super.key,
    required this.state,
    this.pageTitle,
    required this.app,
    required this.playstoreApp,
    required this.member,
    required this.currentPage,
    required this.scaffoldKey,
    required this.theTitle,
  });

  @override
  State<EliudAppBarWithItems> createState() => _EliudAppBarWithItemsState();
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
    if ((title != null) && (title.contains(EliudAppBar.pageTitleKeyword))) {
      if (widget.pageTitle != null) {
        title =
            title.replaceAll(EliudAppBar.pageTitleKeyword, widget.pageTitle!);
      } else {
        title = title.replaceAll(EliudAppBar.pageTitleKeyword, 'No title');
      }
    }
    var icon = value.icon;
    var memberMediumModel = value.image;
    if ((header == HeaderSelection.title) && (title == null)) {
      if (icon != null) {
        header = HeaderSelection.icon;
      } else {
        header = HeaderSelection.image;
      }
    } else if ((header == HeaderSelection.image) && (icon == null)) {
      if (title != null) {
        header = HeaderSelection.title;
      } else {
        header = HeaderSelection.image;
      }
    } else if ((header == HeaderSelection.image) &&
        (memberMediumModel == null)) {
      if (title != null) {
        header = HeaderSelection.title;
      } else {
        header = HeaderSelection.icon;
      }
    }

    var headerAttributes = AppbarHeaderAttributes(
        title: title,
        icon: value.icon,
        memberMediumModel: value.image,
        header: header);

    return FutureBuilder<List<AbstractMenuItemAttributes>>(
        future: mapMenu(context, value.iconMenu!, widget.member, currentPage),
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
                  selectedIconColorOverride: value.selectedIconColorOverride,
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
                  selectedIconColorOverride: value.selectedIconColorOverride,
                  pageName: widget.theTitle,
                  items: [],
                  openDrawer: () =>
                      widget.scaffoldKey.currentState!.openEndDrawer());
            }, value)();
          }
        });
  }

  Future<List<AbstractMenuItemAttributes>> mapMenu(BuildContext context,
      MenuDefModel menu, MemberModel? member, String? currentPage) async {
    var items =
        await MenuItemMapper.mapMenu(context, menu, member, currentPage);
    var playStoreApp = widget.playstoreApp;
    if ((playStoreApp != null) &&
        (widget.app.documentID != playStoreApp.documentID)) {
      if ((playStoreApp.logo != null) && (playStoreApp.logo!.url != null)) {
        items.add(MenuItemAttributes(
            isActive: false,
            onTap: () => eliudrouter.Router.navigateTo(context,
                SwitchApp(widget.app, toAppID: playStoreApp.documentID)),
            imageURL: playStoreApp.logo!.url));
      } else {
        items.add(MenuItemAttributes(
          isActive: false,
          onTap: () => eliudrouter.Router.navigateTo(
              context, SwitchApp(widget.app, toAppID: playStoreApp.documentID)),
          icon: IconModel(
              codePoint: Icons.home.codePoint, fontFamily: "MaterialIcons"),
        ));
      }
    }
    return items;
  }
}
