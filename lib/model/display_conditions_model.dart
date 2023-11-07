/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 display_conditions_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/core/base/model_base.dart';

import 'package:eliud_core/model/entity_export.dart';

import 'package:eliud_core/model/display_conditions_entity.dart';

enum PrivilegeLevelRequired {
  noPrivilegeRequired,
  level1PrivilegeRequired,
  level2PrivilegeRequired,
  ownerPrivilegeRequired,
  unknown
}

enum ConditionOverride {
  exactPrivilege,
  inclusiveForBlockedMembers,
  exclusiveForBlockedMember,
  unknown
}

PrivilegeLevelRequired toPrivilegeLevelRequired(int? index) {
  switch (index) {
    case 0:
      return PrivilegeLevelRequired.noPrivilegeRequired;
    case 1:
      return PrivilegeLevelRequired.level1PrivilegeRequired;
    case 2:
      return PrivilegeLevelRequired.level2PrivilegeRequired;
    case 3:
      return PrivilegeLevelRequired.ownerPrivilegeRequired;
  }
  return PrivilegeLevelRequired.unknown;
}

ConditionOverride toConditionOverride(int? index) {
  switch (index) {
    case 0:
      return ConditionOverride.exactPrivilege;
    case 1:
      return ConditionOverride.inclusiveForBlockedMembers;
    case 2:
      return ConditionOverride.exclusiveForBlockedMember;
  }
  return ConditionOverride.unknown;
}

class DisplayConditionsModel {
  static const String packageName = 'eliud_core';
  static const String id = 'displayConditionss';

  // see firestore rules
  PrivilegeLevelRequired? privilegeLevelRequired;

  // see firestore rules
  String? packageCondition;

  // see firestore rules
  ConditionOverride? conditionOverride;

  DisplayConditionsModel({
    this.privilegeLevelRequired,
    this.packageCondition,
    this.conditionOverride,
  });

  DisplayConditionsModel copyWith({
    PrivilegeLevelRequired? privilegeLevelRequired,
    String? packageCondition,
    ConditionOverride? conditionOverride,
  }) {
    return DisplayConditionsModel(
      privilegeLevelRequired:
          privilegeLevelRequired ?? this.privilegeLevelRequired,
      packageCondition: packageCondition ?? this.packageCondition,
      conditionOverride: conditionOverride ?? this.conditionOverride,
    );
  }

  @override
  int get hashCode =>
      privilegeLevelRequired.hashCode ^
      packageCondition.hashCode ^
      conditionOverride.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DisplayConditionsModel &&
          runtimeType == other.runtimeType &&
          privilegeLevelRequired == other.privilegeLevelRequired &&
          packageCondition == other.packageCondition &&
          conditionOverride == other.conditionOverride;

  @override
  String toString() {
    return 'DisplayConditionsModel{privilegeLevelRequired: $privilegeLevelRequired, packageCondition: $packageCondition, conditionOverride: $conditionOverride}';
  }

  Future<List<ModelReference>> collectReferences({String? appId}) async {
    List<ModelReference> referencesCollector = [];
    return referencesCollector;
  }

  DisplayConditionsEntity toEntity({String? appId}) {
    return DisplayConditionsEntity(
      privilegeLevelRequired: (privilegeLevelRequired != null)
          ? privilegeLevelRequired!.index
          : null,
      packageCondition: (packageCondition != null) ? packageCondition : null,
      conditionOverride:
          (conditionOverride != null) ? conditionOverride!.index : null,
    );
  }

  static Future<DisplayConditionsModel?> fromEntity(
      DisplayConditionsEntity? entity) async {
    if (entity == null) return null;
    return DisplayConditionsModel(
      privilegeLevelRequired:
          toPrivilegeLevelRequired(entity.privilegeLevelRequired),
      packageCondition: entity.packageCondition,
      conditionOverride: toConditionOverride(entity.conditionOverride),
    );
  }

  static Future<DisplayConditionsModel?> fromEntityPlus(
      DisplayConditionsEntity? entity,
      {String? appId}) async {
    if (entity == null) return null;

    return DisplayConditionsModel(
      privilegeLevelRequired:
          toPrivilegeLevelRequired(entity.privilegeLevelRequired),
      packageCondition: entity.packageCondition,
      conditionOverride: toConditionOverride(entity.conditionOverride),
    );
  }
}
