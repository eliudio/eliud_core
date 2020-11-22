/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 pos_size_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/core/global_data.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_core/model/entity_export.dart';


import 'package:eliud_core/model/pos_size_entity.dart';

import 'package:eliud_core/tools/random.dart';

enum WidthTypePortrait {
  AbsoluteWidth, PercentageWidth, Unknown
}

enum WidthTypeLandscape {
  AbsoluteWidth, PercentageWidth, Unknown
}

enum HeightTypePortrait {
  AbsoluteHeight, PercentageHeight, Unknown
}

enum HeightTypeLandscape {
  AbsoluteHeight, PercentageHeight, Unknown
}

enum PortraitFitType {
  PortraitFitWidth, PortraitFitHeight, PortraitFill, PortraitNone, PortraitContain, PortraitCover, PortraitScaleDown, Unknown
}

enum LandscapeFitType {
  LandscapeFitWidth, LandscapeFitHeight, LandscapeFill, LandscapeNone, LandscapeContain, LandscapeCover, LandscapeScaleDown, Unknown
}

enum PortraitAlignType {
  PortraitAlignTopLeft, PortraitAlignTopCenter, PortraitAlignTopRight, PortraitAlignCenterLeft, PortraitAlignCenter, PortraitAlignCenterRight, PortraitAlignBottomLeft, PortraitAlignBottomCenter, PortraitAlignBottomRight, Unknown
}

enum LandscapeAlignType {
  LandscapeAlignTopLeft, LandscapeAlignTopCenter, LandscapeAlignTopRight, LandscapeAlignCenterLeft, LandscapeAlignCenter, LandscapeAlignCenterRight, LandscapeAlignBottomLeft, LandscapeAlignBottomCenter, LandscapeAlignBottomRight, Unknown
}

enum ClipType {
  NoClip, ClipOval, ClipRRect5, ClipRRect10, ClipRRect15, ClipRRect20, ClipRRect30, ClipRRect40, Unknown
}


WidthTypePortrait toWidthTypePortrait(int index) {
  switch (index) {
    case 0: return WidthTypePortrait.AbsoluteWidth;
    case 1: return WidthTypePortrait.PercentageWidth;
  }
  return WidthTypePortrait.Unknown;
}

WidthTypeLandscape toWidthTypeLandscape(int index) {
  switch (index) {
    case 0: return WidthTypeLandscape.AbsoluteWidth;
    case 1: return WidthTypeLandscape.PercentageWidth;
  }
  return WidthTypeLandscape.Unknown;
}

HeightTypePortrait toHeightTypePortrait(int index) {
  switch (index) {
    case 0: return HeightTypePortrait.AbsoluteHeight;
    case 1: return HeightTypePortrait.PercentageHeight;
  }
  return HeightTypePortrait.Unknown;
}

HeightTypeLandscape toHeightTypeLandscape(int index) {
  switch (index) {
    case 0: return HeightTypeLandscape.AbsoluteHeight;
    case 1: return HeightTypeLandscape.PercentageHeight;
  }
  return HeightTypeLandscape.Unknown;
}

PortraitFitType toPortraitFitType(int index) {
  switch (index) {
    case 0: return PortraitFitType.PortraitFitWidth;
    case 1: return PortraitFitType.PortraitFitHeight;
    case 2: return PortraitFitType.PortraitFill;
    case 3: return PortraitFitType.PortraitNone;
    case 4: return PortraitFitType.PortraitContain;
    case 5: return PortraitFitType.PortraitCover;
    case 6: return PortraitFitType.PortraitScaleDown;
  }
  return PortraitFitType.Unknown;
}

LandscapeFitType toLandscapeFitType(int index) {
  switch (index) {
    case 0: return LandscapeFitType.LandscapeFitWidth;
    case 1: return LandscapeFitType.LandscapeFitHeight;
    case 2: return LandscapeFitType.LandscapeFill;
    case 3: return LandscapeFitType.LandscapeNone;
    case 4: return LandscapeFitType.LandscapeContain;
    case 5: return LandscapeFitType.LandscapeCover;
    case 6: return LandscapeFitType.LandscapeScaleDown;
  }
  return LandscapeFitType.Unknown;
}

PortraitAlignType toPortraitAlignType(int index) {
  switch (index) {
    case 0: return PortraitAlignType.PortraitAlignTopLeft;
    case 1: return PortraitAlignType.PortraitAlignTopCenter;
    case 2: return PortraitAlignType.PortraitAlignTopRight;
    case 3: return PortraitAlignType.PortraitAlignCenterLeft;
    case 4: return PortraitAlignType.PortraitAlignCenter;
    case 5: return PortraitAlignType.PortraitAlignCenterRight;
    case 6: return PortraitAlignType.PortraitAlignBottomLeft;
    case 7: return PortraitAlignType.PortraitAlignBottomCenter;
    case 8: return PortraitAlignType.PortraitAlignBottomRight;
  }
  return PortraitAlignType.Unknown;
}

