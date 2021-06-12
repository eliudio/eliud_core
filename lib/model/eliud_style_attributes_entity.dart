/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 eliud_style_attributes_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'package:eliud_core/tools/common_tools.dart';
import 'abstract_repository_singleton.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_core/model/entity_export.dart';

class EliudStyleAttributesEntity {
  final String? description;
  final RgbEntity? formSubmitButtonColor;
  final String? formBackgroundId;
  final RgbEntity? formSubmitButtonTextColor;
  final RgbEntity? formGroupTitleColor;
  final RgbEntity? formFieldTextColor;
  final RgbEntity? formFieldHeaderColor;
  final RgbEntity? formFieldFocusColor;
  final String? formAppBarBackgroundId;
  final RgbEntity? formAppBarTextColor;
  final String? listBackgroundId;
  final RgbEntity? listTextItemColor;
  final RgbEntity? floatingButtonForegroundColor;
  final RgbEntity? floatingButtonBackgroundColor;
  final RgbEntity? dividerColor;
  final RgbEntity? iconColor;
  final String? h1Id;
  final String? h2Id;
  final String? h3Id;
  final String? h4Id;
  final String? h5Id;
  final String? fontTextId;
  final String? fontHighlight1Id;
  final String? fontHighlight2Id;
  final String? fontLinkId;

  EliudStyleAttributesEntity({this.description, this.formSubmitButtonColor, this.formBackgroundId, this.formSubmitButtonTextColor, this.formGroupTitleColor, this.formFieldTextColor, this.formFieldHeaderColor, this.formFieldFocusColor, this.formAppBarBackgroundId, this.formAppBarTextColor, this.listBackgroundId, this.listTextItemColor, this.floatingButtonForegroundColor, this.floatingButtonBackgroundColor, this.dividerColor, this.iconColor, this.h1Id, this.h2Id, this.h3Id, this.h4Id, this.h5Id, this.fontTextId, this.fontHighlight1Id, this.fontHighlight2Id, this.fontLinkId, });


  List<Object?> get props => [description, formSubmitButtonColor, formBackgroundId, formSubmitButtonTextColor, formGroupTitleColor, formFieldTextColor, formFieldHeaderColor, formFieldFocusColor, formAppBarBackgroundId, formAppBarTextColor, listBackgroundId, listTextItemColor, floatingButtonForegroundColor, floatingButtonBackgroundColor, dividerColor, iconColor, h1Id, h2Id, h3Id, h4Id, h5Id, fontTextId, fontHighlight1Id, fontHighlight2Id, fontLinkId, ];

  @override
  String toString() {
    return 'EliudStyleAttributesEntity{description: $description, formSubmitButtonColor: $formSubmitButtonColor, formBackgroundId: $formBackgroundId, formSubmitButtonTextColor: $formSubmitButtonTextColor, formGroupTitleColor: $formGroupTitleColor, formFieldTextColor: $formFieldTextColor, formFieldHeaderColor: $formFieldHeaderColor, formFieldFocusColor: $formFieldFocusColor, formAppBarBackgroundId: $formAppBarBackgroundId, formAppBarTextColor: $formAppBarTextColor, listBackgroundId: $listBackgroundId, listTextItemColor: $listTextItemColor, floatingButtonForegroundColor: $floatingButtonForegroundColor, floatingButtonBackgroundColor: $floatingButtonBackgroundColor, dividerColor: $dividerColor, iconColor: $iconColor, h1Id: $h1Id, h2Id: $h2Id, h3Id: $h3Id, h4Id: $h4Id, h5Id: $h5Id, fontTextId: $fontTextId, fontHighlight1Id: $fontHighlight1Id, fontHighlight2Id: $fontHighlight2Id, fontLinkId: $fontLinkId}';
  }

