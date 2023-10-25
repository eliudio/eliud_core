/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 blocking_model.dart
                       
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


import 'package:eliud_core/model/blocking_entity.dart';

import 'package:eliud_core/tools/random.dart';



class BlockingModel implements ModelBase {
  static const String packageName = 'eliud_core';
  static const String id = 'blockings';


  // Member response ID - Member request ID
  String documentID;
  String memberBlocking;
  String? memberBeingBlocked;

  BlockingModel({required this.documentID, required this.memberBlocking, this.memberBeingBlocked, })  {
    assert(documentID != null);
  }

  BlockingModel copyWith({String? documentID, String? memberBlocking, String? memberBeingBlocked, }) {
    return BlockingModel(documentID: documentID ?? this.documentID, memberBlocking: memberBlocking ?? this.memberBlocking, memberBeingBlocked: memberBeingBlocked ?? this.memberBeingBlocked, );
  }

  @override
  int get hashCode => documentID.hashCode ^ memberBlocking.hashCode ^ memberBeingBlocked.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is BlockingModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          memberBlocking == other.memberBlocking &&
          memberBeingBlocked == other.memberBeingBlocked;

  @override
  String toString() {
    return 'BlockingModel{documentID: $documentID, memberBlocking: $memberBlocking, memberBeingBlocked: $memberBeingBlocked}';
  }

  Future<List<ModelReference>> collectReferences({String? appId}) async {
    List<ModelReference> referencesCollector = [];
    return referencesCollector;
  }

  BlockingEntity toEntity({String? appId}) {
    return BlockingEntity(
          memberBlocking: (memberBlocking != null) ? memberBlocking : null, 
          memberBeingBlocked: (memberBeingBlocked != null) ? memberBeingBlocked : null, 
    );
  }

  static Future<BlockingModel?> fromEntity(String documentID, BlockingEntity? entity) async {
    if (entity == null) return null;
    var counter = 0;
    return BlockingModel(
          documentID: documentID, 
          memberBlocking: entity.memberBlocking ?? '', 
          memberBeingBlocked: entity.memberBeingBlocked, 
    );
  }

  static Future<BlockingModel?> fromEntityPlus(String documentID, BlockingEntity? entity, { String? appId}) async {
    if (entity == null) return null;

    var counter = 0;
    return BlockingModel(
          documentID: documentID, 
          memberBlocking: entity.memberBlocking ?? '', 
          memberBeingBlocked: entity.memberBeingBlocked, 
    );
  }

}

