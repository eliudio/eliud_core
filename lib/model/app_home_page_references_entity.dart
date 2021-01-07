/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 app_home_page_references_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'package:eliud_core/tools/common_tools.dart';
import 'abstract_repository_singleton.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_core/model/entity_export.dart';

class AppHomePageReferencesEntity {
  final String homePageBlockedMemberId;
  final String homePageSubscribedMemberId;
  final String homePageLevel1MemberId;
  final String homePageLevel2MemberId;
  final String homePageOwnerId;

  AppHomePageReferencesEntity({this.homePageBlockedMemberId, this.homePageSubscribedMemberId, this.homePageLevel1MemberId, this.homePageLevel2MemberId, this.homePageOwnerId, });


  List<Object> get props => [homePageBlockedMemberId, homePageSubscribedMemberId, homePageLevel1MemberId, homePageLevel2MemberId, homePageOwnerId, ];

  @override
  String toString() {
    return 'AppHomePageReferencesEntity{homePageBlockedMemberId: $homePageBlockedMemberId, homePageSubscribedMemberId: $homePageSubscribedMemberId, homePageLevel1MemberId: $homePageLevel1MemberId, homePageLevel2MemberId: $homePageLevel2MemberId, homePageOwnerId: $homePageOwnerId}';
  }

  static AppHomePageReferencesEntity fromMap(Map map) {
    if (map == null) return null;

    return AppHomePageReferencesEntity(
      homePageBlockedMemberId: map['homePageBlockedMemberId'], 
      homePageSubscribedMemberId: map['homePageSubscribedMemberId'], 
      homePageLevel1MemberId: map['homePageLevel1MemberId'], 
      homePageLevel2MemberId: map['homePageLevel2MemberId'], 
      homePageOwnerId: map['homePageOwnerId'], 
    );
  }

  Map<String, Object> toDocument() {
    Map<String, Object> theDocument = HashMap();
    if (homePageBlockedMemberId != null) theDocument["homePageBlockedMemberId"] = homePageBlockedMemberId;
      else theDocument["homePageBlockedMemberId"] = null;
    if (homePageSubscribedMemberId != null) theDocument["homePageSubscribedMemberId"] = homePageSubscribedMemberId;
      else theDocument["homePageSubscribedMemberId"] = null;
    if (homePageLevel1MemberId != null) theDocument["homePageLevel1MemberId"] = homePageLevel1MemberId;
      else theDocument["homePageLevel1MemberId"] = null;
    if (homePageLevel2MemberId != null) theDocument["homePageLevel2MemberId"] = homePageLevel2MemberId;
      else theDocument["homePageLevel2MemberId"] = null;
    if (homePageOwnerId != null) theDocument["homePageOwnerId"] = homePageOwnerId;
      else theDocument["homePageOwnerId"] = null;
    return theDocument;
  }

  static AppHomePageReferencesEntity fromJsonString(String json) {
    Map<String, dynamic> generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

}

