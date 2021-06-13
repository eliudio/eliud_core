/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 eliud_style_attributes_model.dart
                       
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


import 'package:eliud_core/model/eliud_style_attributes_entity.dart';

import 'package:eliud_core/tools/random.dart';



class EliudStyleAttributesModel {
  String? documentID;
  String? description;
  RgbModel? formSubmitButtonColor;

  // Background of forms in admin section
  BackgroundModel? formBackground;

  // Background of pages in app
  BackgroundModel? appBackground;
  RgbModel? formSubmitButtonTextColor;
  RgbModel? formGroupTitleColor;
  RgbModel? formFieldTextColor;
  RgbModel? formFieldHeaderColor;
  RgbModel? formFieldFocusColor;
  BackgroundModel? formAppBarBackground;
  RgbModel? formAppBarTextColor;

  // Background of list in admin section
  BackgroundModel? listBackground;
  RgbModel? listTextItemColor;
  RgbModel? floatingButtonForegroundColor;
  RgbModel? floatingButtonBackgroundColor;
  RgbModel? dividerColor;
  RgbModel? iconColor;

  // Override the style background
  BackgroundModel? backgroundHomeMenu;
  RgbModel? backgroundColorHomeMenu;
  RgbModel? iconColorHomeMenu;
  FontModel? h1;
  FontModel? h2;
  FontModel? h3;
  FontModel? h4;
  FontModel? h5;
  FontModel? fontText;
  FontModel? fontHighlight1;
  FontModel? fontHighlight2;
  FontModel? fontLink;

  EliudStyleAttributesModel({this.documentID, this.description, this.formSubmitButtonColor, this.formBackground, this.appBackground, this.formSubmitButtonTextColor, this.formGroupTitleColor, this.formFieldTextColor, this.formFieldHeaderColor, this.formFieldFocusColor, this.formAppBarBackground, this.formAppBarTextColor, this.listBackground, this.listTextItemColor, this.floatingButtonForegroundColor, this.floatingButtonBackgroundColor, this.dividerColor, this.iconColor, this.backgroundHomeMenu, this.backgroundColorHomeMenu, this.iconColorHomeMenu, this.h1, this.h2, this.h3, this.h4, this.h5, this.fontText, this.fontHighlight1, this.fontHighlight2, this.fontLink, })  {
    assert(documentID != null);
  }

  EliudStyleAttributesModel copyWith({String? documentID, String? description, RgbModel? formSubmitButtonColor, BackgroundModel? formBackground, BackgroundModel? appBackground, RgbModel? formSubmitButtonTextColor, RgbModel? formGroupTitleColor, RgbModel? formFieldTextColor, RgbModel? formFieldHeaderColor, RgbModel? formFieldFocusColor, BackgroundModel? formAppBarBackground, RgbModel? formAppBarTextColor, BackgroundModel? listBackground, RgbModel? listTextItemColor, RgbModel? floatingButtonForegroundColor, RgbModel? floatingButtonBackgroundColor, RgbModel? dividerColor, RgbModel? iconColor, BackgroundModel? backgroundHomeMenu, RgbModel? backgroundColorHomeMenu, RgbModel? iconColorHomeMenu, FontModel? h1, FontModel? h2, FontModel? h3, FontModel? h4, FontModel? h5, FontModel? fontText, FontModel? fontHighlight1, FontModel? fontHighlight2, FontModel? fontLink, }) {
    return EliudStyleAttributesModel(documentID: documentID ?? this.documentID, description: description ?? this.description, formSubmitButtonColor: formSubmitButtonColor ?? this.formSubmitButtonColor, formBackground: formBackground ?? this.formBackground, appBackground: appBackground ?? this.appBackground, formSubmitButtonTextColor: formSubmitButtonTextColor ?? this.formSubmitButtonTextColor, formGroupTitleColor: formGroupTitleColor ?? this.formGroupTitleColor, formFieldTextColor: formFieldTextColor ?? this.formFieldTextColor, formFieldHeaderColor: formFieldHeaderColor ?? this.formFieldHeaderColor, formFieldFocusColor: formFieldFocusColor ?? this.formFieldFocusColor, formAppBarBackground: formAppBarBackground ?? this.formAppBarBackground, formAppBarTextColor: formAppBarTextColor ?? this.formAppBarTextColor, listBackground: listBackground ?? this.listBackground, listTextItemColor: listTextItemColor ?? this.listTextItemColor, floatingButtonForegroundColor: floatingButtonForegroundColor ?? this.floatingButtonForegroundColor, floatingButtonBackgroundColor: floatingButtonBackgroundColor ?? this.floatingButtonBackgroundColor, dividerColor: dividerColor ?? this.dividerColor, iconColor: iconColor ?? this.iconColor, backgroundHomeMenu: backgroundHomeMenu ?? this.backgroundHomeMenu, backgroundColorHomeMenu: backgroundColorHomeMenu ?? this.backgroundColorHomeMenu, iconColorHomeMenu: iconColorHomeMenu ?? this.iconColorHomeMenu, h1: h1 ?? this.h1, h2: h2 ?? this.h2, h3: h3 ?? this.h3, h4: h4 ?? this.h4, h5: h5 ?? this.h5, fontText: fontText ?? this.fontText, fontHighlight1: fontHighlight1 ?? this.fontHighlight1, fontHighlight2: fontHighlight2 ?? this.fontHighlight2, fontLink: fontLink ?? this.fontLink, );
  }

