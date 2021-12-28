import 'package:eliud_core/model/app_model.dart';
import 'package:flutter/material.dart';

import '../style_registry.dart';

abstract class HasStyle {
  TextStyle? styleInputDecorationLabel(AppModel app, BuildContext context);
  TextStyle? styleText(AppModel app, BuildContext context);
  TextStyle? styleSmallText(AppModel app, BuildContext context);
  TextStyle? styleHighLight1(AppModel app, BuildContext context);
  TextStyle? styleHighLight2(AppModel app, BuildContext context);
  TextStyle? styleH1(AppModel app, BuildContext context);
  TextStyle? styleH2(AppModel app, BuildContext context);
  TextStyle? styleH3(AppModel app, BuildContext context);
  TextStyle? styleH4(AppModel app, BuildContext context);
  TextStyle? styleH5(AppModel app, BuildContext context);
}

TextStyle? styleInputDecorationLabel(AppModel app, BuildContext context) => StyleRegistry.registry()
    .styleWithApp(app)
    .frontEndStyle()
    .textStyleStyle()
    .styleInputDecorationLabel(app, context);

TextStyle? styleText(AppModel app, BuildContext context) => StyleRegistry.registry()
    .styleWithApp(app)
    .frontEndStyle()
    .textStyleStyle()
    .styleText(app, context);

TextStyle? styleSmallText(AppModel app, BuildContext context) => StyleRegistry.registry()
    .styleWithApp(app)
    .frontEndStyle()
    .textStyleStyle()
    .styleSmallText(app, context);

TextStyle? styleHighLight1(AppModel app, BuildContext context) => StyleRegistry.registry()
    .styleWithApp(app)
    .frontEndStyle()
    .textStyleStyle()
    .styleHighLight1(app, context);

TextStyle? styleHighLight2(AppModel app, BuildContext context) => StyleRegistry.registry()
    .styleWithApp(app)
    .frontEndStyle()
    .textStyleStyle()
    .styleHighLight2(app, context);

TextStyle? styleH1(AppModel app, BuildContext context) => StyleRegistry.registry()
    .styleWithApp(app)
    .frontEndStyle()
    .textStyleStyle()
    .styleH1(app, context);

TextStyle? styleH2(AppModel app, BuildContext context) => StyleRegistry.registry()
    .styleWithApp(app)
    .frontEndStyle()
    .textStyleStyle()
    .styleH2(app, context);

TextStyle? styleH3(AppModel app, BuildContext context) => StyleRegistry.registry()
    .styleWithApp(app)
    .frontEndStyle()
    .textStyleStyle()
    .styleH3(app, context);

TextStyle? styleH4(AppModel app, BuildContext context) => StyleRegistry.registry()
    .styleWithApp(app)
    .frontEndStyle()
    .textStyleStyle()
    .styleH4(app, context);

TextStyle? styleH5(AppModel app, BuildContext context) => StyleRegistry.registry()
    .styleWithApp(app)
    .frontEndStyle()
    .textStyleStyle()
    .styleH5(app, context);
