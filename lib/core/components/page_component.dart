import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';
import 'package:eliud_core/core/components/page_constructors/eliud_appbar.dart';
import 'package:eliud_core/core/components/page_constructors/eliud_bottom_navigation_bar.dart';
import 'package:eliud_core/core/components/page_constructors/eliud_drawer.dart';
import 'package:eliud_core/core/navigate/navigate_bloc.dart';
import 'package:eliud_core/core/tools/component_info.dart';
import 'package:eliud_core/core/tools/page_body.dart';
import 'package:eliud_core/core/widgets/accept_membership.dart';
import 'package:eliud_core/decoration/decorations.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/page_model.dart';
import 'package:eliud_core/style/frontend/has_drawer.dart';
import 'package:eliud_core/style/frontend/has_progress_indicator.dart';
import 'package:eliud_core/style/frontend/has_text.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'package:eliud_core/tools/has_fab.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../registry.dart';

class PageComponent extends StatefulWidget {
  final GlobalKey _pageKey = GlobalKey();

  final GlobalKey<NavigatorState>? navigatorKey;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
  GlobalKey<ScaffoldMessengerState>();
  final Map<String, dynamic>? parameters;
  final String appId;
  final String pageId;

  PageComponent({this.navigatorKey, required this.appId, required this.pageId, this.parameters});

  @override
  State<StatefulWidget> createState() {
    return _PageComponentState();
  }
}

class _PageComponentState extends State<PageComponent> {
  _PageComponentState();

  Future<PageModel?> getPage(String appId, String pageId) {
    return pageRepository(appId: appId)!.get(pageId);
  }

  @override
  Widget build(BuildContext context) {
    var state = AccessBloc.getState(context);
    if (state is AppLoaded) {
      return FutureBuilder<PageModel?>(
          future: getPage(widget.appId, widget.pageId),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var pageModel = snapshot.data!;
              return Decorations.instance().createDecoratedPage(
                  context, widget._pageKey, () =>
                  PageContentsWidget(
                    key: widget._pageKey,
                    state: state,
                    pageID: widget.pageId,
                    pageModel: pageModel,
                    parameters: widget.parameters,
                    scaffoldKey: widget.scaffoldKey,
                    scaffoldMessengerKey: widget.scaffoldMessengerKey,
                  ), pageModel)();
            }
            return progressIndicator(context);
          });
    }  else {
      return text(context, 'App not loaded');
    }
  }

}

class PageContentsWidget extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey;
  final AppLoaded state;
  final PageModel pageModel;
  final String pageID;
  final Map<String, dynamic>? parameters;

  PageContentsWidget({
    Key? key,
    required this.state,
    required this.pageModel,
    required this.pageID,
    required this.parameters,
    required this.scaffoldKey,
    required this.scaffoldMessengerKey,
  }) : super(key: key) {
  }

  @override
  _PageContentsWidgetState createState() {
    return _PageContentsWidgetState();
  }
}

class _PageContentsWidgetState extends State<PageContentsWidget> {
  Widget? theBody;
  HasFab? hasFab;

  @override
  Widget build(BuildContext context) {
    hasFab = null;
    var accessState = widget.state;
    var app = accessState.app;
    var value = widget.pageModel;
    var pageTitle = value.title;
    var pageID = widget.pageID;
    var parameters = widget.parameters;
    if ((accessState is LoggedIn) &&
        (accessState.forceAcceptMembership())) {
      theBody =
          AcceptMembershipWidget(app, accessState.member, accessState.usr);
    } else {
      var componentInfo = ComponentInfo.getComponentInfo(context, value.bodyComponents!, parameters, accessState, fromPageLayout(value.layout), value.backgroundOverride, value.gridView);
        theBody = PageBody(componentInfo: componentInfo,);
    }

    var drawer = value.drawer == null
        ? null
        : EliudDrawer(drawerType: DrawerType.Left, drawer: value.drawer!, currentPage: pageID);
    var endDrawer = value.endDrawer == null
        ? null
        : EliudDrawer(drawerType: DrawerType.Right, drawer: value.endDrawer!, currentPage: pageID);
    var bottomNavigationBar = EliudBottomNavigationBar(
        homeMenu: value.homeMenu!,
        currentPage: pageID);
    var appBar = value.appBar == null
        ? null
        : PreferredSize(
            preferredSize: const Size(double.infinity, kToolbarHeight),
            child: EliudAppBar(
                pageTitle: pageTitle,
                currentPage: pageID,
                scaffoldKey: widget.scaffoldKey,
                theTitle: value.title == null ? '' : value.title!,
                value: value.appBar!));
    var fab = hasFab != null ? hasFab!.fab(context) : null;
    var scaffoldMessenger = ScaffoldMessenger(
        key: widget.scaffoldMessengerKey,
        child: Scaffold(
          key: widget.scaffoldKey,
          endDrawer: endDrawer,
          appBar: appBar,
          body: theBody,
          drawer: drawer,
          floatingActionButton: fab,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          bottomNavigationBar: bottomNavigationBar,
        ));
    return scaffoldMessenger;
  }
}