LandscapeAlignType toLandscapeAlignType(int index) {
  switch (index) {
    case 0: return LandscapeAlignType.LandscapeAlignTopLeft;
    case 1: return LandscapeAlignType.LandscapeAlignTopCenter;
    case 2: return LandscapeAlignType.LandscapeAlignTopRight;
    case 3: return LandscapeAlignType.LandscapeAlignCenterLeft;
    case 4: return LandscapeAlignType.LandscapeAlignCenter;
    case 5: return LandscapeAlignType.LandscapeAlignCenterRight;
    case 6: return LandscapeAlignType.LandscapeAlignBottomLeft;
    case 7: return LandscapeAlignType.LandscapeAlignBottomCenter;
    case 8: return LandscapeAlignType.LandscapeAlignBottomRight;
  }
  return LandscapeAlignType.Unknown;
}

ClipType toClipType(int index) {
  switch (index) {
    case 0: return ClipType.NoClip;
    case 1: return ClipType.ClipOval;
    case 2: return ClipType.ClipRRect5;
    case 3: return ClipType.ClipRRect10;
    case 4: return ClipType.ClipRRect15;
    case 5: return ClipType.ClipRRect20;
    case 6: return ClipType.ClipRRect30;
    case 7: return ClipType.ClipRRect40;
  }
  return ClipType.Unknown;
}


class PosSizeModel {
  String documentID;
  String appId;
  String name;
  double widthPortrait;

  // Is width an absolute value or a percentage of the device width?
  WidthTypePortrait widthTypePortrait;
  double widthLandscape;

  // Is width an absolute value or a percentage of the device width?
  WidthTypeLandscape widthTypeLandscape;
  double heightPortrait;

  // Is height an absolute value or a percentage of the device height?
  HeightTypePortrait heightTypePortrait;
  double heightLandscape;

  // Is height an absolute value or a percentage of the device height?
  HeightTypeLandscape heightTypeLandscape;

  // How to fit the item within the box, when portrait
  PortraitFitType fitPortrait;

  // How to fit the item within the box, when landscape
  LandscapeFitType fitLandscape;

  // Align when Portrait
  PortraitAlignType alignTypePortrait;

  // Align when Landscape
  LandscapeAlignType alignTypeLandscape;

  // Clip
  ClipType clip;

  PosSizeModel({this.documentID, this.appId, this.name, this.widthPortrait, this.widthTypePortrait, this.widthLandscape, this.widthTypeLandscape, this.heightPortrait, this.heightTypePortrait, this.heightLandscape, this.heightTypeLandscape, this.fitPortrait, this.fitLandscape, this.alignTypePortrait, this.alignTypeLandscape, this.clip, })  {
    assert(documentID != null);
  }

  PosSizeModel copyWith({String documentID, String appId, String name, double widthPortrait, WidthTypePortrait widthTypePortrait, double widthLandscape, WidthTypeLandscape widthTypeLandscape, double heightPortrait, HeightTypePortrait heightTypePortrait, double heightLandscape, HeightTypeLandscape heightTypeLandscape, PortraitFitType fitPortrait, LandscapeFitType fitLandscape, PortraitAlignType alignTypePortrait, LandscapeAlignType alignTypeLandscape, ClipType clip, }) {
    return PosSizeModel(documentID: documentID ?? this.documentID, appId: appId ?? this.appId, name: name ?? this.name, widthPortrait: widthPortrait ?? this.widthPortrait, widthTypePortrait: widthTypePortrait ?? this.widthTypePortrait, widthLandscape: widthLandscape ?? this.widthLandscape, widthTypeLandscape: widthTypeLandscape ?? this.widthTypeLandscape, heightPortrait: heightPortrait ?? this.heightPortrait, heightTypePortrait: heightTypePortrait ?? this.heightTypePortrait, heightLandscape: heightLandscape ?? this.heightLandscape, heightTypeLandscape: heightTypeLandscape ?? this.heightTypeLandscape, fitPortrait: fitPortrait ?? this.fitPortrait, fitLandscape: fitLandscape ?? this.fitLandscape, alignTypePortrait: alignTypePortrait ?? this.alignTypePortrait, alignTypeLandscape: alignTypeLandscape ?? this.alignTypeLandscape, clip: clip ?? this.clip, );
  }

  @override
  int get hashCode => documentID.hashCode ^ appId.hashCode ^ name.hashCode ^ widthPortrait.hashCode ^ widthTypePortrait.hashCode ^ widthLandscape.hashCode ^ widthTypeLandscape.hashCode ^ heightPortrait.hashCode ^ heightTypePortrait.hashCode ^ heightLandscape.hashCode ^ heightTypeLandscape.hashCode ^ fitPortrait.hashCode ^ fitLandscape.hashCode ^ alignTypePortrait.hashCode ^ alignTypeLandscape.hashCode ^ clip.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is PosSizeModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          appId == other.appId &&
          name == other.name &&
          widthPortrait == other.widthPortrait &&
          widthTypePortrait == other.widthTypePortrait &&
          widthLandscape == other.widthLandscape &&
          widthTypeLandscape == other.widthTypeLandscape &&
          heightPortrait == other.heightPortrait &&
          heightTypePortrait == other.heightTypePortrait &&
          heightLandscape == other.heightLandscape &&
          heightTypeLandscape == other.heightTypeLandscape &&
          fitPortrait == other.fitPortrait &&
          fitLandscape == other.fitLandscape &&
          alignTypePortrait == other.alignTypePortrait &&
          alignTypeLandscape == other.alignTypeLandscape &&
          clip == other.clip;

