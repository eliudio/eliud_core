/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 country_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_core/model/entity_export.dart';

class CountryEntity {
  final String countryCode;
  final String countryName;

  CountryEntity({this.countryCode, this.countryName, });


  List<Object> get props => [countryCode, countryName, ];

  @override
  String toString() {
    return 'CountryEntity{countryCode: $countryCode, countryName: $countryName}';
  }

  static CountryEntity fromMap(Map map) {
    if (map == null) return null;

    return CountryEntity(
      countryCode: map['countryCode'], 
      countryName: map['countryName'], 
    );
  }

  Map<String, Object> toDocument() {
    Map<String, Object> theDocument = HashMap();
    if (countryCode != null) theDocument["countryCode"] = countryCode;
      else theDocument["countryCode"] = null;
    if (countryName != null) theDocument["countryName"] = countryName;
      else theDocument["countryName"] = null;
    return theDocument;
  }

  static CountryEntity fromJsonString(String json) {
    Map<String, dynamic> generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

}

