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
import 'abstract_repository_singleton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/core/base/entity_base.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_core/model/entity_export.dart';

import 'package:eliud_core/tools/common_tools.dart';
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

  MemberDashboardEntity({required this.appId, this.description, this.updateProfileText, this.retrieveDataText, this.deleteDataText, this.retrieveDataEmailSubject, this.deleteDataEmailSubject, this.deleteDataEmailMessage, this.conditions, });


  List<Object?> get props => [appId, description, updateProfileText, retrieveDataText, deleteDataText, retrieveDataEmailSubject, deleteDataEmailSubject, deleteDataEmailMessage, conditions, ];

  @override
  String toString() {
    return 'MemberDashboardEntity{appId: $appId, description: $description, updateProfileText: $updateProfileText, retrieveDataText: $retrieveDataText, deleteDataText: $deleteDataText, retrieveDataEmailSubject: $retrieveDataEmailSubject, deleteDataEmailSubject: $deleteDataEmailSubject, deleteDataEmailMessage: $deleteDataEmailMessage, conditions: $conditions}';
  }

  static MemberDashboardEntity? fromMap(Object? o) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    var conditionsFromMap;
    conditionsFromMap = map['conditions'];
    if (conditionsFromMap != null)
      conditionsFromMap = StorageConditionsEntity.fromMap(conditionsFromMap);

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

  Map<String, Object?> toDocument() {
    final Map<String, dynamic>? conditionsMap = conditions != null 
        ? conditions!.toDocument()
        : null;

    Map<String, Object?> theDocument = HashMap();
    if (appId != null) theDocument["appId"] = appId;
      else theDocument["appId"] = null;
    if (description != null) theDocument["description"] = description;
      else theDocument["description"] = null;
    if (updateProfileText != null) theDocument["updateProfileText"] = updateProfileText;
      else theDocument["updateProfileText"] = null;
    if (retrieveDataText != null) theDocument["retrieveDataText"] = retrieveDataText;
      else theDocument["retrieveDataText"] = null;
    if (deleteDataText != null) theDocument["deleteDataText"] = deleteDataText;
      else theDocument["deleteDataText"] = null;
    if (retrieveDataEmailSubject != null) theDocument["retrieveDataEmailSubject"] = retrieveDataEmailSubject;
      else theDocument["retrieveDataEmailSubject"] = null;
    if (deleteDataEmailSubject != null) theDocument["deleteDataEmailSubject"] = deleteDataEmailSubject;
      else theDocument["deleteDataEmailSubject"] = null;
    if (deleteDataEmailMessage != null) theDocument["deleteDataEmailMessage"] = deleteDataEmailMessage;
      else theDocument["deleteDataEmailMessage"] = null;
    if (conditions != null) theDocument["conditions"] = conditionsMap;
      else theDocument["conditions"] = null;
    return theDocument;
  }

  static MemberDashboardEntity? fromJsonString(String json) {
    Map<String, dynamic>? generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

  Future<Map<String, Object?>> enrichedDocument(Map<String, Object?> theDocument) async {
    return theDocument;
  }

}