  @override
  String toString() {
    return 'PosSizeModel{documentID: $documentID, appId: $appId, name: $name, widthPortrait: $widthPortrait, widthTypePortrait: $widthTypePortrait, widthLandscape: $widthLandscape, widthTypeLandscape: $widthTypeLandscape, heightPortrait: $heightPortrait, heightTypePortrait: $heightTypePortrait, heightLandscape: $heightLandscape, heightTypeLandscape: $heightTypeLandscape, fitPortrait: $fitPortrait, fitLandscape: $fitLandscape, alignTypePortrait: $alignTypePortrait, alignTypeLandscape: $alignTypeLandscape, clip: $clip}';
  }

  PosSizeEntity toEntity({String appId}) {
    return PosSizeEntity(
          appId: (appId != null) ? appId : null, 
          name: (name != null) ? name : null, 
          widthPortrait: (widthPortrait != null) ? widthPortrait : null, 
          widthTypePortrait: (widthTypePortrait != null) ? widthTypePortrait.index : null, 
          widthLandscape: (widthLandscape != null) ? widthLandscape : null, 
          widthTypeLandscape: (widthTypeLandscape != null) ? widthTypeLandscape.index : null, 
          heightPortrait: (heightPortrait != null) ? heightPortrait : null, 
          heightTypePortrait: (heightTypePortrait != null) ? heightTypePortrait.index : null, 
          heightLandscape: (heightLandscape != null) ? heightLandscape : null, 
          heightTypeLandscape: (heightTypeLandscape != null) ? heightTypeLandscape.index : null, 
          fitPortrait: (fitPortrait != null) ? fitPortrait.index : null, 
          fitLandscape: (fitLandscape != null) ? fitLandscape.index : null, 
          alignTypePortrait: (alignTypePortrait != null) ? alignTypePortrait.index : null, 
          alignTypeLandscape: (alignTypeLandscape != null) ? alignTypeLandscape.index : null, 
          clip: (clip != null) ? clip.index : null, 
    );
  }

  static PosSizeModel fromEntity(String documentID, PosSizeEntity entity) {
    if (entity == null) return null;
    return PosSizeModel(
          documentID: documentID, 
          appId: entity.appId, 
          name: entity.name, 
          widthPortrait: entity.widthPortrait, 
          widthTypePortrait: toWidthTypePortrait(entity.widthTypePortrait), 
          widthLandscape: entity.widthLandscape, 
          widthTypeLandscape: toWidthTypeLandscape(entity.widthTypeLandscape), 
          heightPortrait: entity.heightPortrait, 
          heightTypePortrait: toHeightTypePortrait(entity.heightTypePortrait), 
          heightLandscape: entity.heightLandscape, 
          heightTypeLandscape: toHeightTypeLandscape(entity.heightTypeLandscape), 
          fitPortrait: toPortraitFitType(entity.fitPortrait), 
          fitLandscape: toLandscapeFitType(entity.fitLandscape), 
          alignTypePortrait: toPortraitAlignType(entity.alignTypePortrait), 
          alignTypeLandscape: toLandscapeAlignType(entity.alignTypeLandscape), 
          clip: toClipType(entity.clip), 
    );
  }

  static Future<PosSizeModel> fromEntityPlus(String documentID, PosSizeEntity entity) async {
    if (entity == null) return null;

    return PosSizeModel(
          documentID: documentID, 
          appId: entity.appId, 
          name: entity.name, 
          widthPortrait: entity.widthPortrait, 
          widthTypePortrait: toWidthTypePortrait(entity.widthTypePortrait), 
          widthLandscape: entity.widthLandscape, 
          widthTypeLandscape: toWidthTypeLandscape(entity.widthTypeLandscape), 
          heightPortrait: entity.heightPortrait, 
          heightTypePortrait: toHeightTypePortrait(entity.heightTypePortrait), 
          heightLandscape: entity.heightLandscape, 
          heightTypeLandscape: toHeightTypeLandscape(entity.heightTypeLandscape), 
          fitPortrait: toPortraitFitType(entity.fitPortrait), 
          fitLandscape: toLandscapeFitType(entity.fitLandscape), 
          alignTypePortrait: toPortraitAlignType(entity.alignTypePortrait), 
          alignTypeLandscape: toLandscapeAlignType(entity.alignTypeLandscape), 
          clip: toClipType(entity.clip), 
    );
  }

}

