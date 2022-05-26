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
class AppPolicyItemEntity {
  final String? name;
  final String? policyId;

  AppPolicyItemEntity({this.name, this.policyId, });


  List<Object?> get props => [name, policyId, ];

  @override
  String toString() {
    return 'AppPolicyItemEntity{name: $name, policyId: $policyId}';
  }

  static AppPolicyItemEntity? fromMap(Object? o) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

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

