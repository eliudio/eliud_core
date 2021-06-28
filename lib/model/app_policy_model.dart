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

import 'package:collection/collection.dart';
import 'package:eliud_core/tools/common_tools.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_core/model/entity_export.dart';


import 'package:eliud_core/model/app_policy_entity.dart';

import 'package:eliud_core/tools/random.dart';



class AppPolicyModel {
  String? documentID;
  String? appId;
  String? comments;
  List<AppPolicyItemModel>? policies;

  AppPolicyModel({this.documentID, this.appId, this.comments, this.policies, })  {
    assert(documentID != null);
  }

  AppPolicyModel copyWith({String? documentID, String? appId, String? comments, List<AppPolicyItemModel>? policies, }) {
    return AppPolicyModel(documentID: documentID ?? this.documentID, appId: appId ?? this.appId, comments: comments ?? this.comments, policies: policies ?? this.policies, );
  }

  @override
  int get hashCode => documentID.hashCode ^ appId.hashCode ^ comments.hashCode ^ policies.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is AppPolicyModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          appId == other.appId &&
          comments == other.comments &&
          ListEquality().equals(policies, other.policies);

  @override
  String toString() {
    String policiesCsv = (policies == null) ? '' : policies!.join(', ');

    return 'AppPolicyModel{documentID: $documentID, appId: $appId, comments: $comments, policies: AppPolicyItem[] { $policiesCsv }}';
  }

  AppPolicyEntity toEntity({String? appId}) {
    return AppPolicyEntity(
          appId: (appId != null) ? appId : null, 
          comments: (comments != null) ? comments : null, 
          policies: (policies != null) ? policies
            !.map((item) => item.toEntity(appId: appId))
            .toList() : null, 
    );
  }

  static AppPolicyModel? fromEntity(String documentID, AppPolicyEntity? entity) {
    if (entity == null) return null;
    var counter = 0;
    return AppPolicyModel(
          documentID: documentID, 
          appId: entity.appId, 
          comments: entity.comments, 
          policies: 
            entity.policies == null ? null :
            entity.policies
            !.map((item) {
              counter++; 
              return AppPolicyItemModel.fromEntity(counter.toString(), item)!;
            })
            .toList(), 
    );
  }

  static Future<AppPolicyModel?> fromEntityPlus(String documentID, AppPolicyEntity? entity, { String? appId}) async {
    if (entity == null) return null;

    var counter = 0;
    return AppPolicyModel(
          documentID: documentID, 
          appId: entity.appId, 
          comments: entity.comments, 
          policies: 
            entity. policies == null ? null : List<AppPolicyItemModel>.from(await Future.wait(entity. policies
            !.map((item) {
            counter++;
            return AppPolicyItemModel.fromEntityPlus(counter.toString(), item, appId: appId);})
            .toList())), 
    );
  }

}

