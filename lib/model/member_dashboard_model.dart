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
  String? documentID;

  // This is the identifier of the app to which this belongs
  String? appId;
  String? description;

  // This is the text on the member dashboard screen providing more information about what it means to update the member profile
  String? updateProfileText;

  // This is the text on the member dashboard screen providing more information about what it means to retrieve all data
  String? retrieveDataText;

  // This is the text on the member dashboard screen providing more information about what it means to destroy the account, i.e. the member will loose all data
  String? deleteDataText;

  // This is the subject of the email providing the member his data stored in the app (after requesting it)
  String? retrieveDataEmailSubject;

  // This is the subject of the email informing the member that his account and all of his data has been destroyed (after requesting it)
  String? deleteDataEmailSubject;

  // This is the message of the email informing the member that his account and all of his data has been destroyed (after requesting it)
  String? deleteDataEmailMessage;
  ConditionsSimpleModel? conditions;

  MemberDashboardModel({this.documentID, this.appId, this.description, this.updateProfileText, this.retrieveDataText, this.deleteDataText, this.retrieveDataEmailSubject, this.deleteDataEmailSubject, this.deleteDataEmailMessage, this.conditions, })  {
    assert(documentID != null);
  }

  MemberDashboardModel copyWith({String? documentID, String? appId, String? description, String? updateProfileText, String? retrieveDataText, String? deleteDataText, String? retrieveDataEmailSubject, String? deleteDataEmailSubject, String? deleteDataEmailMessage, ConditionsSimpleModel? conditions, }) {
    return MemberDashboardModel(documentID: documentID ?? this.documentID, appId: appId ?? this.appId, description: description ?? this.description, updateProfileText: updateProfileText ?? this.updateProfileText, retrieveDataText: retrieveDataText ?? this.retrieveDataText, deleteDataText: deleteDataText ?? this.deleteDataText, retrieveDataEmailSubject: retrieveDataEmailSubject ?? this.retrieveDataEmailSubject, deleteDataEmailSubject: deleteDataEmailSubject ?? this.deleteDataEmailSubject, deleteDataEmailMessage: deleteDataEmailMessage ?? this.deleteDataEmailMessage, conditions: conditions ?? this.conditions, );
  }

  @override
  int get hashCode => documentID.hashCode ^ appId.hashCode ^ description.hashCode ^ updateProfileText.hashCode ^ retrieveDataText.hashCode ^ deleteDataText.hashCode ^ retrieveDataEmailSubject.hashCode ^ deleteDataEmailSubject.hashCode ^ deleteDataEmailMessage.hashCode ^ conditions.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is MemberDashboardModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          appId == other.appId &&
          description == other.description &&
          updateProfileText == other.updateProfileText &&
          retrieveDataText == other.retrieveDataText &&
          deleteDataText == other.deleteDataText &&
          retrieveDataEmailSubject == other.retrieveDataEmailSubject &&
          deleteDataEmailSubject == other.deleteDataEmailSubject &&
          deleteDataEmailMessage == other.deleteDataEmailMessage &&
          conditions == other.conditions;

  @override
  String toString() {
    return 'MemberDashboardModel{documentID: $documentID, appId: $appId, description: $description, updateProfileText: $updateProfileText, retrieveDataText: $retrieveDataText, deleteDataText: $deleteDataText, retrieveDataEmailSubject: $retrieveDataEmailSubject, deleteDataEmailSubject: $deleteDataEmailSubject, deleteDataEmailMessage: $deleteDataEmailMessage, conditions: $conditions}';
  }

  MemberDashboardEntity toEntity({String? appId}) {
    return MemberDashboardEntity(
          appId: (appId != null) ? appId : null, 
          description: (description != null) ? description : null, 
          updateProfileText: (updateProfileText != null) ? updateProfileText : null, 
          retrieveDataText: (retrieveDataText != null) ? retrieveDataText : null, 
          deleteDataText: (deleteDataText != null) ? deleteDataText : null, 
          retrieveDataEmailSubject: (retrieveDataEmailSubject != null) ? retrieveDataEmailSubject : null, 
          deleteDataEmailSubject: (deleteDataEmailSubject != null) ? deleteDataEmailSubject : null, 
          deleteDataEmailMessage: (deleteDataEmailMessage != null) ? deleteDataEmailMessage : null, 
          conditions: (conditions != null) ? conditions!.toEntity(appId: appId) : null, 
    );
  }

  static MemberDashboardModel? fromEntity(String documentID, MemberDashboardEntity? entity) {
    if (entity == null) return null;
    return MemberDashboardModel(
          documentID: documentID, 
          appId: entity.appId, 
          description: entity.description, 
          updateProfileText: entity.updateProfileText, 
          retrieveDataText: entity.retrieveDataText, 
          deleteDataText: entity.deleteDataText, 
          retrieveDataEmailSubject: entity.retrieveDataEmailSubject, 
          deleteDataEmailSubject: entity.deleteDataEmailSubject, 
          deleteDataEmailMessage: entity.deleteDataEmailMessage, 
          conditions: 
            ConditionsSimpleModel.fromEntity(entity.conditions), 
    );
  }

  static Future<MemberDashboardModel?> fromEntityPlus(String documentID, MemberDashboardEntity? entity, { String? appId}) async {
    if (entity == null) return null;

    return MemberDashboardModel(
          documentID: documentID, 
          appId: entity.appId, 
          description: entity.description, 
          updateProfileText: entity.updateProfileText, 
          retrieveDataText: entity.retrieveDataText, 
          deleteDataText: entity.deleteDataText, 
          retrieveDataEmailSubject: entity.retrieveDataEmailSubject, 
          deleteDataEmailSubject: entity.deleteDataEmailSubject, 
          deleteDataEmailMessage: entity.deleteDataEmailMessage, 
          conditions: 
            await ConditionsSimpleModel.fromEntityPlus(entity.conditions, appId: appId), 
    );
  }

}

