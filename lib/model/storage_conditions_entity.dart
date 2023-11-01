/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 storage_conditions_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'package:eliud_core/core/base/entity_base.dart';

class StorageConditionsEntity implements EntityBase {
  final int? privilegeLevelRequired;

  StorageConditionsEntity({this.privilegeLevelRequired, });

  StorageConditionsEntity copyWith({int? privilegeLevelRequired, }) {
    return StorageConditionsEntity(privilegeLevelRequired : privilegeLevelRequired ?? this.privilegeLevelRequired, );
  }
  List<Object?> get props => [privilegeLevelRequired, ];

  @override
  String toString() {
    return 'StorageConditionsEntity{privilegeLevelRequired: $privilegeLevelRequired}';
  }

  static StorageConditionsEntity? fromMap(Object? o, {Map<String, String>? newDocumentIds}) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    return StorageConditionsEntity(
      privilegeLevelRequired: map['privilegeLevelRequired'], 
    );
  }

  Map<String, Object?> toDocument() {
    Map<String, Object?> theDocument = HashMap();
    if (privilegeLevelRequired != null) theDocument["privilegeLevelRequired"] = privilegeLevelRequired;
      else theDocument["privilegeLevelRequired"] = null;
    return theDocument;
  }

  @override
  StorageConditionsEntity switchAppId({required String newAppId}) {
    var newEntity = copyWith();
    return newEntity;
  }

  static StorageConditionsEntity? fromJsonString(String json, {Map<String, String>? newDocumentIds}) {
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

