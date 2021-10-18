/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 background_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:collection/collection.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_core/model/entity_export.dart';


import 'package:eliud_core/model/background_entity.dart';

import 'package:eliud_core/tools/random.dart';

enum StartGradientPosition {
  TopLeft, TopCenter, TopRight, CenterLeft, Center, CenterRight, BottomLeft, BottomCenter, BottomRight, Unknown
}

enum EndGradientPosition {
  TopLeft, TopCenter, TopRight, CenterLeft, Center, CenterRight, BottomLeft, BottomCenter, BottomRight, Unknown
}


StartGradientPosition toStartGradientPosition(int? index) {
  switch (index) {
    case 0: return StartGradientPosition.TopLeft;
    case 1: return StartGradientPosition.TopCenter;
    case 2: return StartGradientPosition.TopRight;
    case 3: return StartGradientPosition.CenterLeft;
    case 4: return StartGradientPosition.Center;
    case 5: return StartGradientPosition.CenterRight;
    case 6: return StartGradientPosition.BottomLeft;
    case 7: return StartGradientPosition.BottomCenter;
    case 8: return StartGradientPosition.BottomRight;
  }
  return StartGradientPosition.Unknown;
}

EndGradientPosition toEndGradientPosition(int? index) {
  switch (index) {
    case 0: return EndGradientPosition.TopLeft;
    case 1: return EndGradientPosition.TopCenter;
    case 2: return EndGradientPosition.TopRight;
    case 3: return EndGradientPosition.CenterLeft;
    case 4: return EndGradientPosition.Center;
    case 5: return EndGradientPosition.CenterRight;
    case 6: return EndGradientPosition.BottomLeft;
    case 7: return EndGradientPosition.BottomCenter;
    case 8: return EndGradientPosition.BottomRight;
  }
  return EndGradientPosition.Unknown;
}


class BackgroundModel {
  String? documentID;
  String? comments;

  // Background Image. If you want to use an image you've uploaded to your member area then please use that public URL
  PublicMediumModel? backgroundImage;

  // When set, the profile photo will be used as background. This takes preference over backgroundImage.
  bool? useProfilePhotoAsBackground;

  // Start position of the gradient
  StartGradientPosition? beginGradientPosition;

  // End position of the gradient
  EndGradientPosition? endGradientPosition;
  ShadowModel? shadow;
  List<DecorationColorModel>? decorationColors;
  bool? border;

  BackgroundModel({this.documentID, this.comments, this.backgroundImage, this.useProfilePhotoAsBackground, this.beginGradientPosition, this.endGradientPosition, this.shadow, this.decorationColors, this.border, })  {
    assert(documentID != null);
  }

  BackgroundModel copyWith({String? documentID, String? comments, PublicMediumModel? backgroundImage, bool? useProfilePhotoAsBackground, StartGradientPosition? beginGradientPosition, EndGradientPosition? endGradientPosition, ShadowModel? shadow, List<DecorationColorModel>? decorationColors, bool? border, }) {
    return BackgroundModel(documentID: documentID ?? this.documentID, comments: comments ?? this.comments, backgroundImage: backgroundImage ?? this.backgroundImage, useProfilePhotoAsBackground: useProfilePhotoAsBackground ?? this.useProfilePhotoAsBackground, beginGradientPosition: beginGradientPosition ?? this.beginGradientPosition, endGradientPosition: endGradientPosition ?? this.endGradientPosition, shadow: shadow ?? this.shadow, decorationColors: decorationColors ?? this.decorationColors, border: border ?? this.border, );
  }

  @override
  int get hashCode => documentID.hashCode ^ comments.hashCode ^ backgroundImage.hashCode ^ useProfilePhotoAsBackground.hashCode ^ beginGradientPosition.hashCode ^ endGradientPosition.hashCode ^ shadow.hashCode ^ decorationColors.hashCode ^ border.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is BackgroundModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          comments == other.comments &&
          backgroundImage == other.backgroundImage &&
          useProfilePhotoAsBackground == other.useProfilePhotoAsBackground &&
          beginGradientPosition == other.beginGradientPosition &&
          endGradientPosition == other.endGradientPosition &&
          shadow == other.shadow &&
          ListEquality().equals(decorationColors, other.decorationColors) &&
          border == other.border;

