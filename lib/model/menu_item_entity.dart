/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 menu_item_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'abstract_repository_singleton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/core/base/entity_base.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_core/model/entity_export.dart';

import 'package:eliud_core/tools/common_tools.dart';
class MenuItemEntity implements EntityBase {
  final String? text;
  final String? description;
  final IconEntity? icon;
  final ActionEntity? action;

  MenuItemEntity({this.text, this.description, this.icon, this.action, });


  List<Object?> get props => [text, description, icon, action, ];

  @override
  String toString() {
    return 'MenuItemEntity{text: $text, description: $description, icon: $icon, action: $action}';
  }

  static MenuItemEntity? fromMap(Object? o) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    var iconFromMap;
    iconFromMap = map['icon'];
    if (iconFromMap != null)
      iconFromMap = IconEntity.fromMap(iconFromMap);
    var actionFromMap;
    actionFromMap = map['action'];
    if (actionFromMap != null)
      actionFromMap = ActionEntity.fromMap(actionFromMap);

    return MenuItemEntity(
      text: map['text'], 
      description: map['description'], 
      icon: iconFromMap, 
      action: actionFromMap, 
    );
  }

  Map<String, Object?> toDocument() {
    final Map<String, dynamic>? iconMap = icon != null 
        ? icon!.toDocument()
        : null;
    final Map<String, dynamic>? actionMap = action != null 
        ? action!.toDocument()
        : null;

    Map<String, Object?> theDocument = HashMap();
    if (text != null) theDocument["text"] = text;
      else theDocument["text"] = null;
    if (description != null) theDocument["description"] = description;
      else theDocument["description"] = null;
    if (icon != null) theDocument["icon"] = iconMap;
      else theDocument["icon"] = null;
    if (action != null) theDocument["action"] = actionMap;
      else theDocument["action"] = null;
    return theDocument;
  }

  static MenuItemEntity? fromJsonString(String json) {
    Map<String, dynamic>? generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

  Future<Map<String, Object?>> enrichedDocument(Map<String, Object?> theDocument) async {
    return theDocument;
  }

}

