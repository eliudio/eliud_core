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

import 'package:eliud_core/core/global_data.dart';
import 'package:eliud_core/tools/common_tools.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_core/model/entity_export.dart';


import 'package:eliud_core/model/app_policy_item_entity.dart';

import 'package:eliud_core/tools/random.dart';



class AppPolicyItemModel {
  String? documentID;
  String? name;
  MemberMediumModel? policy;

  AppPolicyItemModel({this.documentID, this.name, this.policy, })  {
    assert(documentID != null);
  }

  AppPolicyItemModel copyWith({String? documentID, String? name, MemberMediumModel? policy, }) {
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

  AppPolicyItemEntity toEntity({String? appId}) {
    return AppPolicyItemEntity(
          name: (name != null) ? name : null, 
          policyId: (policy != null) ? policy!.documentID : null, 
    );
  }

  static AppPolicyItemModel? fromEntity(String documentID, AppPolicyItemEntity? entity) {
    if (entity == null) return null;
    return AppPolicyItemModel(
          documentID: documentID, 
          name: entity.name, 
    );
  }

  static Future<AppPolicyItemModel?> fromEntityPlus(String documentID, AppPolicyItemEntity? entity, { String? appId}) async {
    if (entity == null) return null;

    MemberMediumModel? policyHolder;
    if (entity.policyId != null) {
      try {
        await memberMediumRepository(appId: appId)!.get(entity.policyId).then((val) {
          policyHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    return AppPolicyItemModel(
          documentID: documentID, 
          name: entity.name, 
          policy: policyHolder, 
    );
  }

}
