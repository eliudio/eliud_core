import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:eliud_core/core/blocs/access/state/access_state.dart';
import 'package:eliud_core/core/blocs/access/state/logged_in.dart';
import 'package:eliud_core/core/blocs/app/app_bloc.dart';
import 'package:eliud_core/core/blocs/app/app_state.dart';
import 'package:eliud_core/core/components/page_constructors/eliud_appbar.dart';
import 'package:eliud_core/core/components/page_constructors/eliud_bottom_navigation_bar.dart';
import 'package:eliud_core/core/components/page_constructors/eliud_drawer.dart';
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

  PageComponent(
      {this.navigatorKey,
      required this.appId,
      required this.pageId,
      this.parameters});

  @override
  State<StatefulWidget> createState() {
    return _PageComponentState();
  }
}
/*

class _PageComponentState extends State<PageComponent> {
  _PageComponentState();

  Future<PageModel?> getPage(String appId, String pageId) {
    return pageRepository(appId: appId)!.get(pageId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(builder: (context, state) {
      if (state is AppLoaded) {
        return FutureBuilder<PageModel?>(
            future: getPage(widget.appId, widget.pageId),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var pageModel = snapshot.data!;
                return Decorations.instance().createDecoratedPage(
                    context,
                    widget._pageKey,
                    () => PageContentsWidget(
                          key: widget._pageKey,
                          pageID: widget.pageId,
                          pageModel: pageModel,
                          parameters: widget.parameters,
                          scaffoldKey: widget.scaffoldKey,
                          scaffoldMessengerKey: widget.scaffoldMessengerKey,
                        ),
                    pageModel)();
              }
              return progressIndicator(context);
            });
      } else {
        return progressIndicator(context);
      }
    });
  }
}
*/

class _PageComponentState extends State<PageComponent> {
  Widget? theBody;
  HasFab? hasFab;

  Future<PageModel?> getPage(String appId, String pageId) {
    return pageRepository(appId: appId)!.get(pageId);
  }

  @override
  Widget build(BuildContext context) {
    hasFab = null;
    return BlocBuilder<AccessBloc, AccessState>(
        builder: (context, accessState) {
      return BlocBuilder<AppBloc, AppState>(builder: (context, appState) {
        if (appState is AppLoaded) {
          return FutureBuilder<PageModel?>(
              future: getPage(widget.appId, widget.pageId),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var pageModel = snapshot.data!;
                  var value = pageModel;
                  var pageTitle = value.title;
                  var pageID = pageModel.documentID!;
                  var parameters = widget.parameters;
                  var componentInfo = ComponentInfo.getComponentInfo(
                      context,
                      value.bodyComponents!,
                      parameters,
                      appState,
                      accessState,
                      fromPageLayout(value.layout),
                      value.backgroundOverride,
                      value.gridView);
                  theBody = PageBody(
                    componentInfo: componentInfo,
                  );
//    }

                  var drawer = value.drawer == null
                      ? null
                      : EliudDrawer(
                          drawerType: DrawerType.Left,
                          drawer: value.drawer!,
                          currentPage: pageID);
                  var endDrawer = value.endDrawer == null
                      ? null
                      : EliudDrawer(
                          drawerType: DrawerType.Right,
                          drawer: value.endDrawer!,
                          currentPage: pageID);
                  var bottomNavigationBar = EliudBottomNavigationBar(
                      homeMenu: value.homeMenu!, currentPage: pageID);
                  var appBar = value.appBar == null
                      ? null
                      : PreferredSize(
                          preferredSize:
                              const Size(double.infinity, kToolbarHeight),
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
                } else {
                  return progressIndicator(context);
                }
              });
        } else {
          return progressIndicator(context);
        }
      });
    });
  }
}
