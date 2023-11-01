/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 grid_view_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/core/base/model_base.dart';

import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';


import 'package:eliud_core/model/grid_view_entity.dart';


enum GridViewScrollDirection {
  Horizontal, Vertical, Unknown
}

enum GridViewGridType {
  Count, Extent, Unknown
}

enum MaxCrossAxisExtentType {
  Absolute, Relative, Unknown
}


GridViewScrollDirection toGridViewScrollDirection(int? index) {
  switch (index) {
    case 0: return GridViewScrollDirection.Horizontal;
    case 1: return GridViewScrollDirection.Vertical;
  }
  return GridViewScrollDirection.Unknown;
}

GridViewGridType toGridViewGridType(int? index) {
  switch (index) {
    case 0: return GridViewGridType.Count;
    case 1: return GridViewGridType.Extent;
  }
  return GridViewGridType.Unknown;
}

MaxCrossAxisExtentType toMaxCrossAxisExtentType(int? index) {
  switch (index) {
    case 0: return MaxCrossAxisExtentType.Absolute;
    case 1: return MaxCrossAxisExtentType.Relative;
  }
  return MaxCrossAxisExtentType.Unknown;
}


class GridViewModel implements ModelBase, WithAppId {
  static const String packageName = 'eliud_core';
  static const String id = 'gridViews';

  String documentID;
  String appId;
  String? name;
  GridViewScrollDirection? scrollDirection;
  GridViewGridType? type;

  // Amount of components cross axis
  int? crossAxisCount;

  // Is this absolute amount of pixels or % of full width of the screen
  MaxCrossAxisExtentType? maxCrossAxisExtentType;

  // Absolute Max Cross Axis Extent
  double? absoluteMaxCrossAxisExtent;

  // Relative Max Cross Axis Extent
  double? relativeMaxCrossAxisExtent;
  double? childAspectRatio;
  double? padding;
  double? mainAxisSpacing;
  double? crossAxisSpacing;
  StorageConditionsModel? conditions;

  GridViewModel({required this.documentID, required this.appId, this.name, this.scrollDirection, this.type, this.crossAxisCount, this.maxCrossAxisExtentType, this.absoluteMaxCrossAxisExtent, this.relativeMaxCrossAxisExtent, this.childAspectRatio, this.padding, this.mainAxisSpacing, this.crossAxisSpacing, this.conditions, })  {
  }

  GridViewModel copyWith({String? documentID, String? appId, String? name, GridViewScrollDirection? scrollDirection, GridViewGridType? type, int? crossAxisCount, MaxCrossAxisExtentType? maxCrossAxisExtentType, double? absoluteMaxCrossAxisExtent, double? relativeMaxCrossAxisExtent, double? childAspectRatio, double? padding, double? mainAxisSpacing, double? crossAxisSpacing, StorageConditionsModel? conditions, }) {
    return GridViewModel(documentID: documentID ?? this.documentID, appId: appId ?? this.appId, name: name ?? this.name, scrollDirection: scrollDirection ?? this.scrollDirection, type: type ?? this.type, crossAxisCount: crossAxisCount ?? this.crossAxisCount, maxCrossAxisExtentType: maxCrossAxisExtentType ?? this.maxCrossAxisExtentType, absoluteMaxCrossAxisExtent: absoluteMaxCrossAxisExtent ?? this.absoluteMaxCrossAxisExtent, relativeMaxCrossAxisExtent: relativeMaxCrossAxisExtent ?? this.relativeMaxCrossAxisExtent, childAspectRatio: childAspectRatio ?? this.childAspectRatio, padding: padding ?? this.padding, mainAxisSpacing: mainAxisSpacing ?? this.mainAxisSpacing, crossAxisSpacing: crossAxisSpacing ?? this.crossAxisSpacing, conditions: conditions ?? this.conditions, );
  }

  @override
  int get hashCode => documentID.hashCode ^ appId.hashCode ^ name.hashCode ^ scrollDirection.hashCode ^ type.hashCode ^ crossAxisCount.hashCode ^ maxCrossAxisExtentType.hashCode ^ absoluteMaxCrossAxisExtent.hashCode ^ relativeMaxCrossAxisExtent.hashCode ^ childAspectRatio.hashCode ^ padding.hashCode ^ mainAxisSpacing.hashCode ^ crossAxisSpacing.hashCode ^ conditions.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is GridViewModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          appId == other.appId &&
          name == other.name &&
          scrollDirection == other.scrollDirection &&
          type == other.type &&
          crossAxisCount == other.crossAxisCount &&
          maxCrossAxisExtentType == other.maxCrossAxisExtentType &&
          absoluteMaxCrossAxisExtent == other.absoluteMaxCrossAxisExtent &&
          relativeMaxCrossAxisExtent == other.relativeMaxCrossAxisExtent &&
          childAspectRatio == other.childAspectRatio &&
          padding == other.padding &&
          mainAxisSpacing == other.mainAxisSpacing &&
          crossAxisSpacing == other.crossAxisSpacing &&
          conditions == other.conditions;

