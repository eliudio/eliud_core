/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 storage_conditions_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
class StorageConditionsEntity {
  final int? privilegeLevelRequired;

  StorageConditionsEntity({this.privilegeLevelRequired, });


  List<Object?> get props => [privilegeLevelRequired, ];

  @override
  String toString() {
    return 'StorageConditionsEntity{privilegeLevelRequired: $privilegeLevelRequired}';
  }

  static StorageConditionsEntity? fromMap(Object? o) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    return StorageConditionsEntity(
      privilegeLevelRequired: map['privilegeLevelRequired'], 
    );
  }

  Map<String, Object?> toDocument() {
    Map<String, Object?> theDocument = HashMap();
    if (privilegeLevelRequired != null) theDocument["privilegeLevelRequired"] = privilegeLevelRequired;
      else theDocument["privilegeLevelRequired"] = null;
    return theDocument;
  }

  static StorageConditionsEntity? fromJsonString(String json) {
    Map<String, dynamic>? generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

}

