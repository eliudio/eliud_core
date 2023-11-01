/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 blocking_dashboard_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/core/base/model_base.dart';

import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';


import 'package:eliud_core/model/blocking_dashboard_entity.dart';




class BlockingDashboardModel implements ModelBase, WithAppId {
  static const String packageName = 'eliud_core';
  static const String id = 'blockingDashboards';

  String documentID;

  // This is the identifier of the app to which this belongs
  String appId;
  String? description;
  StorageConditionsModel? conditions;

  BlockingDashboardModel({required this.documentID, required this.appId, this.description, this.conditions, })  {
  }

  BlockingDashboardModel copyWith({String? documentID, String? appId, String? description, StorageConditionsModel? conditions, }) {
    return BlockingDashboardModel(documentID: documentID ?? this.documentID, appId: appId ?? this.appId, description: description ?? this.description, conditions: conditions ?? this.conditions, );
  }

  @override
  int get hashCode => documentID.hashCode ^ appId.hashCode ^ description.hashCode ^ conditions.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is BlockingDashboardModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          appId == other.appId &&
          description == other.description &&
          conditions == other.conditions;

  @override
  String toString() {
    return 'BlockingDashboardModel{documentID: $documentID, appId: $appId, description: $description, conditions: $conditions}';
  }

  Future<List<ModelReference>> collectReferences({String? appId}) async {
    List<ModelReference> referencesCollector = [];
    if (conditions != null) referencesCollector.addAll(await conditions!.collectReferences(appId: appId));
    return referencesCollector;
  }

  BlockingDashboardEntity toEntity({String? appId}) {
    return BlockingDashboardEntity(
          appId: (appId != null) ? appId : null, 
          description: (description != null) ? description : null, 
          conditions: (conditions != null) ? conditions!.toEntity(appId: appId) : null, 
    );
  }

  static Future<BlockingDashboardModel?> fromEntity(String documentID, BlockingDashboardEntity? entity) async {
    if (entity == null) return null;
    var counter = 0;
    return BlockingDashboardModel(
          documentID: documentID, 
          appId: entity.appId ?? '', 
          description: entity.description, 
          conditions: 
            await StorageConditionsModel.fromEntity(entity.conditions), 
    );
  }

  static Future<BlockingDashboardModel?> fromEntityPlus(String documentID, BlockingDashboardEntity? entity, { String? appId}) async {
    if (entity == null) return null;

    var counter = 0;
    return BlockingDashboardModel(
          documentID: documentID, 
          appId: entity.appId ?? '', 
          description: entity.description, 
          conditions: 
            await StorageConditionsModel.fromEntityPlus(entity.conditions, appId: appId), 
    );
  }

}

