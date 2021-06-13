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
import 'package:eliud_core/core/global_data.dart';
import 'package:eliud_core/tools/common_tools.dart';

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

  // Specific gridview
  GridViewModel? gridView;

  // This widgetWrapper can be registered by your package onto the registry and will then be used as a widget wrapper for all components of this page. The page will wrap all it's components inside this widget. This can for example be of use when you would want to use 1 bloc for several components on a page, preventing a bloc-delay for each component
  String? widgetWrapper;
  ConditionsModel? conditions;

  DialogModel({this.documentID, this.appId, this.title, this.bodyComponents, this.backgroundOverride, this.layout, this.gridView, this.widgetWrapper, this.conditions, })  {
    assert(documentID != null);
  }

  DialogModel copyWith({String? documentID, String? appId, String? title, List<BodyComponentModel>? bodyComponents, BackgroundModel? backgroundOverride, DialogLayout? layout, GridViewModel? gridView, String? widgetWrapper, ConditionsModel? conditions, }) {
    return DialogModel(documentID: documentID ?? this.documentID, appId: appId ?? this.appId, title: title ?? this.title, bodyComponents: bodyComponents ?? this.bodyComponents, backgroundOverride: backgroundOverride ?? this.backgroundOverride, layout: layout ?? this.layout, gridView: gridView ?? this.gridView, widgetWrapper: widgetWrapper ?? this.widgetWrapper, conditions: conditions ?? this.conditions, );
  }

  @override
  int get hashCode => documentID.hashCode ^ appId.hashCode ^ title.hashCode ^ bodyComponents.hashCode ^ backgroundOverride.hashCode ^ layout.hashCode ^ gridView.hashCode ^ widgetWrapper.hashCode ^ conditions.hashCode;

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
          gridView == other.gridView &&
          widgetWrapper == other.widgetWrapper &&
          conditions == other.conditions;

  @override
  String toString() {
    String bodyComponentsCsv = (bodyComponents == null) ? '' : bodyComponents!.join(', ');

    return 'DialogModel{documentID: $documentID, appId: $appId, title: $title, bodyComponents: BodyComponent[] { $bodyComponentsCsv }, backgroundOverride: $backgroundOverride, layout: $layout, gridView: $gridView, widgetWrapper: $widgetWrapper, conditions: $conditions}';
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
          gridViewId: (gridView != null) ? gridView!.documentID : null, 
          widgetWrapper: (widgetWrapper != null) ? widgetWrapper : null, 
          conditions: (conditions != null) ? conditions!.toEntity(appId: appId) : null, 
    );
  }

  static DialogModel? fromEntity(String documentID, DialogEntity? entity) {
    if (entity == null) return null;
    return DialogModel(
          documentID: documentID, 
          appId: entity.appId, 
          title: entity.title, 
          bodyComponents: 
            entity.bodyComponents == null ? null :
            entity.bodyComponents
            !.map((item) => BodyComponentModel.fromEntity(newRandomKey(), item)!)
            .toList(), 
          layout: toDialogLayout(entity.layout), 
          widgetWrapper: entity.widgetWrapper, 
          conditions: 
            ConditionsModel.fromEntity(entity.conditions), 
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

    return DialogModel(
          documentID: documentID, 
          appId: entity.appId, 
          title: entity.title, 
          bodyComponents: 
            entity. bodyComponents == null ? null : new List<BodyComponentModel>.from(await Future.wait(entity. bodyComponents
            !.map((item) => BodyComponentModel.fromEntityPlus(newRandomKey(), item, appId: appId))
            .toList())), 
          backgroundOverride: backgroundOverrideHolder, 
          layout: toDialogLayout(entity.layout), 
          gridView: gridViewHolder, 
          widgetWrapper: entity.widgetWrapper, 
          conditions: 
            await ConditionsModel.fromEntityPlus(entity.conditions, appId: appId), 
    );
  }

}

