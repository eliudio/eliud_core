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

import 'package:eliud_core/tools/common_tools.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/core/base/model_base.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_core/model/entity_export.dart';


import 'package:eliud_core/model/access_entity.dart';

import 'package:eliud_core/tools/random.dart';

enum PrivilegeLevel {
  NoPrivilege, Level1Privilege, Level2Privilege, OwnerPrivilege, Unknown
}

enum PrivilegeLevelBeforeBlocked {
  NoPrivilege, Level1Privilege, Level2Privilege, OwnerPrivilege, Unknown
}


PrivilegeLevel toPrivilegeLevel(int? index) {
  switch (index) {
    case 0: return PrivilegeLevel.NoPrivilege;
    case 1: return PrivilegeLevel.Level1Privilege;
    case 2: return PrivilegeLevel.Level2Privilege;
    case 3: return PrivilegeLevel.OwnerPrivilege;
  }
  return PrivilegeLevel.Unknown;
}

PrivilegeLevelBeforeBlocked toPrivilegeLevelBeforeBlocked(int? index) {
  switch (index) {
    case 0: return PrivilegeLevelBeforeBlocked.NoPrivilege;
    case 1: return PrivilegeLevelBeforeBlocked.Level1Privilege;
    case 2: return PrivilegeLevelBeforeBlocked.Level2Privilege;
    case 3: return PrivilegeLevelBeforeBlocked.OwnerPrivilege;
  }
  return PrivilegeLevelBeforeBlocked.Unknown;
}


class AccessModel implements ModelBase, WithAppId {

  // This is the member ID
  String documentID;
  String appId;

  // This is the privilege level and will determine the data accessible
  PrivilegeLevel? privilegeLevel;

  // Points received for this app. Points accrued can result in increase of privilege
  int? points;

  // Is this user blocked
  bool? blocked;

  // This is the privilege level before the member was blocked and allows to restore to this point
  PrivilegeLevelBeforeBlocked? privilegeLevelBeforeBlocked;

  AccessModel({required this.documentID, required this.appId, this.privilegeLevel, this.points, this.blocked, this.privilegeLevelBeforeBlocked, })  {
    assert(documentID != null);
  }

  AccessModel copyWith({String? documentID, String? appId, PrivilegeLevel? privilegeLevel, int? points, bool? blocked, PrivilegeLevelBeforeBlocked? privilegeLevelBeforeBlocked, }) {
    return AccessModel(documentID: documentID ?? this.documentID, appId: appId ?? this.appId, privilegeLevel: privilegeLevel ?? this.privilegeLevel, points: points ?? this.points, blocked: blocked ?? this.blocked, privilegeLevelBeforeBlocked: privilegeLevelBeforeBlocked ?? this.privilegeLevelBeforeBlocked, );
  }

  @override
  int get hashCode => documentID.hashCode ^ appId.hashCode ^ privilegeLevel.hashCode ^ points.hashCode ^ blocked.hashCode ^ privilegeLevelBeforeBlocked.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is AccessModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          appId == other.appId &&
          privilegeLevel == other.privilegeLevel &&
          points == other.points &&
          blocked == other.blocked &&
          privilegeLevelBeforeBlocked == other.privilegeLevelBeforeBlocked;

  @override
  String toString() {
    return 'AccessModel{documentID: $documentID, appId: $appId, privilegeLevel: $privilegeLevel, points: $points, blocked: $blocked, privilegeLevelBeforeBlocked: $privilegeLevelBeforeBlocked}';
  }

  AccessEntity toEntity({String? appId}) {
    return AccessEntity(
          appId: (appId != null) ? appId : null, 
          privilegeLevel: (privilegeLevel != null) ? privilegeLevel!.index : null, 
          points: (points != null) ? points : null, 
          blocked: (blocked != null) ? blocked : null, 
          privilegeLevelBeforeBlocked: (privilegeLevelBeforeBlocked != null) ? privilegeLevelBeforeBlocked!.index : null, 
    );
  }

  static Future<AccessModel?> fromEntity(String documentID, AccessEntity? entity) async {
    if (entity == null) return null;
    var counter = 0;
    return AccessModel(
          documentID: documentID, 
          appId: entity.appId ?? '', 
          privilegeLevel: toPrivilegeLevel(entity.privilegeLevel), 
          points: entity.points, 
          blocked: entity.blocked, 
          privilegeLevelBeforeBlocked: toPrivilegeLevelBeforeBlocked(entity.privilegeLevelBeforeBlocked), 
    );
  }

  static Future<AccessModel?> fromEntityPlus(String documentID, AccessEntity? entity, { String? appId}) async {
    if (entity == null) return null;

    var counter = 0;
    return AccessModel(
          documentID: documentID, 
          appId: entity.appId ?? '', 
          privilegeLevel: toPrivilegeLevel(entity.privilegeLevel), 
          points: entity.points, 
          blocked: entity.blocked, 
          privilegeLevelBeforeBlocked: toPrivilegeLevelBeforeBlocked(entity.privilegeLevelBeforeBlocked), 
    );
  }

}

