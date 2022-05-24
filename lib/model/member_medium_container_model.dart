/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_medium_container_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/tools/common_tools.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/core/base/model_base.dart';

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


import 'package:eliud_core/model/member_medium_container_entity.dart';

import 'package:eliud_core/tools/random.dart';



class MemberMediumContainerModel implements ModelBase {
  String documentID;
  MemberMediumModel? memberMedium;

  MemberMediumContainerModel({required this.documentID, this.memberMedium, })  {
    assert(documentID != null);
  }

  MemberMediumContainerModel copyWith({String? documentID, MemberMediumModel? memberMedium, }) {
    return MemberMediumContainerModel(documentID: documentID ?? this.documentID, memberMedium: memberMedium ?? this.memberMedium, );
  }

  @override
  int get hashCode => documentID.hashCode ^ memberMedium.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is MemberMediumContainerModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          memberMedium == other.memberMedium;

  @override
  String toString() {
    return 'MemberMediumContainerModel{documentID: $documentID, memberMedium: $memberMedium}';
  }

  MemberMediumContainerEntity toEntity({String? appId}) {
    return MemberMediumContainerEntity(
          memberMediumId: (memberMedium != null) ? memberMedium!.documentID : null, 
    );
  }

  static Future<MemberMediumContainerModel?> fromEntity(String documentID, MemberMediumContainerEntity? entity) async {
    if (entity == null) return null;
    var counter = 0;
    return MemberMediumContainerModel(
          documentID: documentID, 
    );
  }

  static Future<MemberMediumContainerModel?> fromEntityPlus(String documentID, MemberMediumContainerEntity? entity, { String? appId}) async {
    if (entity == null) return null;

    MemberMediumModel? memberMediumHolder;
    if (entity.memberMediumId != null) {
      try {
          memberMediumHolder = await memberMediumRepository(appId: appId)!.get(entity.memberMediumId);
      } on Exception catch(e) {
        print('Error whilst trying to initialise memberMedium');
        print('Error whilst retrieving memberMedium with id ${entity.memberMediumId}');
        print('Exception: $e');
      }
    }

    var counter = 0;
    return MemberMediumContainerModel(
          documentID: documentID, 
          memberMedium: memberMediumHolder, 
    );
  }

}

