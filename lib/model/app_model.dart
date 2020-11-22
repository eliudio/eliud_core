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

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
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


AppStatus toAppStatus(int index) {
  switch (index) {
    case 0: return AppStatus.Live;
    case 1: return AppStatus.Offline;
    case 2: return AppStatus.Invisible;
  }
  return AppStatus.Unknown;
}

DarkOrLight toDarkOrLight(int index) {
  switch (index) {
    case 0: return DarkOrLight.Dark;
    case 1: return DarkOrLight.Light;
  }
  return DarkOrLight.Unknown;
}

PageTransitionAnimation toPageTransitionAnimation(int index) {
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
  String documentID;
  String ownerID;
  String title;
  String email;
  String description;
  AppStatus appStatus;
  DarkOrLight darkOrLight;
  PageModel entryPage;
  ImageModel logo;
  RgbModel formSubmitButtonColor;
  BackgroundModel formBackground;
  RgbModel formSubmitButtonTextColor;
  RgbModel formGroupTitleColor;
  RgbModel formFieldTextColor;
  RgbModel formFieldHeaderColor;
  RgbModel formFieldFocusColor;
  BackgroundModel formAppBarBackground;
  RgbModel formAppBarTextColor;
  BackgroundModel listBackground;
  RgbModel listTextItemColor;
  RgbModel floatingButtonForegroundColor;
  RgbModel floatingButtonBackgroundColor;
  RgbModel dividerColor;
  PageTransitionAnimation routeBuilder;
  int routeAnimationDuration;

  // This is a copy of logo.imageURLOriginal because logo.imageURLOriginal is not accessible as a cross-app document. Hence we copy it into this field.
  String logoURL;
  FontModel h1;
  FontModel h2;
  FontModel h3;
  FontModel h4;
  FontModel h5;
  FontModel fontText;
  FontModel fontHighlight1;
  FontModel fontHighlight2;
  FontModel fontLink;

  AppModel({this.documentID, this.ownerID, this.title, this.email, this.description, this.appStatus, this.darkOrLight, this.entryPage, this.logo, this.formSubmitButtonColor, this.formBackground, this.formSubmitButtonTextColor, this.formGroupTitleColor, this.formFieldTextColor, this.formFieldHeaderColor, this.formFieldFocusColor, this.formAppBarBackground, this.formAppBarTextColor, this.listBackground, this.listTextItemColor, this.floatingButtonForegroundColor, this.floatingButtonBackgroundColor, this.dividerColor, this.routeBuilder, this.routeAnimationDuration, this.logoURL, this.h1, this.h2, this.h3, this.h4, this.h5, this.fontText, this.fontHighlight1, this.fontHighlight2, this.fontLink, })  {
    assert(documentID != null);
  }

  AppModel copyWith({String documentID, String ownerID, String title, String email, String description, AppStatus appStatus, DarkOrLight darkOrLight, PageModel entryPage, ImageModel logo, RgbModel formSubmitButtonColor, BackgroundModel formBackground, RgbModel formSubmitButtonTextColor, RgbModel formGroupTitleColor, RgbModel formFieldTextColor, RgbModel formFieldHeaderColor, RgbModel formFieldFocusColor, BackgroundModel formAppBarBackground, RgbModel formAppBarTextColor, BackgroundModel listBackground, RgbModel listTextItemColor, RgbModel floatingButtonForegroundColor, RgbModel floatingButtonBackgroundColor, RgbModel dividerColor, PageTransitionAnimation routeBuilder, int routeAnimationDuration, String logoURL, FontModel h1, FontModel h2, FontModel h3, FontModel h4, FontModel h5, FontModel fontText, FontModel fontHighlight1, FontModel fontHighlight2, FontModel fontLink, }) {
    return AppModel(documentID: documentID ?? this.documentID, ownerID: ownerID ?? this.ownerID, title: title ?? this.title, email: email ?? this.email, description: description ?? this.description, appStatus: appStatus ?? this.appStatus, darkOrLight: darkOrLight ?? this.darkOrLight, entryPage: entryPage ?? this.entryPage, logo: logo ?? this.logo, formSubmitButtonColor: formSubmitButtonColor ?? this.formSubmitButtonColor, formBackground: formBackground ?? this.formBackground, formSubmitButtonTextColor: formSubmitButtonTextColor ?? this.formSubmitButtonTextColor, formGroupTitleColor: formGroupTitleColor ?? this.formGroupTitleColor, formFieldTextColor: formFieldTextColor ?? this.formFieldTextColor, formFieldHeaderColor: formFieldHeaderColor ?? this.formFieldHeaderColor, formFieldFocusColor: formFieldFocusColor ?? this.formFieldFocusColor, formAppBarBackground: formAppBarBackground ?? this.formAppBarBackground, formAppBarTextColor: formAppBarTextColor ?? this.formAppBarTextColor, listBackground: listBackground ?? this.listBackground, listTextItemColor: listTextItemColor ?? this.listTextItemColor, floatingButtonForegroundColor: floatingButtonForegroundColor ?? this.floatingButtonForegroundColor, floatingButtonBackgroundColor: floatingButtonBackgroundColor ?? this.floatingButtonBackgroundColor, dividerColor: dividerColor ?? this.dividerColor, routeBuilder: routeBuilder ?? this.routeBuilder, routeAnimationDuration: routeAnimationDuration ?? this.routeAnimationDuration, logoURL: logoURL ?? this.logoURL, h1: h1 ?? this.h1, h2: h2 ?? this.h2, h3: h3 ?? this.h3, h4: h4 ?? this.h4, h5: h5 ?? this.h5, fontText: fontText ?? this.fontText, fontHighlight1: fontHighlight1 ?? this.fontHighlight1, fontHighlight2: fontHighlight2 ?? this.fontHighlight2, fontLink: fontLink ?? this.fontLink, );
  }

  @override
  int get hashCode => documentID.hashCode ^ ownerID.hashCode ^ title.hashCode ^ email.hashCode ^ description.hashCode ^ appStatus.hashCode ^ darkOrLight.hashCode ^ entryPage.hashCode ^ logo.hashCode ^ formSubmitButtonColor.hashCode ^ formBackground.hashCode ^ formSubmitButtonTextColor.hashCode ^ formGroupTitleColor.hashCode ^ formFieldTextColor.hashCode ^ formFieldHeaderColor.hashCode ^ formFieldFocusColor.hashCode ^ formAppBarBackground.hashCode ^ formAppBarTextColor.hashCode ^ listBackground.hashCode ^ listTextItemColor.hashCode ^ floatingButtonForegroundColor.hashCode ^ floatingButtonBackgroundColor.hashCode ^ dividerColor.hashCode ^ routeBuilder.hashCode ^ routeAnimationDuration.hashCode ^ logoURL.hashCode ^ h1.hashCode ^ h2.hashCode ^ h3.hashCode ^ h4.hashCode ^ h5.hashCode ^ fontText.hashCode ^ fontHighlight1.hashCode ^ fontHighlight2.hashCode ^ fontLink.hashCode;

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
          entryPage == other.entryPage &&
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
          fontLink == other.fontLink;

  @override
  String toString() {
    return 'AppModel{documentID: $documentID, ownerID: $ownerID, title: $title, email: $email, description: $description, appStatus: $appStatus, darkOrLight: $darkOrLight, entryPage: $entryPage, logo: $logo, formSubmitButtonColor: $formSubmitButtonColor, formBackground: $formBackground, formSubmitButtonTextColor: $formSubmitButtonTextColor, formGroupTitleColor: $formGroupTitleColor, formFieldTextColor: $formFieldTextColor, formFieldHeaderColor: $formFieldHeaderColor, formFieldFocusColor: $formFieldFocusColor, formAppBarBackground: $formAppBarBackground, formAppBarTextColor: $formAppBarTextColor, listBackground: $listBackground, listTextItemColor: $listTextItemColor, floatingButtonForegroundColor: $floatingButtonForegroundColor, floatingButtonBackgroundColor: $floatingButtonBackgroundColor, dividerColor: $dividerColor, routeBuilder: $routeBuilder, routeAnimationDuration: $routeAnimationDuration, logoURL: $logoURL, h1: $h1, h2: $h2, h3: $h3, h4: $h4, h5: $h5, fontText: $fontText, fontHighlight1: $fontHighlight1, fontHighlight2: $fontHighlight2, fontLink: $fontLink}';
  }

  AppEntity toEntity({String appId}) {
    logoURL = logo != null ? logo.imageURLOriginal : null;
    return AppEntity(
          ownerID: (ownerID != null) ? ownerID : null, 
          title: (title != null) ? title : null, 
          email: (email != null) ? email : null, 
          description: (description != null) ? description : null, 
          appStatus: (appStatus != null) ? appStatus.index : null, 
          darkOrLight: (darkOrLight != null) ? darkOrLight.index : null, 
          entryPageId: (entryPage != null) ? entryPage.documentID : null, 
          logoId: (logo != null) ? logo.documentID : null, 
          formSubmitButtonColor: (formSubmitButtonColor != null) ? formSubmitButtonColor.toEntity(appId: appId) : null, 
          formBackgroundId: (formBackground != null) ? formBackground.documentID : null, 
          formSubmitButtonTextColor: (formSubmitButtonTextColor != null) ? formSubmitButtonTextColor.toEntity(appId: appId) : null, 
          formGroupTitleColor: (formGroupTitleColor != null) ? formGroupTitleColor.toEntity(appId: appId) : null, 
          formFieldTextColor: (formFieldTextColor != null) ? formFieldTextColor.toEntity(appId: appId) : null, 
          formFieldHeaderColor: (formFieldHeaderColor != null) ? formFieldHeaderColor.toEntity(appId: appId) : null, 
          formFieldFocusColor: (formFieldFocusColor != null) ? formFieldFocusColor.toEntity(appId: appId) : null, 
          formAppBarBackgroundId: (formAppBarBackground != null) ? formAppBarBackground.documentID : null, 
          formAppBarTextColor: (formAppBarTextColor != null) ? formAppBarTextColor.toEntity(appId: appId) : null, 
          listBackgroundId: (listBackground != null) ? listBackground.documentID : null, 
          listTextItemColor: (listTextItemColor != null) ? listTextItemColor.toEntity(appId: appId) : null, 
          floatingButtonForegroundColor: (floatingButtonForegroundColor != null) ? floatingButtonForegroundColor.toEntity(appId: appId) : null, 
          floatingButtonBackgroundColor: (floatingButtonBackgroundColor != null) ? floatingButtonBackgroundColor.toEntity(appId: appId) : null, 
          dividerColor: (dividerColor != null) ? dividerColor.toEntity(appId: appId) : null, 
          routeBuilder: (routeBuilder != null) ? routeBuilder.index : null, 
          routeAnimationDuration: (routeAnimationDuration != null) ? routeAnimationDuration : null, 
          logoURL: (logoURL != null) ? logoURL : null, 
          h1Id: (h1 != null) ? h1.documentID : null, 
          h2Id: (h2 != null) ? h2.documentID : null, 
          h3Id: (h3 != null) ? h3.documentID : null, 
          h4Id: (h4 != null) ? h4.documentID : null, 
          h5Id: (h5 != null) ? h5.documentID : null, 
          fontTextId: (fontText != null) ? fontText.documentID : null, 
          fontHighlight1Id: (fontHighlight1 != null) ? fontHighlight1.documentID : null, 
          fontHighlight2Id: (fontHighlight2 != null) ? fontHighlight2.documentID : null, 
          fontLinkId: (fontLink != null) ? fontLink.documentID : null, 
    );
  }

  static AppModel fromEntity(String documentID, AppEntity entity) {
    if (entity == null) return null;
    return AppModel(
          documentID: documentID, 
          ownerID: entity.ownerID, 
          title: entity.title, 
          email: entity.email, 
          description: entity.description, 
          appStatus: toAppStatus(entity.appStatus), 
          darkOrLight: toDarkOrLight(entity.darkOrLight), 
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
          routeBuilder: toPageTransitionAnimation(entity.routeBuilder), 
          routeAnimationDuration: entity.routeAnimationDuration, 
          logoURL: entity.logoURL, 
    );
  }

  static Future<AppModel> fromEntityPlus(String documentID, AppEntity entity) async {
    if (entity == null) return null;

    PageModel entryPageHolder;
    if (entity.entryPageId != null) {
      try {
        await pageRepository().get(entity.entryPageId).then((val) {
          entryPageHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    ImageModel logoHolder;
    if (entity.logoId != null) {
      try {
        await imageRepository().get(entity.logoId).then((val) {
          logoHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    BackgroundModel formBackgroundHolder;
    if (entity.formBackgroundId != null) {
      try {
        await backgroundRepository().get(entity.formBackgroundId).then((val) {
          formBackgroundHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    BackgroundModel formAppBarBackgroundHolder;
    if (entity.formAppBarBackgroundId != null) {
      try {
        await backgroundRepository().get(entity.formAppBarBackgroundId).then((val) {
          formAppBarBackgroundHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    BackgroundModel listBackgroundHolder;
    if (entity.listBackgroundId != null) {
      try {
        await backgroundRepository().get(entity.listBackgroundId).then((val) {
          listBackgroundHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    FontModel h1Holder;
    if (entity.h1Id != null) {
      try {
        await fontRepository().get(entity.h1Id).then((val) {
          h1Holder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    FontModel h2Holder;
    if (entity.h2Id != null) {
      try {
        await fontRepository().get(entity.h2Id).then((val) {
          h2Holder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    FontModel h3Holder;
    if (entity.h3Id != null) {
      try {
        await fontRepository().get(entity.h3Id).then((val) {
          h3Holder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    FontModel h4Holder;
    if (entity.h4Id != null) {
      try {
        await fontRepository().get(entity.h4Id).then((val) {
          h4Holder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    FontModel h5Holder;
    if (entity.h5Id != null) {
      try {
        await fontRepository().get(entity.h5Id).then((val) {
          h5Holder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    FontModel fontTextHolder;
    if (entity.fontTextId != null) {
      try {
        await fontRepository().get(entity.fontTextId).then((val) {
          fontTextHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    FontModel fontHighlight1Holder;
    if (entity.fontHighlight1Id != null) {
      try {
        await fontRepository().get(entity.fontHighlight1Id).then((val) {
          fontHighlight1Holder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    FontModel fontHighlight2Holder;
    if (entity.fontHighlight2Id != null) {
      try {
        await fontRepository().get(entity.fontHighlight2Id).then((val) {
          fontHighlight2Holder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    FontModel fontLinkHolder;
    if (entity.fontLinkId != null) {
      try {
        await fontRepository().get(entity.fontLinkId).then((val) {
          fontLinkHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    return AppModel(
          documentID: documentID, 
          ownerID: entity.ownerID, 
          title: entity.title, 
          email: entity.email, 
          description: entity.description, 
          appStatus: toAppStatus(entity.appStatus), 
          darkOrLight: toDarkOrLight(entity.darkOrLight), 
          entryPage: entryPageHolder, 
          logo: logoHolder, 
          formSubmitButtonColor: 
            await RgbModel.fromEntityPlus(entity.formSubmitButtonColor), 
          formBackground: formBackgroundHolder, 
          formSubmitButtonTextColor: 
            await RgbModel.fromEntityPlus(entity.formSubmitButtonTextColor), 
          formGroupTitleColor: 
            await RgbModel.fromEntityPlus(entity.formGroupTitleColor), 
          formFieldTextColor: 
            await RgbModel.fromEntityPlus(entity.formFieldTextColor), 
          formFieldHeaderColor: 
            await RgbModel.fromEntityPlus(entity.formFieldHeaderColor), 
          formFieldFocusColor: 
            await RgbModel.fromEntityPlus(entity.formFieldFocusColor), 
          formAppBarBackground: formAppBarBackgroundHolder, 
          formAppBarTextColor: 
            await RgbModel.fromEntityPlus(entity.formAppBarTextColor), 
          listBackground: listBackgroundHolder, 
          listTextItemColor: 
            await RgbModel.fromEntityPlus(entity.listTextItemColor), 
          floatingButtonForegroundColor: 
            await RgbModel.fromEntityPlus(entity.floatingButtonForegroundColor), 
          floatingButtonBackgroundColor: 
            await RgbModel.fromEntityPlus(entity.floatingButtonBackgroundColor), 
          dividerColor: 
            await RgbModel.fromEntityPlus(entity.dividerColor), 
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
    );
  }

}

