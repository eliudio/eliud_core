/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 grid_view_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'package:eliud_core/core/base/entity_base.dart';
import 'package:eliud_core/model/entity_export.dart';

class GridViewEntity implements EntityBase {
  final String? appId;
  final String? name;
  final int? scrollDirection;
  final int? type;
  final int? crossAxisCount;
  final int? maxCrossAxisExtentType;
  final double? absoluteMaxCrossAxisExtent;
  final double? relativeMaxCrossAxisExtent;
  final double? childAspectRatio;
  final double? padding;
  final double? mainAxisSpacing;
  final double? crossAxisSpacing;
  final StorageConditionsEntity? conditions;

  GridViewEntity({required this.appId, this.name, this.scrollDirection, this.type, this.crossAxisCount, this.maxCrossAxisExtentType, this.absoluteMaxCrossAxisExtent, this.relativeMaxCrossAxisExtent, this.childAspectRatio, this.padding, this.mainAxisSpacing, this.crossAxisSpacing, this.conditions, });

  GridViewEntity copyWith({String? documentID, String? appId, String? name, int? scrollDirection, int? type, int? crossAxisCount, int? maxCrossAxisExtentType, double? absoluteMaxCrossAxisExtent, double? relativeMaxCrossAxisExtent, double? childAspectRatio, double? padding, double? mainAxisSpacing, double? crossAxisSpacing, StorageConditionsEntity? conditions, }) {
    return GridViewEntity(appId : appId ?? this.appId, name : name ?? this.name, scrollDirection : scrollDirection ?? this.scrollDirection, type : type ?? this.type, crossAxisCount : crossAxisCount ?? this.crossAxisCount, maxCrossAxisExtentType : maxCrossAxisExtentType ?? this.maxCrossAxisExtentType, absoluteMaxCrossAxisExtent : absoluteMaxCrossAxisExtent ?? this.absoluteMaxCrossAxisExtent, relativeMaxCrossAxisExtent : relativeMaxCrossAxisExtent ?? this.relativeMaxCrossAxisExtent, childAspectRatio : childAspectRatio ?? this.childAspectRatio, padding : padding ?? this.padding, mainAxisSpacing : mainAxisSpacing ?? this.mainAxisSpacing, crossAxisSpacing : crossAxisSpacing ?? this.crossAxisSpacing, conditions : conditions ?? this.conditions, );
  }
  List<Object?> get props => [appId, name, scrollDirection, type, crossAxisCount, maxCrossAxisExtentType, absoluteMaxCrossAxisExtent, relativeMaxCrossAxisExtent, childAspectRatio, padding, mainAxisSpacing, crossAxisSpacing, conditions, ];

  @override
  String toString() {
    return 'GridViewEntity{appId: $appId, name: $name, scrollDirection: $scrollDirection, type: $type, crossAxisCount: $crossAxisCount, maxCrossAxisExtentType: $maxCrossAxisExtentType, absoluteMaxCrossAxisExtent: $absoluteMaxCrossAxisExtent, relativeMaxCrossAxisExtent: $relativeMaxCrossAxisExtent, childAspectRatio: $childAspectRatio, padding: $padding, mainAxisSpacing: $mainAxisSpacing, crossAxisSpacing: $crossAxisSpacing, conditions: $conditions}';
  }

  static GridViewEntity? fromMap(Object? o, {Map<String, String>? newDocumentIds}) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    var conditionsFromMap;
    conditionsFromMap = map['conditions'];
    if (conditionsFromMap != null)
      conditionsFromMap = StorageConditionsEntity.fromMap(conditionsFromMap, newDocumentIds: newDocumentIds);

    return GridViewEntity(
      appId: map['appId'], 
      name: map['name'], 
      scrollDirection: map['scrollDirection'], 
      type: map['type'], 
      crossAxisCount: int.tryParse(map['crossAxisCount'].toString()), 
      maxCrossAxisExtentType: map['maxCrossAxisExtentType'], 
      absoluteMaxCrossAxisExtent: double.tryParse(map['absoluteMaxCrossAxisExtent'].toString()), 
      relativeMaxCrossAxisExtent: double.tryParse(map['relativeMaxCrossAxisExtent'].toString()), 
      childAspectRatio: double.tryParse(map['childAspectRatio'].toString()), 
      padding: double.tryParse(map['padding'].toString()), 
      mainAxisSpacing: double.tryParse(map['mainAxisSpacing'].toString()), 
      crossAxisSpacing: double.tryParse(map['crossAxisSpacing'].toString()), 
      conditions: conditionsFromMap, 
    );
  }

  Map<String, Object?> toDocument() {
    final Map<String, dynamic>? conditionsMap = conditions != null 
        ? conditions!.toDocument()
        : null;

    Map<String, Object?> theDocument = HashMap();
    if (appId != null) theDocument["appId"] = appId;
      else theDocument["appId"] = null;
    if (name != null) theDocument["name"] = name;
      else theDocument["name"] = null;
    if (scrollDirection != null) theDocument["scrollDirection"] = scrollDirection;
      else theDocument["scrollDirection"] = null;
    if (type != null) theDocument["type"] = type;
      else theDocument["type"] = null;
    if (crossAxisCount != null) theDocument["crossAxisCount"] = crossAxisCount;
      else theDocument["crossAxisCount"] = null;
    if (maxCrossAxisExtentType != null) theDocument["maxCrossAxisExtentType"] = maxCrossAxisExtentType;
      else theDocument["maxCrossAxisExtentType"] = null;
    if (absoluteMaxCrossAxisExtent != null) theDocument["absoluteMaxCrossAxisExtent"] = absoluteMaxCrossAxisExtent;
      else theDocument["absoluteMaxCrossAxisExtent"] = null;
    if (relativeMaxCrossAxisExtent != null) theDocument["relativeMaxCrossAxisExtent"] = relativeMaxCrossAxisExtent;
      else theDocument["relativeMaxCrossAxisExtent"] = null;
    if (childAspectRatio != null) theDocument["childAspectRatio"] = childAspectRatio;
      else theDocument["childAspectRatio"] = null;
    if (padding != null) theDocument["padding"] = padding;
      else theDocument["padding"] = null;
    if (mainAxisSpacing != null) theDocument["mainAxisSpacing"] = mainAxisSpacing;
      else theDocument["mainAxisSpacing"] = null;
    if (crossAxisSpacing != null) theDocument["crossAxisSpacing"] = crossAxisSpacing;
      else theDocument["crossAxisSpacing"] = null;
    if (conditions != null) theDocument["conditions"] = conditionsMap;
      else theDocument["conditions"] = null;
    return theDocument;
  }

  @override
  GridViewEntity switchAppId({required String newAppId}) {
    var newEntity = copyWith(appId: newAppId);
    return newEntity;
  }

  static GridViewEntity? fromJsonString(String json, {Map<String, String>? newDocumentIds}) {
    Map<String, dynamic>? generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap, newDocumentIds: newDocumentIds);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

  Future<Map<String, Object?>> enrichedDocument(Map<String, Object?> theDocument) async {
    return theDocument;
  }

}

