import 'package:eliud_core/core/access/bloc/access_details.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';

import '../../global_data.dart';
import '../page_helper.dart';
import 'package:eliud_core/core/components/page_constructors/popup_helper.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/menu_item_model.dart';
import 'package:eliud_core/platform/platform.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/model/rgb_model.dart';
import 'package:eliud_core/model/app_bar_model.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../eliud.dart';
import '../../navigate/router.dart';

class AppBarConstructor {
  final String currentPage;
  final GlobalKey<ScaffoldState> scaffoldKey;

  AppBarConstructor(this.currentPage, this.scaffoldKey);

  Widget _appBarWithButtons(BuildContext context, String theTitle,
      AppBarModel value, List<Widget> buttons, MemberModel member)  {
    Widget title;
    Widget part1;
    if ((value.header == HeaderSelection.Title) && (value.title != null)) {
      part1 = Text(value.title,
          style: FontTools.textStyle(GlobalData.app().h1));
    } else if ((value.header == HeaderSelection.Icon) && (value.icon != null)) {
      part1 = IconHelper.getIconFromModel(iconModel: value.icon);
    } else if ((value.header == HeaderSelection.Image) &&
        (value.image != null)) {
      part1 = AbstractPlatform.platform.getImage(
        height: kToolbarHeight,
        image: value.image,
      );
    }

    if (part1 != null) {
      title = Row(children: [part1, Container(width: 20), Text(theTitle)]);
    } else if (theTitle != null) {
      title = Text(
        theTitle,
        style:  FontTools.textStyle(GlobalData.app().h1),
      );
    } else
      title = Text("No title provided",
          style:  FontTools.textStyle(GlobalData.app().h1));

    if (member != null) {
      String userPhotoUrl = member.photoURL;
      Widget profilePhoto;
      if (userPhotoUrl != null)
        profilePhoto = AbstractPlatform.platform
          .getImageFromURL(url: userPhotoUrl);
      if (profilePhoto == null) {
        profilePhoto = Icon(Icons.person_outline,
            color: value.iconColor != null ? RgbHelper.color(rgbo: value.iconColor) : null);
      }
      buttons.add(
        IconButton(
          icon: CircleAvatar(
            radius: 30.0,
            child: ClipOval(
                child: profilePhoto),
            backgroundColor: Colors.transparent,
          ),
          onPressed: () {
            scaffoldKey.currentState.openEndDrawer();
          },
        ),
      );
    }

    IconThemeData iconThemeData =
        new IconThemeData(color: RgbHelper.color(rgbo: value.iconColor));

    return AppBar(
        iconTheme: iconThemeData,
        title: title,
        actions: buttons,
        flexibleSpace: Container(
            decoration: BoxDecorationHelper.boxDecoration(value.background)));
  }

  void _addPlayStoreButton(
      BuildContext context, List<Widget> buttons, AppBarModel value, AppModel app) {
    String playStoreApp = Eliud.addPlayStoreApp(app);
    if (playStoreApp != null) {
      ActionModel action = SwitchApp(appID: playStoreApp);

      buttons.add(FutureBuilder<AppModel>(
          future: AbstractMainRepositorySingleton.singleton
              .appRepository()
              .get(playStoreApp),
          builder: (BuildContext context2, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return IconButton(
                  icon: AbstractPlatform.platform
                      .getImageFromURL(url: snapshot.data.logoURL),
                  color: RgbHelper.color(rgbo: value.iconColor),
                  onPressed: () {
                    Router.navigateTo(context, action);
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }));
    }
  }

  Widget appBar(
      BuildContext context, String theTitle, AppBarModel value) {
    /*return BlocBuilder<PluggableBloc, PluggableState>(builder: (context, state) {*/
      AppModel app = GlobalData.app();
      MemberModel member = GlobalData.member();
      AccessDetails accessDetails = GlobalData.details();
      if ((value.iconMenu != null) &&
          (value.iconMenu.menuItems != null) &&
          value.iconMenu.menuItems.length > 0) {
        List<Widget> buttons = new List();
        if (value.iconMenu != null) {
          value.iconMenu.menuItems.forEach((item) {
            if (accessDetails.hasAccess(item))
              _addButton(context, value, buttons, item, member, accessDetails);
          });
        }
        _addPlayStoreButton(context, buttons, value, app);
        return _appBarWithButtons(context, theTitle, value, buttons, member);
      } else {
        List<Widget> buttons = new List();
        _addPlayStoreButton(context, buttons, value, app);
        return _appBarWithButtons(context, theTitle, value, buttons, member);
      }
//    });
  }

  void _addButton(BuildContext context, AppBarModel value, List<Widget> buttons,
      MenuItemModel item, MemberModel member, AccessDetails accessDetails) {
    bool isActive = PageHelper.isActivePage(currentPage, item.action);
    Color _color = isActive
        ? RgbHelper.color(rgbo: value.selectedIconColor)
        : RgbHelper.color(rgbo: value.iconColor);


    RgbModel _rgbcolor = isActive
            ? value.selectedIconColor
            : value.iconColor;

    ActionModel action = item.action;
    if (action is PopupMenu) {
      Widget popupMenu = PopupHelper(currentPage, member, accessDetails).popupMenuButton(
          context,
          action.menuDef,
          Text(item.text),
          item.icon == null
              ? null
              : IconHelper.getIconFromModel(
                  iconModel: item.icon, color: _rgbcolor),
          value.menuBackgroundColor);
      if (popupMenu != null)
        buttons.add(Theme(
            data: Theme.of(context).copyWith(
              cardColor: RgbHelper.color(rgbo: value.menuBackgroundColor),
            ),
            child: popupMenu));
    } else {
      if (item.icon != null) {
        buttons.add(IconButton(
          icon: IconHelper.getIconFromModel(iconModel: item.icon),
          color: _color,
          onPressed: () {
            if (!PageHelper.isActivePage(currentPage, item.action))
              Router.navigateTo(context, item.action);
          },
        ));
      } else {

        buttons.add(Center(
            child: OutlineButton(
          padding: EdgeInsets.all(10.0),
          child: Text("${item.text}",
              style: FontTools.textStyle(GlobalData.app().h5)),
          onPressed: () {
            if (!PageHelper.isActivePage(currentPage, item.action))
              Router.navigateTo(context, item.action);
          },
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0)),
          borderSide:
              BorderSide(color: FontTools.textStyle(GlobalData.app().h4).color),
        )));
      }
    }
  }
}