  @override
  String toString() {
    return 'GridViewModel{documentID: $documentID, appId: $appId, name: $name, scrollDirection: $scrollDirection, type: $type, crossAxisCount: $crossAxisCount, maxCrossAxisExtentType: $maxCrossAxisExtentType, absoluteMaxCrossAxisExtent: $absoluteMaxCrossAxisExtent, relativeMaxCrossAxisExtent: $relativeMaxCrossAxisExtent, childAspectRatio: $childAspectRatio, padding: $padding, mainAxisSpacing: $mainAxisSpacing, crossAxisSpacing: $crossAxisSpacing, conditions: $conditions}';
  }

  Future<List<ModelReference>> collectReferences({String? appId}) async {
    List<ModelReference> referencesCollector = [];
    if (conditions != null) referencesCollector.addAll(await conditions!.collectReferences(appId: appId));
    return referencesCollector;
  }

  GridViewEntity toEntity({String? appId}) {
    return GridViewEntity(
          appId: (appId != null) ? appId : null, 
          name: (name != null) ? name : null, 
          scrollDirection: (scrollDirection != null) ? scrollDirection!.index : null, 
          type: (type != null) ? type!.index : null, 
          crossAxisCount: (crossAxisCount != null) ? crossAxisCount : null, 
          maxCrossAxisExtentType: (maxCrossAxisExtentType != null) ? maxCrossAxisExtentType!.index : null, 
          absoluteMaxCrossAxisExtent: (absoluteMaxCrossAxisExtent != null) ? absoluteMaxCrossAxisExtent : null, 
          relativeMaxCrossAxisExtent: (relativeMaxCrossAxisExtent != null) ? relativeMaxCrossAxisExtent : null, 
          childAspectRatio: (childAspectRatio != null) ? childAspectRatio : null, 
          padding: (padding != null) ? padding : null, 
          mainAxisSpacing: (mainAxisSpacing != null) ? mainAxisSpacing : null, 
          crossAxisSpacing: (crossAxisSpacing != null) ? crossAxisSpacing : null, 
          conditions: (conditions != null) ? conditions!.toEntity(appId: appId) : null, 
    );
  }

  static Future<GridViewModel?> fromEntity(String documentID, GridViewEntity? entity) async {
    if (entity == null) return null;
    var counter = 0;
    return GridViewModel(
          documentID: documentID, 
          appId: entity.appId ?? '', 
          name: entity.name, 
          scrollDirection: toGridViewScrollDirection(entity.scrollDirection), 
          type: toGridViewGridType(entity.type), 
          crossAxisCount: entity.crossAxisCount, 
          maxCrossAxisExtentType: toMaxCrossAxisExtentType(entity.maxCrossAxisExtentType), 
          absoluteMaxCrossAxisExtent: entity.absoluteMaxCrossAxisExtent, 
          relativeMaxCrossAxisExtent: entity.relativeMaxCrossAxisExtent, 
          childAspectRatio: entity.childAspectRatio, 
          padding: entity.padding, 
          mainAxisSpacing: entity.mainAxisSpacing, 
          crossAxisSpacing: entity.crossAxisSpacing, 
          conditions: 
            await StorageConditionsModel.fromEntity(entity.conditions), 
    );
  }

  static Future<GridViewModel?> fromEntityPlus(String documentID, GridViewEntity? entity, { String? appId}) async {
    if (entity == null) return null;

    var counter = 0;
    return GridViewModel(
          documentID: documentID, 
          appId: entity.appId ?? '', 
          name: entity.name, 
          scrollDirection: toGridViewScrollDirection(entity.scrollDirection), 
          type: toGridViewGridType(entity.type), 
          crossAxisCount: entity.crossAxisCount, 
          maxCrossAxisExtentType: toMaxCrossAxisExtentType(entity.maxCrossAxisExtentType), 
          absoluteMaxCrossAxisExtent: entity.absoluteMaxCrossAxisExtent, 
          relativeMaxCrossAxisExtent: entity.relativeMaxCrossAxisExtent, 
          childAspectRatio: entity.childAspectRatio, 
          padding: entity.padding, 
          mainAxisSpacing: entity.mainAxisSpacing, 
          crossAxisSpacing: entity.crossAxisSpacing, 
          conditions: 
            await StorageConditionsModel.fromEntityPlus(entity.conditions, appId: appId), 
    );
  }

}

