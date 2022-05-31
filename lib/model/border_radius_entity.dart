/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 border_radius_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'abstract_repository_singleton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_core/model/entity_export.dart';

import 'package:eliud_core/tools/common_tools.dart';
class BorderRadiusEntity {
  final int? borderRadiusType;
  final double? circularValue;
  final double? ellipticalX;
  final double? ellipticalY;

  BorderRadiusEntity({this.borderRadiusType, this.circularValue, this.ellipticalX, this.ellipticalY, });


  List<Object?> get props => [borderRadiusType, circularValue, ellipticalX, ellipticalY, ];

  @override
  String toString() {
    return 'BorderRadiusEntity{borderRadiusType: $borderRadiusType, circularValue: $circularValue, ellipticalX: $ellipticalX, ellipticalY: $ellipticalY}';
  }

  static BorderRadiusEntity? fromMap(Object? o) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    return BorderRadiusEntity(
      borderRadiusType: map['borderRadiusType'], 
      circularValue: double.tryParse(map['circularValue'].toString()), 
      ellipticalX: double.tryParse(map['ellipticalX'].toString()), 
      ellipticalY: double.tryParse(map['ellipticalY'].toString()), 
    );
  }

  Map<String, Object?> toDocument() {
    Map<String, Object?> theDocument = HashMap();
    if (borderRadiusType != null) theDocument["borderRadiusType"] = borderRadiusType;
      else theDocument["borderRadiusType"] = null;
    if (circularValue != null) theDocument["circularValue"] = circularValue;
      else theDocument["circularValue"] = null;
    if (ellipticalX != null) theDocument["ellipticalX"] = ellipticalX;
      else theDocument["ellipticalX"] = null;
    if (ellipticalY != null) theDocument["ellipticalY"] = ellipticalY;
      else theDocument["ellipticalY"] = null;
    return theDocument;
  }

  static BorderRadiusEntity? fromJsonString(String json) {
    Map<String, dynamic>? generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

}

