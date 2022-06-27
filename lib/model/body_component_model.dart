/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 body_component_model.dart
                       
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


import 'package:eliud_core/model/body_component_entity.dart';

import 'package:eliud_core/tools/random.dart';



class BodyComponentModel implements ModelBase {
  static const String packageName = 'eliud_core';
  static const String id = 'BodyComponent';

  String documentID;

  // The component name, such as 'carousel' which is required on this body
  String? componentName;

  // For that specific component, e.g. 'carousel', which Component ID, i.e. which carousel to include in the page
  String? componentId;

  BodyComponentModel({required this.documentID, this.componentName, this.componentId, })  {
    assert(documentID != null);
  }

  BodyComponentModel copyWith({String? documentID, String? componentName, String? componentId, }) {
    return BodyComponentModel(documentID: documentID ?? this.documentID, componentName: componentName ?? this.componentName, componentId: componentId ?? this.componentId, );
  }

  @override
  int get hashCode => documentID.hashCode ^ componentName.hashCode ^ componentId.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is BodyComponentModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          componentName == other.componentName &&
          componentId == other.componentId;

  @override
  String toString() {
    return 'BodyComponentModel{documentID: $documentID, componentName: $componentName, componentId: $componentId}';
  }

  BodyComponentEntity toEntity({String? appId, Set<ModelReference>? referencesCollector}) {
    if (referencesCollector != null) {
    }
    return BodyComponentEntity(
          componentName: (componentName != null) ? componentName : null, 
          componentId: (componentId != null) ? componentId : null, 
    );
  }

  static Future<BodyComponentModel?> fromEntity(String documentID, BodyComponentEntity? entity) async {
    if (entity == null) return null;
    var counter = 0;
    return BodyComponentModel(
          documentID: documentID, 
          componentName: entity.componentName, 
          componentId: entity.componentId, 
    );
  }

  static Future<BodyComponentModel?> fromEntityPlus(String documentID, BodyComponentEntity? entity, { String? appId}) async {
    if (entity == null) return null;

    var counter = 0;
    return BodyComponentModel(
          documentID: documentID, 
          componentName: entity.componentName, 
          componentId: entity.componentId, 
    );
  }

}

