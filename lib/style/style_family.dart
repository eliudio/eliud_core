import 'package:eliud_core/style/style.dart';
import 'package:flutter/cupertino.dart';

abstract class StyleFamily {
  final String familyName;
  final Map<String, Style> styles = <String, Style>{};

  StyleFamily(this.familyName);

  void register(Style style) {
    styles[style.styleName] = style;
  }

  Widget? widgetToUpdateStyle(BuildContext context, Style style,);

  Style? style(String styleName) {
    return styles[styleName];
  }
}