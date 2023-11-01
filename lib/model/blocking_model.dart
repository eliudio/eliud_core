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

import 'package:eliud_core/core/base/model_base.dart';

import 'package:eliud_core/model/entity_export.dart';


import 'package:eliud_core/model/blocking_entity.dart';




class BlockingModel implements ModelBase {
  static const String packageName = 'eliud_core';
  static const String id = 'blockings';


  // Member response ID - Member request ID
  String documentID;
  String memberBlocking;
  String? memberBeingBlocked;

  BlockingModel({required this.documentID, required this.memberBlocking, this.memberBeingBlocked, })  {
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

