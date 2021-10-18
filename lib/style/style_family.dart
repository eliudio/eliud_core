import 'package:eliud_core/style/style.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

abstract class StyleFamily extends Equatable {
  final String familyName;
  final Map<String, Style> styles = <String, Style>{};
  final bool canInsert;

  StyleFamily(this.familyName, this.canInsert);

  StyleFamily register(Style style) {
    styles[style.styleName] = style;
    return this;
  }

  StyleFamily registerAll(List<Style> styles) {
    for (var style in styles) {
      register(style);
    }
    return this;
  }

  StyleFamily registerMap(Map<String, Style> styles) {
    for (var style in styles.values) {
      register(style);
    }
    return this;
  }

  Style? style(String styleName) {
    return styles[styleName];
  }

  /*
   * Implement this methods in your style family to support inserts.
   * This will be used from for example when eliud_pkg_create StyleFamily::canInsert
   * is true and will be used in combination with Style::update(...)
   */
  Style? defaultNew(String newName) => null;

  StyleFamily copyWithNewStyles(Map<String, Style>? styles);

  @override
  List<Object?> get props => [ familyName, styles, canInsert ];

  @override
  bool operator == (Object other) =>
      identical(this, other) ||
          other is StyleFamily &&
              runtimeType == other.runtimeType &&
              familyName == other.familyName &&
              canInsert == other.canInsert &&
              mapEquals(styles, other.styles);
}