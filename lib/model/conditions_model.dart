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



class ConditionsModel {

  // Page only accessible conditionally. See type definition for more info
  ReadCondition readCondition;
  int privilegeLevelRequired;
  String packageCondition;

  ConditionsModel({this.readCondition, this.privilegeLevelRequired, this.packageCondition, })  {
  }

  ConditionsModel copyWith({ReadCondition readCondition, int privilegeLevelRequired, String packageCondition, }) {
    return ConditionsModel(readCondition: readCondition ?? this.readCondition, privilegeLevelRequired: privilegeLevelRequired ?? this.privilegeLevelRequired, packageCondition: packageCondition ?? this.packageCondition, );
  }

  @override
  int get hashCode => readCondition.hashCode ^ privilegeLevelRequired.hashCode ^ packageCondition.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is ConditionsModel &&
          runtimeType == other.runtimeType && 
          readCondition == other.readCondition &&
          privilegeLevelRequired == other.privilegeLevelRequired &&
          packageCondition == other.packageCondition;

  @override
  String toString() {
    return 'ConditionsModel{readCondition: $readCondition, privilegeLevelRequired: $privilegeLevelRequired, packageCondition: $packageCondition}';
  }

  ConditionsEntity toEntity({String appId}) {
    return ConditionsEntity(
          readCondition: readCondition,           privilegeLevelRequired: (privilegeLevelRequired != null) ? privilegeLevelRequired : null, 
          packageCondition: (packageCondition != null) ? packageCondition : null, 
    );
  }

  static ConditionsModel fromEntity(ConditionsEntity entity) {
    if (entity == null) return null;
    return ConditionsModel(
          readCondition: entity.readCondition, 
          privilegeLevelRequired: entity.privilegeLevelRequired, 
          packageCondition: entity.packageCondition, 
    );
  }

  static Future<ConditionsModel> fromEntityPlus(ConditionsEntity entity, { String appId}) async {
    if (entity == null) return null;

    return ConditionsModel(
          readCondition: entity.readCondition, 
          privilegeLevelRequired: entity.privilegeLevelRequired, 
          packageCondition: entity.packageCondition, 
    );
  }

}

