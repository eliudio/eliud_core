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

import 'package:eliud_core/core/base/model_base.dart';

import 'package:eliud_core/model/entity_export.dart';


import 'package:eliud_core/model/body_component_entity.dart';




class BodyComponentModel implements ModelBase {
  static const String packageName = 'eliud_core';
  static const String id = 'bodyComponents';

  String documentID;

  // The component name, such as 'carousel' which is required on this body
  String? componentName;

  // For that specific component, e.g. 'carousel', which Component ID, i.e. which carousel to include in the page
  String? componentId;

  BodyComponentModel({required this.documentID, this.componentName, this.componentId, })  {
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

  Future<List<ModelReference>> collectReferences({String? appId}) async {
    List<ModelReference> referencesCollector = [];
    return referencesCollector;
  }

  BodyComponentEntity toEntity({String? appId}) {
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

