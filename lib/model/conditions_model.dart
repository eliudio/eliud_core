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

  // To determine access to a page/dialog/component, privilegeLevelRequired is compared against the privilegeLevel of the member (in app/access/{user id}/privilegeLevel).
// If a member is blocked, meaning his app/access/{user id}/blocked is set to true, then that member can still see the pages which have 
  PrivilegeLevelRequired privilegeLevelRequired;

  // If a ReadCondition is PackageDecides, then the field packageCondition is used as label to query the packages for the condition. Package condition is for example 'must have items in basket' and used to show the basket icon/action referring to the cart page. That page is conditional to having items in the basket. This is a display condition, not a data access restriction.
  String packageCondition;

  // The default condition is defined in the readCondition + privilegeLevelRequired + packageCondition, as explained in the remarks on those. However, when the condition is true, then the override can add extra display condition. ExactPrivilege means that the condition is met when the member's privilegeLevel equals exactly the privilegeLevelRequired. In other words a member with higher access rights does not see the page/component. InclusiveForBlockedMembers is to allow blocked members to also see the page/component. Remember: a blocked user can always see those pages anyway, because they are public pages. This is an display condition, not a data access restriction
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

