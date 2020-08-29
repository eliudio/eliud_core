/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 shadow_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/core/global_data.dart';

// import the main classes
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';

// import the shared classes
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/model/entity_export.dart';
  
// import the classes of this package:
import '../model/abstract_repository_singleton.dart';
import '../model/repository_export.dart';
import 'package:eliud_core/model/repository_export.dart';
import '../model/model_export.dart';
import 'package:eliud_core/model/model_export.dart';
import '../model/entity_export.dart';
import 'package:eliud_core/model/entity_export.dart';


import 'shadow_entity.dart';
import 'package:eliud_core/tools/random.dart';



class ShadowModel {
  String documentID;
  String appId;
  String comments;
  RgbModel color;

  // The first argument sets [dx], the horizontal component of the offset
  double offsetDX;

  // The second argument sets [dy], the vertical component of the offset
  double offsetDY;

  // The amount the box should be inflated prior to applying the blur.
  double spreadRadius;

  // The standard deviation of the Gaussian to convolve with the shadow's shape.
  double blurRadius;

  ShadowModel({this.documentID, this.appId, this.comments, this.color, this.offsetDX, this.offsetDY, this.spreadRadius, this.blurRadius, })  {
    assert(documentID != null);
  }

  ShadowModel copyWith({String documentID, String appId, String comments, RgbModel color, double offsetDX, double offsetDY, double spreadRadius, double blurRadius, }) {
    return ShadowModel(documentID: documentID ?? this.documentID, appId: appId ?? this.appId, comments: comments ?? this.comments, color: color ?? this.color, offsetDX: offsetDX ?? this.offsetDX, offsetDY: offsetDY ?? this.offsetDY, spreadRadius: spreadRadius ?? this.spreadRadius, blurRadius: blurRadius ?? this.blurRadius, );
  }

  @override
  int get hashCode => documentID.hashCode ^ appId.hashCode ^ comments.hashCode ^ color.hashCode ^ offsetDX.hashCode ^ offsetDY.hashCode ^ spreadRadius.hashCode ^ blurRadius.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is ShadowModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          appId == other.appId &&
          comments == other.comments &&
          color == other.color &&
          offsetDX == other.offsetDX &&
          offsetDY == other.offsetDY &&
          spreadRadius == other.spreadRadius &&
          blurRadius == other.blurRadius;

  @override
  String toString() {
    return 'ShadowModel{documentID: $documentID, appId: $appId, comments: $comments, color: $color, offsetDX: $offsetDX, offsetDY: $offsetDY, spreadRadius: $spreadRadius, blurRadius: $blurRadius}';
  }

  ShadowEntity toEntity() {
    appId = GlobalData.app().documentID;
    return ShadowEntity(
          appId: (appId != null) ? appId : null, 
          comments: (comments != null) ? comments : null, 
          color: (color != null) ? color.toEntity() : null, 
          offsetDX: (offsetDX != null) ? offsetDX : null, 
          offsetDY: (offsetDY != null) ? offsetDY : null, 
          spreadRadius: (spreadRadius != null) ? spreadRadius : null, 
          blurRadius: (blurRadius != null) ? blurRadius : null, 
    );
  }

  static ShadowModel fromEntity(String documentID, ShadowEntity entity) {
    if (entity == null) return null;
    return ShadowModel(
          documentID: documentID, 
          appId: entity.appId, 
          comments: entity.comments, 
          color: 
            RgbModel.fromEntity(entity.color), 
          offsetDX: entity.offsetDX, 
          offsetDY: entity.offsetDY, 
          spreadRadius: entity.spreadRadius, 
          blurRadius: entity.blurRadius, 
    );
  }

  static Future<ShadowModel> fromEntityPlus(String documentID, ShadowEntity entity) async {
    if (entity == null) return null;

    return ShadowModel(
          documentID: documentID, 
          appId: entity.appId, 
          comments: entity.comments, 
          color: 
            await RgbModel.fromEntityPlus(entity.color), 
          offsetDX: entity.offsetDX, 
          offsetDY: entity.offsetDY, 
          spreadRadius: entity.spreadRadius, 
          blurRadius: entity.blurRadius, 
    );
  }

}

