/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 app_entry_pages_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'package:eliud_core/tools/common_tools.dart';
import 'abstract_repository_singleton.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_core/model/entity_export.dart';

class AppEntryPagesEntity {
  final String? entryPageId;
  final int? minPrivilege;

  AppEntryPagesEntity({this.entryPageId, this.minPrivilege, });


  List<Object?> get props => [entryPageId, minPrivilege, ];

  @override
  String toString() {
    return 'AppEntryPagesEntity{entryPageId: $entryPageId, minPrivilege: $minPrivilege}';
  }

  static AppEntryPagesEntity? fromMap(Object? o) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    return AppEntryPagesEntity(
      entryPageId: map['entryPageId'], 
      minPrivilege: int.tryParse(map['minPrivilege'].toString()), 
    );
  }

  Map<String, Object?> toDocument() {
    Map<String, Object?> theDocument = HashMap();
    if (entryPageId != null) theDocument["entryPageId"] = entryPageId;
      else theDocument["entryPageId"] = null;
    if (minPrivilege != null) theDocument["minPrivilege"] = minPrivilege;
      else theDocument["minPrivilege"] = null;
    return theDocument;
  }

  static AppEntryPagesEntity? fromJsonString(String json) {
    Map<String, dynamic>? generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

}

