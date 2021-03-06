/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_dashboard_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/core/global_data.dart';
import 'package:eliud_core/tools/common_tools.dart';

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


import 'package:eliud_core/model/member_dashboard_entity.dart';

import 'package:eliud_core/tools/random.dart';



class MemberDashboardModel {
  String documentID;

  // This is the identifier of the app to which this belongs
  String appId;
  String description;
  ConditionsSimpleModel conditions;

  MemberDashboardModel({this.documentID, this.appId, this.description, this.conditions, })  {
    assert(documentID != null);
  }

  MemberDashboardModel copyWith({String documentID, String appId, String description, ConditionsSimpleModel conditions, }) {
    return MemberDashboardModel(documentID: documentID ?? this.documentID, appId: appId ?? this.appId, description: description ?? this.description, conditions: conditions ?? this.conditions, );
  }

  @override
  int get hashCode => documentID.hashCode ^ appId.hashCode ^ description.hashCode ^ conditions.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is MemberDashboardModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          appId == other.appId &&
          description == other.description &&
          conditions == other.conditions;

  @override
  String toString() {
    return 'MemberDashboardModel{documentID: $documentID, appId: $appId, description: $description, conditions: $conditions}';
  }

  MemberDashboardEntity toEntity({String appId}) {
    return MemberDashboardEntity(
          appId: (appId != null) ? appId : null, 
          description: (description != null) ? description : null, 
          conditions: (conditions != null) ? conditions.toEntity(appId: appId) : null, 
    );
  }

  static MemberDashboardModel fromEntity(String documentID, MemberDashboardEntity entity) {
    if (entity == null) return null;
    return MemberDashboardModel(
          documentID: documentID, 
          appId: entity.appId, 
          description: entity.description, 
          conditions: 
            ConditionsSimpleModel.fromEntity(entity.conditions), 
    );
  }

  static Future<MemberDashboardModel> fromEntityPlus(String documentID, MemberDashboardEntity entity, { String appId}) async {
    if (entity == null) return null;

    return MemberDashboardModel(
          documentID: documentID, 
          appId: entity.appId, 
          description: entity.description, 
          conditions: 
            await ConditionsSimpleModel.fromEntityPlus(entity.conditions, appId: appId), 
    );
  }

}

