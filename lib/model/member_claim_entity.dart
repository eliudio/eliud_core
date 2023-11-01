/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_claim_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'package:eliud_core/core/base/entity_base.dart';

class MemberClaimEntity implements EntityBase {
  final int? refreshValue;

  MemberClaimEntity({this.refreshValue, });

  MemberClaimEntity copyWith({String? documentID, int? refreshValue, }) {
    return MemberClaimEntity(refreshValue : refreshValue ?? this.refreshValue, );
  }
  List<Object?> get props => [refreshValue, ];

  @override
  String toString() {
    return 'MemberClaimEntity{refreshValue: $refreshValue}';
  }

  static MemberClaimEntity? fromMap(Object? o, {Map<String, String>? newDocumentIds}) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    return MemberClaimEntity(
      refreshValue: int.tryParse(map['refreshValue'].toString()), 
    );
  }

  Map<String, Object?> toDocument() {
    Map<String, Object?> theDocument = HashMap();
    if (refreshValue != null) theDocument["refreshValue"] = refreshValue;
      else theDocument["refreshValue"] = null;
    return theDocument;
  }

  @override
  MemberClaimEntity switchAppId({required String newAppId}) {
    var newEntity = copyWith();
    return newEntity;
  }

  static MemberClaimEntity? fromJsonString(String json, {Map<String, String>? newDocumentIds}) {
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

