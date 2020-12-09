import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';
import 'package:eliud_core/core/components/page_body_helper.dart';
import 'package:eliud_core/core/widgets/accept_membership.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/background_model.dart';
import 'package:eliud_core/tools/has_fab.dart';
import 'package:eliud_core/tools/grid_view_helper.dart';

import 'package:eliud_core/core/components/page_constructors/appbar_constructor.dart';
import 'package:eliud_core/core/components/page_constructors/bottom_navigation_bar_constructor.dart';
import 'package:eliud_core/core/components/page_constructors/drawer_constructor.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';

import 'package:eliud_core/tools/component_constructor.dart';

import 'package:eliud_core/model/body_component_model.dart';
import 'package:eliud_core/model/page_component_bloc.dart';
import 'package:eliud_core/model/page_component_state.dart';
import 'package:eliud_core/model/page_component_event.dart';
import 'package:eliud_core/model/page_model.dart';
import 'package:eliud_core/tools/registry.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../tools/etc.dart';

abstract class PageComponentConstructor extends ComponentConstructor {}

class PageComponentConstructorDefault extends PageComponentConstructor {
  final GlobalKey<NavigatorState> navigatorKey;

  PageComponentConstructorDefault({this.navigatorKey});

  @override
  Widget createNew({String id, Map<String, Object> parameters}) {
    return PageComponent(navigatorKey: navigatorKey, pageID: id, parameters: parameters,);
  }
}

// ignore: must_be_immutable
class PageComponent extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final String pageID;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final Map<String, Object> parameters;

  PageComponent({this.navigatorKey, this.pageID, this.parameters});

  @override
  Widget build(BuildContext context) {
    var accessState = BlocProvider.of<AccessBloc>(context).state;
    if (accessState is AppLoaded) {
      var app = accessState.app;
      return MultiBlocProvider(
          providers: [
            BlocProvider<PageComponentBloc>(
              create: (context) =>
              PageComponentBloc(
                  pageRepository:
                  AbstractRepositorySingleton.singleton.pageRepository(
                      app.documentID))
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
                    Widget theBody;
                    var hasFab;
                    if ((accessState is LoggedIn) &&
                        (accessState.forceAcceptMembership())) {
                      theBody = AcceptMembershipWidget(
                          app, accessState.member, accessState.usr);
                    } else {
                      var helper = PageBodyHelper();
                      var components = helper.getComponents(state.value.bodyComponents, parameters);
                      hasFab = getFab(components);
                      theBody = helper.body(context, accessState,
                          backgroundDecoration: state.value.background,
                          components: components,
                          pageModel: state.value);
                    }

                    var drawer = DrawerConstructor(pageID)
                        .drawer(context, state.value.drawer);
                    var endDrawer = DrawerConstructor(pageID)
                        .drawer(context, state.value.endDrawer);
                    var appBar = AppBarConstructor(pageID, _scaffoldKey)
                        .appBar(context, state.value.title, state.value.appBar);
                    return Scaffold(
                      key: _scaffoldKey,
                      endDrawer: endDrawer,
                      appBar: PreferredSize(
                          preferredSize: const Size(
                              double.infinity, kToolbarHeight),
                          child: appBar),
                      body: theBody,
                      drawer: drawer,
                      floatingActionButton: hasFab != null
                          ? hasFab.fab(context)
                          : null,
                      floatingActionButtonLocation: FloatingActionButtonLocation
                          .centerFloat,
                      bottomNavigationBar: BottomNavigationBarConstructor(
                          pageID).bottomNavigationBar(
                          app, state.value.homeMenu, state.value.background),
                    );
                  }
                } else if (state is PageComponentError) {
                  return AlertWidget(title: 'Error', content: state.message);
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }));
    } else {
      return CircularProgressIndicator();
    }
  }

  HasFab getFab(List<Widget> components) {
    HasFab hasFab;
    components.forEach((element) {
      if (element is HasFab) {
        hasFab = element as HasFab;
      }
    });
    return hasFab;
  }

}
