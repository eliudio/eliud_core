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

import 'package:eliud_core/core/global_data.dart';
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

enum DarkOrLight {
  Dark, Light, Unknown
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

DarkOrLight toDarkOrLight(int? index) {
  switch (index) {
    case 0: return DarkOrLight.Dark;
    case 1: return DarkOrLight.Light;
  }
  return DarkOrLight.Unknown;
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
  DarkOrLight? darkOrLight;
  AppHomePageReferencesModel? homePages;
  MemberMediumModel? logo;
  RgbModel? formSubmitButtonColor;
  BackgroundModel? formBackground;
  RgbModel? formSubmitButtonTextColor;
  RgbModel? formGroupTitleColor;
  RgbModel? formFieldTextColor;
  RgbModel? formFieldHeaderColor;
  RgbModel? formFieldFocusColor;
  BackgroundModel? formAppBarBackground;
  RgbModel? formAppBarTextColor;
  BackgroundModel? listBackground;
  RgbModel? listTextItemColor;
  RgbModel? floatingButtonForegroundColor;
  RgbModel? floatingButtonBackgroundColor;
  RgbModel? dividerColor;
  RgbModel? iconColor;
  PageTransitionAnimation? routeBuilder;
  int? routeAnimationDuration;

  // This is a copy of logo.url because logo.url is not accessible as a cross-app document. Hence we copy it into this field.
  String? logoURL;
  FontModel? h1;
  FontModel? h2;
  FontModel? h3;
  FontModel? h4;
  FontModel? h5;
  FontModel? fontText;
  FontModel? fontHighlight1;
  FontModel? fontHighlight2;
  FontModel? fontLink;
  AppPolicyModel? policies;

  AppModel({this.documentID, this.ownerID, this.title, this.email, this.description, this.appStatus, this.darkOrLight, this.homePages, this.logo, this.formSubmitButtonColor, this.formBackground, this.formSubmitButtonTextColor, this.formGroupTitleColor, this.formFieldTextColor, this.formFieldHeaderColor, this.formFieldFocusColor, this.formAppBarBackground, this.formAppBarTextColor, this.listBackground, this.listTextItemColor, this.floatingButtonForegroundColor, this.floatingButtonBackgroundColor, this.dividerColor, this.iconColor, this.routeBuilder, this.routeAnimationDuration, this.logoURL, this.h1, this.h2, this.h3, this.h4, this.h5, this.fontText, this.fontHighlight1, this.fontHighlight2, this.fontLink, this.policies, })  {
    assert(documentID != null);
  }

  AppModel copyWith({String? documentID, String? ownerID, String? title, String? email, String? description, AppStatus? appStatus, DarkOrLight? darkOrLight, AppHomePageReferencesModel? homePages, MemberMediumModel? logo, RgbModel? formSubmitButtonColor, BackgroundModel? formBackground, RgbModel? formSubmitButtonTextColor, RgbModel? formGroupTitleColor, RgbModel? formFieldTextColor, RgbModel? formFieldHeaderColor, RgbModel? formFieldFocusColor, BackgroundModel? formAppBarBackground, RgbModel? formAppBarTextColor, BackgroundModel? listBackground, RgbModel? listTextItemColor, RgbModel? floatingButtonForegroundColor, RgbModel? floatingButtonBackgroundColor, RgbModel? dividerColor, RgbModel? iconColor, PageTransitionAnimation? routeBuilder, int? routeAnimationDuration, String? logoURL, FontModel? h1, FontModel? h2, FontModel? h3, FontModel? h4, FontModel? h5, FontModel? fontText, FontModel? fontHighlight1, FontModel? fontHighlight2, FontModel? fontLink, AppPolicyModel? policies, }) {
    return AppModel(documentID: documentID ?? this.documentID, ownerID: ownerID ?? this.ownerID, title: title ?? this.title, email: email ?? this.email, description: description ?? this.description, appStatus: appStatus ?? this.appStatus, darkOrLight: darkOrLight ?? this.darkOrLight, homePages: homePages ?? this.homePages, logo: logo ?? this.logo, formSubmitButtonColor: formSubmitButtonColor ?? this.formSubmitButtonColor, formBackground: formBackground ?? this.formBackground, formSubmitButtonTextColor: formSubmitButtonTextColor ?? this.formSubmitButtonTextColor, formGroupTitleColor: formGroupTitleColor ?? this.formGroupTitleColor, formFieldTextColor: formFieldTextColor ?? this.formFieldTextColor, formFieldHeaderColor: formFieldHeaderColor ?? this.formFieldHeaderColor, formFieldFocusColor: formFieldFocusColor ?? this.formFieldFocusColor, formAppBarBackground: formAppBarBackground ?? this.formAppBarBackground, formAppBarTextColor: formAppBarTextColor ?? this.formAppBarTextColor, listBackground: listBackground ?? this.listBackground, listTextItemColor: listTextItemColor ?? this.listTextItemColor, floatingButtonForegroundColor: floatingButtonForegroundColor ?? this.floatingButtonForegroundColor, floatingButtonBackgroundColor: floatingButtonBackgroundColor ?? this.floatingButtonBackgroundColor, dividerColor: dividerColor ?? this.dividerColor, iconColor: iconColor ?? this.iconColor, routeBuilder: routeBuilder ?? this.routeBuilder, routeAnimationDuration: routeAnimationDuration ?? this.routeAnimationDuration, logoURL: logoURL ?? this.logoURL, h1: h1 ?? this.h1, h2: h2 ?? this.h2, h3: h3 ?? this.h3, h4: h4 ?? this.h4, h5: h5 ?? this.h5, fontText: fontText ?? this.fontText, fontHighlight1: fontHighlight1 ?? this.fontHighlight1, fontHighlight2: fontHighlight2 ?? this.fontHighlight2, fontLink: fontLink ?? this.fontLink, policies: policies ?? this.policies, );
  }

  @override
  int get hashCode => documentID.hashCode ^ ownerID.hashCode ^ title.hashCode ^ email.hashCode ^ description.hashCode ^ appStatus.hashCode ^ darkOrLight.hashCode ^ homePages.hashCode ^ logo.hashCode ^ formSubmitButtonColor.hashCode ^ formBackground.hashCode ^ formSubmitButtonTextColor.hashCode ^ formGroupTitleColor.hashCode ^ formFieldTextColor.hashCode ^ formFieldHeaderColor.hashCode ^ formFieldFocusColor.hashCode ^ formAppBarBackground.hashCode ^ formAppBarTextColor.hashCode ^ listBackground.hashCode ^ listTextItemColor.hashCode ^ floatingButtonForegroundColor.hashCode ^ floatingButtonBackgroundColor.hashCode ^ dividerColor.hashCode ^ iconColor.hashCode ^ routeBuilder.hashCode ^ routeAnimationDuration.hashCode ^ logoURL.hashCode ^ h1.hashCode ^ h2.hashCode ^ h3.hashCode ^ h4.hashCode ^ h5.hashCode ^ fontText.hashCode ^ fontHighlight1.hashCode ^ fontHighlight2.hashCode ^ fontLink.hashCode ^ policies.hashCode;

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
          darkOrLight == other.darkOrLight &&
          homePages == other.homePages &&
          logo == other.logo &&
          formSubmitButtonColor == other.formSubmitButtonColor &&
          formBackground == other.formBackground &&
          formSubmitButtonTextColor == other.formSubmitButtonTextColor &&
          formGroupTitleColor == other.formGroupTitleColor &&
          formFieldTextColor == other.formFieldTextColor &&
          formFieldHeaderColor == other.formFieldHeaderColor &&
          formFieldFocusColor == other.formFieldFocusColor &&
          formAppBarBackground == other.formAppBarBackground &&
          formAppBarTextColor == other.formAppBarTextColor &&
          listBackground == other.listBackground &&
          listTextItemColor == other.listTextItemColor &&
          floatingButtonForegroundColor == other.floatingButtonForegroundColor &&
          floatingButtonBackgroundColor == other.floatingButtonBackgroundColor &&
          dividerColor == other.dividerColor &&
          iconColor == other.iconColor &&
          routeBuilder == other.routeBuilder &&
          routeAnimationDuration == other.routeAnimationDuration &&
          logoURL == other.logoURL &&
          h1 == other.h1 &&
          h2 == other.h2 &&
          h3 == other.h3 &&
          h4 == other.h4 &&
          h5 == other.h5 &&
          fontText == other.fontText &&
          fontHighlight1 == other.fontHighlight1 &&
          fontHighlight2 == other.fontHighlight2 &&
          fontLink == other.fontLink &&
          policies == other.policies;

  @override
  String toString() {
    return 'AppModel{documentID: $documentID, ownerID: $ownerID, title: $title, email: $email, description: $description, appStatus: $appStatus, darkOrLight: $darkOrLight, homePages: $homePages, logo: $logo, formSubmitButtonColor: $formSubmitButtonColor, formBackground: $formBackground, formSubmitButtonTextColor: $formSubmitButtonTextColor, formGroupTitleColor: $formGroupTitleColor, formFieldTextColor: $formFieldTextColor, formFieldHeaderColor: $formFieldHeaderColor, formFieldFocusColor: $formFieldFocusColor, formAppBarBackground: $formAppBarBackground, formAppBarTextColor: $formAppBarTextColor, listBackground: $listBackground, listTextItemColor: $listTextItemColor, floatingButtonForegroundColor: $floatingButtonForegroundColor, floatingButtonBackgroundColor: $floatingButtonBackgroundColor, dividerColor: $dividerColor, iconColor: $iconColor, routeBuilder: $routeBuilder, routeAnimationDuration: $routeAnimationDuration, logoURL: $logoURL, h1: $h1, h2: $h2, h3: $h3, h4: $h4, h5: $h5, fontText: $fontText, fontHighlight1: $fontHighlight1, fontHighlight2: $fontHighlight2, fontLink: $fontLink, policies: $policies}';
  }

  AppEntity toEntity({String? appId}) {
    logoURL = logo != null ? logo!.url : null;
    return AppEntity(
          ownerID: (ownerID != null) ? ownerID : null, 
          title: (title != null) ? title : null, 
          email: (email != null) ? email : null, 
          description: (description != null) ? description : null, 
          appStatus: (appStatus != null) ? appStatus!.index : null, 
          darkOrLight: (darkOrLight != null) ? darkOrLight!.index : null, 
          homePages: (homePages != null) ? homePages!.toEntity(appId: appId) : null, 
          logoId: (logo != null) ? logo!.documentID : null, 
          formSubmitButtonColor: (formSubmitButtonColor != null) ? formSubmitButtonColor!.toEntity(appId: appId) : null, 
          formBackgroundId: (formBackground != null) ? formBackground!.documentID : null, 
          formSubmitButtonTextColor: (formSubmitButtonTextColor != null) ? formSubmitButtonTextColor!.toEntity(appId: appId) : null, 
          formGroupTitleColor: (formGroupTitleColor != null) ? formGroupTitleColor!.toEntity(appId: appId) : null, 
          formFieldTextColor: (formFieldTextColor != null) ? formFieldTextColor!.toEntity(appId: appId) : null, 
          formFieldHeaderColor: (formFieldHeaderColor != null) ? formFieldHeaderColor!.toEntity(appId: appId) : null, 
          formFieldFocusColor: (formFieldFocusColor != null) ? formFieldFocusColor!.toEntity(appId: appId) : null, 
          formAppBarBackgroundId: (formAppBarBackground != null) ? formAppBarBackground!.documentID : null, 
          formAppBarTextColor: (formAppBarTextColor != null) ? formAppBarTextColor!.toEntity(appId: appId) : null, 
          listBackgroundId: (listBackground != null) ? listBackground!.documentID : null, 
          listTextItemColor: (listTextItemColor != null) ? listTextItemColor!.toEntity(appId: appId) : null, 
          floatingButtonForegroundColor: (floatingButtonForegroundColor != null) ? floatingButtonForegroundColor!.toEntity(appId: appId) : null, 
          floatingButtonBackgroundColor: (floatingButtonBackgroundColor != null) ? floatingButtonBackgroundColor!.toEntity(appId: appId) : null, 
          dividerColor: (dividerColor != null) ? dividerColor!.toEntity(appId: appId) : null, 
          iconColor: (iconColor != null) ? iconColor!.toEntity(appId: appId) : null, 
          routeBuilder: (routeBuilder != null) ? routeBuilder!.index : null, 
          routeAnimationDuration: (routeAnimationDuration != null) ? routeAnimationDuration : null, 
          logoURL: (logoURL != null) ? logoURL : null, 
          h1Id: (h1 != null) ? h1!.documentID : null, 
          h2Id: (h2 != null) ? h2!.documentID : null, 
          h3Id: (h3 != null) ? h3!.documentID : null, 
          h4Id: (h4 != null) ? h4!.documentID : null, 
          h5Id: (h5 != null) ? h5!.documentID : null, 
          fontTextId: (fontText != null) ? fontText!.documentID : null, 
          fontHighlight1Id: (fontHighlight1 != null) ? fontHighlight1!.documentID : null, 
          fontHighlight2Id: (fontHighlight2 != null) ? fontHighlight2!.documentID : null, 
          fontLinkId: (fontLink != null) ? fontLink!.documentID : null, 
          policiesId: (policies != null) ? policies!.documentID : null, 
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
          darkOrLight: toDarkOrLight(entity.darkOrLight), 
          homePages: 
            AppHomePageReferencesModel.fromEntity(entity.homePages), 
          formSubmitButtonColor: 
            RgbModel.fromEntity(entity.formSubmitButtonColor), 
          formSubmitButtonTextColor: 
            RgbModel.fromEntity(entity.formSubmitButtonTextColor), 
          formGroupTitleColor: 
            RgbModel.fromEntity(entity.formGroupTitleColor), 
          formFieldTextColor: 
            RgbModel.fromEntity(entity.formFieldTextColor), 
          formFieldHeaderColor: 
            RgbModel.fromEntity(entity.formFieldHeaderColor), 
          formFieldFocusColor: 
            RgbModel.fromEntity(entity.formFieldFocusColor), 
          formAppBarTextColor: 
            RgbModel.fromEntity(entity.formAppBarTextColor), 
          listTextItemColor: 
            RgbModel.fromEntity(entity.listTextItemColor), 
          floatingButtonForegroundColor: 
            RgbModel.fromEntity(entity.floatingButtonForegroundColor), 
          floatingButtonBackgroundColor: 
            RgbModel.fromEntity(entity.floatingButtonBackgroundColor), 
          dividerColor: 
            RgbModel.fromEntity(entity.dividerColor), 
          iconColor: 
            RgbModel.fromEntity(entity.iconColor), 
          routeBuilder: toPageTransitionAnimation(entity.routeBuilder), 
          routeAnimationDuration: entity.routeAnimationDuration, 
          logoURL: entity.logoURL, 
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

    BackgroundModel? formBackgroundHolder;
    if (entity.formBackgroundId != null) {
      try {
          formBackgroundHolder = await backgroundRepository(appId: appId)!.get(entity.formBackgroundId);
      } on Exception catch(e) {
        print('Error whilst trying to initialise formBackground');
        print('Error whilst retrieving background with id ${entity.formBackgroundId}');
        print('Exception: $e');
      }
    }

    BackgroundModel? formAppBarBackgroundHolder;
    if (entity.formAppBarBackgroundId != null) {
      try {
          formAppBarBackgroundHolder = await backgroundRepository(appId: appId)!.get(entity.formAppBarBackgroundId);
      } on Exception catch(e) {
        print('Error whilst trying to initialise formAppBarBackground');
        print('Error whilst retrieving background with id ${entity.formAppBarBackgroundId}');
        print('Exception: $e');
      }
    }

    BackgroundModel? listBackgroundHolder;
    if (entity.listBackgroundId != null) {
      try {
          listBackgroundHolder = await backgroundRepository(appId: appId)!.get(entity.listBackgroundId);
      } on Exception catch(e) {
        print('Error whilst trying to initialise listBackground');
        print('Error whilst retrieving background with id ${entity.listBackgroundId}');
        print('Exception: $e');
      }
    }

    FontModel? h1Holder;
    if (entity.h1Id != null) {
      try {
          h1Holder = await fontRepository(appId: appId)!.get(entity.h1Id);
      } on Exception catch(e) {
        print('Error whilst trying to initialise h1');
        print('Error whilst retrieving font with id ${entity.h1Id}');
        print('Exception: $e');
      }
    }

    FontModel? h2Holder;
    if (entity.h2Id != null) {
      try {
          h2Holder = await fontRepository(appId: appId)!.get(entity.h2Id);
      } on Exception catch(e) {
        print('Error whilst trying to initialise h2');
        print('Error whilst retrieving font with id ${entity.h2Id}');
        print('Exception: $e');
      }
    }

    FontModel? h3Holder;
    if (entity.h3Id != null) {
      try {
          h3Holder = await fontRepository(appId: appId)!.get(entity.h3Id);
      } on Exception catch(e) {
        print('Error whilst trying to initialise h3');
        print('Error whilst retrieving font with id ${entity.h3Id}');
        print('Exception: $e');
      }
    }

    FontModel? h4Holder;
    if (entity.h4Id != null) {
      try {
          h4Holder = await fontRepository(appId: appId)!.get(entity.h4Id);
      } on Exception catch(e) {
        print('Error whilst trying to initialise h4');
        print('Error whilst retrieving font with id ${entity.h4Id}');
        print('Exception: $e');
      }
    }

    FontModel? h5Holder;
    if (entity.h5Id != null) {
      try {
          h5Holder = await fontRepository(appId: appId)!.get(entity.h5Id);
      } on Exception catch(e) {
        print('Error whilst trying to initialise h5');
        print('Error whilst retrieving font with id ${entity.h5Id}');
        print('Exception: $e');
      }
    }

    FontModel? fontTextHolder;
    if (entity.fontTextId != null) {
      try {
          fontTextHolder = await fontRepository(appId: appId)!.get(entity.fontTextId);
      } on Exception catch(e) {
        print('Error whilst trying to initialise fontText');
        print('Error whilst retrieving font with id ${entity.fontTextId}');
        print('Exception: $e');
      }
    }

    FontModel? fontHighlight1Holder;
    if (entity.fontHighlight1Id != null) {
      try {
          fontHighlight1Holder = await fontRepository(appId: appId)!.get(entity.fontHighlight1Id);
      } on Exception catch(e) {
        print('Error whilst trying to initialise fontHighlight1');
        print('Error whilst retrieving font with id ${entity.fontHighlight1Id}');
        print('Exception: $e');
      }
    }

    FontModel? fontHighlight2Holder;
    if (entity.fontHighlight2Id != null) {
      try {
          fontHighlight2Holder = await fontRepository(appId: appId)!.get(entity.fontHighlight2Id);
      } on Exception catch(e) {
        print('Error whilst trying to initialise fontHighlight2');
        print('Error whilst retrieving font with id ${entity.fontHighlight2Id}');
        print('Exception: $e');
      }
    }

    FontModel? fontLinkHolder;
    if (entity.fontLinkId != null) {
      try {
          fontLinkHolder = await fontRepository(appId: appId)!.get(entity.fontLinkId);
      } on Exception catch(e) {
        print('Error whilst trying to initialise fontLink');
        print('Error whilst retrieving font with id ${entity.fontLinkId}');
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
          darkOrLight: toDarkOrLight(entity.darkOrLight), 
          homePages: 
            await AppHomePageReferencesModel.fromEntityPlus(entity.homePages, appId: appId), 
          logo: logoHolder, 
          formSubmitButtonColor: 
            await RgbModel.fromEntityPlus(entity.formSubmitButtonColor, appId: appId), 
          formBackground: formBackgroundHolder, 
          formSubmitButtonTextColor: 
            await RgbModel.fromEntityPlus(entity.formSubmitButtonTextColor, appId: appId), 
          formGroupTitleColor: 
            await RgbModel.fromEntityPlus(entity.formGroupTitleColor, appId: appId), 
          formFieldTextColor: 
            await RgbModel.fromEntityPlus(entity.formFieldTextColor, appId: appId), 
          formFieldHeaderColor: 
            await RgbModel.fromEntityPlus(entity.formFieldHeaderColor, appId: appId), 
          formFieldFocusColor: 
            await RgbModel.fromEntityPlus(entity.formFieldFocusColor, appId: appId), 
          formAppBarBackground: formAppBarBackgroundHolder, 
          formAppBarTextColor: 
            await RgbModel.fromEntityPlus(entity.formAppBarTextColor, appId: appId), 
          listBackground: listBackgroundHolder, 
          listTextItemColor: 
            await RgbModel.fromEntityPlus(entity.listTextItemColor, appId: appId), 
          floatingButtonForegroundColor: 
            await RgbModel.fromEntityPlus(entity.floatingButtonForegroundColor, appId: appId), 
          floatingButtonBackgroundColor: 
            await RgbModel.fromEntityPlus(entity.floatingButtonBackgroundColor, appId: appId), 
          dividerColor: 
            await RgbModel.fromEntityPlus(entity.dividerColor, appId: appId), 
          iconColor: 
            await RgbModel.fromEntityPlus(entity.iconColor, appId: appId), 
          routeBuilder: toPageTransitionAnimation(entity.routeBuilder), 
          routeAnimationDuration: entity.routeAnimationDuration, 
          logoURL: entity.logoURL, 
          h1: h1Holder, 
          h2: h2Holder, 
          h3: h3Holder, 
          h4: h4Holder, 
          h5: h5Holder, 
          fontText: fontTextHolder, 
          fontHighlight1: fontHighlight1Holder, 
          fontHighlight2: fontHighlight2Holder, 
          fontLink: fontLinkHolder, 
          policies: policiesHolder, 
    );
  }

}

