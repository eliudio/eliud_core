import 'dart:async';

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
//  late DefaultStyle defaultStyle;
  final Map<int, Style> _defaultStyles = {};

  static DefaultStyleFamily instance() {
    _instance ??= DefaultStyleFamily._();
    return _instance!;
  }

  DefaultStyleFamily._()
      : super(
          defaultStyleFamilyName,
          false,
        ) {
    _defaultStyles[0] = DefaultStyle(this);
  }

  /*
   * A StyleFamily can implement the widgetToUpdateStyle. If so, the eliud_pkg_create
   * will allow to create / update the style
   */
  Widget? widgetToUpdateStyle(
    BuildContext context,
    Style style,
  ) =>
      null;

  @override
  Future<void> addApp(MemberModel? currentMember, AppModel app) async {}

  @override
  Style? getStyle(AppModel currentApp, String styleName) {
    return _defaultStyles[0];
  }

  @override
  StreamSubscription? listenToStyles(
      String appId, StylesTrigger stylesTrigger) {
    stylesTrigger([_defaultStyles[0]!]);
    return null;
  }

  @override
  Future<void> delete(AppModel app, Style style) {
    throw Exception('Readonly style');
  }

  @override
  void subscribeForChange(CurrentStyleTrigger currentStyleTrigger) {}

  @override
  Future<void> update(AppModel app, Style style) {
    throw Exception('Readonly style');
  }

  @override
  Future<Style> newStyle(AppModel app, String newName) {
    throw Exception('Readonly style');
  }

  Style defaultStyle() {
    return _defaultStyles[0]!;
  }
}

class DefaultStyle extends Style {
  static final String defaultStyleName = 'DefaultStyle';

  final AdminFormStyle _adminFormStyle;
  final AdminListStyle _adminListStyle;
  final FrontEndStyle _frontEndFormStyle;

  DefaultStyle(StyleFamily styleFamily)
      : _adminFormStyle = DefaultAdminFormStyle(),
        _adminListStyle = DefaultAdminListStyle(),
        _frontEndFormStyle = DefaultFrontEndStyle(),
        super(styleFamily, defaultStyleName, AllowedUpdates.noneAllowed());

  @override
  AdminFormStyle adminFormStyle() => _adminFormStyle;

  @override
  AdminListStyle adminListStyle() => _adminListStyle;

  @override
  FrontEndStyle frontEndStyle() => _frontEndFormStyle;

  @override
  Future<Style> copy(AppModel app, String newName) {
    throw Exception('Readonly style');
  }
}
