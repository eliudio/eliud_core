/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 app_policy_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'package:eliud_core/tools/common_tools.dart';
import 'abstract_repository_singleton.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_core/model/entity_export.dart';

class AppPolicyEntity {
  final String? appId;
  final String? comments;
  final List<AppPolicyItemEntity>? policies;

  AppPolicyEntity({this.appId, this.comments, this.policies, });


  List<Object?> get props => [appId, comments, policies, ];

  @override
  String toString() {
    String policiesCsv = (policies == null) ? '' : policies!.join(', ');

    return 'AppPolicyEntity{appId: $appId, comments: $comments, policies: AppPolicyItem[] { $policiesCsv }}';
  }

  static AppPolicyEntity? fromMap(Map? map) {
    if (map == null) return null;

    var policiesFromMap;
    policiesFromMap = map['policies'];
    var policiesList;
    if (policiesFromMap != null)
      policiesList = (map['policies'] as List<dynamic>)
        .map((dynamic item) =>
        AppPolicyItemEntity.fromMap(item as Map)!)
        .toList();

    return AppPolicyEntity(
      appId: map['appId'], 
      comments: map['comments'], 
      policies: policiesList, 
    );
  }

  Map<String, Object?> toDocument() {
    final List<Map<String?, dynamic>>? policiesListMap = policies != null 
        ? policies!.map((item) => item.toDocument()).toList()
        : null;

    Map<String, Object?> theDocument = HashMap();
    if (appId != null) theDocument["appId"] = appId;
      else theDocument["appId"] = null;
    if (comments != null) theDocument["comments"] = comments;
      else theDocument["comments"] = null;
    if (policies != null) theDocument["policies"] = policiesListMap;
      else theDocument["policies"] = null;
    return theDocument;
  }

  static AppPolicyEntity? fromJsonString(String json) {
    Map<String, dynamic>? generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

}

