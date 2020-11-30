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

import 'package:eliud_core/core/global_data.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_core/model/entity_export.dart';


import 'package:eliud_core/model/body_component_entity.dart';

import 'package:eliud_core/tools/random.dart';



class BodyComponentModel {
  String documentID;

  // The component name, such as 'carousel' which is required on this body
  String componentName;

  // For that specific component, e.g. 'carousel', which Component ID, i.e. which carousel to include in the page
  String componentId;

  BodyComponentModel({this.documentID, this.componentName, this.componentId, })  {
    assert(documentID != null);
  }

  BodyComponentModel copyWith({String documentID, String componentName, String componentId, }) {
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

  BodyComponentEntity toEntity({String appId}) {
    return BodyComponentEntity(
          componentName: (componentName != null) ? componentName : null, 
          componentId: (componentId != null) ? componentId : null, 
    );
  }

  static BodyComponentModel fromEntity(String documentID, BodyComponentEntity entity) {
    if (entity == null) return null;
    return BodyComponentModel(
          documentID: documentID, 
          componentName: entity.componentName, 
          componentId: entity.componentId, 
    );
  }

  static Future<BodyComponentModel> fromEntityPlus(String documentID, BodyComponentEntity entity, { String appId}) async {
    if (entity == null) return null;

    return BodyComponentModel(
          documentID: documentID, 
          componentName: entity.componentName, 
          componentId: entity.componentId, 
    );
  }

}

