import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/default_style/default_style.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/style/style.dart';
import 'package:flutter/material.dart';

class StyleRegistry {
  static Style? _defaultStyle;
  Map<String, Style> registeredStyle = <String, Style>{};

  static final StyleRegistry _instance = StyleRegistry();

  static StyleRegistry registry() {
    return _instance;
  }

  StyleRegistry();

  Style styleWithContext(BuildContext context) {
      var app = AccessBloc.app(context);
      if (app != null) {
        return styleWithApp(app);
      } else {
        return defaultStyle();
      }
  }

  Style styleWithApp(AppModel app) {
    if ((app.styleFamily == null) || (app.styleName == null)) return defaultStyle();
    return style(app.styleFamily!, app.styleName!);
  }

  Style style(String familyName, String styleName) {
    var style = registeredStyle[key(familyName, styleName)];
    if (style != null) return style;
    return defaultStyle();
  }

  Style defaultStyle() {
    _defaultStyle ??= DefaultStyle();
    return _defaultStyle!;
  }

  String key(String familyName, String styleName) => familyName + '-' + styleName;

  void registerStyle(Style style) {
    registeredStyle[key(style.familyName(), style.styleName())] = style;
  }
}
