/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 app_entry_pages_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'package:eliud_core/core/base/entity_base.dart';

class AppEntryPagesEntity implements EntityBase {
  final String? entryPageId;
  final int? minPrivilege;

  AppEntryPagesEntity({
    this.entryPageId,
    this.minPrivilege,
  });

  AppEntryPagesEntity copyWith({
    String? documentID,
    String? entryPageId,
    int? minPrivilege,
  }) {
    return AppEntryPagesEntity(
      entryPageId: entryPageId ?? this.entryPageId,
      minPrivilege: minPrivilege ?? this.minPrivilege,
    );
  }

  List<Object?> get props => [
        entryPageId,
        minPrivilege,
      ];

  @override
  String toString() {
    return 'AppEntryPagesEntity{entryPageId: $entryPageId, minPrivilege: $minPrivilege}';
  }

  static AppEntryPagesEntity? fromMap(Object? o,
      {Map<String, String>? newDocumentIds}) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    return AppEntryPagesEntity(
      entryPageId: map['entryPageId'],
      minPrivilege: int.tryParse(map['minPrivilege'].toString()),
    );
  }

  @override
  Map<String, Object?> toDocument() {
    Map<String, Object?> theDocument = HashMap();
    if (entryPageId != null) {
      theDocument["entryPageId"] = entryPageId;
    } else {
      theDocument["entryPageId"] = null;
    }
    if (minPrivilege != null) {
      theDocument["minPrivilege"] = minPrivilege;
    } else {
      theDocument["minPrivilege"] = null;
    }
    return theDocument;
  }

  @override
  AppEntryPagesEntity switchAppId({required String newAppId}) {
    var newEntity = copyWith();
    return newEntity;
  }

  static AppEntryPagesEntity? fromJsonString(String json,
      {Map<String, String>? newDocumentIds}) {
    Map<String, dynamic>? generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap, newDocumentIds: newDocumentIds);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

  @override
  Future<Map<String, Object?>> enrichedDocument(
      Map<String, Object?> theDocument) async {
    return theDocument;
  }
}