  @override
  int get hashCode => documentID.hashCode ^ description.hashCode ^ formSubmitButtonColor.hashCode ^ formBackground.hashCode ^ appBackground.hashCode ^ formSubmitButtonTextColor.hashCode ^ formGroupTitleColor.hashCode ^ formFieldTextColor.hashCode ^ formFieldHeaderColor.hashCode ^ formFieldFocusColor.hashCode ^ formAppBarBackground.hashCode ^ formAppBarTextColor.hashCode ^ listBackground.hashCode ^ listTextItemColor.hashCode ^ floatingButtonForegroundColor.hashCode ^ floatingButtonBackgroundColor.hashCode ^ dividerColor.hashCode ^ iconColor.hashCode ^ backgroundHomeMenu.hashCode ^ backgroundColorHomeMenu.hashCode ^ iconColorHomeMenu.hashCode ^ h1.hashCode ^ h2.hashCode ^ h3.hashCode ^ h4.hashCode ^ h5.hashCode ^ fontText.hashCode ^ fontHighlight1.hashCode ^ fontHighlight2.hashCode ^ fontLink.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is EliudStyleAttributesModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          description == other.description &&
          formSubmitButtonColor == other.formSubmitButtonColor &&
          formBackground == other.formBackground &&
          appBackground == other.appBackground &&
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
          backgroundHomeMenu == other.backgroundHomeMenu &&
          backgroundColorHomeMenu == other.backgroundColorHomeMenu &&
          iconColorHomeMenu == other.iconColorHomeMenu &&
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
    return 'EliudStyleAttributesModel{documentID: $documentID, description: $description, formSubmitButtonColor: $formSubmitButtonColor, formBackground: $formBackground, appBackground: $appBackground, formSubmitButtonTextColor: $formSubmitButtonTextColor, formGroupTitleColor: $formGroupTitleColor, formFieldTextColor: $formFieldTextColor, formFieldHeaderColor: $formFieldHeaderColor, formFieldFocusColor: $formFieldFocusColor, formAppBarBackground: $formAppBarBackground, formAppBarTextColor: $formAppBarTextColor, listBackground: $listBackground, listTextItemColor: $listTextItemColor, floatingButtonForegroundColor: $floatingButtonForegroundColor, floatingButtonBackgroundColor: $floatingButtonBackgroundColor, dividerColor: $dividerColor, iconColor: $iconColor, backgroundHomeMenu: $backgroundHomeMenu, backgroundColorHomeMenu: $backgroundColorHomeMenu, iconColorHomeMenu: $iconColorHomeMenu, h1: $h1, h2: $h2, h3: $h3, h4: $h4, h5: $h5, fontText: $fontText, fontHighlight1: $fontHighlight1, fontHighlight2: $fontHighlight2, fontLink: $fontLink}';
  }

  EliudStyleAttributesEntity toEntity({String? appId}) {
    return EliudStyleAttributesEntity(
          description: (description != null) ? description : null, 
          formSubmitButtonColor: (formSubmitButtonColor != null) ? formSubmitButtonColor!.toEntity(appId: appId) : null, 
          formBackgroundId: (formBackground != null) ? formBackground!.documentID : null, 
          appBackgroundId: (appBackground != null) ? appBackground!.documentID : null, 
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
          backgroundHomeMenuId: (backgroundHomeMenu != null) ? backgroundHomeMenu!.documentID : null, 
          backgroundColorHomeMenu: (backgroundColorHomeMenu != null) ? backgroundColorHomeMenu!.toEntity(appId: appId) : null, 
          iconColorHomeMenu: (iconColorHomeMenu != null) ? iconColorHomeMenu!.toEntity(appId: appId) : null, 
          h1Id: (h1 != null) ? h1!.documentID : null, 
          h2Id: (h2 != null) ? h2!.documentID : null, 
          h3Id: (h3 != null) ? h3!.documentID : null, 
          h4Id: (h4 != null) ? h4!.documentID : null, 
          h5Id: (h5 != null) ? h5!.documentID : null, 
          fontTextId: (fontText != null) ? fontText!.documentID : null, 
          fontHighlight1Id: (fontHighlight1 != null) ? fontHighlight1!.documentID : null, 
          fontHighlight2Id: (fontHighlight2 != null) ? fontHighlight2!.documentID : null, 
          fontLinkId: (fontLink != null) ? fontLink!.documentID : null, 
    );
  }

  static EliudStyleAttributesModel? fromEntity(String documentID, EliudStyleAttributesEntity? entity) {
    if (entity == null) return null;
    return EliudStyleAttributesModel(
          documentID: documentID, 
          description: entity.description, 
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
          backgroundColorHomeMenu: 
            RgbModel.fromEntity(entity.backgroundColorHomeMenu), 
          iconColorHomeMenu: 
            RgbModel.fromEntity(entity.iconColorHomeMenu), 
    );
  }

  static Future<EliudStyleAttributesModel?> fromEntityPlus(String documentID, EliudStyleAttributesEntity? entity, { String? appId}) async {
    if (entity == null) return null;

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

    BackgroundModel? appBackgroundHolder;
    if (entity.appBackgroundId != null) {
      try {
          appBackgroundHolder = await backgroundRepository(appId: appId)!.get(entity.appBackgroundId);
      } on Exception catch(e) {
        print('Error whilst trying to initialise appBackground');
        print('Error whilst retrieving background with id ${entity.appBackgroundId}');
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

    BackgroundModel? backgroundHomeMenuHolder;
    if (entity.backgroundHomeMenuId != null) {
      try {
          backgroundHomeMenuHolder = await backgroundRepository(appId: appId)!.get(entity.backgroundHomeMenuId);
      } on Exception catch(e) {
        print('Error whilst trying to initialise backgroundHomeMenu');
        print('Error whilst retrieving background with id ${entity.backgroundHomeMenuId}');
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

    return EliudStyleAttributesModel(
          documentID: documentID, 
          description: entity.description, 
          formSubmitButtonColor: 
            await RgbModel.fromEntityPlus(entity.formSubmitButtonColor, appId: appId), 
          formBackground: formBackgroundHolder, 
          appBackground: appBackgroundHolder, 
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
          backgroundHomeMenu: backgroundHomeMenuHolder, 
          backgroundColorHomeMenu: 
            await RgbModel.fromEntityPlus(entity.backgroundColorHomeMenu, appId: appId), 
          iconColorHomeMenu: 
            await RgbModel.fromEntityPlus(entity.iconColorHomeMenu, appId: appId), 
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

