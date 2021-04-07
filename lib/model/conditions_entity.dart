/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 conditions_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'package:eliud_core/tools/common_tools.dart';
import 'abstract_repository_singleton.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_core/model/entity_export.dart';

class ConditionsEntity {
  final int? privilegeLevelRequired;
  final String? packageCondition;
  final int? conditionOverride;

  ConditionsEntity({this.privilegeLevelRequired, this.packageCondition, this.conditionOverride, });


  List<Object?> get props => [privilegeLevelRequired, packageCondition, conditionOverride, ];

  @override
  String toString() {
    return 'ConditionsEntity{privilegeLevelRequired: $privilegeLevelRequired, packageCondition: $packageCondition, conditionOverride: $conditionOverride}';
  }

  static ConditionsEntity? fromMap(Map? map) {
    if (map == null) return null;

    return ConditionsEntity(
      privilegeLevelRequired: map['privilegeLevelRequired'], 
      packageCondition: map['packageCondition'], 
      conditionOverride: map['conditionOverride'], 
    );
  }

  Map<String, Object?> toDocument() {
    Map<String, Object?> theDocument = HashMap();
    if (privilegeLevelRequired != null) theDocument["privilegeLevelRequired"] = privilegeLevelRequired;
      else theDocument["privilegeLevelRequired"] = null;
    if (packageCondition != null) theDocument["packageCondition"] = packageCondition;
      else theDocument["packageCondition"] = null;
    if (conditionOverride != null) theDocument["conditionOverride"] = conditionOverride;
      else theDocument["conditionOverride"] = null;
    return theDocument;
  }

  static ConditionsEntity? fromJsonString(String json) {
    Map<String, dynamic>? generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

}

