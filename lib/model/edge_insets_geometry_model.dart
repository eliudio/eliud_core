/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 edge_insets_geometry_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/tools/common_tools.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/core/base/model_base.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:eliud_core/model/app_model.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_core/model/entity_export.dart';


import 'package:eliud_core/model/edge_insets_geometry_entity.dart';

import 'package:eliud_core/tools/random.dart';



class EdgeInsetsGeometryModel {
  static const String packageName = 'eliud_core';
  static const String id = 'edgeInsetsGeometrys';

  double? left;
  double? right;
  double? top;
  double? bottom;

  EdgeInsetsGeometryModel({this.left, this.right, this.top, this.bottom, })  {
  }

  EdgeInsetsGeometryModel copyWith({double? left, double? right, double? top, double? bottom, }) {
    return EdgeInsetsGeometryModel(left: left ?? this.left, right: right ?? this.right, top: top ?? this.top, bottom: bottom ?? this.bottom, );
  }

  @override
  int get hashCode => left.hashCode ^ right.hashCode ^ top.hashCode ^ bottom.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is EdgeInsetsGeometryModel &&
          runtimeType == other.runtimeType && 
          left == other.left &&
          right == other.right &&
          top == other.top &&
          bottom == other.bottom;

  @override
  String toString() {
    return 'EdgeInsetsGeometryModel{left: $left, right: $right, top: $top, bottom: $bottom}';
  }

  EdgeInsetsGeometryEntity toEntity({String? appId, List<ModelReference>? referencesCollector}) {
    if (referencesCollector != null) {
    }
    return EdgeInsetsGeometryEntity(
          left: (left != null) ? left : null, 
          right: (right != null) ? right : null, 
          top: (top != null) ? top : null, 
          bottom: (bottom != null) ? bottom : null, 
    );
  }

  static Future<EdgeInsetsGeometryModel?> fromEntity(EdgeInsetsGeometryEntity? entity) async {
    if (entity == null) return null;
    var counter = 0;
    return EdgeInsetsGeometryModel(
          left: entity.left, 
          right: entity.right, 
          top: entity.top, 
          bottom: entity.bottom, 
    );
  }

  static Future<EdgeInsetsGeometryModel?> fromEntityPlus(EdgeInsetsGeometryEntity? entity, { String? appId}) async {
    if (entity == null) return null;

    var counter = 0;
    return EdgeInsetsGeometryModel(
          left: entity.left, 
          right: entity.right, 
          top: entity.top, 
          bottom: entity.bottom, 
    );
  }

}

