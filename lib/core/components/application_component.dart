import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_event.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';
import 'package:eliud_core/core/global_data.dart';
import 'package:eliud_core/core/navigate/navigate_bloc.dart';
import 'package:eliud_core/tools/component_constructor.dart';
import 'package:eliud_core/tools/router_builders.dart';

import '../../core/navigate/router.dart' as eliudrouter;
import '../../core/widgets/alert_widget.dart';

import '../../model/app_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class ApplicationComponentConstructor extends ComponentConstructor {}

class ApplicationComponentConstructorDefault
    extends ApplicationComponentConstructor {
  final GlobalKey<NavigatorState> navigatorKey;
//  final UserRepository userRepository;

  ApplicationComponentConstructorDefault(
      {this.navigatorKey /*, this.userRepository*/});

  @override
  Widget createNew({String id, Map<String, String> parameters}) {
    return ApplicationComponent(
        applicationID: id,
        navigatorKey: navigatorKey /*, userRepository: userRepository*/);
  }
}

class ApplicationComponent extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final String applicationID;
  final Map<String, String> parameters;

  ApplicationComponent({this.applicationID, this.navigatorKey, this.parameters});

  @override
  Widget build(BuildContext context) {
    var navigatorBloc = NavigatorBloc(navigatorKey: navigatorKey);
    var blocProviders = <BlocProvider>[];
    blocProviders.add(BlocProvider<AccessBloc>(
        create: (context) => AccessBloc(navigatorBloc)..add(InitApp(applicationID)))
    );
    blocProviders.add(BlocProvider<NavigatorBloc>(create: (context) => navigatorBloc));
    GlobalData.registeredPlugins.forEach((element) {
      var provider = element.createMainBloc(navigatorBloc);
      if (provider != null) {
        blocProviders.add(provider);
      }
    });

    return MultiBlocProvider(
        providers: blocProviders,
        child: _app()
    );
  }

  Widget _app() {
    return BlocBuilder<AccessBloc, AccessState>(
        builder: (accessContext, accessState) {
      if (accessState is UndeterminedAccessState) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (accessState is AccessStateWithDetails) {
        if (accessState.app == null) {
          return AlertWidget(title: 'Error', content: 'No access defined');
        } else {
          var app = accessState.app;
          var router = eliudrouter.Router();
          ThemeData darkTheme;
          if ((app.darkOrLight != null) &&
              (app.darkOrLight == DarkOrLight.Dark)) {
            darkTheme = ThemeData.dark();
          }

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            navigatorKey: navigatorKey,
            initialRoute: eliudrouter.Router.homeRoute,
            onGenerateRoute: router.generateRoute,
            darkTheme: darkTheme,
            onUnknownRoute: (RouteSettings setting) {
              return pageRouteBuilder(
                  page: AlertWidget(title: 'Error', content: 'Page not found'));
            },
            title: app.title ?? 'No title',
          );
        }
      } else {
        return AlertWidget(title: 'Error', content: 'Unexpected state');
      }
    });
  }
}
