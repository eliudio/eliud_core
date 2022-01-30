import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/style/style.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

abstract class StyleFamily extends Equatable {
  final String familyName;
  final bool canInsert;

  StyleFamily(this.familyName, this.canInsert);

  Style? style(AppModel currentApp, String styleName);

  /*
   * Implement this methods in your style family to support inserts.
   * This will be used from for example when eliud_pkg_create StyleFamily::canInsert
   * is true and will be used in combination with Style::update(...)
   */
  Future<Style?> defaultNew(String appId, String newName) => Future.value(null);

  Map<String, Style> allStylesMap(AppModel app);

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