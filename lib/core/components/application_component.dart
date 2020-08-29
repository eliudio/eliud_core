import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_event.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';
import 'package:eliud_core/core/navigate/navigate_bloc.dart';
import 'package:eliud_core/tools/component_constructor.dart';
import 'package:eliud_core/tools/router_builders.dart';

import '../../core/navigate/router.dart';
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
    NavigatorBloc navigatorBloc = NavigatorBloc(navigatorKey: navigatorKey);
    // CartBloc cartBloc = CartBloc(navigatorBloc);
    // Allow the application component to have blocs, cartbloc, registered and then to be added here!
    return MultiBlocProvider(providers: [
      BlocProvider<AccessBloc>(
          create: (context) =>
              //    AppBloc(appRepository: AbstractRepositorySingleton.singleton.appRepository())..add(FetchApp(id: applicationID)))
              AccessBloc(navigatorBloc)..add(InitApp(applicationID))),
      BlocProvider<NavigatorBloc>(create: (context) => navigatorBloc),
//      BlocProvider<CartBloc>(create: (context) => cartBloc),
    ], child: _app());
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
          return AlertWidget(title: "Error", content: "No access defined");
        } else {
          AppModel app = accessState.app;
          Router router = Router();
          ThemeData darkTheme;
          if ((app.darkOrLight != null) &&
              (app.darkOrLight == DarkOrLight.Dark))
            darkTheme = ThemeData.dark();

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            navigatorKey: navigatorKey,
            initialRoute: Router.homeRoute,
            onGenerateRoute: router.generateRoute,
            darkTheme: darkTheme,
            onUnknownRoute: (RouteSettings setting) {
              return pageRouteBuilder(
                  page: AlertWidget(title: "Error", content: "Page not found"));
            },
            title: app.title != null ? app.title : "No title",
          );
        }
      } else {
        return AlertWidget(title: "Error", content: "Unexpected state");
      }
    });
  }
}
