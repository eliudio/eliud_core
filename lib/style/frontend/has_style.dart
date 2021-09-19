import 'package:flutter/material.dart';

import '../style_registry.dart';

abstract class HasStyle {
  TextStyle? styleText(BuildContext context);
  TextStyle? styleSmallText(BuildContext context);
  TextStyle? styleHighLight1(BuildContext context);
  TextStyle? styleHighLight2(BuildContext context);
  TextStyle? styleH1(BuildContext context);
  TextStyle? styleH2(BuildContext context);
  TextStyle? styleH3(BuildContext context);
  TextStyle? styleH4(BuildContext context);
  TextStyle? styleH5(BuildContext context);
}

TextStyle? styleText(BuildContext context) => StyleRegistry.registry()
    .styleWithContext(context)
    .frontEndStyle()
    .textStyleStyle()
    .styleText(context);

TextStyle? styleSmallText(BuildContext context) => StyleRegistry.registry()
    .styleWithContext(context)
    .frontEndStyle()
    .textStyleStyle()
    .styleSmallText(context);

TextStyle? styleHighLight1(BuildContext context) => StyleRegistry.registry()
    .styleWithContext(context)
    .frontEndStyle()
    .textStyleStyle()
    .styleHighLight1(context);

TextStyle? styleHighLight2(BuildContext context) => StyleRegistry.registry()
    .styleWithContext(context)
    .frontEndStyle()
    .textStyleStyle()
    .styleHighLight2(context);

TextStyle? styleH1(BuildContext context) => StyleRegistry.registry()
    .styleWithContext(context)
    .frontEndStyle()
    .textStyleStyle()
    .styleH1(context);

TextStyle? styleH2(BuildContext context) => StyleRegistry.registry()
    .styleWithContext(context)
    .frontEndStyle()
    .textStyleStyle()
    .styleH2(context);

TextStyle? styleH3(BuildContext context) => StyleRegistry.registry()
    .styleWithContext(context)
    .frontEndStyle()
    .textStyleStyle()
    .styleH3(context);

TextStyle? styleH4(BuildContext context) => StyleRegistry.registry()
    .styleWithContext(context)
    .frontEndStyle()
    .textStyleStyle()
    .styleH4(context);

TextStyle? styleH5(BuildContext context) => StyleRegistry.registry()
    .styleWithContext(context)
    .frontEndStyle()
    .textStyleStyle()
    .styleH5(context);
