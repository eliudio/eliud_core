import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';
import 'package:eliud_core/core/components/util/component_info.dart';
import 'package:eliud_core/core/components/util/page_body.dart';
import 'package:eliud_core/core/components/page_constructors/eliud_appbar.dart';
import 'package:eliud_core/core/components/page_constructors/eliud_bottom_navigation_bar.dart';
import 'package:eliud_core/core/components/page_constructors/eliud_drawer.dart';
import 'package:eliud_core/core/widgets/accept_membership.dart';
import 'package:eliud_core/core/widgets/progress_indicator.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/page_model.dart';

import 'package:eliud_core/core/widgets/alert_widget.dart';

import 'package:eliud_core/model/page_component_bloc.dart';
import 'package:eliud_core/model/page_component_state.dart';
import 'package:eliud_core/model/page_component_event.dart';
import 'package:eliud_core/tools/has_fab.dart';
import 'package:eliud_core/tools/registry.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class PageComponent extends StatelessWidget {
  final GlobalKey<NavigatorState>? navigatorKey;
  final String? pageID;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
  final Map<String, dynamic>? parameters;

  PageComponent({this.navigatorKey, this.pageID, this.parameters});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccessBloc, AccessState>(
        builder: (context, accessState) {
      if (accessState is AppLoaded) {
        var app = accessState.app;
        return MultiBlocProvider(
            providers: [
              BlocProvider<PageComponentBloc>(
                create: (context) => PageComponentBloc(
                    pageRepository: pageRepository(appId: app.documentID))
                  ..add(FetchPageComponent(id: pageID)),
              ),
            ],
            child: BlocBuilder<PageComponentBloc, PageComponentState>(
                builder: (context, state) {
              if (state is PageComponentLoaded) {
                if (state.value == null) {
                  return AlertWidget(
                      title: 'Error', content: 'No page defined');
                } else {
                  return PageContentsWidget(
                    state: accessState,
                    pageID: pageID!,
                    pageModel: state.value!,
                    parameters: parameters,
                    scaffoldKey: scaffoldKey,
                    scaffoldMessengerKey: scaffoldMessengerKey,
                  );
                }
              } else if (state is PageComponentError) {
                return AlertWidget(title: 'Error', content: state.message);
              } else {
                return Center(
                  child: DelayedCircularProgressIndicator(),
                );
              }
            }));
      } else {
        return DelayedCircularProgressIndicator();
      }
    });
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
  }) : super(key: key);

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
    var pageID = widget.pageID;
    var parameters = widget.parameters;
    if (accessState is AppProcessingState) {
      theBody = Center(
          child: DelayedCircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
      ));
    } else if ((accessState is LoggedIn) &&
        (accessState.forceAcceptMembership())) {
      theBody =
          AcceptMembershipWidget(app, accessState.member, accessState.usr);
    } else {
      var componentInfo = ComponentInfo.getComponentInfo(value.bodyComponents!, parameters, accessState, fromPageLayout(value.layout), value.background, value.gridView);
      if (value.widgetWrapper != null) {
        theBody = Registry.registry()!.wrapWidgetInBloc(value.widgetWrapper!, context, componentInfo);
      } else {
        theBody = PageBody(componentInfo: componentInfo,);
      }
    }

    var drawer = value.drawer == null
        ? null
        : EliudDrawer(drawer: value.drawer!, currentPage: pageID);
    var endDrawer = value.endDrawer == null
        ? null
        : EliudDrawer(drawer: value.endDrawer!, currentPage: pageID);
    var bottomNavigationBar = EliudBottomNavigationBar(
        app: app,
        homeMenu: value.homeMenu,
        bg: value.background,
        currentPage: pageID);
    var appBar = value.appBar == null
        ? null
        : PreferredSize(
            preferredSize: const Size(double.infinity, kToolbarHeight),
            child: EliudAppBar(
                currentPage: pageID,
                scaffoldKey: widget.scaffoldKey,
                theTitle: value.title == null ? "" : value.title!,
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
