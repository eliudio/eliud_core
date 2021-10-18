/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 app_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'abstract_repository_singleton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_core/model/entity_export.dart';

import 'package:eliud_core/tools/common_tools.dart';
class AppEntity {
  final String? ownerID;
  final String? title;
  final String? email;
  final String? description;
  final int? appStatus;
  final AppHomePageReferencesEntity? homePages;
  final String? logoId;
  final int? routeBuilder;
  final int? routeAnimationDuration;
  final String? policiesId;
  final String? styleFamily;
  final String? styleName;

  AppEntity({this.ownerID, this.title, this.email, this.description, this.appStatus, this.homePages, this.logoId, this.routeBuilder, this.routeAnimationDuration, this.policiesId, this.styleFamily, this.styleName, });


  List<Object?> get props => [ownerID, title, email, description, appStatus, homePages, logoId, routeBuilder, routeAnimationDuration, policiesId, styleFamily, styleName, ];

  @override
  String toString() {
    return 'AppEntity{ownerID: $ownerID, title: $title, email: $email, description: $description, appStatus: $appStatus, homePages: $homePages, logoId: $logoId, routeBuilder: $routeBuilder, routeAnimationDuration: $routeAnimationDuration, policiesId: $policiesId, styleFamily: $styleFamily, styleName: $styleName}';
  }

  static AppEntity? fromMap(Object? o) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    var homePagesFromMap;
    homePagesFromMap = map['homePages'];
    if (homePagesFromMap != null)
      homePagesFromMap = AppHomePageReferencesEntity.fromMap(homePagesFromMap);

    return AppEntity(
      ownerID: map['ownerID'], 
      title: map['title'], 
      email: map['email'], 
      description: map['description'], 
      appStatus: map['appStatus'], 
      homePages: homePagesFromMap, 
      logoId: map['logoId'], 
      routeBuilder: map['routeBuilder'], 
      routeAnimationDuration: int.tryParse(map['routeAnimationDuration'].toString()), 
      policiesId: map['policiesId'], 
      styleFamily: map['styleFamily'], 
      styleName: map['styleName'], 
    );
  }

  Map<String, Object?> toDocument() {
    final Map<String, dynamic>? homePagesMap = homePages != null 
        ? homePages!.toDocument()
        : null;

    Map<String, Object?> theDocument = HashMap();
    if (ownerID != null) theDocument["ownerID"] = ownerID;
      else theDocument["ownerID"] = null;
    if (title != null) theDocument["title"] = title;
      else theDocument["title"] = null;
    if (email != null) theDocument["email"] = email;
      else theDocument["email"] = null;
    if (description != null) theDocument["description"] = description;
      else theDocument["description"] = null;
    if (appStatus != null) theDocument["appStatus"] = appStatus;
      else theDocument["appStatus"] = null;
    if (homePages != null) theDocument["homePages"] = homePagesMap;
      else theDocument["homePages"] = null;
    if (logoId != null) theDocument["logoId"] = logoId;
      else theDocument["logoId"] = null;
    if (routeBuilder != null) theDocument["routeBuilder"] = routeBuilder;
      else theDocument["routeBuilder"] = null;
    if (routeAnimationDuration != null) theDocument["routeAnimationDuration"] = routeAnimationDuration;
      else theDocument["routeAnimationDuration"] = null;
    if (policiesId != null) theDocument["policiesId"] = policiesId;
      else theDocument["policiesId"] = null;
    if (styleFamily != null) theDocument["styleFamily"] = styleFamily;
      else theDocument["styleFamily"] = null;
    if (styleName != null) theDocument["styleName"] = styleName;
      else theDocument["styleName"] = null;
    return theDocument;
  }

  static AppEntity? fromJsonString(String json) {
    Map<String, dynamic>? generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

}

