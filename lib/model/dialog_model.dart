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


DialogLayout toDialogLayout(int index) {
  switch (index) {
    case 0: return DialogLayout.GridView;
    case 1: return DialogLayout.ListView;
    case 2: return DialogLayout.OnlyTheFirstComponent;
  }
  return DialogLayout.Unknown;
}


class DialogModel {
  String documentID;
  String appId;
  String title;
  List<BodyComponentModel> bodyComponents;
  RgbModel background;
  DialogLayout layout;

  // Specific gridview
  GridViewModel gridView;

  // Page only accessible conditionally. See type definition for more info
  ReadCondition readCondition;
  int privilegeLevelRequired;
  String packageCondition;

  DialogModel({this.documentID, this.appId, this.title, this.bodyComponents, this.background, this.layout, this.gridView, this.readCondition, this.privilegeLevelRequired, this.packageCondition, })  {
    assert(documentID != null);
  }

  DialogModel copyWith({String documentID, String appId, String title, List<BodyComponentModel> bodyComponents, RgbModel background, DialogLayout layout, GridViewModel gridView, ReadCondition readCondition, int privilegeLevelRequired, String packageCondition, }) {
    return DialogModel(documentID: documentID ?? this.documentID, appId: appId ?? this.appId, title: title ?? this.title, bodyComponents: bodyComponents ?? this.bodyComponents, background: background ?? this.background, layout: layout ?? this.layout, gridView: gridView ?? this.gridView, readCondition: readCondition ?? this.readCondition, privilegeLevelRequired: privilegeLevelRequired ?? this.privilegeLevelRequired, packageCondition: packageCondition ?? this.packageCondition, );
  }

  @override
  int get hashCode => documentID.hashCode ^ appId.hashCode ^ title.hashCode ^ bodyComponents.hashCode ^ background.hashCode ^ layout.hashCode ^ gridView.hashCode ^ readCondition.hashCode ^ privilegeLevelRequired.hashCode ^ packageCondition.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is DialogModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          appId == other.appId &&
          title == other.title &&
          ListEquality().equals(bodyComponents, other.bodyComponents) &&
          background == other.background &&
          layout == other.layout &&
          gridView == other.gridView &&
          readCondition == other.readCondition &&
          privilegeLevelRequired == other.privilegeLevelRequired &&
          packageCondition == other.packageCondition;

  @override
  String toString() {
    String bodyComponentsCsv = (bodyComponents == null) ? '' : bodyComponents.join(', ');

    return 'DialogModel{documentID: $documentID, appId: $appId, title: $title, bodyComponents: BodyComponent[] { $bodyComponentsCsv }, background: $background, layout: $layout, gridView: $gridView, readCondition: $readCondition, privilegeLevelRequired: $privilegeLevelRequired, packageCondition: $packageCondition}';
  }

  DialogEntity toEntity({String appId}) {
    return DialogEntity(
          appId: (appId != null) ? appId : null, 
          title: (title != null) ? title : null, 
          bodyComponents: (bodyComponents != null) ? bodyComponents
            .map((item) => item.toEntity(appId: appId))
            .toList() : null, 
          background: (background != null) ? background.toEntity(appId: appId) : null, 
          layout: (layout != null) ? layout.index : null, 
          gridViewId: (gridView != null) ? gridView.documentID : null, 
          readCondition: readCondition,           privilegeLevelRequired: (privilegeLevelRequired != null) ? privilegeLevelRequired : null, 
          packageCondition: (packageCondition != null) ? packageCondition : null, 
    );
  }

  static DialogModel fromEntity(String documentID, DialogEntity entity) {
    if (entity == null) return null;
    return DialogModel(
          documentID: documentID, 
          appId: entity.appId, 
          title: entity.title, 
          bodyComponents: 
            entity. bodyComponents
            .map((item) => BodyComponentModel.fromEntity(newRandomKey(), item))
            .toList(), 
          background: 
            RgbModel.fromEntity(entity.background), 
          layout: toDialogLayout(entity.layout), 
          readCondition: entity.readCondition, 
          privilegeLevelRequired: entity.privilegeLevelRequired, 
          packageCondition: entity.packageCondition, 
    );
  }

  static Future<DialogModel> fromEntityPlus(String documentID, DialogEntity entity, { String appId}) async {
    if (entity == null) return null;

    GridViewModel gridViewHolder;
    if (entity.gridViewId != null) {
      try {
        await gridViewRepository(appId: appId).get(entity.gridViewId).then((val) {
          gridViewHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    return DialogModel(
          documentID: documentID, 
          appId: entity.appId, 
          title: entity.title, 
          bodyComponents: 
            new List<BodyComponentModel>.from(await Future.wait(entity. bodyComponents
            .map((item) => BodyComponentModel.fromEntityPlus(newRandomKey(), item, appId: appId))
            .toList())), 
          background: 
            await RgbModel.fromEntityPlus(entity.background, appId: appId), 
          layout: toDialogLayout(entity.layout), 
          gridView: gridViewHolder, 
          readCondition: entity.readCondition, 
          privilegeLevelRequired: entity.privilegeLevelRequired, 
          packageCondition: entity.packageCondition, 
    );
  }

}
