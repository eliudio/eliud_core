/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 blocking_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'package:eliud_core/core/base/entity_base.dart';

class BlockingEntity implements EntityBase {
  final String? memberBlocking;
  final String? memberBeingBlocked;

  BlockingEntity({required this.memberBlocking, this.memberBeingBlocked, });

  BlockingEntity copyWith({String? documentID, String? memberBlocking, String? memberBeingBlocked, }) {
    return BlockingEntity(memberBlocking : memberBlocking ?? this.memberBlocking, memberBeingBlocked : memberBeingBlocked ?? this.memberBeingBlocked, );
  }
  List<Object?> get props => [memberBlocking, memberBeingBlocked, ];

  @override
  String toString() {
    return 'BlockingEntity{memberBlocking: $memberBlocking, memberBeingBlocked: $memberBeingBlocked}';
  }

  static BlockingEntity? fromMap(Object? o, {Map<String, String>? newDocumentIds}) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    return BlockingEntity(
      memberBlocking: map['memberBlocking'], 
      memberBeingBlocked: map['memberBeingBlocked'], 
    );
  }

  Map<String, Object?> toDocument() {
    Map<String, Object?> theDocument = HashMap();
    if (memberBlocking != null) theDocument["memberBlocking"] = memberBlocking;
      else theDocument["memberBlocking"] = null;
    if (memberBeingBlocked != null) theDocument["memberBeingBlocked"] = memberBeingBlocked;
      else theDocument["memberBeingBlocked"] = null;
    return theDocument;
  }

  @override
  BlockingEntity switchAppId({required String newAppId}) {
    var newEntity = copyWith();
    return newEntity;
  }

  static BlockingEntity? fromJsonString(String json, {Map<String, String>? newDocumentIds}) {
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

