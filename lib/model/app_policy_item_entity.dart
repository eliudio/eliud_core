/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 app_policy_item_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'package:eliud_core/tools/common_tools.dart';
import 'abstract_repository_singleton.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_core/model/entity_export.dart';

class AppPolicyItemEntity {
  final String? name;
  final String? policyId;

  AppPolicyItemEntity({this.name, this.policyId, });


  List<Object?> get props => [name, policyId, ];

  @override
  String toString() {
    return 'AppPolicyItemEntity{name: $name, policyId: $policyId}';
  }

  static AppPolicyItemEntity? fromMap(Map? map) {
    if (map == null) return null;

    return AppPolicyItemEntity(
      name: map['name'], 
      policyId: map['policyId'], 
    );
  }

  Map<String, Object?> toDocument() {
    Map<String, Object?> theDocument = HashMap();
    if (name != null) theDocument["name"] = name;
      else theDocument["name"] = null;
    if (policyId != null) theDocument["policyId"] = policyId;
      else theDocument["policyId"] = null;
    return theDocument;
  }

  static AppPolicyItemEntity? fromJsonString(String json) {
    Map<String, dynamic>? generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

}
