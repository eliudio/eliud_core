import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/style/_default/default_style_family.dart';
import 'package:eliud_core/style/style.dart';
import 'package:eliud_core/style/style_family.dart';

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
  Future<void> addApp(MemberModel? currentMember, AppModel app,
      CurrentStyleTrigger currentStyleTrigger) async {
    for (var value in registeredStyleFamilies.values) {
      await value.addApp(currentMember, app);
      value.subscribeForChange(currentStyleTrigger);
    }
/*
    var futures = <Future<void>>[];
    registeredStyleFamilies.forEach((key, value) async {
      futures.add(await value.addApp(currentMember, app);
      value.subscribeForChange(currentStyleTrigger);
    });
*/
//    await Future.wait(futures);
  }

  Style styleWithApp(AppModel app) {
    if ((app.styleFamily == null) || (app.styleName == null)) {
      return defaultStyle();
    }
    return style(app, app.styleFamily!, app.styleName!);
  }

  StyleFamily? styleFamily(String familyName) {
    return registeredStyleFamilies[familyName];
  }

  Style style(AppModel app, String familyName, String styleName) {
    var theStyleFamily = styleFamily(familyName);
    if (theStyleFamily != null) {
      var style = theStyleFamily.getStyle(app, styleName);
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
