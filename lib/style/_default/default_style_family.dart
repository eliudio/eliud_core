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

  static DefaultStyleFamily instance = DefaultStyleFamily._();

  DefaultStyleFamily._() : super(defaultStyleFamilyName) {
    register(_DefaultStyle(this));
  }

  Style defaultStyle() => styles.values.first;

  /*
   * A StyleFamily can implement the widgetToUpdateStyle. If so, the eliud_decor_style
   * will allow to create / update the style
   */
  @override
  Widget? widgetToUpdateStyle(BuildContext context, Style style,) => null;
}

class _DefaultStyle extends Style {
  static final String defaultStyleName = 'DefaultStyle';

  late AdminFormStyle _adminFormStyle;
  late AdminListStyle _adminListStyle;
  late FrontEndStyle _frontEndFormStyle;

  _DefaultStyle(StyleFamily styleFamily) : super(styleFamily, defaultStyleName, ) {
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
