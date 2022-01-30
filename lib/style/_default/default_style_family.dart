import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/style/admin/admin_form_style.dart';
import 'package:eliud_core/style/admin/admin_list_style.dart';
import 'package:eliud_core/style/frontend/frontend_style.dart';
import 'package:eliud_core/style/style.dart';
import 'package:flutter/widgets.dart';
import '../style_family.dart';
import 'admin/default_admin_form_style.dart';
import 'admin/default_admin_list_style.dart';
import 'frontend/default_frontend_style.dart';

class DefaultStyleFamily extends StyleFamily {
  static final String defaultStyleFamilyName = 'DefaultFamilyStyle';

  static DefaultStyleFamily? _instance;
  static DefaultStyle? _defaultStyle;

  static DefaultStyleFamily instance() {
    _instance ??= DefaultStyleFamily._();
    return _instance!;
  }

  DefaultStyleFamily._() : super(defaultStyleFamilyName, false);

  Style defaultStyle() {
    _defaultStyle ??= DefaultStyle(this);
    return _defaultStyle!;
  }

  /*
   * A StyleFamily can implement the widgetToUpdateStyle. If so, the eliud_pkg_create
   * will allow to create / update the style
   */
  Widget? widgetToUpdateStyle(BuildContext context, Style style,) => null;

  @override
  Future<void> addApp(MemberModel? currentMember, AppModel app) async {
  }

  @override
  Map<String, Style> allStylesMap(AppModel app) => { defaultStyleFamilyName: _defaultStyle! };

  @override
  Style? style(AppModel currentApp, String styleName) => _defaultStyle;
}

class DefaultStyle extends Style {
  static final String defaultStyleName = 'DefaultStyle';

  late AdminFormStyle _adminFormStyle;
  late AdminListStyle _adminListStyle;
  late FrontEndStyle _frontEndFormStyle;

  DefaultStyle(StyleFamily styleFamily) : super(styleFamily, defaultStyleName, AllowedUpdates.noneAllowed()) {
    _adminFormStyle = DefaultAdminFormStyle();
    _adminListStyle = DefaultAdminListStyle();
    _frontEndFormStyle = DefaultFrontEndStyle();
  }

  @override
  AdminFormStyle adminFormStyle() => _adminFormStyle;
  @override
  AdminListStyle adminListStyle() => _adminListStyle;
  @override
  FrontEndStyle frontEndStyle() => _frontEndFormStyle;
}
