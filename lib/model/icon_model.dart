/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 icon_model.dart
                       
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


import 'package:eliud_core/model/icon_entity.dart';

import 'package:eliud_core/tools/random.dart';



class IconModel {

  // The Unicode code point at which this icon is stored in the icon font. For example, for materialicon 'Home', use codePoint: 0xe88a. Find the codePoint from sources such as https://github.com/flutter/flutter/blob/master/packages/flutter/lib/src/material/icons.dart, https://github.com/google/material-design-icons/blob/master/iconfont/codepoints, https://material.io/resources/icons or ...
  int codePoint;

  // The font family from which the glyph for the codePoint will be selected. For example MaterialIcons
  String fontFamily;

  IconModel({this.codePoint, this.fontFamily, })  {
  }

  IconModel copyWith({int codePoint, String fontFamily, }) {
    return IconModel(codePoint: codePoint ?? this.codePoint, fontFamily: fontFamily ?? this.fontFamily, );
  }

  @override
  int get hashCode => codePoint.hashCode ^ fontFamily.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is IconModel &&
          runtimeType == other.runtimeType && 
          codePoint == other.codePoint &&
          fontFamily == other.fontFamily;

  @override
  String toString() {
    return 'IconModel{codePoint: $codePoint, fontFamily: $fontFamily}';
  }

  IconEntity toEntity({String appId}) {
    return IconEntity(
          codePoint: (codePoint != null) ? codePoint : null, 
          fontFamily: (fontFamily != null) ? fontFamily : null, 
    );
  }

  static IconModel fromEntity(IconEntity entity) {
    if (entity == null) return null;
    return IconModel(
          codePoint: entity.codePoint, 
          fontFamily: entity.fontFamily, 
    );
  }

  static Future<IconModel> fromEntityPlus(IconEntity entity, { String appId}) async {
    if (entity == null) return null;

    return IconModel(
          codePoint: entity.codePoint, 
          fontFamily: entity.fontFamily, 
    );
  }

}

