/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 app_policy_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'package:eliud_core/tools/random.dart';
import 'abstract_repository_singleton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/core/base/entity_base.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_core/model/entity_export.dart';

import 'package:eliud_core/tools/common_tools.dart';
class AppPolicyEntity implements EntityBase {
  final String? appId;
  final String? name;
  final String? policyId;

  AppPolicyEntity({required this.appId, this.name, this.policyId, });

  AppPolicyEntity copyWith({String? documentID, String? appId, String? name, String? policyId, }) {
    return AppPolicyEntity(appId : appId ?? this.appId, name : name ?? this.name, policyId : policyId ?? this.policyId, );
  }
  List<Object?> get props => [appId, name, policyId, ];

  @override
  String toString() {
    return 'AppPolicyEntity{appId: $appId, name: $name, policyId: $policyId}';
  }

  static AppPolicyEntity? fromMap(Object? o, {Map<String, String>? newDocumentIds}) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    var policyIdNewDocmentId = map['policyId'];
    if ((newDocumentIds != null) && (policyIdNewDocmentId != null)) {
      var policyIdOldDocmentId = policyIdNewDocmentId;
      policyIdNewDocmentId = newRandomKey();
      newDocumentIds[policyIdOldDocmentId] = policyIdNewDocmentId;
    }
    return AppPolicyEntity(
      appId: map['appId'], 
      name: map['name'], 
      policyId: policyIdNewDocmentId, 
    );
  }

  Map<String, Object?> toDocument() {
    Map<String, Object?> theDocument = HashMap();
    if (appId != null) theDocument["appId"] = appId;
      else theDocument["appId"] = null;
    if (name != null) theDocument["name"] = name;
      else theDocument["name"] = null;
    if (policyId != null) theDocument["policyId"] = policyId;
      else theDocument["policyId"] = null;
    return theDocument;
  }

  @override
  AppPolicyEntity switchAppId({required String newAppId}) {
    var newEntity = copyWith(appId: newAppId);
    return newEntity;
  }

  static AppPolicyEntity? fromJsonString(String json, {Map<String, String>? newDocumentIds}) {
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