  @override
  String toString() {
    String decorationColorsCsv = (decorationColors == null) ? '' : decorationColors!.join(', ');

    return 'BackgroundModel{documentID: $documentID, comments: $comments, backgroundImage: $backgroundImage, useProfilePhotoAsBackground: $useProfilePhotoAsBackground, beginGradientPosition: $beginGradientPosition, endGradientPosition: $endGradientPosition, shadow: $shadow, decorationColors: DecorationColor[] { $decorationColorsCsv }, border: $border}';
  }

  BackgroundEntity toEntity({String? appId}) {
    return BackgroundEntity(
          comments: (comments != null) ? comments : null, 
          backgroundImageId: (backgroundImage != null) ? backgroundImage!.documentID : null, 
          useProfilePhotoAsBackground: (useProfilePhotoAsBackground != null) ? useProfilePhotoAsBackground : null, 
          beginGradientPosition: (beginGradientPosition != null) ? beginGradientPosition!.index : null, 
          endGradientPosition: (endGradientPosition != null) ? endGradientPosition!.index : null, 
          shadowId: (shadow != null) ? shadow!.documentID : null, 
          decorationColors: (decorationColors != null) ? decorationColors
            !.map((item) => item.toEntity(appId: appId))
            .toList() : null, 
          border: (border != null) ? border : null, 
    );
  }

  static BackgroundModel? fromEntity(String documentID, BackgroundEntity? entity) {
    if (entity == null) return null;
    var counter = 0;
    return BackgroundModel(
          documentID: documentID, 
          comments: entity.comments, 
          useProfilePhotoAsBackground: entity.useProfilePhotoAsBackground, 
          beginGradientPosition: toStartGradientPosition(entity.beginGradientPosition), 
          endGradientPosition: toEndGradientPosition(entity.endGradientPosition), 
          decorationColors: 
            entity.decorationColors == null ? null :
            entity.decorationColors
            !.map((item) {
              counter++; 
              return DecorationColorModel.fromEntity(counter.toString(), item)!;
            })
            .toList(), 
          border: entity.border, 
    );
  }

  static Future<BackgroundModel?> fromEntityPlus(String documentID, BackgroundEntity? entity, { String? appId}) async {
    if (entity == null) return null;

    PublicMediumModel? backgroundImageHolder;
    if (entity.backgroundImageId != null) {
      try {
          backgroundImageHolder = await publicMediumRepository(appId: appId)!.get(entity.backgroundImageId);
      } on Exception catch(e) {
        print('Error whilst trying to initialise backgroundImage');
        print('Error whilst retrieving publicMedium with id ${entity.backgroundImageId}');
        print('Exception: $e');
      }
    }

    ShadowModel? shadowHolder;
    if (entity.shadowId != null) {
      try {
          shadowHolder = await shadowRepository(appId: appId)!.get(entity.shadowId);
      } on Exception catch(e) {
        print('Error whilst trying to initialise shadow');
        print('Error whilst retrieving shadow with id ${entity.shadowId}');
        print('Exception: $e');
      }
    }

    var counter = 0;
    return BackgroundModel(
          documentID: documentID, 
          comments: entity.comments, 
          backgroundImage: backgroundImageHolder, 
          useProfilePhotoAsBackground: entity.useProfilePhotoAsBackground, 
          beginGradientPosition: toStartGradientPosition(entity.beginGradientPosition), 
          endGradientPosition: toEndGradientPosition(entity.endGradientPosition), 
          shadow: shadowHolder, 
          decorationColors: 
            entity. decorationColors == null ? null : List<DecorationColorModel>.from(await Future.wait(entity. decorationColors
            !.map((item) {
            counter++;
            return DecorationColorModel.fromEntityPlus(counter.toString(), item, appId: appId);})
            .toList())), 
          border: entity.border, 
    );
  }

}

