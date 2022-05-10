/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 background_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'abstract_repository_singleton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_core/model/entity_export.dart';

import 'package:eliud_core/tools/common_tools.dart';
class BackgroundEntity {
  final String? backgroundImageId;
  final bool? useProfilePhotoAsBackground;
  final int? beginGradientPosition;
  final int? endGradientPosition;
  final ShadowEntity? shadow;
  final List<DecorationColorEntity>? decorationColors;
  final BorderRadiusEntity? borderRadius;
  final bool? border;

  BackgroundEntity({this.backgroundImageId, this.useProfilePhotoAsBackground, this.beginGradientPosition, this.endGradientPosition, this.shadow, this.decorationColors, this.borderRadius, this.border, });


  List<Object?> get props => [backgroundImageId, useProfilePhotoAsBackground, beginGradientPosition, endGradientPosition, shadow, decorationColors, borderRadius, border, ];

  @override
  String toString() {
    String decorationColorsCsv = (decorationColors == null) ? '' : decorationColors!.join(', ');

    return 'BackgroundEntity{backgroundImageId: $backgroundImageId, useProfilePhotoAsBackground: $useProfilePhotoAsBackground, beginGradientPosition: $beginGradientPosition, endGradientPosition: $endGradientPosition, shadow: $shadow, decorationColors: DecorationColor[] { $decorationColorsCsv }, borderRadius: $borderRadius, border: $border}';
  }

  static BackgroundEntity? fromMap(Object? o) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    var shadowFromMap;
    shadowFromMap = map['shadow'];
    if (shadowFromMap != null)
      shadowFromMap = ShadowEntity.fromMap(shadowFromMap);
    var decorationColorsFromMap;
    decorationColorsFromMap = map['decorationColors'];
    var decorationColorsList;
    if (decorationColorsFromMap != null)
      decorationColorsList = (map['decorationColors'] as List<dynamic>)
        .map((dynamic item) =>
        DecorationColorEntity.fromMap(item as Map)!)
        .toList();
    var borderRadiusFromMap;
    borderRadiusFromMap = map['borderRadius'];
    if (borderRadiusFromMap != null)
      borderRadiusFromMap = BorderRadiusEntity.fromMap(borderRadiusFromMap);

    return BackgroundEntity(
      backgroundImageId: map['backgroundImageId'], 
      useProfilePhotoAsBackground: map['useProfilePhotoAsBackground'], 
      beginGradientPosition: map['beginGradientPosition'], 
      endGradientPosition: map['endGradientPosition'], 
      shadow: shadowFromMap, 
      decorationColors: decorationColorsList, 
      borderRadius: borderRadiusFromMap, 
      border: map['border'], 
    );
  }

  Map<String, Object?> toDocument() {
    final Map<String, dynamic>? shadowMap = shadow != null 
        ? shadow!.toDocument()
        : null;
    final List<Map<String?, dynamic>>? decorationColorsListMap = decorationColors != null 
        ? decorationColors!.map((item) => item.toDocument()).toList()
        : null;
    final Map<String, dynamic>? borderRadiusMap = borderRadius != null 
        ? borderRadius!.toDocument()
        : null;

    Map<String, Object?> theDocument = HashMap();
    if (backgroundImageId != null) theDocument["backgroundImageId"] = backgroundImageId;
      else theDocument["backgroundImageId"] = null;
    if (useProfilePhotoAsBackground != null) theDocument["useProfilePhotoAsBackground"] = useProfilePhotoAsBackground;
      else theDocument["useProfilePhotoAsBackground"] = null;
    if (beginGradientPosition != null) theDocument["beginGradientPosition"] = beginGradientPosition;
      else theDocument["beginGradientPosition"] = null;
    if (endGradientPosition != null) theDocument["endGradientPosition"] = endGradientPosition;
      else theDocument["endGradientPosition"] = null;
    if (shadow != null) theDocument["shadow"] = shadowMap;
      else theDocument["shadow"] = null;
    if (decorationColors != null) theDocument["decorationColors"] = decorationColorsListMap;
      else theDocument["decorationColors"] = null;
    if (borderRadius != null) theDocument["borderRadius"] = borderRadiusMap;
      else theDocument["borderRadius"] = null;
    if (border != null) theDocument["border"] = border;
      else theDocument["border"] = null;
    return theDocument;
  }

  static BackgroundEntity? fromJsonString(String json) {
    Map<String, dynamic>? generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

}

