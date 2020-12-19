/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 image_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/core/global_data.dart';
import 'package:eliud_core/tools/common_tools.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_core/model/entity_export.dart';


import 'package:eliud_core/model/image_entity.dart';

import 'package:eliud_core/tools/random.dart';

enum SourceImage {
  Upload, SpecifyURL, YourProfilePhoto, Unknown
}


SourceImage toSourceImage(int index) {
  switch (index) {
    case 0: return SourceImage.Upload;
    case 1: return SourceImage.SpecifyURL;
    case 2: return SourceImage.YourProfilePhoto;
  }
  return SourceImage.Unknown;
}


class ImageModel {
  String documentID;
  String appId;
  String name;

  // Where do you want to retrieve your image from. Upload can come with GCP charge. Consider a photo hosting service, e.g. flickr or alternative (https://beebom.com/flickr-alternatives/)
  SourceImage source;
  String imageURLOriginal;
  String imageURLThumbnail;

  ImageModel({this.documentID, this.appId, this.name, this.source, this.imageURLOriginal, this.imageURLThumbnail, })  {
    assert(documentID != null);
  }

  ImageModel copyWith({String documentID, String appId, String name, SourceImage source, String imageURLOriginal, String imageURLThumbnail, }) {
    return ImageModel(documentID: documentID ?? this.documentID, appId: appId ?? this.appId, name: name ?? this.name, source: source ?? this.source, imageURLOriginal: imageURLOriginal ?? this.imageURLOriginal, imageURLThumbnail: imageURLThumbnail ?? this.imageURLThumbnail, );
  }

  @override
  int get hashCode => documentID.hashCode ^ appId.hashCode ^ name.hashCode ^ source.hashCode ^ imageURLOriginal.hashCode ^ imageURLThumbnail.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is ImageModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          appId == other.appId &&
          name == other.name &&
          source == other.source &&
          imageURLOriginal == other.imageURLOriginal &&
          imageURLThumbnail == other.imageURLThumbnail;

  @override
  String toString() {
    return 'ImageModel{documentID: $documentID, appId: $appId, name: $name, source: $source, imageURLOriginal: $imageURLOriginal, imageURLThumbnail: $imageURLThumbnail}';
  }

  ImageEntity toEntity({String appId}) {
    return ImageEntity(
          appId: (appId != null) ? appId : null, 
          name: (name != null) ? name : null, 
          source: (source != null) ? source.index : null, 
          imageURLOriginal: (imageURLOriginal != null) ? imageURLOriginal : null, 
          imageURLThumbnail: (imageURLThumbnail != null) ? imageURLThumbnail : null, 
    );
  }

  static ImageModel fromEntity(String documentID, ImageEntity entity) {
    if (entity == null) return null;
    return ImageModel(
          documentID: documentID, 
          appId: entity.appId, 
          name: entity.name, 
          source: toSourceImage(entity.source), 
          imageURLOriginal: entity.imageURLOriginal, 
          imageURLThumbnail: entity.imageURLThumbnail, 
    );
  }

  static Future<ImageModel> fromEntityPlus(String documentID, ImageEntity entity, { String appId}) async {
    if (entity == null) return null;

    return ImageModel(
          documentID: documentID, 
          appId: entity.appId, 
          name: entity.name, 
          source: toSourceImage(entity.source), 
          imageURLOriginal: entity.imageURLOriginal, 
          imageURLThumbnail: entity.imageURLThumbnail, 
    );
  }

}

