import 'dart:async';
import 'dart:ui';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

import '../blocs/access/access_event.dart';
import '../blocs/access/state/access_state.dart';
import 'dialog_component.dart';

class PageComponent extends StatefulWidget {
  final GlobalKey pageKey = GlobalKey();

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

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
            return BlocListener<AccessBloc, AccessState>(
                bloc: BlocProvider.of<AccessBloc>(context),
                listener: (context, state) {
                  if ((state is AccessDetermined) &&
                      (state.tempMessage != null)) {
                    Flushbar(
                      title: 'Message',
                      message: state.tempMessage,
                      duration: Duration(seconds: 3),
                      onStatusChanged: (status) {
                        if (status == FlushbarStatus.DISMISSED) {
                          BlocProvider.of<AccessBloc>(context)
                              .add(DismissTempMessage());
                        }
                      },
                    )
                      ..show(context);
                  }
                },
                child: BlocBuilder(
                    bloc: BlocProvider.of<AccessBloc>(context),
                    builder: (BuildContext context, accessState) {
                      if (accessState is AccessDetermined) {
                        return Decorations.instance().createDecoratedPage(
                            state.app,
                            context,
                            widget.pageKey,
                                () =>
                                PageContentsWidget(
                                  key: widget.pageKey,
                                  state: accessState,
                                  app: state.app,
                                  pageModel: page,
                                  parameters: widget.parameters,
                                  scaffoldKey: widget.scaffoldKey,
                                  componentInfo: componentInfo,
                                ),
                            page)();
                      } else {
                        return progressIndicator();
                      }
                    }));
          } else if (state is CurrentPageLoadError) {
            return BlocBuilder(
                bloc: BlocProvider.of<AccessBloc>(context),
                builder: (BuildContext context, accessState) {
                  if (accessState is AccessDetermined) {
                    return Decorations.instance().createDecoratedErrorPage(
                        state.app,
                        context,
                        widget.pageKey,
                            () => Text("ERROR PAGE"),
                        )();
                  } else {
                    return progressIndicator();
                  }
                });
          } else {
            return progressIndicator();
          }
        }));
  }

  Widget progressIndicator() {
    return Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Center(child: CircularProgressIndicator()));
  }
}

class PageContentsWidget extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
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
    return Scaffold(
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: EliudBottomNavigationBar(
          accessState: widget.state,
          app: widget.app,
          homeMenu: widget.pageModel.homeMenu!,
          currentPage: widget.pageModel.documentID),
    );
  }

  Widget considerDialog(Widget original) {
    var parameters = widget.parameters;
    if (parameters != null) {
      var openDialogParam = parameters['open-dialog'];
      if (openDialogParam != null) {
        var dialogComponent = DialogComponent(app: widget.app,
            dialogId: openDialogParam,
            parameters: widget.parameters, includeHeading: false,);
        return Stack(children: [
          original,
          dialogComponent
        ]);
      }
    }
    return original;
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
        return _scaffold(considerDialog(Stack(children: [
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
        ])));
      }
      if (theState.isCurrentAppBlocked(widget.app.documentID)) {
        return _scaffold(considerDialog(Stack(children: [
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
        ])));
      } else {
        return _scaffold(considerDialog(pageBody(widget.app, context,
            backgroundOverride: widget.componentInfo.backgroundOverride,
            components: widget.componentInfo.widgets,
            layout: widget.componentInfo.layout,
            gridView: widget.componentInfo.gridView)));
      }
    }
  }
}
