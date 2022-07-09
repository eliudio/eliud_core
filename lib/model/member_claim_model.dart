/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_claim_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/tools/common_tools.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/core/base/model_base.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:eliud_core/model/app_model.dart';

import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_core/model/entity_export.dart';


import 'package:eliud_core/model/member_claim_entity.dart';

import 'package:eliud_core/tools/random.dart';



class MemberClaimModel implements ModelBase {
  static const String packageName = 'eliud_core';
  static const String id = 'memberClaims';

  String documentID;
  int? refreshValue;

  MemberClaimModel({required this.documentID, this.refreshValue, })  {
    assert(documentID != null);
  }

  MemberClaimModel copyWith({String? documentID, int? refreshValue, }) {
    return MemberClaimModel(documentID: documentID ?? this.documentID, refreshValue: refreshValue ?? this.refreshValue, );
  }

  @override
  int get hashCode => documentID.hashCode ^ refreshValue.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is MemberClaimModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          refreshValue == other.refreshValue;

  @override
  String toString() {
    return 'MemberClaimModel{documentID: $documentID, refreshValue: $refreshValue}';
  }

  MemberClaimEntity toEntity({String? appId, List<ModelReference>? referencesCollector}) {
    if (referencesCollector != null) {
    }
    return MemberClaimEntity(
          refreshValue: (refreshValue != null) ? refreshValue : null, 
    );
  }

  static Future<MemberClaimModel?> fromEntity(String documentID, MemberClaimEntity? entity) async {
    if (entity == null) return null;
    var counter = 0;
    return MemberClaimModel(
          documentID: documentID, 
          refreshValue: entity.refreshValue, 
    );
  }

  static Future<MemberClaimModel?> fromEntityPlus(String documentID, MemberClaimEntity? entity, { String? appId}) async {
    if (entity == null) return null;

    var counter = 0;
    return MemberClaimModel(
          documentID: documentID, 
          refreshValue: entity.refreshValue, 
    );
  }

}

