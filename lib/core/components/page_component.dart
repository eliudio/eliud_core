import 'dart:async';
import 'dart:ui';

import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:eliud_core/core/blocs/access/state/access_determined.dart';
import 'package:eliud_core/core/blocs/access/state/logged_in.dart';
import 'package:eliud_core/core/blocs/page/current_page_bloc.dart';
import 'package:eliud_core/core/blocs/page/current_page_event.dart';
import 'package:eliud_core/core/blocs/page/current_page_state.dart';
import 'package:eliud_core/core/components/page_constructors/eliud_appbar.dart';
import 'package:eliud_core/core/components/page_constructors/eliud_bottom_navigation_bar.dart';
import 'package:eliud_core/core/components/page_constructors/eliud_drawer.dart';
import 'package:eliud_core/core/tools/component_info.dart';
import 'package:eliud_core/core/tools/page_helper.dart';
import 'package:eliud_core/core/widgets/accept_membership.dart';
import 'package:eliud_core/decoration/decorations.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/page_model.dart';
import 'package:eliud_core/package/packages.dart';
import 'package:eliud_core/style/frontend/has_drawer.dart';
import 'package:eliud_core/style/frontend/has_page_body.dart';
import 'package:eliud_core/style/frontend/has_progress_indicator.dart';
import 'package:eliud_core/tools/has_fab.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PageComponent extends StatefulWidget {
  final GlobalKey pageKey = GlobalKey();

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  final String appId;
  final String pageId;
  final Map<String, dynamic>? parameters;

  PageComponent({required this.appId, required this.pageId, this.parameters});

  @override
  State<StatefulWidget> createState() {
    return _PageComponentState();
  }
}

class _PageComponentState extends State<PageComponent> {
  Widget? theBody;
  HasFab? hasFab;

  Future<PageModel?> getPage(String appId, String pageId) {
    return pageRepository(appId: appId)!.get(pageId);
  }

  @override
  Widget build(BuildContext context) {
    hasFab = null;

    var packageBlocProviders = <BlocProvider>[];
    Packages.registeredPackages.forEach((element) {
      var provider = element.createPackageAppBloc(
          widget.appId, AccessBloc.getBloc(context));
      if (provider != null) {
        packageBlocProviders.add(provider);
      }
    });

    if (packageBlocProviders.isNotEmpty) {
      return MultiBlocProvider(
          providers: packageBlocProviders, child: createPage(context));
    } else {
      return createPage(context);
    }
  }

  Widget createPage(BuildContext context) {
    return BlocProvider<CurrentPageBloc>(
        create: (context) => CurrentPageBloc()
          ..add(FetchCurrentPage(appId: widget.appId, pageId: widget.pageId)),
        child: BlocBuilder<CurrentPageBloc, CurrentPageState>(
            builder: (context, state) {
          if (state is CurrentPageLoaded) {
            var page = state.page;
            var parameters = widget.parameters;
            var componentInfo = ComponentInfo.getComponentInfo(
                context,
                state.app,
                page.bodyComponents!,
                parameters,
                fromPageLayout(page.layout),
                page.backgroundOverride,
                page.gridView);
            return Decorations.instance().createDecoratedPage(
                state.app,
                context,
                widget.pageKey,
                () => BlocBuilder(
                    bloc: BlocProvider.of<AccessBloc>(context),
                    builder: (BuildContext context, accessState) {
                      if (accessState is AccessDetermined) {
                        return PageContentsWidget(
                          key: widget.pageKey,
                          state: accessState,
                          app: state.app,
                          pageModel: page,
                          parameters: widget.parameters,
                          scaffoldKey: widget.scaffoldKey,
                          scaffoldMessengerKey: widget.scaffoldMessengerKey,
                          componentInfo: componentInfo,
                        );
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    }),
                page)();
          } else {
            return Center(child: CircularProgressIndicator());
          }
        }));
  }
}

class PageContentsWidget extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey;
  final AccessDetermined state;
  final AppModel app;
  final PageModel pageModel;
  final Map<String, dynamic>? parameters;
  final ComponentInfo componentInfo;

