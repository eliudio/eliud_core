/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 access_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_core/model/entity_export.dart';

class AccessEntity {
  final int privilegeLevel;
  final int points;

  AccessEntity({this.privilegeLevel, this.points, });


  List<Object> get props => [privilegeLevel, points, ];

  @override
  String toString() {
    return 'AccessEntity{privilegeLevel: $privilegeLevel, points: $points}';
  }

  static AccessEntity fromMap(Map map) {
    if (map == null) return null;

    return AccessEntity(
      privilegeLevel: int.tryParse(map['privilegeLevel'].toString()), 
      points: int.tryParse(map['points'].toString()), 
    );
  }

  Map<String, Object> toDocument() {
    Map<String, Object> theDocument = HashMap();
    if (privilegeLevel != null) theDocument["privilegeLevel"] = privilegeLevel;
      else theDocument["privilegeLevel"] = null;
    if (points != null) theDocument["points"] = points;
      else theDocument["points"] = null;
    return theDocument;
  }

  static AccessEntity fromJsonString(String json) {
    Map<String, dynamic> generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

}

