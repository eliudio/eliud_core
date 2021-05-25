import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';
import 'package:eliud_core/core/widgets/progress_indicator.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';

import 'package:eliud_core/core/components/page_helper.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/menu_item_model.dart';
import 'package:eliud_core/tools/action/action_model.dart';
import 'package:eliud_core/model/app_bar_model.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:eliud_core/core/navigate/router.dart' as eliudrouter;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transparent_image/transparent_image.dart';

import 'eliud_popup_menu.dart';

class EliudAppBar extends StatefulWidget {
  final String currentPage;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final String theTitle;
  final AppBarModel value;

  const EliudAppBar({Key? key, required this.currentPage, required this.scaffoldKey, required this.theTitle, required this.value})
      : super(key: key);

  @override
  _EliudAppBarState createState() => _EliudAppBarState();
}

class _EliudAppBarState extends State<EliudAppBar> {
  @override
  Widget build(BuildContext context) {
    var theTitle = widget.theTitle;
    var value = widget.value;
    return BlocBuilder<AccessBloc, AccessState>(builder: (context, theState) {
      if (theState is AppLoaded) {
        var app = theState.app;
        var member = (theState is LoggedIn) ? theState.member : null;
        if ((value.iconMenu != null) &&
            (value.iconMenu!.menuItems != null) &&
            value.iconMenu!.menuItems!.isNotEmpty) {
          var buttons = <Widget>[];
          if (value.iconMenu != null) {
            value.iconMenu!.menuItems!.forEach((item) {
              if (theState.menuItemHasAccess(item)) {
                _addButton(context, theState, app, value, buttons, item, member);
              }
            });
          }

          _addPlayStoreButton(AccessBloc.playStoreApp(theState), context, buttons, value, app);
          return _appBarWithButtons(context, theState, app, theTitle, value, buttons, member);
        } else {
          var buttons = <Widget>[];
          _addPlayStoreButton(AccessBloc.playStoreApp(theState), context, buttons, value, app);
          return _appBarWithButtons(context, theState, app, theTitle, value, buttons, member);
        }
      } else {
        return Text("State is not AppLoaded");
      }});
  }

  void _addButton(BuildContext context, AccessState state, AppModel app, AppBarModel? value, List<Widget> buttons,
      MenuItemModel item, MemberModel? member) {
    var isActive = PageHelper.isActivePage(widget.currentPage, item.action);
    var _color = isActive
        ? RgbHelper.color(rgbo: value!.selectedIconColor)
        : RgbHelper.color(rgbo: value!.iconColor);


    var _rgbcolor = isActive
        ? value.selectedIconColor
        : value.iconColor;

    var action = item.action;
    if ((action is PopupMenu) && (action.menuDef != null) && (action.menuDef!.menuItems != null) && (action.menuDef!.menuItems!.length > 0)) {
        var popupMenu = EliudPopupMenu(app:app, state: state, currentPage: widget.currentPage, member: member, menu: action.menuDef!, text: Text(item.text!),
            icon: item.icon == null
                ? null
                : IconHelper.getIconFromModel(
                iconModel: item.icon, color: _rgbcolor),
            menuBackgroundColor: value.menuBackgroundColor);
        buttons.add(Theme(
            data: Theme.of(context).copyWith(
              cardColor: RgbHelper.color(rgbo: value.menuBackgroundColor),
            ),
            child: popupMenu));
    } else {
      if (item.icon != null) {
        buttons.add(IconButton(
          icon: IconHelper.getIconFromModel(iconModel: item.icon)!,
          color: _color,
          onPressed: () {
            if (!PageHelper.isActivePage(widget.currentPage, item.action)) {
              eliudrouter.Router.navigateTo(context, item.action!);
            }
          },
        ));
      } else {

        buttons.add(Center(
            child: OutlineButton(
              padding: EdgeInsets.all(10.0),
              child: Text('${item.text}',
                  style: FontTools.textStyle(app.h5)),
              onPressed: () {
                if (!PageHelper.isActivePage(widget.currentPage, item.action)) {
                  eliudrouter.Router.navigateTo(context, item.action!);
                }
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              borderSide:
              BorderSide(color: FontTools.textStyle(app.h4)!.color!),
            )));
      }
    }
  }

  Widget _appBarWithButtons(BuildContext context, AccessState state, AppModel app, String? theTitle, AppBarModel value, List<Widget> buttons, MemberModel? member)  {
    Widget title;
    Widget? part1;
    if ((value.header == HeaderSelection.Title) && (value.title != null)) {
      part1 = Text(value.title!,
          style: FontTools.textStyle(app.h1));
    } else if ((value.header == HeaderSelection.Icon) && (value.icon != null)) {
      part1 = IconHelper.getIconFromModel(iconModel: value.icon);
    } else if ((value.header == HeaderSelection.Image) &&
        (value.image != null)) {

      part1 = FadeInImage.memoryNetwork(
        placeholder: kTransparentImage,
        image: value.image!.url!,
        height: kToolbarHeight,
      );
    }

    if (part1 != null) {
      title = Row(children: [part1, Container(width: 20), Text(theTitle!)]);
    } else if (theTitle != null) {
      title = Text(
        theTitle,
        style:  FontTools.textStyle(app.h1),
      );
    } else {
      title = Text('No title provided',
          style:  FontTools.textStyle(app.h1));
    }

    if (member != null) {
      var userPhotoUrl = member.photoURL;
      Widget? profilePhoto;
      if (userPhotoUrl != null) {
        profilePhoto =  Image.network(
            member.photoURL!
        );
      }
      profilePhoto ??= Icon(Icons.person_outline,
          color: value.iconColor != null ? RgbHelper.color(rgbo: value.iconColor) : null);
      buttons.add(
        IconButton(
          icon: CircleAvatar(
            radius: 30.0,
            child: ClipOval(
                child: profilePhoto),
            backgroundColor: Colors.transparent,
          ),
          onPressed: () {
            widget.scaffoldKey.currentState!.openEndDrawer();
          },
        ),
      );
    }

    var iconThemeData =
    IconThemeData(color: RgbHelper.color(rgbo: value.iconColor));

    return AppBar(
        iconTheme: iconThemeData,
        title: title,
        actions: buttons,
        flexibleSpace: Container(
            decoration: BoxDecorationHelper.boxDecoration(state, value.background)));
  }

  void _addPlayStoreButton(String? playStoreApp,
      BuildContext context, List<Widget> buttons, AppBarModel? value, AppModel app) {
    if (playStoreApp != null) {
      ActionModel action = SwitchApp(app.documentID, toAppID: playStoreApp);
      if (action.hasAccess(context)) {
        buttons.add(FutureBuilder<AppModel?>(
            future: AbstractMainRepositorySingleton.singleton
                .appRepository()!
                .get(playStoreApp),
            builder: (BuildContext context2, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return IconButton(
                    icon: Image.network(
                        snapshot.data.logoURL
                    )/*AbstractPlatform.platform
                        .getImageFromURL(url: snapshot.data.logoURL)*/,
                    color: RgbHelper.color(rgbo: value!.iconColor),
                    onPressed: () {
                      eliudrouter.Router.navigateTo(context, action);
                    });
              } else {
                return Center(child: DelayedCircularProgressIndicator());
              }
            }));
      }
    }
  }
}