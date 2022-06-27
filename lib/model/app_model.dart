/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 app_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/tools/common_tools.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/core/base/model_base.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:eliud_core/model/app_model.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_core/model/entity_export.dart';


import 'package:eliud_core/model/app_entity.dart';

import 'package:eliud_core/tools/random.dart';

enum AppStatus {
  Live, Offline, Invisible, Unknown
}


AppStatus toAppStatus(int? index) {
  switch (index) {
    case 0: return AppStatus.Live;
    case 1: return AppStatus.Offline;
    case 2: return AppStatus.Invisible;
  }
  return AppStatus.Unknown;
}


class AppModel implements ModelBase {
  static const String packageName = 'eliud_core';
  static const String id = 'App';

  String documentID;
  String ownerID;
  String? title;
  String? email;
  String? description;
  AppStatus? appStatus;
  PublicMediumModel? anonymousProfilePhoto;
  AppHomePageReferencesModel? homePages;
  PublicMediumModel? logo;
  AppPolicyModel? policies;
  String? styleFamily;
  String? styleName;

  // When set, any new joining member will have privilegeLevel = 1
  bool? autoPrivileged1;

  // Is Featured
  bool? isFeatured;

  AppModel({required this.documentID, required this.ownerID, this.title, this.email, this.description, this.appStatus, this.anonymousProfilePhoto, this.homePages, this.logo, this.policies, this.styleFamily, this.styleName, this.autoPrivileged1, this.isFeatured, })  {
    assert(documentID != null);
  }

  AppModel copyWith({String? documentID, String? ownerID, String? title, String? email, String? description, AppStatus? appStatus, PublicMediumModel? anonymousProfilePhoto, AppHomePageReferencesModel? homePages, PublicMediumModel? logo, AppPolicyModel? policies, String? styleFamily, String? styleName, bool? autoPrivileged1, bool? isFeatured, }) {
    return AppModel(documentID: documentID ?? this.documentID, ownerID: ownerID ?? this.ownerID, title: title ?? this.title, email: email ?? this.email, description: description ?? this.description, appStatus: appStatus ?? this.appStatus, anonymousProfilePhoto: anonymousProfilePhoto ?? this.anonymousProfilePhoto, homePages: homePages ?? this.homePages, logo: logo ?? this.logo, policies: policies ?? this.policies, styleFamily: styleFamily ?? this.styleFamily, styleName: styleName ?? this.styleName, autoPrivileged1: autoPrivileged1 ?? this.autoPrivileged1, isFeatured: isFeatured ?? this.isFeatured, );
  }

  @override
  int get hashCode => documentID.hashCode ^ ownerID.hashCode ^ title.hashCode ^ email.hashCode ^ description.hashCode ^ appStatus.hashCode ^ anonymousProfilePhoto.hashCode ^ homePages.hashCode ^ logo.hashCode ^ policies.hashCode ^ styleFamily.hashCode ^ styleName.hashCode ^ autoPrivileged1.hashCode ^ isFeatured.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is AppModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          ownerID == other.ownerID &&
          title == other.title &&
          email == other.email &&
          description == other.description &&
          appStatus == other.appStatus &&
          anonymousProfilePhoto == other.anonymousProfilePhoto &&
          homePages == other.homePages &&
          logo == other.logo &&
          policies == other.policies &&
          styleFamily == other.styleFamily &&
          styleName == other.styleName &&
          autoPrivileged1 == other.autoPrivileged1 &&
          isFeatured == other.isFeatured;

  @override
  String toString() {
    return 'AppModel{documentID: $documentID, ownerID: $ownerID, title: $title, email: $email, description: $description, appStatus: $appStatus, anonymousProfilePhoto: $anonymousProfilePhoto, homePages: $homePages, logo: $logo, policies: $policies, styleFamily: $styleFamily, styleName: $styleName, autoPrivileged1: $autoPrivileged1, isFeatured: $isFeatured}';
  }

