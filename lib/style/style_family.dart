import 'dart:async';

import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/style/style.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

typedef StylesTrigger(List<Style> list);
typedef CurrentStyleTrigger();

abstract class StyleFamily extends Equatable {
  final String familyName;
  final bool canInsert;
  final bool canGenerateDefaults;

  StyleFamily(this.familyName, this.canInsert, this.canGenerateDefaults);

  Style? getStyle(AppModel currentApp, String styleName);

  /*
   * Implement this methods in your style family to support inserts.
   * This will be used from for example when eliud_pkg_create StyleFamily::canInsert
   * is true and will be used in combination with Style::update(...)
   */
  Future<Style?> defaultNew(String appId, String newName) => Future.value(null);

  /*
   * Retrieve all styles supported by this family
   */
  StreamSubscription<dynamic>? listenToStyles(String appId, StylesTrigger stylesTrigger);

  /*
   * Subscribe for a change of the current style
   */
  void subscribeForChange(CurrentStyleTrigger? currentStyleTrigger);

  /*
   * Delete style
   */
  Future<void> delete(AppModel app, Style style);

  /*
   * Update style
   */
  Future<void> update(AppModel app, Style style);

  /*
   * Create a new style
   */
  Future<Style> newStyle(AppModel app, String newName);

  /*
   * Install "factory" default styles
   */
  Future<void> installDefaults(AppModel app);

    /* inform the style family that there user switched to a new app and
   * hence need to prepare, ie. have styles in memory, ...
   */
  Future<void> addApp(MemberModel? currentMember, AppModel app);

  @override
  List<Object?> get props => [ familyName, canInsert ];

  @override
  bool operator == (Object other) =>
      identical(this, other) ||
          other is StyleFamily &&
              runtimeType == other.runtimeType &&
              familyName == other.familyName &&
              canInsert == other.canInsert;
}