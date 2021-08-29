import 'package:eliud_core/style/admin/admin_form_style.dart';
import 'package:eliud_core/style/admin/admin_list_style.dart';
import 'package:eliud_core/style/frontend/frontend_style.dart';
import 'package:eliud_core/style/style.dart';
import 'admin/default_admin_form_style.dart';
import 'admin/default_admin_list_style.dart';
import 'frontend/default_frontend_style.dart';

/*
 * This is the default style.
 * This style is used when an app refers to an non existing style or an app has not yet specified a style
 * This style is the minimum implementation of the style
 */
class DefaultStyle extends Style {
  static final String defaultFamilyName = 'DefaultFamily';
  static final String defaultStyleName = 'DefaultStyle';

  late AdminFormStyle _adminFormStyle;
  late AdminListStyle _adminListStyle;
  late FrontEndStyle _frontEndFormStyle;

  DefaultStyle() : super(defaultFamilyName, defaultStyleName, ) {
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
