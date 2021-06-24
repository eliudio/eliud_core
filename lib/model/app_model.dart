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

enum PageTransitionAnimation {
  SlideRightToLeft, SlideBottomToTop, ScaleRoute, RotationRoute, FadeRoute, Unknown
}


AppStatus toAppStatus(int? index) {
  switch (index) {
    case 0: return AppStatus.Live;
    case 1: return AppStatus.Offline;
    case 2: return AppStatus.Invisible;
  }
  return AppStatus.Unknown;
}

PageTransitionAnimation toPageTransitionAnimation(int? index) {
  switch (index) {
    case 0: return PageTransitionAnimation.SlideRightToLeft;
    case 1: return PageTransitionAnimation.SlideBottomToTop;
    case 2: return PageTransitionAnimation.ScaleRoute;
    case 3: return PageTransitionAnimation.RotationRoute;
    case 4: return PageTransitionAnimation.FadeRoute;
  }
  return PageTransitionAnimation.Unknown;
}


class AppModel {
  String? documentID;
  String? ownerID;
  String? title;
  String? email;
  String? description;
  AppStatus? appStatus;
  AppHomePageReferencesModel? homePages;
  MemberMediumModel? logo;
  PageTransitionAnimation? routeBuilder;
  int? routeAnimationDuration;

  // This is a copy of logo.url because logo.url is not accessible as a cross-app document. Hence we copy it into this field.
  String? logoURL;
  AppPolicyModel? policies;
  String? styleFamily;
  String? styleName;

  AppModel({this.documentID, this.ownerID, this.title, this.email, this.description, this.appStatus, this.homePages, this.logo, this.routeBuilder, this.routeAnimationDuration, this.logoURL, this.policies, this.styleFamily, this.styleName, })  {
    assert(documentID != null);
  }

  AppModel copyWith({String? documentID, String? ownerID, String? title, String? email, String? description, AppStatus? appStatus, AppHomePageReferencesModel? homePages, MemberMediumModel? logo, PageTransitionAnimation? routeBuilder, int? routeAnimationDuration, String? logoURL, AppPolicyModel? policies, String? styleFamily, String? styleName, }) {
    return AppModel(documentID: documentID ?? this.documentID, ownerID: ownerID ?? this.ownerID, title: title ?? this.title, email: email ?? this.email, description: description ?? this.description, appStatus: appStatus ?? this.appStatus, homePages: homePages ?? this.homePages, logo: logo ?? this.logo, routeBuilder: routeBuilder ?? this.routeBuilder, routeAnimationDuration: routeAnimationDuration ?? this.routeAnimationDuration, logoURL: logoURL ?? this.logoURL, policies: policies ?? this.policies, styleFamily: styleFamily ?? this.styleFamily, styleName: styleName ?? this.styleName, );
  }

  @override
  int get hashCode => documentID.hashCode ^ ownerID.hashCode ^ title.hashCode ^ email.hashCode ^ description.hashCode ^ appStatus.hashCode ^ homePages.hashCode ^ logo.hashCode ^ routeBuilder.hashCode ^ routeAnimationDuration.hashCode ^ logoURL.hashCode ^ policies.hashCode ^ styleFamily.hashCode ^ styleName.hashCode;

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
          homePages == other.homePages &&
          logo == other.logo &&
          routeBuilder == other.routeBuilder &&
          routeAnimationDuration == other.routeAnimationDuration &&
          logoURL == other.logoURL &&
          policies == other.policies &&
          styleFamily == other.styleFamily &&
          styleName == other.styleName;

  @override
  String toString() {
    return 'AppModel{documentID: $documentID, ownerID: $ownerID, title: $title, email: $email, description: $description, appStatus: $appStatus, homePages: $homePages, logo: $logo, routeBuilder: $routeBuilder, routeAnimationDuration: $routeAnimationDuration, logoURL: $logoURL, policies: $policies, styleFamily: $styleFamily, styleName: $styleName}';
  }

  AppEntity toEntity({String? appId}) {
    logoURL = logo != null ? logo!.url : null;
    return AppEntity(
          ownerID: (ownerID != null) ? ownerID : null, 
          title: (title != null) ? title : null, 
          email: (email != null) ? email : null, 
          description: (description != null) ? description : null, 
          appStatus: (appStatus != null) ? appStatus!.index : null, 
          homePages: (homePages != null) ? homePages!.toEntity(appId: appId) : null, 
          logoId: (logo != null) ? logo!.documentID : null, 
          routeBuilder: (routeBuilder != null) ? routeBuilder!.index : null, 
          routeAnimationDuration: (routeAnimationDuration != null) ? routeAnimationDuration : null, 
          logoURL: (logoURL != null) ? logoURL : null, 
          policiesId: (policies != null) ? policies!.documentID : null, 
          styleFamily: (styleFamily != null) ? styleFamily : null, 
          styleName: (styleName != null) ? styleName : null, 
    );
  }

  static AppModel? fromEntity(String documentID, AppEntity? entity) {
    if (entity == null) return null;
    return AppModel(
          documentID: documentID, 
          ownerID: entity.ownerID, 
          title: entity.title, 
          email: entity.email, 
          description: entity.description, 
          appStatus: toAppStatus(entity.appStatus), 
          homePages: 
            AppHomePageReferencesModel.fromEntity(entity.homePages), 
          routeBuilder: toPageTransitionAnimation(entity.routeBuilder), 
          routeAnimationDuration: entity.routeAnimationDuration, 
          logoURL: entity.logoURL, 
          styleFamily: entity.styleFamily, 
          styleName: entity.styleName, 
    );
  }

  static Future<AppModel?> fromEntityPlus(String documentID, AppEntity? entity, { String? appId}) async {
    if (entity == null) return null;

    MemberMediumModel? logoHolder;
    if (entity.logoId != null) {
      try {
          logoHolder = await memberMediumRepository(appId: appId)!.get(entity.logoId);
      } on Exception catch(e) {
        print('Error whilst trying to initialise logo');
        print('Error whilst retrieving memberMedium with id ${entity.logoId}');
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

    return AppModel(
          documentID: documentID, 
          ownerID: entity.ownerID, 
          title: entity.title, 
          email: entity.email, 
          description: entity.description, 
          appStatus: toAppStatus(entity.appStatus), 
          homePages: 
            await AppHomePageReferencesModel.fromEntityPlus(entity.homePages, appId: appId), 
          logo: logoHolder, 
          routeBuilder: toPageTransitionAnimation(entity.routeBuilder), 
          routeAnimationDuration: entity.routeAnimationDuration, 
          logoURL: entity.logoURL, 
          policies: policiesHolder, 
          styleFamily: entity.styleFamily, 
          styleName: entity.styleName, 
    );
  }

}

