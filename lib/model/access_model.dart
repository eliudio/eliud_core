/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 access_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/core/global_data.dart';
import 'package:eliud_core/tools/common_tools.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_core/model/entity_export.dart';


import 'package:eliud_core/model/access_entity.dart';

import 'package:eliud_core/tools/random.dart';



class AccessModel {

  // This is the member ID
  String documentID;

  // This is the privilege level and will determine the data accessible
  int privilegeLevel;

  // Points received for this app. Points accrued can result in increase of privilege
  int points;

  AccessModel({this.documentID, this.privilegeLevel, this.points, })  {
    assert(documentID != null);
  }

  AccessModel copyWith({String documentID, int privilegeLevel, int points, }) {
    return AccessModel(documentID: documentID ?? this.documentID, privilegeLevel: privilegeLevel ?? this.privilegeLevel, points: points ?? this.points, );
  }

  @override
  int get hashCode => documentID.hashCode ^ privilegeLevel.hashCode ^ points.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is AccessModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          privilegeLevel == other.privilegeLevel &&
          points == other.points;

  @override
  String toString() {
    return 'AccessModel{documentID: $documentID, privilegeLevel: $privilegeLevel, points: $points}';
  }

  AccessEntity toEntity({String appId}) {
    return AccessEntity(
          privilegeLevel: (privilegeLevel != null) ? privilegeLevel : null, 
          points: (points != null) ? points : null, 
    );
  }

  static AccessModel fromEntity(String documentID, AccessEntity entity) {
    if (entity == null) return null;
    return AccessModel(
          documentID: documentID, 
          privilegeLevel: entity.privilegeLevel, 
          points: entity.points, 
    );
  }

  static Future<AccessModel> fromEntityPlus(String documentID, AccessEntity entity, { String appId}) async {
    if (entity == null) return null;

    return AccessModel(
          documentID: documentID, 
          privilegeLevel: entity.privilegeLevel, 
          points: entity.points, 
    );
  }

}

