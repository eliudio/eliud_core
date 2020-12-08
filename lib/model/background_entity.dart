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
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_core/model/entity_export.dart';

class BackgroundEntity {
  final String appId;
  final String comments;
  final String backgroundImageId;
  final int beginGradientPosition;
  final int endGradientPosition;
  final String shadowId;
  final List<DecorationColorEntity> decorationColors;
  final bool border;
  final bool admin;

  BackgroundEntity({this.appId, this.comments, this.backgroundImageId, this.beginGradientPosition, this.endGradientPosition, this.shadowId, this.decorationColors, this.border, this.admin, });


  List<Object> get props => [appId, comments, backgroundImageId, beginGradientPosition, endGradientPosition, shadowId, decorationColors, border, admin, ];

  @override
  String toString() {
    String decorationColorsCsv = (decorationColors == null) ? '' : decorationColors.join(', ');

    return 'BackgroundEntity{appId: $appId, comments: $comments, backgroundImageId: $backgroundImageId, beginGradientPosition: $beginGradientPosition, endGradientPosition: $endGradientPosition, shadowId: $shadowId, decorationColors: DecorationColor[] { $decorationColorsCsv }, border: $border, admin: $admin}';
  }

  static BackgroundEntity fromMap(Map map) {
    if (map == null) return null;

    final decorationColorsList = (map['decorationColors'] as List<dynamic>)
        .map((dynamic item) =>
        DecorationColorEntity.fromMap(item as Map))
        .toList();

    return BackgroundEntity(
      appId: map['appId'], 
      comments: map['comments'], 
      backgroundImageId: map['backgroundImageId'], 
      beginGradientPosition: map['beginGradientPosition'], 
      endGradientPosition: map['endGradientPosition'], 
      shadowId: map['shadowId'], 
      decorationColors: decorationColorsList, 
      border: map['border'], 
      admin: map['admin'], 
    );
  }

  Map<String, Object> toDocument() {
    final List<Map<String, dynamic>> decorationColorsListMap = decorationColors != null 
        ? decorationColors.map((item) => item.toDocument()).toList()
        : null;

    Map<String, Object> theDocument = HashMap();
    if (appId != null) theDocument["appId"] = appId;
      else theDocument["appId"] = null;
    if (comments != null) theDocument["comments"] = comments;
      else theDocument["comments"] = null;
    if (backgroundImageId != null) theDocument["backgroundImageId"] = backgroundImageId;
      else theDocument["backgroundImageId"] = null;
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
    if (admin != null) theDocument["admin"] = admin;
      else theDocument["admin"] = null;
    return theDocument;
  }

  static BackgroundEntity fromJsonString(String json) {
    Map<String, dynamic> generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

}

