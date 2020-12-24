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
import 'package:eliud_core/core/global_data.dart';
import 'package:eliud_core/tools/common_tools.dart';

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


StartGradientPosition toStartGradientPosition(int index) {
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

EndGradientPosition toEndGradientPosition(int index) {
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
  String documentID;
  String appId;
  String comments;
  ImageModel backgroundImage;

  // Start position of the gradient
  StartGradientPosition beginGradientPosition;

  // End position of the gradient
  EndGradientPosition endGradientPosition;
  ShadowModel shadow;
  List<DecorationColorModel> decorationColors;
  bool border;
  bool admin;

  BackgroundModel({this.documentID, this.appId, this.comments, this.backgroundImage, this.beginGradientPosition, this.endGradientPosition, this.shadow, this.decorationColors, this.border, this.admin, })  {
    assert(documentID != null);
  }

  BackgroundModel copyWith({String documentID, String appId, String comments, ImageModel backgroundImage, StartGradientPosition beginGradientPosition, EndGradientPosition endGradientPosition, ShadowModel shadow, List<DecorationColorModel> decorationColors, bool border, bool admin, }) {
    return BackgroundModel(documentID: documentID ?? this.documentID, appId: appId ?? this.appId, comments: comments ?? this.comments, backgroundImage: backgroundImage ?? this.backgroundImage, beginGradientPosition: beginGradientPosition ?? this.beginGradientPosition, endGradientPosition: endGradientPosition ?? this.endGradientPosition, shadow: shadow ?? this.shadow, decorationColors: decorationColors ?? this.decorationColors, border: border ?? this.border, admin: admin ?? this.admin, );
  }

  @override
  int get hashCode => documentID.hashCode ^ appId.hashCode ^ comments.hashCode ^ backgroundImage.hashCode ^ beginGradientPosition.hashCode ^ endGradientPosition.hashCode ^ shadow.hashCode ^ decorationColors.hashCode ^ border.hashCode ^ admin.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is BackgroundModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          appId == other.appId &&
          comments == other.comments &&
          backgroundImage == other.backgroundImage &&
          beginGradientPosition == other.beginGradientPosition &&
          endGradientPosition == other.endGradientPosition &&
          shadow == other.shadow &&
          ListEquality().equals(decorationColors, other.decorationColors) &&
          border == other.border &&
          admin == other.admin;

  @override
  String toString() {
    String decorationColorsCsv = (decorationColors == null) ? '' : decorationColors.join(', ');

    return 'BackgroundModel{documentID: $documentID, appId: $appId, comments: $comments, backgroundImage: $backgroundImage, beginGradientPosition: $beginGradientPosition, endGradientPosition: $endGradientPosition, shadow: $shadow, decorationColors: DecorationColor[] { $decorationColorsCsv }, border: $border, admin: $admin}';
  }

  BackgroundEntity toEntity({String appId}) {
    return BackgroundEntity(
          appId: (appId != null) ? appId : null, 
          comments: (comments != null) ? comments : null, 
          backgroundImageId: (backgroundImage != null) ? backgroundImage.documentID : null, 
          beginGradientPosition: (beginGradientPosition != null) ? beginGradientPosition.index : null, 
          endGradientPosition: (endGradientPosition != null) ? endGradientPosition.index : null, 
          shadowId: (shadow != null) ? shadow.documentID : null, 
          decorationColors: (decorationColors != null) ? decorationColors
            .map((item) => item.toEntity(appId: appId))
            .toList() : null, 
          border: (border != null) ? border : null, 
          admin: (admin != null) ? admin : null, 
    );
  }

  static BackgroundModel fromEntity(String documentID, BackgroundEntity entity) {
    if (entity == null) return null;
    return BackgroundModel(
          documentID: documentID, 
          appId: entity.appId, 
          comments: entity.comments, 
          beginGradientPosition: toStartGradientPosition(entity.beginGradientPosition), 
          endGradientPosition: toEndGradientPosition(entity.endGradientPosition), 
          decorationColors: 
            entity. decorationColors
            .map((item) => DecorationColorModel.fromEntity(newRandomKey(), item))
            .toList(), 
          border: entity.border, 
          admin: entity.admin, 
    );
  }

  static Future<BackgroundModel> fromEntityPlus(String documentID, BackgroundEntity entity, { String appId}) async {
    if (entity == null) return null;

    ImageModel backgroundImageHolder;
    if (entity.backgroundImageId != null) {
      try {
        await imageRepository(appId: appId).get(entity.backgroundImageId).then((val) {
          backgroundImageHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    ShadowModel shadowHolder;
    if (entity.shadowId != null) {
      try {
        await shadowRepository(appId: appId).get(entity.shadowId).then((val) {
          shadowHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    return BackgroundModel(
          documentID: documentID, 
          appId: entity.appId, 
          comments: entity.comments, 
          backgroundImage: backgroundImageHolder, 
          beginGradientPosition: toStartGradientPosition(entity.beginGradientPosition), 
          endGradientPosition: toEndGradientPosition(entity.endGradientPosition), 
          shadow: shadowHolder, 
          decorationColors: 
            new List<DecorationColorModel>.from(await Future.wait(entity. decorationColors
            .map((item) => DecorationColorModel.fromEntityPlus(newRandomKey(), item, appId: appId))
            .toList())), 
          border: entity.border, 
          admin: entity.admin, 
    );
  }

}

