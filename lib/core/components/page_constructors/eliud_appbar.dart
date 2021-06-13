import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';
import 'package:eliud_core/core/tools/menu_helper.dart';
import 'package:eliud_core/core/widgets/progress_indicator.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
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
    MenuHelper.addButton(context, state, app, buttons, item, member, widget.currentPage, value!.selectedIconColor!, value!.iconColor!, value!.menuBackgroundColor!);
  }

  Widget _appBarWithButtons(BuildContext context, AccessState state, AppModel app, String? theTitle, AppBarModel value, List<Widget> buttons, MemberModel? member)  {
    Widget title;
    Widget? part1;
    if ((value.header == HeaderSelection.Title) && (value.title != null)) {
      part1 = StyleRegistry.registry().styleWithContext(context).frontEndFormStyle().h1(context, value.title!);
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
      title = StyleRegistry.registry().styleWithContext(context).frontEndFormStyle().h1(context, theTitle);
    } else {
      title = StyleRegistry.registry().styleWithContext(context).frontEndFormStyle().h1(context, 'No title');
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

    var iconThemeData = IconThemeData(color: RgbHelper.color(rgbo: value.iconColor));

    return StyleRegistry.registry().styleWithContext(context).frontEndFormStyle().appBarWithWidget(context, iconTheme: iconThemeData, title: title, actions: buttons, background: value.background);
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
