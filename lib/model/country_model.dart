/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 country_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/core/global_data.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import '../model/abstract_repository_singleton.dart';
import 'repository_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import '../model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import '../model/entity_export.dart';


import 'country_entity.dart';
import 'package:eliud_core/tools/random.dart';



class CountryModel {
  String documentID;
  String countryCode;
  String countryName;

  CountryModel({this.documentID, this.countryCode, this.countryName, })  {
    assert(documentID != null);
  }

  CountryModel copyWith({String documentID, String countryCode, String countryName, }) {
    return CountryModel(documentID: documentID ?? this.documentID, countryCode: countryCode ?? this.countryCode, countryName: countryName ?? this.countryName, );
  }

  @override
  int get hashCode => documentID.hashCode ^ countryCode.hashCode ^ countryName.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is CountryModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          countryCode == other.countryCode &&
          countryName == other.countryName;

  @override
  String toString() {
    return 'CountryModel{documentID: $documentID, countryCode: $countryCode, countryName: $countryName}';
  }

  CountryEntity toEntity() {
    return CountryEntity(
          countryCode: (countryCode != null) ? countryCode : null, 
          countryName: (countryName != null) ? countryName : null, 
    );
  }

  static CountryModel fromEntity(String documentID, CountryEntity entity) {
    if (entity == null) return null;
    return CountryModel(
          documentID: documentID, 
          countryCode: entity.countryCode, 
          countryName: entity.countryName, 
    );
  }

  static Future<CountryModel> fromEntityPlus(String documentID, CountryEntity entity) async {
    if (entity == null) return null;

    return CountryModel(
          documentID: documentID, 
          countryCode: entity.countryCode, 
          countryName: entity.countryName, 
    );
  }

}

