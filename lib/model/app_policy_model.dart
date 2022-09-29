/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 app_policy_model.dart
                       
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


import 'package:eliud_core/model/app_policy_entity.dart';

import 'package:eliud_core/tools/random.dart';



class AppPolicyModel implements ModelBase, WithAppId {
  static const String packageName = 'eliud_core';
  static const String id = 'appPolicys';

  String documentID;
  String appId;
  String? name;
  PlatformMediumModel? policy;
  StorageConditionsModel? conditions;

  AppPolicyModel({required this.documentID, required this.appId, this.name, this.policy, this.conditions, })  {
    assert(documentID != null);
  }

  AppPolicyModel copyWith({String? documentID, String? appId, String? name, PlatformMediumModel? policy, StorageConditionsModel? conditions, }) {
    return AppPolicyModel(documentID: documentID ?? this.documentID, appId: appId ?? this.appId, name: name ?? this.name, policy: policy ?? this.policy, conditions: conditions ?? this.conditions, );
  }

  @override
  int get hashCode => documentID.hashCode ^ appId.hashCode ^ name.hashCode ^ policy.hashCode ^ conditions.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is AppPolicyModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          appId == other.appId &&
          name == other.name &&
          policy == other.policy &&
          conditions == other.conditions;

  @override
  String toString() {
    return 'AppPolicyModel{documentID: $documentID, appId: $appId, name: $name, policy: $policy, conditions: $conditions}';
  }

  Future<List<ModelReference>> collectReferences({String? appId}) async {
    List<ModelReference> referencesCollector = [];
    if (policy != null) {
      referencesCollector.add(ModelReference(PlatformMediumModel.packageName, PlatformMediumModel.id, policy!));
    }
    if (policy != null) referencesCollector.addAll(await policy!.collectReferences(appId: appId));
    if (conditions != null) referencesCollector.addAll(await conditions!.collectReferences(appId: appId));
    return referencesCollector;
  }

  AppPolicyEntity toEntity({String? appId}) {
    return AppPolicyEntity(
          appId: (appId != null) ? appId : null, 
          name: (name != null) ? name : null, 
          policyId: (policy != null) ? policy!.documentID : null, 
          conditions: (conditions != null) ? conditions!.toEntity(appId: appId) : null, 
    );
  }

  static Future<AppPolicyModel?> fromEntity(String documentID, AppPolicyEntity? entity) async {
    if (entity == null) return null;
    var counter = 0;
    return AppPolicyModel(
          documentID: documentID, 
          appId: entity.appId ?? '', 
          name: entity.name, 
          conditions: 
            await StorageConditionsModel.fromEntity(entity.conditions), 
    );
  }

  static Future<AppPolicyModel?> fromEntityPlus(String documentID, AppPolicyEntity? entity, { String? appId}) async {
    if (entity == null) return null;

    PlatformMediumModel? policyHolder;
    if (entity.policyId != null) {
      try {
          policyHolder = await platformMediumRepository(appId: appId)!.get(entity.policyId);
      } on Exception catch(e) {
        print('Error whilst trying to initialise policy');
        print('Error whilst retrieving platformMedium with id ${entity.policyId}');
        print('Exception: $e');
      }
    }

    var counter = 0;
    return AppPolicyModel(
          documentID: documentID, 
          appId: entity.appId ?? '', 
          name: entity.name, 
          policy: policyHolder, 
          conditions: 
            await StorageConditionsModel.fromEntityPlus(entity.conditions, appId: appId), 
    );
  }

}

