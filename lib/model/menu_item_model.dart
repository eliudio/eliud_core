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

import 'package:eliud_core/core/base/model_base.dart';

import '../tools/bespoke_models.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';


import 'package:eliud_core/model/menu_item_entity.dart';




class MenuItemModel implements ModelBase {
  static const String packageName = 'eliud_core';
  static const String id = 'menuItems';

  String documentID;
  String? text;
  String? description;
  IconModel? icon;
  ActionModel? action;

  MenuItemModel({required this.documentID, this.text, this.description, this.icon, this.action, })  {
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

  Future<List<ModelReference>> collectReferences({String? appId}) async {
    List<ModelReference> referencesCollector = [];
    if (icon != null) referencesCollector.addAll(await icon!.collectReferences(appId: appId));
    if (action != null) referencesCollector.addAll(await action!.collectReferences(appId: appId));
    return referencesCollector;
  }

  MenuItemEntity toEntity({String? appId}) {
    return MenuItemEntity(
          text: (text != null) ? text : null, 
          description: (description != null) ? description : null, 
          icon: (icon != null) ? icon!.toEntity(appId: appId) : null, 
          action: (action != null) ? action!.toEntity(appId: appId) : null, 
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

