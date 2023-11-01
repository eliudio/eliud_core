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

import 'package:eliud_core/core/base/model_base.dart';

import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';


import 'package:eliud_core/model/member_medium_container_entity.dart';




class MemberMediumContainerModel implements ModelBase {
  static const String packageName = 'eliud_core';
  static const String id = 'memberMediumContainers';

  String documentID;
  String? htmlReference;
  MemberMediumModel? memberMedium;

  MemberMediumContainerModel({required this.documentID, this.htmlReference, this.memberMedium, })  {
  }

  MemberMediumContainerModel copyWith({String? documentID, String? htmlReference, MemberMediumModel? memberMedium, }) {
    return MemberMediumContainerModel(documentID: documentID ?? this.documentID, htmlReference: htmlReference ?? this.htmlReference, memberMedium: memberMedium ?? this.memberMedium, );
  }

  @override
  int get hashCode => documentID.hashCode ^ htmlReference.hashCode ^ memberMedium.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is MemberMediumContainerModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          htmlReference == other.htmlReference &&
          memberMedium == other.memberMedium;

  @override
  String toString() {
    return 'MemberMediumContainerModel{documentID: $documentID, htmlReference: $htmlReference, memberMedium: $memberMedium}';
  }

  Future<List<ModelReference>> collectReferences({String? appId}) async {
    List<ModelReference> referencesCollector = [];
    if (memberMedium != null) {
      referencesCollector.add(ModelReference(MemberMediumModel.packageName, MemberMediumModel.id, memberMedium!));
    }
    if (memberMedium != null) referencesCollector.addAll(await memberMedium!.collectReferences(appId: appId));
    return referencesCollector;
  }

  MemberMediumContainerEntity toEntity({String? appId}) {
    return MemberMediumContainerEntity(
          htmlReference: (htmlReference != null) ? htmlReference : null, 
          memberMediumId: (memberMedium != null) ? memberMedium!.documentID : null, 
    );
  }

  static Future<MemberMediumContainerModel?> fromEntity(String documentID, MemberMediumContainerEntity? entity) async {
    if (entity == null) return null;
    var counter = 0;
    return MemberMediumContainerModel(
          documentID: documentID, 
          htmlReference: entity.htmlReference, 
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
          htmlReference: entity.htmlReference, 
          memberMedium: memberMediumHolder, 
    );
  }

}

