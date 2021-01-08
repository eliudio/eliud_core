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
  final ReadCondition readCondition;
  final int privilegeLevelRequired;
  final String packageCondition;

  ConditionsEntity({this.readCondition, this.privilegeLevelRequired, this.packageCondition, });


  List<Object> get props => [readCondition, privilegeLevelRequired, packageCondition, ];

  @override
  String toString() {
    return 'ConditionsEntity{readCondition: $readCondition, privilegeLevelRequired: $privilegeLevelRequired, packageCondition: $packageCondition}';
  }

  static ConditionsEntity fromMap(Map map) {
    if (map == null) return null;

    var readConditionFromMap;
    readConditionFromMap = map['readCondition'];
    if (readConditionFromMap != null)
      readConditionFromMap = toReadCondition(map['readCondition']);
    return ConditionsEntity(
      readCondition: readConditionFromMap, 
      privilegeLevelRequired: int.tryParse(map['privilegeLevelRequired'].toString()), 
      packageCondition: map['packageCondition'], 
    );
  }

  Map<String, Object> toDocument() {
    Map<String, Object> theDocument = HashMap();
    if (readCondition != null) theDocument['readCondition'] = readCondition.index; else theDocument['readCondition'] = null;
    if (privilegeLevelRequired != null) theDocument["privilegeLevelRequired"] = privilegeLevelRequired;
      else theDocument["privilegeLevelRequired"] = null;
    if (packageCondition != null) theDocument["packageCondition"] = packageCondition;
      else theDocument["packageCondition"] = null;
    return theDocument;
  }

  static ConditionsEntity fromJsonString(String json) {
    Map<String, dynamic> generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

}

