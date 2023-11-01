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
import 'package:eliud_core/tools/random.dart';
import 'package:eliud_core/core/base/entity_base.dart';
import 'package:eliud_core/model/entity_export.dart';

class BackgroundEntity implements EntityBase {
  final String? backgroundImageId;
  final bool? useProfilePhotoAsBackground;
  final int? beginGradientPosition;
  final int? endGradientPosition;
  final ShadowEntity? shadow;
  final List<DecorationColorEntity>? decorationColors;
  final BorderRadiusEntity? borderRadius;
  final bool? border;
  final EdgeInsetsGeometryEntity? padding;
  final EdgeInsetsGeometryEntity? margin;

  BackgroundEntity({this.backgroundImageId, this.useProfilePhotoAsBackground, this.beginGradientPosition, this.endGradientPosition, this.shadow, this.decorationColors, this.borderRadius, this.border, this.padding, this.margin, });

  BackgroundEntity copyWith({String? backgroundImageId, bool? useProfilePhotoAsBackground, int? beginGradientPosition, int? endGradientPosition, ShadowEntity? shadow, List<DecorationColorEntity>? decorationColors, BorderRadiusEntity? borderRadius, bool? border, EdgeInsetsGeometryEntity? padding, EdgeInsetsGeometryEntity? margin, }) {
    return BackgroundEntity(backgroundImageId : backgroundImageId ?? this.backgroundImageId, useProfilePhotoAsBackground : useProfilePhotoAsBackground ?? this.useProfilePhotoAsBackground, beginGradientPosition : beginGradientPosition ?? this.beginGradientPosition, endGradientPosition : endGradientPosition ?? this.endGradientPosition, shadow : shadow ?? this.shadow, decorationColors : decorationColors ?? this.decorationColors, borderRadius : borderRadius ?? this.borderRadius, border : border ?? this.border, padding : padding ?? this.padding, margin : margin ?? this.margin, );
  }
  List<Object?> get props => [backgroundImageId, useProfilePhotoAsBackground, beginGradientPosition, endGradientPosition, shadow, decorationColors, borderRadius, border, padding, margin, ];

  @override
  String toString() {
    String decorationColorsCsv = (decorationColors == null) ? '' : decorationColors!.join(', ');

    return 'BackgroundEntity{backgroundImageId: $backgroundImageId, useProfilePhotoAsBackground: $useProfilePhotoAsBackground, beginGradientPosition: $beginGradientPosition, endGradientPosition: $endGradientPosition, shadow: $shadow, decorationColors: DecorationColor[] { $decorationColorsCsv }, borderRadius: $borderRadius, border: $border, padding: $padding, margin: $margin}';
  }

  static BackgroundEntity? fromMap(Object? o, {Map<String, String>? newDocumentIds}) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    var backgroundImageIdNewDocmentId = map['backgroundImageId'];
    if ((newDocumentIds != null) && (backgroundImageIdNewDocmentId != null)) {
      var backgroundImageIdOldDocmentId = backgroundImageIdNewDocmentId;
      backgroundImageIdNewDocmentId = newRandomKey();
      newDocumentIds[backgroundImageIdOldDocmentId] = backgroundImageIdNewDocmentId;
    }
    var shadowFromMap;
    shadowFromMap = map['shadow'];
    if (shadowFromMap != null)
      shadowFromMap = ShadowEntity.fromMap(shadowFromMap, newDocumentIds: newDocumentIds);
    var decorationColorsFromMap;
    decorationColorsFromMap = map['decorationColors'];
    List<DecorationColorEntity> decorationColorsList;
    if (decorationColorsFromMap != null) {
      decorationColorsList = (map['decorationColors'] as List<dynamic>)
        .map((dynamic item) =>
        DecorationColorEntity.fromMap(item as Map, newDocumentIds: newDocumentIds)!)
        .toList();
    } else {
      decorationColorsList = [];
    }
    var borderRadiusFromMap;
    borderRadiusFromMap = map['borderRadius'];
    if (borderRadiusFromMap != null)
      borderRadiusFromMap = BorderRadiusEntity.fromMap(borderRadiusFromMap, newDocumentIds: newDocumentIds);
    var paddingFromMap;
    paddingFromMap = map['padding'];
    if (paddingFromMap != null)
      paddingFromMap = EdgeInsetsGeometryEntity.fromMap(paddingFromMap, newDocumentIds: newDocumentIds);
    var marginFromMap;
    marginFromMap = map['margin'];
    if (marginFromMap != null)
      marginFromMap = EdgeInsetsGeometryEntity.fromMap(marginFromMap, newDocumentIds: newDocumentIds);

    return BackgroundEntity(
      backgroundImageId: backgroundImageIdNewDocmentId, 
      useProfilePhotoAsBackground: map['useProfilePhotoAsBackground'], 
      beginGradientPosition: map['beginGradientPosition'], 
      endGradientPosition: map['endGradientPosition'], 
      shadow: shadowFromMap, 
      decorationColors: decorationColorsList, 
      borderRadius: borderRadiusFromMap, 
      border: map['border'], 
      padding: paddingFromMap, 
      margin: marginFromMap, 
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
    final Map<String, dynamic>? paddingMap = padding != null 
        ? padding!.toDocument()
        : null;
    final Map<String, dynamic>? marginMap = margin != null 
        ? margin!.toDocument()
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
    if (padding != null) theDocument["padding"] = paddingMap;
      else theDocument["padding"] = null;
    if (margin != null) theDocument["margin"] = marginMap;
      else theDocument["margin"] = null;
    return theDocument;
  }

  @override
  BackgroundEntity switchAppId({required String newAppId}) {
    var newEntity = copyWith();
    return newEntity;
  }

  static BackgroundEntity? fromJsonString(String json, {Map<String, String>? newDocumentIds}) {
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