  static EliudStyleAttributesEntity? fromMap(Map? map) {
    if (map == null) return null;

    var formSubmitButtonColorFromMap;
    formSubmitButtonColorFromMap = map['formSubmitButtonColor'];
    if (formSubmitButtonColorFromMap != null)
      formSubmitButtonColorFromMap = RgbEntity.fromMap(formSubmitButtonColorFromMap);
    var formSubmitButtonTextColorFromMap;
    formSubmitButtonTextColorFromMap = map['formSubmitButtonTextColor'];
    if (formSubmitButtonTextColorFromMap != null)
      formSubmitButtonTextColorFromMap = RgbEntity.fromMap(formSubmitButtonTextColorFromMap);
    var formGroupTitleColorFromMap;
    formGroupTitleColorFromMap = map['formGroupTitleColor'];
    if (formGroupTitleColorFromMap != null)
      formGroupTitleColorFromMap = RgbEntity.fromMap(formGroupTitleColorFromMap);
    var formFieldTextColorFromMap;
    formFieldTextColorFromMap = map['formFieldTextColor'];
    if (formFieldTextColorFromMap != null)
      formFieldTextColorFromMap = RgbEntity.fromMap(formFieldTextColorFromMap);
    var formFieldHeaderColorFromMap;
    formFieldHeaderColorFromMap = map['formFieldHeaderColor'];
    if (formFieldHeaderColorFromMap != null)
      formFieldHeaderColorFromMap = RgbEntity.fromMap(formFieldHeaderColorFromMap);
    var formFieldFocusColorFromMap;
    formFieldFocusColorFromMap = map['formFieldFocusColor'];
    if (formFieldFocusColorFromMap != null)
      formFieldFocusColorFromMap = RgbEntity.fromMap(formFieldFocusColorFromMap);
    var formAppBarTextColorFromMap;
    formAppBarTextColorFromMap = map['formAppBarTextColor'];
    if (formAppBarTextColorFromMap != null)
      formAppBarTextColorFromMap = RgbEntity.fromMap(formAppBarTextColorFromMap);
    var listTextItemColorFromMap;
    listTextItemColorFromMap = map['listTextItemColor'];
    if (listTextItemColorFromMap != null)
      listTextItemColorFromMap = RgbEntity.fromMap(listTextItemColorFromMap);
    var floatingButtonForegroundColorFromMap;
    floatingButtonForegroundColorFromMap = map['floatingButtonForegroundColor'];
    if (floatingButtonForegroundColorFromMap != null)
      floatingButtonForegroundColorFromMap = RgbEntity.fromMap(floatingButtonForegroundColorFromMap);
    var floatingButtonBackgroundColorFromMap;
    floatingButtonBackgroundColorFromMap = map['floatingButtonBackgroundColor'];
    if (floatingButtonBackgroundColorFromMap != null)
      floatingButtonBackgroundColorFromMap = RgbEntity.fromMap(floatingButtonBackgroundColorFromMap);
    var dividerColorFromMap;
    dividerColorFromMap = map['dividerColor'];
    if (dividerColorFromMap != null)
      dividerColorFromMap = RgbEntity.fromMap(dividerColorFromMap);
    var iconColorFromMap;
    iconColorFromMap = map['iconColor'];
    if (iconColorFromMap != null)
      iconColorFromMap = RgbEntity.fromMap(iconColorFromMap);

    return EliudStyleAttributesEntity(
      description: map['description'], 
      formSubmitButtonColor: formSubmitButtonColorFromMap, 
      formBackgroundId: map['formBackgroundId'], 
      formSubmitButtonTextColor: formSubmitButtonTextColorFromMap, 
      formGroupTitleColor: formGroupTitleColorFromMap, 
      formFieldTextColor: formFieldTextColorFromMap, 
      formFieldHeaderColor: formFieldHeaderColorFromMap, 
      formFieldFocusColor: formFieldFocusColorFromMap, 
      formAppBarBackgroundId: map['formAppBarBackgroundId'], 
      formAppBarTextColor: formAppBarTextColorFromMap, 
      listBackgroundId: map['listBackgroundId'], 
      listTextItemColor: listTextItemColorFromMap, 
      floatingButtonForegroundColor: floatingButtonForegroundColorFromMap, 
      floatingButtonBackgroundColor: floatingButtonBackgroundColorFromMap, 
      dividerColor: dividerColorFromMap, 
      iconColor: iconColorFromMap, 
      h1Id: map['h1Id'], 
      h2Id: map['h2Id'], 
      h3Id: map['h3Id'], 
      h4Id: map['h4Id'], 
      h5Id: map['h5Id'], 
      fontTextId: map['fontTextId'], 
      fontHighlight1Id: map['fontHighlight1Id'], 
      fontHighlight2Id: map['fontHighlight2Id'], 
      fontLinkId: map['fontLinkId'], 
    );
  }

