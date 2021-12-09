/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 display_conditions_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'abstract_repository_singleton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_core/model/entity_export.dart';

import 'package:eliud_core/tools/common_tools.dart';
class DisplayConditionsEntity {
  final int? privilegeLevelRequired;
  final String? packageCondition;
  final int? conditionOverride;

  DisplayConditionsEntity({this.privilegeLevelRequired, this.packageCondition, this.conditionOverride, });


  List<Object?> get props => [privilegeLevelRequired, packageCondition, conditionOverride, ];

  @override
  String toString() {
    return 'DisplayConditionsEntity{privilegeLevelRequired: $privilegeLevelRequired, packageCondition: $packageCondition, conditionOverride: $conditionOverride}';
  }

  static DisplayConditionsEntity? fromMap(Object? o) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    return DisplayConditionsEntity(
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

  static DisplayConditionsEntity? fromJsonString(String json) {
    Map<String, dynamic>? generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

}

