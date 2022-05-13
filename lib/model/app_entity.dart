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
  final String? anonymousProfilePhotoId;
  final AppHomePageReferencesEntity? homePages;
  final String? logoId;
  final String? policiesId;
  final String? styleFamily;
  final String? styleName;
  final bool? autoPrivileged1;
  final bool? isFeatured;

  AppEntity({this.ownerID, this.title, this.email, this.description, this.appStatus, this.anonymousProfilePhotoId, this.homePages, this.logoId, this.policiesId, this.styleFamily, this.styleName, this.autoPrivileged1, this.isFeatured, });


  List<Object?> get props => [ownerID, title, email, description, appStatus, anonymousProfilePhotoId, homePages, logoId, policiesId, styleFamily, styleName, autoPrivileged1, isFeatured, ];

  @override
  String toString() {
    return 'AppEntity{ownerID: $ownerID, title: $title, email: $email, description: $description, appStatus: $appStatus, anonymousProfilePhotoId: $anonymousProfilePhotoId, homePages: $homePages, logoId: $logoId, policiesId: $policiesId, styleFamily: $styleFamily, styleName: $styleName, autoPrivileged1: $autoPrivileged1, isFeatured: $isFeatured}';
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
      anonymousProfilePhotoId: map['anonymousProfilePhotoId'], 
      homePages: homePagesFromMap, 
      logoId: map['logoId'], 
      policiesId: map['policiesId'], 
      styleFamily: map['styleFamily'], 
      styleName: map['styleName'], 
      autoPrivileged1: map['autoPrivileged1'], 
      isFeatured: map['isFeatured'], 
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
    if (anonymousProfilePhotoId != null) theDocument["anonymousProfilePhotoId"] = anonymousProfilePhotoId;
      else theDocument["anonymousProfilePhotoId"] = null;
    if (homePages != null) theDocument["homePages"] = homePagesMap;
      else theDocument["homePages"] = null;
    if (logoId != null) theDocument["logoId"] = logoId;
      else theDocument["logoId"] = null;
    if (policiesId != null) theDocument["policiesId"] = policiesId;
      else theDocument["policiesId"] = null;
    if (styleFamily != null) theDocument["styleFamily"] = styleFamily;
      else theDocument["styleFamily"] = null;
    if (styleName != null) theDocument["styleName"] = styleName;
      else theDocument["styleName"] = null;
    if (autoPrivileged1 != null) theDocument["autoPrivileged1"] = autoPrivileged1;
      else theDocument["autoPrivileged1"] = null;
    if (isFeatured != null) theDocument["isFeatured"] = isFeatured;
      else theDocument["isFeatured"] = null;
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

