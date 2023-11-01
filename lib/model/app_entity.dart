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
import 'package:eliud_core/tools/random.dart';
import 'package:eliud_core/core/base/entity_base.dart';
import 'package:eliud_core/model/entity_export.dart';

class AppEntity implements EntityBase {
  final String? ownerID;
  final String? title;
  final String? homeURL;
  final String? email;
  final String? description;
  final int? appStatus;
  final String? anonymousProfilePhotoId;
  final AppHomePageReferencesEntity? homePages;
  final String? logoId;
  final String? styleFamily;
  final String? styleName;
  final bool? autoPrivileged1;
  final bool? isFeatured;
  final bool? includeShippingAddress;
  final bool? includeInvoiceAddress;
  final bool? includeSubscriptions;
  final String? welcomeMessage;

  AppEntity({required this.ownerID, this.title, this.homeURL, this.email, this.description, this.appStatus, this.anonymousProfilePhotoId, this.homePages, this.logoId, this.styleFamily, this.styleName, this.autoPrivileged1, this.isFeatured, this.includeShippingAddress, this.includeInvoiceAddress, this.includeSubscriptions, this.welcomeMessage, });

  AppEntity copyWith({String? documentID, String? ownerID, String? title, String? homeURL, String? email, String? description, int? appStatus, String? anonymousProfilePhotoId, AppHomePageReferencesEntity? homePages, String? logoId, String? styleFamily, String? styleName, bool? autoPrivileged1, bool? isFeatured, bool? includeShippingAddress, bool? includeInvoiceAddress, bool? includeSubscriptions, String? welcomeMessage, }) {
    return AppEntity(ownerID : ownerID ?? this.ownerID, title : title ?? this.title, homeURL : homeURL ?? this.homeURL, email : email ?? this.email, description : description ?? this.description, appStatus : appStatus ?? this.appStatus, anonymousProfilePhotoId : anonymousProfilePhotoId ?? this.anonymousProfilePhotoId, homePages : homePages ?? this.homePages, logoId : logoId ?? this.logoId, styleFamily : styleFamily ?? this.styleFamily, styleName : styleName ?? this.styleName, autoPrivileged1 : autoPrivileged1 ?? this.autoPrivileged1, isFeatured : isFeatured ?? this.isFeatured, includeShippingAddress : includeShippingAddress ?? this.includeShippingAddress, includeInvoiceAddress : includeInvoiceAddress ?? this.includeInvoiceAddress, includeSubscriptions : includeSubscriptions ?? this.includeSubscriptions, welcomeMessage : welcomeMessage ?? this.welcomeMessage, );
  }
  List<Object?> get props => [ownerID, title, homeURL, email, description, appStatus, anonymousProfilePhotoId, homePages, logoId, styleFamily, styleName, autoPrivileged1, isFeatured, includeShippingAddress, includeInvoiceAddress, includeSubscriptions, welcomeMessage, ];

  @override
  String toString() {
    return 'AppEntity{ownerID: $ownerID, title: $title, homeURL: $homeURL, email: $email, description: $description, appStatus: $appStatus, anonymousProfilePhotoId: $anonymousProfilePhotoId, homePages: $homePages, logoId: $logoId, styleFamily: $styleFamily, styleName: $styleName, autoPrivileged1: $autoPrivileged1, isFeatured: $isFeatured, includeShippingAddress: $includeShippingAddress, includeInvoiceAddress: $includeInvoiceAddress, includeSubscriptions: $includeSubscriptions, welcomeMessage: $welcomeMessage}';
  }

  static AppEntity? fromMap(Object? o, {Map<String, String>? newDocumentIds}) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    var anonymousProfilePhotoIdNewDocmentId = map['anonymousProfilePhotoId'];
    if ((newDocumentIds != null) && (anonymousProfilePhotoIdNewDocmentId != null)) {
      var anonymousProfilePhotoIdOldDocmentId = anonymousProfilePhotoIdNewDocmentId;
      anonymousProfilePhotoIdNewDocmentId = newRandomKey();
      newDocumentIds[anonymousProfilePhotoIdOldDocmentId] = anonymousProfilePhotoIdNewDocmentId;
    }
    var homePagesFromMap;
    homePagesFromMap = map['homePages'];
    if (homePagesFromMap != null)
      homePagesFromMap = AppHomePageReferencesEntity.fromMap(homePagesFromMap, newDocumentIds: newDocumentIds);
    var logoIdNewDocmentId = map['logoId'];
    if ((newDocumentIds != null) && (logoIdNewDocmentId != null)) {
      var logoIdOldDocmentId = logoIdNewDocmentId;
      logoIdNewDocmentId = newRandomKey();
      newDocumentIds[logoIdOldDocmentId] = logoIdNewDocmentId;
    }

    return AppEntity(
      ownerID: map['ownerID'], 
      title: map['title'], 
      homeURL: map['homeURL'], 
      email: map['email'], 
      description: map['description'], 
      appStatus: map['appStatus'], 
      anonymousProfilePhotoId: anonymousProfilePhotoIdNewDocmentId, 
      homePages: homePagesFromMap, 
      logoId: logoIdNewDocmentId, 
      styleFamily: map['styleFamily'], 
      styleName: map['styleName'], 
      autoPrivileged1: map['autoPrivileged1'], 
      isFeatured: map['isFeatured'], 
      includeShippingAddress: map['includeShippingAddress'], 
      includeInvoiceAddress: map['includeInvoiceAddress'], 
      includeSubscriptions: map['includeSubscriptions'], 
      welcomeMessage: map['welcomeMessage'], 
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
    if (homeURL != null) theDocument["homeURL"] = homeURL;
      else theDocument["homeURL"] = null;
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
    if (styleFamily != null) theDocument["styleFamily"] = styleFamily;
      else theDocument["styleFamily"] = null;
    if (styleName != null) theDocument["styleName"] = styleName;
      else theDocument["styleName"] = null;
    if (autoPrivileged1 != null) theDocument["autoPrivileged1"] = autoPrivileged1;
      else theDocument["autoPrivileged1"] = null;
    if (isFeatured != null) theDocument["isFeatured"] = isFeatured;
      else theDocument["isFeatured"] = null;
    if (includeShippingAddress != null) theDocument["includeShippingAddress"] = includeShippingAddress;
      else theDocument["includeShippingAddress"] = null;
    if (includeInvoiceAddress != null) theDocument["includeInvoiceAddress"] = includeInvoiceAddress;
      else theDocument["includeInvoiceAddress"] = null;
    if (includeSubscriptions != null) theDocument["includeSubscriptions"] = includeSubscriptions;
      else theDocument["includeSubscriptions"] = null;
    if (welcomeMessage != null) theDocument["welcomeMessage"] = welcomeMessage;
      else theDocument["welcomeMessage"] = null;
    return theDocument;
  }

  @override
  AppEntity switchAppId({required String newAppId}) {
    var newEntity = copyWith();
    return newEntity;
  }

  static AppEntity? fromJsonString(String json, {Map<String, String>? newDocumentIds}) {
    Map<String, dynamic>? generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap, newDocumentIds: newDocumentIds);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

  Future<Map<String, Object?>> enrichedDocument(Map<String, Object?> theDocument) async {
    return theDocument;
  }

}

