/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 app_policy_item_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/tools/common_tools.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/core/base/model_base.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:eliud_core/model/app_model.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_core/model/entity_export.dart';


import 'package:eliud_core/model/app_policy_item_entity.dart';

import 'package:eliud_core/tools/random.dart';



class AppPolicyItemModel implements ModelBase {
  static const String packageName = 'eliud_core';
  static const String id = 'AppPolicyItem';

  String documentID;
  String? name;
  PublicMediumModel? policy;

  AppPolicyItemModel({required this.documentID, this.name, this.policy, })  {
    assert(documentID != null);
  }

  AppPolicyItemModel copyWith({String? documentID, String? name, PublicMediumModel? policy, }) {
    return AppPolicyItemModel(documentID: documentID ?? this.documentID, name: name ?? this.name, policy: policy ?? this.policy, );
  }

  @override
  int get hashCode => documentID.hashCode ^ name.hashCode ^ policy.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is AppPolicyItemModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          name == other.name &&
          policy == other.policy;

  @override
  String toString() {
    return 'AppPolicyItemModel{documentID: $documentID, name: $name, policy: $policy}';
  }

  AppPolicyItemEntity toEntity({String? appId, List<ModelReference>? referencesCollector}) {
    if (referencesCollector != null) {
      if (policy != null) referencesCollector.add(ModelReference(PublicMediumModel.packageName, PublicMediumModel.id, policy!));
    }
    return AppPolicyItemEntity(
          name: (name != null) ? name : null, 
          policyId: (policy != null) ? policy!.documentID : null, 
    );
  }

  static Future<AppPolicyItemModel?> fromEntity(String documentID, AppPolicyItemEntity? entity) async {
    if (entity == null) return null;
    var counter = 0;
    return AppPolicyItemModel(
          documentID: documentID, 
          name: entity.name, 
    );
  }

  static Future<AppPolicyItemModel?> fromEntityPlus(String documentID, AppPolicyItemEntity? entity, { String? appId}) async {
    if (entity == null) return null;

    PublicMediumModel? policyHolder;
    if (entity.policyId != null) {
      try {
          policyHolder = await publicMediumRepository(appId: appId)!.get(entity.policyId);
      } on Exception catch(e) {
        print('Error whilst trying to initialise policy');
        print('Error whilst retrieving publicMedium with id ${entity.policyId}');
        print('Exception: $e');
      }
    }

    var counter = 0;
    return AppPolicyItemModel(
          documentID: documentID, 
          name: entity.name, 
          policy: policyHolder, 
    );
  }

}

