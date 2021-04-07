/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 conditions_simple_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'package:eliud_core/tools/common_tools.dart';
import 'abstract_repository_singleton.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_core/model/entity_export.dart';

class ConditionsSimpleEntity {
  final int? privilegeLevelRequired;

  ConditionsSimpleEntity({this.privilegeLevelRequired, });


  List<Object?> get props => [privilegeLevelRequired, ];

  @override
  String toString() {
    return 'ConditionsSimpleEntity{privilegeLevelRequired: $privilegeLevelRequired}';
  }

  static ConditionsSimpleEntity? fromMap(Map? map) {
    if (map == null) return null;

    return ConditionsSimpleEntity(
      privilegeLevelRequired: map['privilegeLevelRequired'], 
    );
  }

  Map<String, Object?> toDocument() {
    Map<String, Object?> theDocument = HashMap();
    if (privilegeLevelRequired != null) theDocument["privilegeLevelRequired"] = privilegeLevelRequired;
      else theDocument["privilegeLevelRequired"] = null;
    return theDocument;
  }

  static ConditionsSimpleEntity? fromJsonString(String json) {
    Map<String, dynamic>? generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

}

