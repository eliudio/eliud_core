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
import 'package:eliud_core/core/base/model_base.dart';

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
  BorderRadiusModel? borderRadius;
  bool? border;
  EdgeInsetsGeometryModel? padding;
  EdgeInsetsGeometryModel? margin;

  BackgroundModel({this.backgroundImage, this.useProfilePhotoAsBackground, this.beginGradientPosition, this.endGradientPosition, this.shadow, this.decorationColors, this.borderRadius, this.border, this.padding, this.margin, })  {
  }

  BackgroundModel copyWith({PublicMediumModel? backgroundImage, bool? useProfilePhotoAsBackground, StartGradientPosition? beginGradientPosition, EndGradientPosition? endGradientPosition, ShadowModel? shadow, List<DecorationColorModel>? decorationColors, BorderRadiusModel? borderRadius, bool? border, EdgeInsetsGeometryModel? padding, EdgeInsetsGeometryModel? margin, }) {
    return BackgroundModel(backgroundImage: backgroundImage ?? this.backgroundImage, useProfilePhotoAsBackground: useProfilePhotoAsBackground ?? this.useProfilePhotoAsBackground, beginGradientPosition: beginGradientPosition ?? this.beginGradientPosition, endGradientPosition: endGradientPosition ?? this.endGradientPosition, shadow: shadow ?? this.shadow, decorationColors: decorationColors ?? this.decorationColors, borderRadius: borderRadius ?? this.borderRadius, border: border ?? this.border, padding: padding ?? this.padding, margin: margin ?? this.margin, );
  }

  @override
  int get hashCode => backgroundImage.hashCode ^ useProfilePhotoAsBackground.hashCode ^ beginGradientPosition.hashCode ^ endGradientPosition.hashCode ^ shadow.hashCode ^ decorationColors.hashCode ^ borderRadius.hashCode ^ border.hashCode ^ padding.hashCode ^ margin.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is BackgroundModel &&
          runtimeType == other.runtimeType && 
          backgroundImage == other.backgroundImage &&
          useProfilePhotoAsBackground == other.useProfilePhotoAsBackground &&
          beginGradientPosition == other.beginGradientPosition &&
          endGradientPosition == other.endGradientPosition &&
          shadow == other.shadow &&
          ListEquality().equals(decorationColors, other.decorationColors) &&
          borderRadius == other.borderRadius &&
          border == other.border &&
          padding == other.padding &&
          margin == other.margin;

  String toJsonString({String? appId}) {
    return toEntity(appId: appId).toJsonString();
  }

  @override
  String toString() {
    String decorationColorsCsv = (decorationColors == null) ? '' : decorationColors!.join(', ');

    return 'BackgroundModel{backgroundImage: $backgroundImage, useProfilePhotoAsBackground: $useProfilePhotoAsBackground, beginGradientPosition: $beginGradientPosition, endGradientPosition: $endGradientPosition, shadow: $shadow, decorationColors: DecorationColor[] { $decorationColorsCsv }, borderRadius: $borderRadius, border: $border, padding: $padding, margin: $margin}';
  }

  BackgroundEntity toEntity({String? appId}) {
    return BackgroundEntity(
          backgroundImageId: (backgroundImage != null) ? backgroundImage!.documentID : null, 
          useProfilePhotoAsBackground: (useProfilePhotoAsBackground != null) ? useProfilePhotoAsBackground : null, 
          beginGradientPosition: (beginGradientPosition != null) ? beginGradientPosition!.index : null, 
          endGradientPosition: (endGradientPosition != null) ? endGradientPosition!.index : null, 
          shadow: (shadow != null) ? shadow!.toEntity(appId: appId) : null, 
          decorationColors: (decorationColors != null) ? decorationColors
            !.map((item) => item.toEntity(appId: appId))
            .toList() : null, 
          borderRadius: (borderRadius != null) ? borderRadius!.toEntity(appId: appId) : null, 
          border: (border != null) ? border : null, 
          padding: (padding != null) ? padding!.toEntity(appId: appId) : null, 
          margin: (margin != null) ? margin!.toEntity(appId: appId) : null, 
    );
  }

  static Future<BackgroundModel?> fromEntity(BackgroundEntity? entity) async {
    if (entity == null) return null;
    var counter = 0;
    return BackgroundModel(
          useProfilePhotoAsBackground: entity.useProfilePhotoAsBackground, 
          beginGradientPosition: toStartGradientPosition(entity.beginGradientPosition), 
          endGradientPosition: toEndGradientPosition(entity.endGradientPosition), 
          shadow: 
            await ShadowModel.fromEntity(entity.shadow), 
          decorationColors: 
            entity.decorationColors == null ? null : List<DecorationColorModel>.from(await Future.wait(entity. decorationColors
            !.map((item) {
            counter++;
              return DecorationColorModel.fromEntity(counter.toString(), item);
            })
            .toList())), 
          borderRadius: 
            await BorderRadiusModel.fromEntity(entity.borderRadius), 
          border: entity.border, 
          padding: 
            await EdgeInsetsGeometryModel.fromEntity(entity.padding), 
          margin: 
            await EdgeInsetsGeometryModel.fromEntity(entity.margin), 
    );
  }

  static Future<BackgroundModel?> fromEntityPlus(BackgroundEntity? entity, { String? appId}) async {
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

    var counter = 0;
    return BackgroundModel(
          backgroundImage: backgroundImageHolder, 
          useProfilePhotoAsBackground: entity.useProfilePhotoAsBackground, 
          beginGradientPosition: toStartGradientPosition(entity.beginGradientPosition), 
          endGradientPosition: toEndGradientPosition(entity.endGradientPosition), 
          shadow: 
            await ShadowModel.fromEntityPlus(entity.shadow, appId: appId), 
          decorationColors: 
            entity. decorationColors == null ? null : List<DecorationColorModel>.from(await Future.wait(entity. decorationColors
            !.map((item) {
            counter++;
            return DecorationColorModel.fromEntityPlus(counter.toString(), item, appId: appId);})
            .toList())), 
          borderRadius: 
            await BorderRadiusModel.fromEntityPlus(entity.borderRadius, appId: appId), 
          border: entity.border, 
          padding: 
            await EdgeInsetsGeometryModel.fromEntityPlus(entity.padding, appId: appId), 
          margin: 
            await EdgeInsetsGeometryModel.fromEntityPlus(entity.margin, appId: appId), 
    );
  }

}

