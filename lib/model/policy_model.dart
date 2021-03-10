/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 policy_model.dart
                       
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


import 'package:eliud_core/model/policy_entity.dart';

import 'package:eliud_core/tools/random.dart';



class PolicyModel {
  String documentID;
  String appId;
  String name;
  String html;

  PolicyModel({this.documentID, this.appId, this.name, this.html, })  {
    assert(documentID != null);
  }

  PolicyModel copyWith({String documentID, String appId, String name, String html, }) {
    return PolicyModel(documentID: documentID ?? this.documentID, appId: appId ?? this.appId, name: name ?? this.name, html: html ?? this.html, );
  }

  @override
  int get hashCode => documentID.hashCode ^ appId.hashCode ^ name.hashCode ^ html.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is PolicyModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          appId == other.appId &&
          name == other.name &&
          html == other.html;

  @override
  String toString() {
    return 'PolicyModel{documentID: $documentID, appId: $appId, name: $name, html: $html}';
  }

  PolicyEntity toEntity({String appId}) {
    return PolicyEntity(
          appId: (appId != null) ? appId : null, 
          name: (name != null) ? name : null, 
          html: (html != null) ? html : null, 
    );
  }

  static PolicyModel fromEntity(String documentID, PolicyEntity entity) {
    if (entity == null) return null;
    return PolicyModel(
          documentID: documentID, 
          appId: entity.appId, 
          name: entity.name, 
          html: entity.html, 
    );
  }

  static Future<PolicyModel> fromEntityPlus(String documentID, PolicyEntity entity, { String appId}) async {
    if (entity == null) return null;

    return PolicyModel(
          documentID: documentID, 
          appId: entity.appId, 
          name: entity.name, 
          html: entity.html, 
    );
  }

}

