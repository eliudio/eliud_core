import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:eliud_core/core/blocs/access/access_event.dart';
import 'package:eliud_core/core/blocs/access/state/access_determined.dart';
import 'package:eliud_core/core/blocs/access/state/logged_in.dart';
import 'package:eliud_core/core/navigate/router.dart' as eliudrouter;
import 'package:eliud_core/decoration/decorations.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/style/frontend/has_button.dart';
import 'package:eliud_core/style/frontend/has_text.dart';
import 'package:eliud_core/tools/action/action_model.dart';
import 'package:eliud_core/tools/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/login_widget.dart';

class ErrorComponent extends StatefulWidget {
  final GlobalKey pageKey = GlobalKey();
  final AppModel app;
  final String error;

  ErrorComponent({required this.app, required this.error});

  @override
  State<StatefulWidget> createState() {
    return _ErrorComponentState();
  }
}

class _ErrorComponentState extends State<ErrorComponent> {
  Widget? theBody;

  @override
  Widget build(BuildContext context) {
    return Decorations.instance().createDecoratedErrorPage(
        widget.app,
        context,
        widget.pageKey,
        () => BlocBuilder(
            bloc: BlocProvider.of<AccessBloc>(context),
            builder: (BuildContext context, accessState) {
              if (accessState is AccessDetermined) {
                var app = accessState.getApp(widget.app.documentID);
                var playstoreApp = accessState.playstoreApp;
                var loggedIn = accessState is LoggedIn;
                if (app != null) {
                  return ErrorContentsWidget(
                      app: app,
                      playstoreApp: playstoreApp,
                      loggedIn: loggedIn,
                      error: widget.error,
                      key: widget.pageKey);
                } else {
                  return text(widget.app, context,
                      "App " + widget.app.documentID + " not found");
                }
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }))();
  }
}

class ErrorContentsWidget extends StatefulWidget {
  final AppModel app;
  final AppModel? playstoreApp;
  final String error;
  final bool loggedIn;

  ErrorContentsWidget({
    Key? key,
    required this.app,
    required this.playstoreApp,
    required this.error,
    required this.loggedIn
  }) : super(key: key) {}

  @override
  _ErrorContentsWidgetState createState() {
    return _ErrorContentsWidgetState();
  }
}

class _ErrorContentsWidgetState extends State<ErrorContentsWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: fullScreenHeight(context),
            width: fullScreenWidth(context),
            child: Center(
                child: ListView(children: [
              Center(child: h1(widget.app, context, widget.error)),
              button(widget.app, context, label: 'Go to home page',
                  onPressed: () {
                BlocProvider.of<AccessBloc>(context)
                    .add(GoHome(app: widget.app));
              }),
              if (!widget.loggedIn) button(widget.app, context, label: 'Login', onPressed: () {
                openLoginWidget(context, widget.app, );
              }),
              if (widget.playstoreApp != null)
                button(widget.app, context, label: 'Go To Playstore', onPressed: () {
                  eliudrouter.Router.navigateTo(
                      context,
                      SwitchApp(widget.app,
                          toAppID: widget.playstoreApp!.documentID));
                }),
            ]))));
  }
}
