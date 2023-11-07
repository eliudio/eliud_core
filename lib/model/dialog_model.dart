/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 dialog_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:collection/collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/core/base/model_base.dart';

import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';

import 'package:eliud_core/model/dialog_entity.dart';

enum DialogLayout { gridView, listView, onlyTheFirstComponent, unknown }

DialogLayout toDialogLayout(int? index) {
  switch (index) {
    case 0:
      return DialogLayout.gridView;
    case 1:
      return DialogLayout.listView;
    case 2:
      return DialogLayout.onlyTheFirstComponent;
  }
  return DialogLayout.unknown;
}

class DialogModel implements ModelBase, WithAppId {
  static const String packageName = 'eliud_core';
  static const String id = 'dialogs';

  @override
  String documentID;
  @override
  String appId;
  String? title;
  String? description;
  List<BodyComponentModel>? bodyComponents;
  BackgroundModel? backgroundOverride;
  DialogLayout? layout;
  bool? includeHeading;

  // Specific gridview
  GridViewModel? gridView;
  StorageConditionsModel? conditions;

  DialogModel({
    required this.documentID,
    required this.appId,
    this.title,
    this.description,
    this.bodyComponents,
    this.backgroundOverride,
    this.layout,
    this.includeHeading,
    this.gridView,
    this.conditions,
  });

  @override
  DialogModel copyWith({
    String? documentID,
    String? appId,
    String? title,
    String? description,
    List<BodyComponentModel>? bodyComponents,
    BackgroundModel? backgroundOverride,
    DialogLayout? layout,
    bool? includeHeading,
    GridViewModel? gridView,
    StorageConditionsModel? conditions,
  }) {
    return DialogModel(
      documentID: documentID ?? this.documentID,
      appId: appId ?? this.appId,
      title: title ?? this.title,
      description: description ?? this.description,
      bodyComponents: bodyComponents ?? this.bodyComponents,
      backgroundOverride: backgroundOverride ?? this.backgroundOverride,
      layout: layout ?? this.layout,
      includeHeading: includeHeading ?? this.includeHeading,
      gridView: gridView ?? this.gridView,
      conditions: conditions ?? this.conditions,
    );
  }

  @override
  int get hashCode =>
      documentID.hashCode ^
      appId.hashCode ^
      title.hashCode ^
      description.hashCode ^
      bodyComponents.hashCode ^
      backgroundOverride.hashCode ^
      layout.hashCode ^
      includeHeading.hashCode ^
      gridView.hashCode ^
      conditions.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DialogModel &&
          runtimeType == other.runtimeType &&
          documentID == other.documentID &&
          appId == other.appId &&
          title == other.title &&
          description == other.description &&
          ListEquality().equals(bodyComponents, other.bodyComponents) &&
          backgroundOverride == other.backgroundOverride &&
          layout == other.layout &&
          includeHeading == other.includeHeading &&
          gridView == other.gridView &&
          conditions == other.conditions;

  @override
  String toString() {
    String bodyComponentsCsv =
        (bodyComponents == null) ? '' : bodyComponents!.join(', ');

    return 'DialogModel{documentID: $documentID, appId: $appId, title: $title, description: $description, bodyComponents: BodyComponent[] { $bodyComponentsCsv }, backgroundOverride: $backgroundOverride, layout: $layout, includeHeading: $includeHeading, gridView: $gridView, conditions: $conditions}';
  }

  @override
  Future<List<ModelReference>> collectReferences({String? appId}) async {
    List<ModelReference> referencesCollector = [];
    if (gridView != null) {
      referencesCollector.add(ModelReference(
          GridViewModel.packageName, GridViewModel.id, gridView!));
    }
    if (bodyComponents != null) {
      for (var item in bodyComponents!) {
        referencesCollector.addAll(await item.collectReferences(appId: appId));
      }
    }
    if (backgroundOverride != null) {
      referencesCollector
          .addAll(await backgroundOverride!.collectReferences(appId: appId));
    }
    if (gridView != null) {
      referencesCollector
          .addAll(await gridView!.collectReferences(appId: appId));
    }
    if (conditions != null) {
      referencesCollector
          .addAll(await conditions!.collectReferences(appId: appId));
    }
    return referencesCollector;
  }

  @override
  DialogEntity toEntity({String? appId}) {
    return DialogEntity(
      appId: appId,
      title: (title != null) ? title : null,
      description: (description != null) ? description : null,
      bodyComponents: (bodyComponents != null)
          ? bodyComponents!.map((item) => item.toEntity(appId: appId)).toList()
          : null,
      backgroundOverride: (backgroundOverride != null)
          ? backgroundOverride!.toEntity(appId: appId)
          : null,
      layout: (layout != null) ? layout!.index : null,
      includeHeading: (includeHeading != null) ? includeHeading : null,
      gridViewId: (gridView != null) ? gridView!.documentID : null,
      conditions:
          (conditions != null) ? conditions!.toEntity(appId: appId) : null,
    );
  }

  static Future<DialogModel?> fromEntity(
      String documentID, DialogEntity? entity) async {
    if (entity == null) return null;
    var counter = 0;
    return DialogModel(
      documentID: documentID,
      appId: entity.appId ?? '',
      title: entity.title,
      description: entity.description,
      bodyComponents: entity.bodyComponents == null
          ? null
          : List<BodyComponentModel>.from(
              await Future.wait(entity.bodyComponents!.map((item) {
              counter++;
              return BodyComponentModel.fromEntity(counter.toString(), item);
            }).toList())),
      backgroundOverride:
          await BackgroundModel.fromEntity(entity.backgroundOverride),
      layout: toDialogLayout(entity.layout),
      includeHeading: entity.includeHeading,
      conditions: await StorageConditionsModel.fromEntity(entity.conditions),
    );
  }

  static Future<DialogModel?> fromEntityPlus(
      String documentID, DialogEntity? entity,
      {String? appId}) async {
    if (entity == null) return null;

    GridViewModel? gridViewHolder;
    if (entity.gridViewId != null) {
      try {
        gridViewHolder =
            await gridViewRepository(appId: appId)!.get(entity.gridViewId);
      } on Exception catch (e) {
        print('Error whilst trying to initialise gridView');
        print('Error whilst retrieving gridView with id ${entity.gridViewId}');
        print('Exception: $e');
      }
    }

    var counter = 0;
    return DialogModel(
      documentID: documentID,
      appId: entity.appId ?? '',
      title: entity.title,
      description: entity.description,
      bodyComponents: entity.bodyComponents == null
          ? null
          : List<BodyComponentModel>.from(
              await Future.wait(entity.bodyComponents!.map((item) {
              counter++;
              return BodyComponentModel.fromEntityPlus(counter.toString(), item,
                  appId: appId);
            }).toList())),
      backgroundOverride: await BackgroundModel.fromEntityPlus(
          entity.backgroundOverride,
          appId: appId),
      layout: toDialogLayout(entity.layout),
      includeHeading: entity.includeHeading,
      gridView: gridViewHolder,
      conditions: await StorageConditionsModel.fromEntityPlus(entity.conditions,
          appId: appId),
    );
  }
}
