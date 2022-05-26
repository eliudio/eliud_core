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
class AccessEntity {
  final String? appId;
  final int? privilegeLevel;
  final int? points;
  final bool? blocked;
  final int? privilegeLevelBeforeBlocked;

  AccessEntity({required this.appId, this.privilegeLevel, this.points, this.blocked, this.privilegeLevelBeforeBlocked, });


  List<Object?> get props => [appId, privilegeLevel, points, blocked, privilegeLevelBeforeBlocked, ];

  @override
  String toString() {
    return 'AccessEntity{appId: $appId, privilegeLevel: $privilegeLevel, points: $points, blocked: $blocked, privilegeLevelBeforeBlocked: $privilegeLevelBeforeBlocked}';
  }

  static AccessEntity? fromMap(Object? o) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    return AccessEntity(
      appId: map['appId'], 
      privilegeLevel: map['privilegeLevel'], 
      points: int.tryParse(map['points'].toString()), 
      blocked: map['blocked'], 
      privilegeLevelBeforeBlocked: map['privilegeLevelBeforeBlocked'], 
    );
  }

  Map<String, Object?> toDocument() {
    Map<String, Object?> theDocument = HashMap();
    if (appId != null) theDocument["appId"] = appId;
      else theDocument["appId"] = null;
    if (privilegeLevel != null) theDocument["privilegeLevel"] = privilegeLevel;
      else theDocument["privilegeLevel"] = null;
    if (points != null) theDocument["points"] = points;
      else theDocument["points"] = null;
    if (blocked != null) theDocument["blocked"] = blocked;
      else theDocument["blocked"] = null;
    if (privilegeLevelBeforeBlocked != null) theDocument["privilegeLevelBeforeBlocked"] = privilegeLevelBeforeBlocked;
      else theDocument["privilegeLevelBeforeBlocked"] = null;
    return theDocument;
  }

  static AccessEntity? fromJsonString(String json) {
    Map<String, dynamic>? generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

}