  PageContentsWidget({
    Key? key,
    required this.state,
    required this.app,
    required this.pageModel,
    required this.parameters,
    required this.scaffoldKey,
    required this.scaffoldMessengerKey,
    required this.componentInfo,
  }) : super(key: key) {}

  @override
  _PageContentsWidgetState createState() {
    return _PageContentsWidgetState();
  }
}

class _PageContentsWidgetState extends State<PageContentsWidget> {
  HasFab? hasFab;

  Widget _scaffold(Widget body) {
    return ScaffoldMessenger(
        key: widget.scaffoldMessengerKey,
        child: Scaffold(
          key: widget.scaffoldKey,
          endDrawer: widget.pageModel.endDrawer == null
              ? null
              : EliudDrawer(
                  accessState: widget.state,
                  app: widget.app,
                  drawerType: DrawerType.Right,
                  drawer: widget.pageModel.endDrawer!,
                  currentPage: widget.pageModel.documentID),
          appBar: widget.pageModel.appBar == null
              ? null
              : PreferredSize(
                  preferredSize: const Size(double.infinity, kToolbarHeight),
                  child: EliudAppBar(
                      app: widget.app,
                      member: widget.state.getMember(),
                      playstoreApp: widget.state.playstoreApp,
                      pageTitle: widget.pageModel.title,
                      currentPage: widget.pageModel.documentID,
                      scaffoldKey: widget.scaffoldKey,
                      theTitle: widget.pageModel.title ?? '',
                      value: widget.pageModel.appBar!)),
          body: body,
          drawer: widget.pageModel.drawer == null
              ? null
              : EliudDrawer(
                  accessState: widget.state,
                  app: widget.app,
                  drawerType: DrawerType.Left,
                  drawer: widget.pageModel.drawer!,
                  currentPage: widget.pageModel.documentID),
          floatingActionButton: hasFab != null ? hasFab!.fab(context) : null,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          bottomNavigationBar: EliudBottomNavigationBar(
              accessState: widget.state,
              app: widget.app,
              homeMenu: widget.pageModel.homeMenu!,
              currentPage: widget.pageModel.documentID),
        ));
  }

  @override
  Widget build(BuildContext context) {
    var theState = widget.state;
    if ((theState is LoggedIn) &&
        (!theState.isSubscribedToCurrentApp(widget.app.documentID))) {
      return _scaffold(
          AcceptMembershipWidget(widget.app, theState.member, theState.usr));
    } else {
      if (theState.isProcessingStatus()) {
        return _scaffold(Stack(children: [
          pageBody2(widget.app, context,
              backgroundOverride: widget.componentInfo.backgroundOverride,
              components: widget.componentInfo.widgets,
              layout: widget.componentInfo.layout,
              gridView: widget.componentInfo.gridView),
          BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 5,
              sigmaY: 5,
            ),
            child: Container(
              color: Colors.black.withOpacity(.3),
            ),
          ),
          progressIndicator(widget.app, context),
        ]));
      }
      if (theState.isCurrentAppBlocked(widget.app.documentID)) {
        return _scaffold(Stack(children: [
          pageBody(widget.app, context,
              backgroundOverride: widget.componentInfo.backgroundOverride,
              components: widget.componentInfo.widgets,
              layout: widget.componentInfo.layout,
              gridView: widget.componentInfo.gridView),
          BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 5,
              sigmaY: 5,
            ),
            child: Container(
              color: Colors.black.withOpacity(.3),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage("assets/images/denied.png",
                      package: 'eliud_core')),
            ),
          )
        ]));
      } else {
        return _scaffold(pageBody(widget.app, context,
            backgroundOverride: widget.componentInfo.backgroundOverride,
            components: widget.componentInfo.widgets,
            layout: widget.componentInfo.layout,
            gridView: widget.componentInfo.gridView));
      }
    }
  }
}
