/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 pos_size_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'package:eliud_core/tools/common_tools.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_core/model/entity_export.dart';

class PosSizeEntity {
  final String appId;
  final String name;
  final double widthPortrait;
  final int widthTypePortrait;
  final double widthLandscape;
  final int widthTypeLandscape;
  final double heightPortrait;
  final int heightTypePortrait;
  final double heightLandscape;
  final int heightTypeLandscape;
  final int fitPortrait;
  final int fitLandscape;
  final int alignTypePortrait;
  final int alignTypeLandscape;
  final int clip;

  PosSizeEntity({this.appId, this.name, this.widthPortrait, this.widthTypePortrait, this.widthLandscape, this.widthTypeLandscape, this.heightPortrait, this.heightTypePortrait, this.heightLandscape, this.heightTypeLandscape, this.fitPortrait, this.fitLandscape, this.alignTypePortrait, this.alignTypeLandscape, this.clip, });


  List<Object> get props => [appId, name, widthPortrait, widthTypePortrait, widthLandscape, widthTypeLandscape, heightPortrait, heightTypePortrait, heightLandscape, heightTypeLandscape, fitPortrait, fitLandscape, alignTypePortrait, alignTypeLandscape, clip, ];

  @override
  String toString() {
    return 'PosSizeEntity{appId: $appId, name: $name, widthPortrait: $widthPortrait, widthTypePortrait: $widthTypePortrait, widthLandscape: $widthLandscape, widthTypeLandscape: $widthTypeLandscape, heightPortrait: $heightPortrait, heightTypePortrait: $heightTypePortrait, heightLandscape: $heightLandscape, heightTypeLandscape: $heightTypeLandscape, fitPortrait: $fitPortrait, fitLandscape: $fitLandscape, alignTypePortrait: $alignTypePortrait, alignTypeLandscape: $alignTypeLandscape, clip: $clip}';
  }

  static PosSizeEntity fromMap(Map map) {
    if (map == null) return null;

    return PosSizeEntity(
      appId: map['appId'], 
      name: map['name'], 
      widthPortrait: double.tryParse(map['widthPortrait'].toString()), 
      widthTypePortrait: map['widthTypePortrait'], 
      widthLandscape: double.tryParse(map['widthLandscape'].toString()), 
      widthTypeLandscape: map['widthTypeLandscape'], 
      heightPortrait: double.tryParse(map['heightPortrait'].toString()), 
      heightTypePortrait: map['heightTypePortrait'], 
      heightLandscape: double.tryParse(map['heightLandscape'].toString()), 
      heightTypeLandscape: map['heightTypeLandscape'], 
      fitPortrait: map['fitPortrait'], 
      fitLandscape: map['fitLandscape'], 
      alignTypePortrait: map['alignTypePortrait'], 
      alignTypeLandscape: map['alignTypeLandscape'], 
      clip: map['clip'], 
    );
  }

  Map<String, Object> toDocument() {
    Map<String, Object> theDocument = HashMap();
    if (appId != null) theDocument["appId"] = appId;
      else theDocument["appId"] = null;
    if (name != null) theDocument["name"] = name;
      else theDocument["name"] = null;
    if (widthPortrait != null) theDocument["widthPortrait"] = widthPortrait;
      else theDocument["widthPortrait"] = null;
    if (widthTypePortrait != null) theDocument["widthTypePortrait"] = widthTypePortrait;
      else theDocument["widthTypePortrait"] = null;
    if (widthLandscape != null) theDocument["widthLandscape"] = widthLandscape;
      else theDocument["widthLandscape"] = null;
    if (widthTypeLandscape != null) theDocument["widthTypeLandscape"] = widthTypeLandscape;
      else theDocument["widthTypeLandscape"] = null;
    if (heightPortrait != null) theDocument["heightPortrait"] = heightPortrait;
      else theDocument["heightPortrait"] = null;
    if (heightTypePortrait != null) theDocument["heightTypePortrait"] = heightTypePortrait;
      else theDocument["heightTypePortrait"] = null;
    if (heightLandscape != null) theDocument["heightLandscape"] = heightLandscape;
      else theDocument["heightLandscape"] = null;
    if (heightTypeLandscape != null) theDocument["heightTypeLandscape"] = heightTypeLandscape;
      else theDocument["heightTypeLandscape"] = null;
    if (fitPortrait != null) theDocument["fitPortrait"] = fitPortrait;
      else theDocument["fitPortrait"] = null;
    if (fitLandscape != null) theDocument["fitLandscape"] = fitLandscape;
      else theDocument["fitLandscape"] = null;
    if (alignTypePortrait != null) theDocument["alignTypePortrait"] = alignTypePortrait;
      else theDocument["alignTypePortrait"] = null;
    if (alignTypeLandscape != null) theDocument["alignTypeLandscape"] = alignTypeLandscape;
      else theDocument["alignTypeLandscape"] = null;
    if (clip != null) theDocument["clip"] = clip;
      else theDocument["clip"] = null;
    return theDocument;
  }

  static PosSizeEntity fromJsonString(String json) {
    Map<String, dynamic> generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

}

