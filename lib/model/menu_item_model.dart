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

import 'package:eliud_core/core/global_data.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_core/model/entity_export.dart';


import 'package:eliud_core/model/menu_item_entity.dart';

import 'package:eliud_core/tools/random.dart';



class MenuItemModel {
  String documentID;
  String text;
  String description;
  IconModel icon;
  ActionModel action;

  MenuItemModel({this.documentID, this.text, this.description, this.icon, this.action, })  {
    assert(documentID != null);
  }

  MenuItemModel copyWith({String documentID, String text, String description, IconModel icon, ActionModel action, }) {
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

  MenuItemEntity toEntity() {
    return MenuItemEntity(
          text: (text != null) ? text : null, 
          description: (description != null) ? description : null, 
          icon: (icon != null) ? icon.toEntity() : null, 
          action: (action != null) ? action.toEntity() : null, 
    );
  }

  static MenuItemModel fromEntity(String documentID, MenuItemEntity entity) {
    if (entity == null) return null;
    return MenuItemModel(
          documentID: documentID, 
          text: entity.text, 
          description: entity.description, 
          icon: 
            IconModel.fromEntity(entity.icon), 
          action: 
            ActionModel.fromEntity(entity.action), 
    );
  }

  static Future<MenuItemModel> fromEntityPlus(String documentID, MenuItemEntity entity) async {
    if (entity == null) return null;

    return MenuItemModel(
          documentID: documentID, 
          text: entity.text, 
          description: entity.description, 
          icon: 
            await IconModel.fromEntityPlus(entity.icon), 
          action: 
            await ActionModel.fromEntityPlus(entity.action), 
    );
  }

}