  Map<String, Object?> toDocument() {
    final Map<String, dynamic>? formSubmitButtonColorMap = formSubmitButtonColor != null 
        ? formSubmitButtonColor!.toDocument()
        : null;
    final Map<String, dynamic>? formSubmitButtonTextColorMap = formSubmitButtonTextColor != null 
        ? formSubmitButtonTextColor!.toDocument()
        : null;
    final Map<String, dynamic>? formGroupTitleColorMap = formGroupTitleColor != null 
        ? formGroupTitleColor!.toDocument()
        : null;
    final Map<String, dynamic>? formFieldTextColorMap = formFieldTextColor != null 
        ? formFieldTextColor!.toDocument()
        : null;
    final Map<String, dynamic>? formFieldHeaderColorMap = formFieldHeaderColor != null 
        ? formFieldHeaderColor!.toDocument()
        : null;
    final Map<String, dynamic>? formFieldFocusColorMap = formFieldFocusColor != null 
        ? formFieldFocusColor!.toDocument()
        : null;
    final Map<String, dynamic>? formAppBarTextColorMap = formAppBarTextColor != null 
        ? formAppBarTextColor!.toDocument()
        : null;
    final Map<String, dynamic>? listTextItemColorMap = listTextItemColor != null 
        ? listTextItemColor!.toDocument()
        : null;
    final Map<String, dynamic>? floatingButtonForegroundColorMap = floatingButtonForegroundColor != null 
        ? floatingButtonForegroundColor!.toDocument()
        : null;
    final Map<String, dynamic>? floatingButtonBackgroundColorMap = floatingButtonBackgroundColor != null 
        ? floatingButtonBackgroundColor!.toDocument()
        : null;
    final Map<String, dynamic>? dividerColorMap = dividerColor != null 
        ? dividerColor!.toDocument()
        : null;
    final Map<String, dynamic>? iconColorMap = iconColor != null 
        ? iconColor!.toDocument()
        : null;

    Map<String, Object?> theDocument = HashMap();
    if (description != null) theDocument["description"] = description;
      else theDocument["description"] = null;
    if (formSubmitButtonColor != null) theDocument["formSubmitButtonColor"] = formSubmitButtonColorMap;
      else theDocument["formSubmitButtonColor"] = null;
    if (formBackgroundId != null) theDocument["formBackgroundId"] = formBackgroundId;
      else theDocument["formBackgroundId"] = null;
    if (formSubmitButtonTextColor != null) theDocument["formSubmitButtonTextColor"] = formSubmitButtonTextColorMap;
      else theDocument["formSubmitButtonTextColor"] = null;
    if (formGroupTitleColor != null) theDocument["formGroupTitleColor"] = formGroupTitleColorMap;
      else theDocument["formGroupTitleColor"] = null;
    if (formFieldTextColor != null) theDocument["formFieldTextColor"] = formFieldTextColorMap;
      else theDocument["formFieldTextColor"] = null;
    if (formFieldHeaderColor != null) theDocument["formFieldHeaderColor"] = formFieldHeaderColorMap;
      else theDocument["formFieldHeaderColor"] = null;
    if (formFieldFocusColor != null) theDocument["formFieldFocusColor"] = formFieldFocusColorMap;
      else theDocument["formFieldFocusColor"] = null;
    if (formAppBarBackgroundId != null) theDocument["formAppBarBackgroundId"] = formAppBarBackgroundId;
      else theDocument["formAppBarBackgroundId"] = null;
    if (formAppBarTextColor != null) theDocument["formAppBarTextColor"] = formAppBarTextColorMap;
      else theDocument["formAppBarTextColor"] = null;
    if (listBackgroundId != null) theDocument["listBackgroundId"] = listBackgroundId;
      else theDocument["listBackgroundId"] = null;
    if (listTextItemColor != null) theDocument["listTextItemColor"] = listTextItemColorMap;
      else theDocument["listTextItemColor"] = null;
    if (floatingButtonForegroundColor != null) theDocument["floatingButtonForegroundColor"] = floatingButtonForegroundColorMap;
      else theDocument["floatingButtonForegroundColor"] = null;
    if (floatingButtonBackgroundColor != null) theDocument["floatingButtonBackgroundColor"] = floatingButtonBackgroundColorMap;
      else theDocument["floatingButtonBackgroundColor"] = null;
    if (dividerColor != null) theDocument["dividerColor"] = dividerColorMap;
      else theDocument["dividerColor"] = null;
    if (iconColor != null) theDocument["iconColor"] = iconColorMap;
      else theDocument["iconColor"] = null;
    if (h1Id != null) theDocument["h1Id"] = h1Id;
      else theDocument["h1Id"] = null;
    if (h2Id != null) theDocument["h2Id"] = h2Id;
      else theDocument["h2Id"] = null;
    if (h3Id != null) theDocument["h3Id"] = h3Id;
      else theDocument["h3Id"] = null;
    if (h4Id != null) theDocument["h4Id"] = h4Id;
      else theDocument["h4Id"] = null;
    if (h5Id != null) theDocument["h5Id"] = h5Id;
      else theDocument["h5Id"] = null;
    if (fontTextId != null) theDocument["fontTextId"] = fontTextId;
      else theDocument["fontTextId"] = null;
    if (fontHighlight1Id != null) theDocument["fontHighlight1Id"] = fontHighlight1Id;
      else theDocument["fontHighlight1Id"] = null;
    if (fontHighlight2Id != null) theDocument["fontHighlight2Id"] = fontHighlight2Id;
      else theDocument["fontHighlight2Id"] = null;
    if (fontLinkId != null) theDocument["fontLinkId"] = fontLinkId;
      else theDocument["fontLinkId"] = null;
    return theDocument;
  }

  static EliudStyleAttributesEntity? fromJsonString(String json) {
    Map<String, dynamic>? generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

}
