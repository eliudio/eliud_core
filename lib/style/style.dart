import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/style/style_family.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'admin/admin_form_style.dart';
import 'admin/admin_list_style.dart';
import 'frontend/frontend_style.dart';

class AllowedUpdates extends Equatable {
  final bool canUpdate;
  final bool canCopy;
  final bool canDelete;

  AllowedUpdates(this.canUpdate, this.canCopy, this.canDelete);

  static AllowedUpdates allAllowed() => AllowedUpdates(true, true, true);
  static AllowedUpdates readOnly() => AllowedUpdates(false, true, false);
  static AllowedUpdates noneAllowed() => AllowedUpdates(false, false, false);

  @override
  List<Object?> get props => [ canUpdate, canCopy, canDelete ];

  @override
  bool operator == (Object other) =>
      identical(this, other) ||
          other is AllowedUpdates &&
              runtimeType == other.runtimeType &&
              canUpdate == other.canUpdate &&
              canCopy == other.canCopy &&
              canDelete == other.canDelete;
}

abstract class Style extends Equatable {
  final StyleFamily styleFamily;
  final String styleName;
  final AllowedUpdates allowedUpdates;

  Style(this.styleFamily, this.styleName, this.allowedUpdates);

  AdminFormStyle adminFormStyle();
  AdminListStyle adminListStyle();
  FrontEndStyle frontEndStyle();

  /*
   * Implement this methods in your style to support updates.
   * This will be used from for example eliud_pkg_create when Style::allowUpdates.canUpdate
   * is true
   */
  bool update(AppModel app, BuildContext context) => false;

  /*
   * Implement this methods in your style to support updates.
   * This will be used from for example eliud_pkg_create when Style::allowUpdates.canCopy
   * is true and will be used in combination with update(...)
   */
  Future<Style?> copy(AppModel app, String newName);

  @override
  List<Object?> get props => [ styleFamily, styleName, allowedUpdates ];

  @override
  bool operator == (Object other) =>
      identical(this, other) ||
          other is Style &&
              runtimeType == other.runtimeType &&
              styleFamily == other.styleFamily &&
              styleName == other.styleName &&
              allowedUpdates == other.allowedUpdates;
}
