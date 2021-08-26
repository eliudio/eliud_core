import 'package:eliud_core/style/admin/admin_form_style.dart';
import 'package:eliud_core/style/admin/admin_list_style.dart';
import 'package:eliud_core/style/frontend/frontend_style.dart';
import 'package:eliud_core/style/style.dart';
import 'admin/default_admin_form_style.dart';
import 'admin/default_admin_list_style.dart';
import 'frontend/default_frontend_style.dart';

/*
 * We should consider to put more in the style API. For example we could include the appBar, the bottom navigation bar, the drawer, popup menu, ...
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
