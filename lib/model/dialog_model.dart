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
import 'package:eliud_core/tools/common_tools.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_core/model/entity_export.dart';


import 'package:eliud_core/model/dialog_entity.dart';

import 'package:eliud_core/tools/random.dart';

enum DialogLayout {
  GridView, ListView, OnlyTheFirstComponent, Unknown
}


DialogLayout toDialogLayout(int? index) {
  switch (index) {
    case 0: return DialogLayout.GridView;
    case 1: return DialogLayout.ListView;
    case 2: return DialogLayout.OnlyTheFirstComponent;
  }
  return DialogLayout.Unknown;
}


class DialogModel {
  String? documentID;
  String? appId;
  String? title;
  List<BodyComponentModel>? bodyComponents;
  BackgroundModel? backgroundOverride;
  DialogLayout? layout;
  bool? includeHeading;

  // Specific gridview
  GridViewModel? gridView;
  StorageConditionsModel? conditions;

  DialogModel({this.documentID, this.appId, this.title, this.bodyComponents, this.backgroundOverride, this.layout, this.includeHeading, this.gridView, this.conditions, })  {
    assert(documentID != null);
  }

  DialogModel copyWith({String? documentID, String? appId, String? title, List<BodyComponentModel>? bodyComponents, BackgroundModel? backgroundOverride, DialogLayout? layout, bool? includeHeading, GridViewModel? gridView, StorageConditionsModel? conditions, }) {
    return DialogModel(documentID: documentID ?? this.documentID, appId: appId ?? this.appId, title: title ?? this.title, bodyComponents: bodyComponents ?? this.bodyComponents, backgroundOverride: backgroundOverride ?? this.backgroundOverride, layout: layout ?? this.layout, includeHeading: includeHeading ?? this.includeHeading, gridView: gridView ?? this.gridView, conditions: conditions ?? this.conditions, );
  }

  @override
  int get hashCode => documentID.hashCode ^ appId.hashCode ^ title.hashCode ^ bodyComponents.hashCode ^ backgroundOverride.hashCode ^ layout.hashCode ^ includeHeading.hashCode ^ gridView.hashCode ^ conditions.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is DialogModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          appId == other.appId &&
          title == other.title &&
          ListEquality().equals(bodyComponents, other.bodyComponents) &&
          backgroundOverride == other.backgroundOverride &&
          layout == other.layout &&
          includeHeading == other.includeHeading &&
          gridView == other.gridView &&
          conditions == other.conditions;

  @override
  String toString() {
    String bodyComponentsCsv = (bodyComponents == null) ? '' : bodyComponents!.join(', ');

    return 'DialogModel{documentID: $documentID, appId: $appId, title: $title, bodyComponents: BodyComponent[] { $bodyComponentsCsv }, backgroundOverride: $backgroundOverride, layout: $layout, includeHeading: $includeHeading, gridView: $gridView, conditions: $conditions}';
  }

  DialogEntity toEntity({String? appId}) {
    return DialogEntity(
          appId: (appId != null) ? appId : null, 
          title: (title != null) ? title : null, 
          bodyComponents: (bodyComponents != null) ? bodyComponents
            !.map((item) => item.toEntity(appId: appId))
            .toList() : null, 
          backgroundOverrideId: (backgroundOverride != null) ? backgroundOverride!.documentID : null, 
          layout: (layout != null) ? layout!.index : null, 
          includeHeading: (includeHeading != null) ? includeHeading : null, 
          gridViewId: (gridView != null) ? gridView!.documentID : null, 
          conditions: (conditions != null) ? conditions!.toEntity(appId: appId) : null, 
    );
  }

  static DialogModel? fromEntity(String documentID, DialogEntity? entity) {
    if (entity == null) return null;
    var counter = 0;
    return DialogModel(
          documentID: documentID, 
          appId: entity.appId, 
          title: entity.title, 
          bodyComponents: 
            entity.bodyComponents == null ? null :
            entity.bodyComponents
            !.map((item) {
              counter++; 
              return BodyComponentModel.fromEntity(counter.toString(), item)!;
            })
            .toList(), 
          layout: toDialogLayout(entity.layout), 
          includeHeading: entity.includeHeading, 
          conditions: 
            StorageConditionsModel.fromEntity(entity.conditions), 
    );
  }

  static Future<DialogModel?> fromEntityPlus(String documentID, DialogEntity? entity, { String? appId}) async {
    if (entity == null) return null;

    BackgroundModel? backgroundOverrideHolder;
    if (entity.backgroundOverrideId != null) {
      try {
          backgroundOverrideHolder = await backgroundRepository(appId: appId)!.get(entity.backgroundOverrideId);
      } on Exception catch(e) {
        print('Error whilst trying to initialise backgroundOverride');
        print('Error whilst retrieving background with id ${entity.backgroundOverrideId}');
        print('Exception: $e');
      }
    }

    GridViewModel? gridViewHolder;
    if (entity.gridViewId != null) {
      try {
          gridViewHolder = await gridViewRepository(appId: appId)!.get(entity.gridViewId);
      } on Exception catch(e) {
        print('Error whilst trying to initialise gridView');
        print('Error whilst retrieving gridView with id ${entity.gridViewId}');
        print('Exception: $e');
      }
    }

    var counter = 0;
    return DialogModel(
          documentID: documentID, 
          appId: entity.appId, 
          title: entity.title, 
          bodyComponents: 
            entity. bodyComponents == null ? null : List<BodyComponentModel>.from(await Future.wait(entity. bodyComponents
            !.map((item) {
            counter++;
            return BodyComponentModel.fromEntityPlus(counter.toString(), item, appId: appId);})
            .toList())), 
          backgroundOverride: backgroundOverrideHolder, 
          layout: toDialogLayout(entity.layout), 
          includeHeading: entity.includeHeading, 
          gridView: gridViewHolder, 
          conditions: 
            await StorageConditionsModel.fromEntityPlus(entity.conditions, appId: appId), 
    );
  }

}

