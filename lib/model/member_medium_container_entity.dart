/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_medium_container_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'package:eliud_core/tools/random.dart';
import 'abstract_repository_singleton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/core/base/entity_base.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_core/model/entity_export.dart';

import 'package:eliud_core/tools/common_tools.dart';
class MemberMediumContainerEntity implements EntityBase {
  final String? htmlReference;
  final String? memberMediumId;

  MemberMediumContainerEntity({this.htmlReference, this.memberMediumId, });

  MemberMediumContainerEntity copyWith({String? documentID, String? htmlReference, String? memberMediumId, }) {
    return MemberMediumContainerEntity(htmlReference : htmlReference ?? this.htmlReference, memberMediumId : memberMediumId ?? this.memberMediumId, );
  }
  List<Object?> get props => [htmlReference, memberMediumId, ];

  @override
  String toString() {
    return 'MemberMediumContainerEntity{htmlReference: $htmlReference, memberMediumId: $memberMediumId}';
  }

  static MemberMediumContainerEntity? fromMap(Object? o, {Map<String, String>? newDocumentIds}) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    var memberMediumIdNewDocmentId = map['memberMediumId'];
    if ((newDocumentIds != null) && (memberMediumIdNewDocmentId != null)) {
      var memberMediumIdOldDocmentId = memberMediumIdNewDocmentId;
      memberMediumIdNewDocmentId = newRandomKey();
      newDocumentIds[memberMediumIdOldDocmentId] = memberMediumIdNewDocmentId;
    }
    return MemberMediumContainerEntity(
      htmlReference: map['htmlReference'], 
      memberMediumId: memberMediumIdNewDocmentId, 
    );
  }

  Map<String, Object?> toDocument() {
    Map<String, Object?> theDocument = HashMap();
    if (htmlReference != null) theDocument["htmlReference"] = htmlReference;
      else theDocument["htmlReference"] = null;
    if (memberMediumId != null) theDocument["memberMediumId"] = memberMediumId;
      else theDocument["memberMediumId"] = null;
    return theDocument;
  }

  @override
  MemberMediumContainerEntity switchAppId({required String newAppId}) {
    var newEntity = copyWith();
    return newEntity;
  }

  static MemberMediumContainerEntity? fromJsonString(String json, {Map<String, String>? newDocumentIds}) {
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

