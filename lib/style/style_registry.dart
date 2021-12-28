import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/style/_default/default_style_family.dart';
import 'package:eliud_core/style/style.dart';
import 'package:eliud_core/style/style_family.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StyleRegistry {
  static Style? _defaultStyle;
  Map<String, StyleFamily> registeredStyleFamilies = <String, StyleFamily>{};

  static final StyleRegistry _instance = StyleRegistry();

  static StyleRegistry registry() {
    return _instance;
  }

  StyleRegistry();

/*
  Style styleWithContext(BuildContext context) {
      var app = AccessBloc.currentApp(context);
      return styleWithApp(app);
  }

*/
  Style styleWithApp(AppModel app) {
    if ((app.styleFamily == null) || (app.styleName == null)) return defaultStyle();
    return style(app.styleFamily!, app.styleName!);
  }

  StyleFamily? styleFamily(String familyName) {
    return registeredStyleFamilies[familyName];
  }

  Style style(String familyName, String styleName) {
    var _styleFamily = styleFamily(familyName);
    if (_styleFamily != null) {
      var style = _styleFamily.style(styleName);
      if (style != null) return style;
    }
    return defaultStyle();
  }

  Style defaultStyle() {
    _defaultStyle ??= DefaultStyleFamily.instance().defaultStyle();
    return _defaultStyle!;
  }

  void registerStyleFamily(StyleFamily styleFamily) {
    registeredStyleFamilies[styleFamily.familyName] = styleFamily;
  }
}
