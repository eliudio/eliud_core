/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_dashboard_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'package:eliud_core/core/base/entity_base.dart';
import 'package:eliud_core/model/entity_export.dart';

class MemberDashboardEntity implements EntityBase {
  final String? appId;
  final String? description;
  final String? updateProfileText;
  final String? retrieveDataText;
  final String? deleteDataText;
  final String? retrieveDataEmailSubject;
  final String? deleteDataEmailSubject;
  final String? deleteDataEmailMessage;
  final StorageConditionsEntity? conditions;

  MemberDashboardEntity({
    required this.appId,
    this.description,
    this.updateProfileText,
    this.retrieveDataText,
    this.deleteDataText,
    this.retrieveDataEmailSubject,
    this.deleteDataEmailSubject,
    this.deleteDataEmailMessage,
    this.conditions,
  });

  MemberDashboardEntity copyWith({
    String? documentID,
    String? appId,
    String? description,
    String? updateProfileText,
    String? retrieveDataText,
    String? deleteDataText,
    String? retrieveDataEmailSubject,
    String? deleteDataEmailSubject,
    String? deleteDataEmailMessage,
    StorageConditionsEntity? conditions,
  }) {
    return MemberDashboardEntity(
      appId: appId ?? this.appId,
      description: description ?? this.description,
      updateProfileText: updateProfileText ?? this.updateProfileText,
      retrieveDataText: retrieveDataText ?? this.retrieveDataText,
      deleteDataText: deleteDataText ?? this.deleteDataText,
      retrieveDataEmailSubject:
          retrieveDataEmailSubject ?? this.retrieveDataEmailSubject,
      deleteDataEmailSubject:
          deleteDataEmailSubject ?? this.deleteDataEmailSubject,
      deleteDataEmailMessage:
          deleteDataEmailMessage ?? this.deleteDataEmailMessage,
      conditions: conditions ?? this.conditions,
    );
  }

  List<Object?> get props => [
        appId,
        description,
        updateProfileText,
        retrieveDataText,
        deleteDataText,
        retrieveDataEmailSubject,
        deleteDataEmailSubject,
        deleteDataEmailMessage,
        conditions,
      ];

  @override
  String toString() {
    return 'MemberDashboardEntity{appId: $appId, description: $description, updateProfileText: $updateProfileText, retrieveDataText: $retrieveDataText, deleteDataText: $deleteDataText, retrieveDataEmailSubject: $retrieveDataEmailSubject, deleteDataEmailSubject: $deleteDataEmailSubject, deleteDataEmailMessage: $deleteDataEmailMessage, conditions: $conditions}';
  }

  static MemberDashboardEntity? fromMap(Object? o,
      {Map<String, String>? newDocumentIds}) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    var conditionsFromMap = map['conditions'];
    if (conditionsFromMap != null) {
      conditionsFromMap = StorageConditionsEntity.fromMap(conditionsFromMap,
          newDocumentIds: newDocumentIds);
    }

    return MemberDashboardEntity(
      appId: map['appId'],
      description: map['description'],
      updateProfileText: map['updateProfileText'],
      retrieveDataText: map['retrieveDataText'],
      deleteDataText: map['deleteDataText'],
      retrieveDataEmailSubject: map['retrieveDataEmailSubject'],
      deleteDataEmailSubject: map['deleteDataEmailSubject'],
      deleteDataEmailMessage: map['deleteDataEmailMessage'],
      conditions: conditionsFromMap,
    );
  }

  @override
  Map<String, Object?> toDocument() {
    final Map<String, dynamic>? conditionsMap =
        conditions != null ? conditions!.toDocument() : null;

    Map<String, Object?> theDocument = HashMap();
    if (appId != null) {
      theDocument["appId"] = appId;
    } else {
      theDocument["appId"] = null;
    }
    if (description != null) {
      theDocument["description"] = description;
    } else {
      theDocument["description"] = null;
    }
    if (updateProfileText != null) {
      theDocument["updateProfileText"] = updateProfileText;
    } else {
      theDocument["updateProfileText"] = null;
    }
    if (retrieveDataText != null) {
      theDocument["retrieveDataText"] = retrieveDataText;
    } else {
      theDocument["retrieveDataText"] = null;
    }
    if (deleteDataText != null) {
      theDocument["deleteDataText"] = deleteDataText;
    } else {
      theDocument["deleteDataText"] = null;
    }
    if (retrieveDataEmailSubject != null) {
      theDocument["retrieveDataEmailSubject"] = retrieveDataEmailSubject;
    } else {
      theDocument["retrieveDataEmailSubject"] = null;
    }
    if (deleteDataEmailSubject != null) {
      theDocument["deleteDataEmailSubject"] = deleteDataEmailSubject;
    } else {
      theDocument["deleteDataEmailSubject"] = null;
    }
    if (deleteDataEmailMessage != null) {
      theDocument["deleteDataEmailMessage"] = deleteDataEmailMessage;
    } else {
      theDocument["deleteDataEmailMessage"] = null;
    }
    if (conditions != null) {
      theDocument["conditions"] = conditionsMap;
    } else {
      theDocument["conditions"] = null;
    }
    return theDocument;
  }

  @override
  MemberDashboardEntity switchAppId({required String newAppId}) {
    var newEntity = copyWith(appId: newAppId);
    return newEntity;
  }

  static MemberDashboardEntity? fromJsonString(String json,
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
