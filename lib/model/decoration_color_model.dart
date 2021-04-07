/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 decoration_color_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/core/global_data.dart';
import 'package:eliud_core/tools/common_tools.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_core/model/entity_export.dart';


import 'package:eliud_core/model/decoration_color_entity.dart';

import 'package:eliud_core/tools/random.dart';



class DecorationColorModel {
  String? documentID;
  RgbModel? color;
  double? stop;

  DecorationColorModel({this.documentID, this.color, this.stop, })  {
    assert(documentID != null);
  }

  DecorationColorModel copyWith({String? documentID, RgbModel? color, double? stop, }) {
    return DecorationColorModel(documentID: documentID ?? this.documentID, color: color ?? this.color, stop: stop ?? this.stop, );
  }

  @override
  int get hashCode => documentID.hashCode ^ color.hashCode ^ stop.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is DecorationColorModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          color == other.color &&
          stop == other.stop;

  @override
  String toString() {
    return 'DecorationColorModel{documentID: $documentID, color: $color, stop: $stop}';
  }

  DecorationColorEntity toEntity({String? appId}) {
    return DecorationColorEntity(
          color: (color != null) ? color!.toEntity(appId: appId) : null, 
          stop: (stop != null) ? stop : null, 
    );
  }

  static DecorationColorModel fromEntity(String documentID, DecorationColorEntity entity) {
    if (entity == null) return null;
    return DecorationColorModel(
          documentID: documentID, 
          color: 
            RgbModel.fromEntity(entity.color), 
          stop: entity.stop, 
    );
  }

  static Future<DecorationColorModel> fromEntityPlus(String documentID, DecorationColorEntity entity, { String? appId}) async {
    if (entity == null) return null;

    return DecorationColorModel(
          documentID: documentID, 
          color: 
            await RgbModel.fromEntityPlus(entity.color, appId: appId), 
          stop: entity.stop, 
    );
  }

}

