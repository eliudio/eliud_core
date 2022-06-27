/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 menu_item_model.dart
                       
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


import 'package:eliud_core/model/menu_item_entity.dart';

import 'package:eliud_core/tools/random.dart';



class MenuItemModel implements ModelBase {
  static const String packageName = 'eliud_core';
  static const String id = 'MenuItem';

  String documentID;
  String? text;
  String? description;
  IconModel? icon;
  ActionModel? action;

  MenuItemModel({required this.documentID, this.text, this.description, this.icon, this.action, })  {
    assert(documentID != null);
  }

  MenuItemModel copyWith({String? documentID, String? text, String? description, IconModel? icon, ActionModel? action, }) {
    return MenuItemModel(documentID: documentID ?? this.documentID, text: text ?? this.text, description: description ?? this.description, icon: icon ?? this.icon, action: action ?? this.action, );
  }

  @override
  int get hashCode => documentID.hashCode ^ text.hashCode ^ description.hashCode ^ icon.hashCode ^ action.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is MenuItemModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          text == other.text &&
          description == other.description &&
          icon == other.icon &&
          action == other.action;

  @override
  String toString() {
    return 'MenuItemModel{documentID: $documentID, text: $text, description: $description, icon: $icon, action: $action}';
  }

  MenuItemEntity toEntity({String? appId, Set<ModelReference>? referencesCollector}) {
    if (referencesCollector != null) {
    }
    return MenuItemEntity(
          text: (text != null) ? text : null, 
          description: (description != null) ? description : null, 
          icon: (icon != null) ? icon!.toEntity(appId: appId, referencesCollector: referencesCollector) : null, 
          action: (action != null) ? action!.toEntity(appId: appId, referencesCollector: referencesCollector) : null, 
    );
  }

  static Future<MenuItemModel?> fromEntity(String documentID, MenuItemEntity? entity) async {
    if (entity == null) return null;
    var counter = 0;
    return MenuItemModel(
          documentID: documentID, 
          text: entity.text, 
          description: entity.description, 
          icon: 
            await IconModel.fromEntity(entity.icon), 
          action: 
            await ActionModel.fromEntity(entity.action), 
    );
  }

  static Future<MenuItemModel?> fromEntityPlus(String documentID, MenuItemEntity? entity, { String? appId}) async {
    if (entity == null) return null;

    var counter = 0;
    return MenuItemModel(
          documentID: documentID, 
          text: entity.text, 
          description: entity.description, 
          icon: 
            await IconModel.fromEntityPlus(entity.icon, appId: appId), 
          action: 
            await ActionModel.fromEntityPlus(entity.action, appId: appId), 
    );
  }

}

