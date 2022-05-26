/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 edge_insets_geometry_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
class EdgeInsetsGeometryEntity {
  final double? left;
  final double? right;
  final double? top;
  final double? bottom;

  EdgeInsetsGeometryEntity({this.left, this.right, this.top, this.bottom, });


  List<Object?> get props => [left, right, top, bottom, ];

  @override
  String toString() {
    return 'EdgeInsetsGeometryEntity{left: $left, right: $right, top: $top, bottom: $bottom}';
  }

  static EdgeInsetsGeometryEntity? fromMap(Object? o) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    return EdgeInsetsGeometryEntity(
      left: double.tryParse(map['left'].toString()), 
      right: double.tryParse(map['right'].toString()), 
      top: double.tryParse(map['top'].toString()), 
      bottom: double.tryParse(map['bottom'].toString()), 
    );
  }

  Map<String, Object?> toDocument() {
    Map<String, Object?> theDocument = HashMap();
    if (left != null) theDocument["left"] = left;
      else theDocument["left"] = null;
    if (right != null) theDocument["right"] = right;
      else theDocument["right"] = null;
    if (top != null) theDocument["top"] = top;
      else theDocument["top"] = null;
    if (bottom != null) theDocument["bottom"] = bottom;
      else theDocument["bottom"] = null;
    return theDocument;
  }

  static EdgeInsetsGeometryEntity? fromJsonString(String json) {
    Map<String, dynamic>? generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

}

