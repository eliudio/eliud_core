/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 conditions_simple_model.dart
                       
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


import 'package:eliud_core/model/conditions_simple_entity.dart';

import 'package:eliud_core/tools/random.dart';

enum PrivilegeLevelRequiredSimple {
  NoPrivilegeRequiredSimple, Level1PrivilegeRequiredSimple, Level2PrivilegeRequiredSimple, OwnerPrivilegeRequiredSimple, Unknown
}


PrivilegeLevelRequiredSimple toPrivilegeLevelRequiredSimple(int index) {
  switch (index) {
    case 0: return PrivilegeLevelRequiredSimple.NoPrivilegeRequiredSimple;
    case 1: return PrivilegeLevelRequiredSimple.Level1PrivilegeRequiredSimple;
    case 2: return PrivilegeLevelRequiredSimple.Level2PrivilegeRequiredSimple;
    case 3: return PrivilegeLevelRequiredSimple.OwnerPrivilegeRequiredSimple;
  }
  return PrivilegeLevelRequiredSimple.Unknown;
}


class ConditionsSimpleModel {

  // see firestore rules
  PrivilegeLevelRequiredSimple privilegeLevelRequired;

  ConditionsSimpleModel({this.privilegeLevelRequired, })  {
  }

  ConditionsSimpleModel copyWith({PrivilegeLevelRequiredSimple privilegeLevelRequired, }) {
    return ConditionsSimpleModel(privilegeLevelRequired: privilegeLevelRequired ?? this.privilegeLevelRequired, );
  }

  @override
  int get hashCode => privilegeLevelRequired.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is ConditionsSimpleModel &&
          runtimeType == other.runtimeType && 
          privilegeLevelRequired == other.privilegeLevelRequired;

  @override
  String toString() {
    return 'ConditionsSimpleModel{privilegeLevelRequired: $privilegeLevelRequired}';
  }

  ConditionsSimpleEntity toEntity({String appId}) {
    return ConditionsSimpleEntity(
          privilegeLevelRequired: (privilegeLevelRequired != null) ? privilegeLevelRequired.index : null, 
    );
  }

  static ConditionsSimpleModel fromEntity(ConditionsSimpleEntity entity) {
    if (entity == null) return null;
    return ConditionsSimpleModel(
          privilegeLevelRequired: toPrivilegeLevelRequiredSimple(entity.privilegeLevelRequired), 
    );
  }

  static Future<ConditionsSimpleModel> fromEntityPlus(ConditionsSimpleEntity entity, { String appId}) async {
    if (entity == null) return null;

    return ConditionsSimpleModel(
          privilegeLevelRequired: toPrivilegeLevelRequiredSimple(entity.privilegeLevelRequired), 
    );
  }

}

