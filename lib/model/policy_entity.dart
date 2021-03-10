/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 policy_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'package:eliud_core/tools/common_tools.dart';
import 'abstract_repository_singleton.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_core/model/entity_export.dart';

class PolicyEntity {
  final String appId;
  final String name;
  final String html;

  PolicyEntity({this.appId, this.name, this.html, });


  List<Object> get props => [appId, name, html, ];

  @override
  String toString() {
    return 'PolicyEntity{appId: $appId, name: $name, html: $html}';
  }

  static PolicyEntity fromMap(Map map) {
    if (map == null) return null;

    return PolicyEntity(
      appId: map['appId'], 
      name: map['name'], 
      html: map['html'], 
    );
  }

  Map<String, Object> toDocument() {
    Map<String, Object> theDocument = HashMap();
    if (appId != null) theDocument["appId"] = appId;
      else theDocument["appId"] = null;
    if (name != null) theDocument["name"] = name;
      else theDocument["name"] = null;
    if (html != null) theDocument["html"] = html;
      else theDocument["html"] = null;
    return theDocument;
  }

  static PolicyEntity fromJsonString(String json) {
    Map<String, dynamic> generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

}

