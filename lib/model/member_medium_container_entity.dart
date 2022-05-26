/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_medium_container_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
class MemberMediumContainerEntity {
  final String? memberMediumId;

  MemberMediumContainerEntity({this.memberMediumId, });


  List<Object?> get props => [memberMediumId, ];

  @override
  String toString() {
    return 'MemberMediumContainerEntity{memberMediumId: $memberMediumId}';
  }

  static MemberMediumContainerEntity? fromMap(Object? o) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    return MemberMediumContainerEntity(
      memberMediumId: map['memberMediumId'], 
    );
  }

  Map<String, Object?> toDocument() {
    Map<String, Object?> theDocument = HashMap();
    if (memberMediumId != null) theDocument["memberMediumId"] = memberMediumId;
      else theDocument["memberMediumId"] = null;
    return theDocument;
  }

  static MemberMediumContainerEntity? fromJsonString(String json) {
    Map<String, dynamic>? generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

}

