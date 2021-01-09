/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 conditions_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/core/global_data.dart';
import 'package:eliud_core/tools/common_tools.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_core/model/entity_export.dart';


import 'package:eliud_core/model/conditions_entity.dart';

import 'package:eliud_core/tools/random.dart';

enum PrivilegeLevelRequired {
  NoPrivilegeRequired, Level1PrivilegeRequired, Level2PrivilegeRequired, OwnerPrivilegeRequired, Unknown
}

enum ConditionOverride {
  ExactPrivilege, InclusiveForBlockedMembers, ExclusiveForBlockedMember, Unknown
}


PrivilegeLevelRequired toPrivilegeLevelRequired(int index) {
  switch (index) {
    case 0: return PrivilegeLevelRequired.NoPrivilegeRequired;
    case 1: return PrivilegeLevelRequired.Level1PrivilegeRequired;
    case 2: return PrivilegeLevelRequired.Level2PrivilegeRequired;
    case 3: return PrivilegeLevelRequired.OwnerPrivilegeRequired;
  }
  return PrivilegeLevelRequired.Unknown;
}

ConditionOverride toConditionOverride(int index) {
  switch (index) {
    case 0: return ConditionOverride.ExactPrivilege;
    case 1: return ConditionOverride.InclusiveForBlockedMembers;
    case 2: return ConditionOverride.ExclusiveForBlockedMember;
  }
  return ConditionOverride.Unknown;
}


class ConditionsModel {

  // see firestore rules
  PrivilegeLevelRequired privilegeLevelRequired;

  // see firestore rules
  String packageCondition;

  // see firestore rules
  ConditionOverride conditionOverride;

  ConditionsModel({this.privilegeLevelRequired, this.packageCondition, this.conditionOverride, })  {
  }

  ConditionsModel copyWith({PrivilegeLevelRequired privilegeLevelRequired, String packageCondition, ConditionOverride conditionOverride, }) {
    return ConditionsModel(privilegeLevelRequired: privilegeLevelRequired ?? this.privilegeLevelRequired, packageCondition: packageCondition ?? this.packageCondition, conditionOverride: conditionOverride ?? this.conditionOverride, );
  }

  @override
  int get hashCode => privilegeLevelRequired.hashCode ^ packageCondition.hashCode ^ conditionOverride.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is ConditionsModel &&
          runtimeType == other.runtimeType && 
          privilegeLevelRequired == other.privilegeLevelRequired &&
          packageCondition == other.packageCondition &&
          conditionOverride == other.conditionOverride;

  @override
  String toString() {
    return 'ConditionsModel{privilegeLevelRequired: $privilegeLevelRequired, packageCondition: $packageCondition, conditionOverride: $conditionOverride}';
  }

  ConditionsEntity toEntity({String appId}) {
    return ConditionsEntity(
          privilegeLevelRequired: (privilegeLevelRequired != null) ? privilegeLevelRequired.index : null, 
          packageCondition: (packageCondition != null) ? packageCondition : null, 
          conditionOverride: (conditionOverride != null) ? conditionOverride.index : null, 
    );
  }

  static ConditionsModel fromEntity(ConditionsEntity entity) {
    if (entity == null) return null;
    return ConditionsModel(
          privilegeLevelRequired: toPrivilegeLevelRequired(entity.privilegeLevelRequired), 
          packageCondition: entity.packageCondition, 
          conditionOverride: toConditionOverride(entity.conditionOverride), 
    );
  }

  static Future<ConditionsModel> fromEntityPlus(ConditionsEntity entity, { String appId}) async {
    if (entity == null) return null;

    return ConditionsModel(
          privilegeLevelRequired: toPrivilegeLevelRequired(entity.privilegeLevelRequired), 
          packageCondition: entity.packageCondition, 
          conditionOverride: toConditionOverride(entity.conditionOverride), 
    );
  }

}

