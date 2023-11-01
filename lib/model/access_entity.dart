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
import 'package:eliud_core/core/base/entity_base.dart';

class AccessEntity implements EntityBase {
  final String? appId;
  final int? privilegeLevel;
  final int? points;
  final bool? blocked;
  final int? privilegeLevelBeforeBlocked;

  AccessEntity({required this.appId, this.privilegeLevel, this.points, this.blocked, this.privilegeLevelBeforeBlocked, });

  AccessEntity copyWith({String? documentID, String? appId, int? privilegeLevel, int? points, bool? blocked, int? privilegeLevelBeforeBlocked, }) {
    return AccessEntity(appId : appId ?? this.appId, privilegeLevel : privilegeLevel ?? this.privilegeLevel, points : points ?? this.points, blocked : blocked ?? this.blocked, privilegeLevelBeforeBlocked : privilegeLevelBeforeBlocked ?? this.privilegeLevelBeforeBlocked, );
  }
  List<Object?> get props => [appId, privilegeLevel, points, blocked, privilegeLevelBeforeBlocked, ];

  @override
  String toString() {
    return 'AccessEntity{appId: $appId, privilegeLevel: $privilegeLevel, points: $points, blocked: $blocked, privilegeLevelBeforeBlocked: $privilegeLevelBeforeBlocked}';
  }

  static AccessEntity? fromMap(Object? o, {Map<String, String>? newDocumentIds}) {
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

  @override
  AccessEntity switchAppId({required String newAppId}) {
    var newEntity = copyWith(appId: newAppId);
    return newEntity;
  }

  static AccessEntity? fromJsonString(String json, {Map<String, String>? newDocumentIds}) {
    Map<String, dynamic>? generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap, newDocumentIds: newDocumentIds);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

  Future<Map<String, Object?>> enrichedDocument(Map<String, Object?> theDocument) async {
    return theDocument;
  }

}

