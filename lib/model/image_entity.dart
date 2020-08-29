/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 image_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'entity_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_core/model/entity_export.dart';
class ImageEntity {
  final String appId;
  final String name;
  final int source;
  final String imageURLOriginal;
  final String imageURLThumbnail;

  ImageEntity({this.appId, this.name, this.source, this.imageURLOriginal, this.imageURLThumbnail, });

  List<Object> get props => [appId, name, source, imageURLOriginal, imageURLThumbnail, ];

  @override
  String toString() {
    return 'ImageEntity{appId: $appId, name: $name, source: $source, imageURLOriginal: $imageURLOriginal, imageURLThumbnail: $imageURLThumbnail}';
  }

  static ImageEntity fromMap(Map map) {
    if (map == null) return null;

    return ImageEntity(
      appId: map['appId'], 
      name: map['name'], 
      source: map['source'], 
      imageURLOriginal: map['imageURLOriginal'], 
      imageURLThumbnail: map['imageURLThumbnail'], 
    );
  }

  Map<String, Object> toDocument() {
    Map<String, Object> theDocument = HashMap();
    if (appId != null) theDocument["appId"] = appId;
      else theDocument["appId"] = null;
    if (name != null) theDocument["name"] = name;
      else theDocument["name"] = null;
    if (source != null) theDocument["source"] = source;
      else theDocument["source"] = null;
    if (imageURLOriginal != null) theDocument["imageURLOriginal"] = imageURLOriginal;
      else theDocument["imageURLOriginal"] = null;
    if (imageURLThumbnail != null) theDocument["imageURLThumbnail"] = imageURLThumbnail;
      else theDocument["imageURLThumbnail"] = null;
    return theDocument;
  }

  static ImageEntity fromJsonString(String json) {
    Map<String, dynamic> generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

}

