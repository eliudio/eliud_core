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
  final String? comments;
  final String? backgroundImageURL;
  final bool? useProfilePhotoAsBackground;
  final int? beginGradientPosition;
  final int? endGradientPosition;
  final String? shadowId;
  final List<DecorationColorEntity>? decorationColors;
  final bool? border;

  BackgroundEntity({this.comments, this.backgroundImageURL, this.useProfilePhotoAsBackground, this.beginGradientPosition, this.endGradientPosition, this.shadowId, this.decorationColors, this.border, });


  List<Object?> get props => [comments, backgroundImageURL, useProfilePhotoAsBackground, beginGradientPosition, endGradientPosition, shadowId, decorationColors, border, ];

  @override
  String toString() {
    String decorationColorsCsv = (decorationColors == null) ? '' : decorationColors!.join(', ');

    return 'BackgroundEntity{comments: $comments, backgroundImageURL: $backgroundImageURL, useProfilePhotoAsBackground: $useProfilePhotoAsBackground, beginGradientPosition: $beginGradientPosition, endGradientPosition: $endGradientPosition, shadowId: $shadowId, decorationColors: DecorationColor[] { $decorationColorsCsv }, border: $border}';
  }

  static BackgroundEntity? fromMap(Object? o) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    var decorationColorsFromMap;
    decorationColorsFromMap = map['decorationColors'];
    var decorationColorsList;
    if (decorationColorsFromMap != null)
      decorationColorsList = (map['decorationColors'] as List<dynamic>)
        .map((dynamic item) =>
        DecorationColorEntity.fromMap(item as Map)!)
        .toList();

    return BackgroundEntity(
      comments: map['comments'], 
      backgroundImageURL: map['backgroundImageURL'], 
      useProfilePhotoAsBackground: map['useProfilePhotoAsBackground'], 
      beginGradientPosition: map['beginGradientPosition'], 
      endGradientPosition: map['endGradientPosition'], 
      shadowId: map['shadowId'], 
      decorationColors: decorationColorsList, 
      border: map['border'], 
    );
  }

  Map<String, Object?> toDocument() {
    final List<Map<String?, dynamic>>? decorationColorsListMap = decorationColors != null 
        ? decorationColors!.map((item) => item.toDocument()).toList()
        : null;

    Map<String, Object?> theDocument = HashMap();
    if (comments != null) theDocument["comments"] = comments;
      else theDocument["comments"] = null;
    if (backgroundImageURL != null) theDocument["backgroundImageURL"] = backgroundImageURL;
      else theDocument["backgroundImageURL"] = null;
    if (useProfilePhotoAsBackground != null) theDocument["useProfilePhotoAsBackground"] = useProfilePhotoAsBackground;
      else theDocument["useProfilePhotoAsBackground"] = null;
    if (beginGradientPosition != null) theDocument["beginGradientPosition"] = beginGradientPosition;
      else theDocument["beginGradientPosition"] = null;
    if (endGradientPosition != null) theDocument["endGradientPosition"] = endGradientPosition;
      else theDocument["endGradientPosition"] = null;
    if (shadowId != null) theDocument["shadowId"] = shadowId;
      else theDocument["shadowId"] = null;
    if (decorationColors != null) theDocument["decorationColors"] = decorationColorsListMap;
      else theDocument["decorationColors"] = null;
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

