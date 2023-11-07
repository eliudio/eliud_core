import 'dart:io' show Platform;

import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:eliud_core/core/blocs/access/access_event.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import '../../style/frontend/has_divider.dart';
import '../../style/style_registry.dart';
import '../../tools/widgets/header_widget.dart';

void openLoginWidget(BuildContext context, AppModel app,
    {PostLoginAction? actions}) {
  StyleRegistry.registry()
      .styleWithApp(app)
      .frontEndStyle()
      .dialogStyle()
      .openComplexDialog(app, context, '${app.documentID}/_style',
          widthFraction: .5,
          includeHeading: false,
          child: LoginWidget(app: app, actions: actions),
          title: 'Style');
}

class LoginWidget extends StatefulWidget {
  static double width(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.8;
  static double height(BuildContext context) =>
      MediaQuery.of(context).size.height * 0.6;

  final AppModel app;
  final PostLoginAction? actions;
  final bool? excludeHeader;

  const LoginWidget({
    required this.app,
    this.actions,
    this.excludeHeader,
    super.key,
  });

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  @override
  Widget build(BuildContext context) {
    var widgets = (widget.excludeHeader ?? false)
        ? <Widget>[]
        : <Widget>[
            HeaderWidget(
              app: widget.app,
              cancelAction: () async {
                return true;
              },
              title: 'Login',
            ),
            divider(widget.app, context),
          ];

    widgets.add(SignInButton(
      Buttons.Google,
      onPressed: () {
        BlocProvider.of<AccessBloc>(context).add(LoginEvent(
            app: widget.app,
            loginType: LoginType.googleLogin,
            actions: widget.actions));
        Navigator.of(context).pop();
      },
    ));

    var appleButton = SignInButton(
      Buttons.Apple,
      onPressed: () async {
        BlocProvider.of<AccessBloc>(context).add(LoginEvent(
            app: widget.app,
            loginType: LoginType.appleLogin,
            actions: widget.actions));
        Navigator.of(context).pop();
      },
    );

    // Avoid querying isIOS on web as this method is not supported / implemented and crashes
    if (kIsWeb) {
      widgets.add(appleButton);
    } else if (Platform.isIOS) {
      widgets.add(appleButton);
    }

    return ListView(
        shrinkWrap: true, physics: ScrollPhysics(), children: widgets);
  }
}