  AppEntity toEntity({String? appId, Set<ModelReference>? referencesCollector}) {
    if (referencesCollector != null) {
      if (anonymousProfilePhoto != null) referencesCollector.add(ModelReference(PublicMediumModel.packageName, PublicMediumModel.id, anonymousProfilePhoto!));
      if (logo != null) referencesCollector.add(ModelReference(PublicMediumModel.packageName, PublicMediumModel.id, logo!));
      if (policies != null) referencesCollector.add(ModelReference(AppPolicyModel.packageName, AppPolicyModel.id, policies!));
    }
    return AppEntity(
          ownerID: (ownerID != null) ? ownerID : null, 
          title: (title != null) ? title : null, 
          email: (email != null) ? email : null, 
          description: (description != null) ? description : null, 
          appStatus: (appStatus != null) ? appStatus!.index : null, 
          anonymousProfilePhotoId: (anonymousProfilePhoto != null) ? anonymousProfilePhoto!.documentID : null, 
          homePages: (homePages != null) ? homePages!.toEntity(appId: appId, referencesCollector: referencesCollector) : null, 
          logoId: (logo != null) ? logo!.documentID : null, 
          policiesId: (policies != null) ? policies!.documentID : null, 
          styleFamily: (styleFamily != null) ? styleFamily : null, 
          styleName: (styleName != null) ? styleName : null, 
          autoPrivileged1: (autoPrivileged1 != null) ? autoPrivileged1 : null, 
          isFeatured: (isFeatured != null) ? isFeatured : null, 
    );
  }

  static Future<AppModel?> fromEntity(String documentID, AppEntity? entity) async {
    if (entity == null) return null;
    var counter = 0;
    return AppModel(
          documentID: documentID, 
          ownerID: entity.ownerID ?? '', 
          title: entity.title, 
          email: entity.email, 
          description: entity.description, 
          appStatus: toAppStatus(entity.appStatus), 
          homePages: 
            await AppHomePageReferencesModel.fromEntity(entity.homePages), 
          styleFamily: entity.styleFamily, 
          styleName: entity.styleName, 
          autoPrivileged1: entity.autoPrivileged1, 
          isFeatured: entity.isFeatured, 
    );
  }

  static Future<AppModel?> fromEntityPlus(String documentID, AppEntity? entity, { String? appId}) async {
    if (entity == null) return null;

    PublicMediumModel? anonymousProfilePhotoHolder;
    if (entity.anonymousProfilePhotoId != null) {
      try {
          anonymousProfilePhotoHolder = await publicMediumRepository(appId: appId)!.get(entity.anonymousProfilePhotoId);
      } on Exception catch(e) {
        print('Error whilst trying to initialise anonymousProfilePhoto');
        print('Error whilst retrieving publicMedium with id ${entity.anonymousProfilePhotoId}');
        print('Exception: $e');
      }
    }

    PublicMediumModel? logoHolder;
    if (entity.logoId != null) {
      try {
          logoHolder = await publicMediumRepository(appId: appId)!.get(entity.logoId);
      } on Exception catch(e) {
        print('Error whilst trying to initialise logo');
        print('Error whilst retrieving publicMedium with id ${entity.logoId}');
        print('Exception: $e');
      }
    }

    AppPolicyModel? policiesHolder;
    if (entity.policiesId != null) {
      try {
          policiesHolder = await appPolicyRepository(appId: appId)!.get(entity.policiesId);
      } on Exception catch(e) {
        print('Error whilst trying to initialise policies');
        print('Error whilst retrieving appPolicy with id ${entity.policiesId}');
        print('Exception: $e');
      }
    }

    var counter = 0;
    return AppModel(
          documentID: documentID, 
          ownerID: entity.ownerID ?? '', 
          title: entity.title, 
          email: entity.email, 
          description: entity.description, 
          appStatus: toAppStatus(entity.appStatus), 
          anonymousProfilePhoto: anonymousProfilePhotoHolder, 
          homePages: 
            await AppHomePageReferencesModel.fromEntityPlus(entity.homePages, appId: appId), 
          logo: logoHolder, 
          policies: policiesHolder, 
          styleFamily: entity.styleFamily, 
          styleName: entity.styleName, 
          autoPrivileged1: entity.autoPrivileged1, 
          isFeatured: entity.isFeatured, 
    );
  }

}

