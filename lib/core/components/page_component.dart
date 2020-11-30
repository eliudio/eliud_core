import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';
import 'package:eliud_core/core/app/app_bloc.dart';
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
  Widget createNew({String id, Map<String, String> parameters}) {
    return PageComponent(navigatorKey: navigatorKey, pageID: id, parameters: parameters,);
  }
}

// ignore: must_be_immutable
class PageComponent extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final String pageID;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final Map<String, String> parameters;

  PageComponent({this.navigatorKey, this.pageID, this.parameters});

  HasFab hasFab;

  @override
  Widget build(BuildContext context) {
    var accessState = BlocProvider.of<AccessBloc>(context).state;
    var app = AppBloc.app(context);
    return MultiBlocProvider(
        providers: [
          BlocProvider<PageComponentBloc>(
            create: (context) => PageComponentBloc(
                pageRepository:
                    AbstractRepositorySingleton.singleton.pageRepository(app.documentID))
              ..add(FetchPageComponent(id: pageID)),
          ),
        ],
        child: BlocBuilder<PageComponentBloc, PageComponentState>(builder: (context, state) {
          if (state is PageComponentLoaded) {
            if (state.value == null) {
              return AlertWidget(title: 'Error', content: 'No page defined');
            } else {
              Widget theBody;
              if ((accessState is LoggedIn) && (accessState.forceAcceptMembership())) {
                theBody = AcceptMembershipWidget(
                    app, accessState.member, accessState.usr);
              } else {
                theBody = _body(context, accessState,
                    backgroundDecoration: state.value.background,
                    componentModels: state.value.bodyComponents,
                    pageModel: state.value);
              }

              var drawer = DrawerConstructor(app, accessState, pageID)
                  .drawer(context, state.value.drawer);
              var endDrawer = DrawerConstructor(app, accessState, pageID)
                  .drawer(context, state.value.endDrawer);
              var appBar = AppBarConstructor(app, accessState, pageID, _scaffoldKey)
                  .appBar(context, state.value.title, state.value.appBar);
              return Scaffold(
                key: _scaffoldKey,
                endDrawer: endDrawer,
                appBar: PreferredSize(
                    preferredSize: const Size(double.infinity, kToolbarHeight),
                    child: appBar),
                body: theBody,
                drawer: drawer,
                floatingActionButton: hasFab != null ? hasFab.fab(context) : null,
                floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
                bottomNavigationBar: BottomNavigationBarConstructor(pageID)
                    .bottomNavigationBar(app, accessState,
                        context, state.value.homeMenu, state.value.background),
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
  }

  Widget _body(BuildContext context,
      AccessState accessState,
      {BackgroundModel backgroundDecoration,
      List<BodyComponentModel> componentModels,
      PageModel pageModel}) {
    try {
      var components = componentModels
          .map((model) => Registry.registry().component(
              componentName: model.componentName, id: model.componentId, parameters: parameters))
          .toList();
      components.forEach((element) {
        if (element is HasFab) {
          hasFab = element as HasFab;
        }
      });
      if (components.isNotEmpty) {
        if (backgroundDecoration == null) {
          return _container(context, components, pageModel);
        } else {
          return Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecorationHelper.boxDecoration(accessState, backgroundDecoration),
              ),
              _container(context, components, pageModel)
            ],
          );
        }
      }
      return Container(color: Colors.white);
    } catch (_) {
      return null;
    }
  }

  Widget _container(
      BuildContext context, List<Widget> components, PageModel model) {
    switch (model.layout) {
      case PageLayout.GridView:
        return _gridView(context, components, model);
      case PageLayout.ListView:
        return _listView(context, components, model);
      case PageLayout.OnlyTheFirstComponent:
        return _justTheFirst(context, components, model);
      case PageLayout.Unknown:
        return _listView(context, components, model);
    }
    return _listView(context, components, model);
  }

  Widget _listView(
      BuildContext context, List<Widget> components, PageModel model) {
    return ListView.builder(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemCount: components.length,
      itemBuilder: (BuildContext context, int index) {
        return components[index];
      },
    );
  }

  Widget _justTheFirst(
      BuildContext context, List<Widget> components, PageModel model) {
    return components[0];
  }

  Widget _gridView(
      BuildContext context, List<Widget> components, PageModel model) {
    return GridViewHelper.container(context, components, model.gridView);
  }
}
