/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 public_medium_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
class PublicMediumEntity {
  final String? authorId;
  final String? baseName;
  final String? url;
  final String? ref;
  final String? urlThumbnail;
  final String? refThumbnail;
  final int? mediumType;
  final int? mediumWidth;
  final int? mediumHeight;
  final int? thumbnailWidth;
  final int? thumbnailHeight;
  final String? relatedMediumId;

  PublicMediumEntity({required this.authorId, this.baseName, this.url, this.ref, this.urlThumbnail, this.refThumbnail, this.mediumType, this.mediumWidth, this.mediumHeight, this.thumbnailWidth, this.thumbnailHeight, this.relatedMediumId, });


  List<Object?> get props => [authorId, baseName, url, ref, urlThumbnail, refThumbnail, mediumType, mediumWidth, mediumHeight, thumbnailWidth, thumbnailHeight, relatedMediumId, ];

  @override
  String toString() {
    return 'PublicMediumEntity{authorId: $authorId, baseName: $baseName, url: $url, ref: $ref, urlThumbnail: $urlThumbnail, refThumbnail: $refThumbnail, mediumType: $mediumType, mediumWidth: $mediumWidth, mediumHeight: $mediumHeight, thumbnailWidth: $thumbnailWidth, thumbnailHeight: $thumbnailHeight, relatedMediumId: $relatedMediumId}';
  }

  static PublicMediumEntity? fromMap(Object? o) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    return PublicMediumEntity(
      authorId: map['authorId'], 
      baseName: map['baseName'], 
      url: map['url'], 
      ref: map['ref'], 
      urlThumbnail: map['urlThumbnail'], 
      refThumbnail: map['refThumbnail'], 
      mediumType: map['mediumType'], 
      mediumWidth: int.tryParse(map['mediumWidth'].toString()), 
      mediumHeight: int.tryParse(map['mediumHeight'].toString()), 
      thumbnailWidth: int.tryParse(map['thumbnailWidth'].toString()), 
      thumbnailHeight: int.tryParse(map['thumbnailHeight'].toString()), 
      relatedMediumId: map['relatedMediumId'], 
    );
  }

  Map<String, Object?> toDocument() {
    Map<String, Object?> theDocument = HashMap();
    if (authorId != null) theDocument["authorId"] = authorId;
      else theDocument["authorId"] = null;
    if (baseName != null) theDocument["baseName"] = baseName;
      else theDocument["baseName"] = null;
    if (url != null) theDocument["url"] = url;
      else theDocument["url"] = null;
    if (ref != null) theDocument["ref"] = ref;
      else theDocument["ref"] = null;
    if (urlThumbnail != null) theDocument["urlThumbnail"] = urlThumbnail;
      else theDocument["urlThumbnail"] = null;
    if (refThumbnail != null) theDocument["refThumbnail"] = refThumbnail;
      else theDocument["refThumbnail"] = null;
    if (mediumType != null) theDocument["mediumType"] = mediumType;
      else theDocument["mediumType"] = null;
    if (mediumWidth != null) theDocument["mediumWidth"] = mediumWidth;
      else theDocument["mediumWidth"] = null;
    if (mediumHeight != null) theDocument["mediumHeight"] = mediumHeight;
      else theDocument["mediumHeight"] = null;
    if (thumbnailWidth != null) theDocument["thumbnailWidth"] = thumbnailWidth;
      else theDocument["thumbnailWidth"] = null;
    if (thumbnailHeight != null) theDocument["thumbnailHeight"] = thumbnailHeight;
      else theDocument["thumbnailHeight"] = null;
    if (relatedMediumId != null) theDocument["relatedMediumId"] = relatedMediumId;
      else theDocument["relatedMediumId"] = null;
    return theDocument;
  }

  static PublicMediumEntity? fromJsonString(String json) {
    Map<String, dynamic>? generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

}

