/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 menu_def_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:collection/collection.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/core/base/model_base.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_core/model/entity_export.dart';


import 'package:eliud_core/model/menu_def_entity.dart';

import 'package:eliud_core/tools/random.dart';



class MenuDefModel implements ModelBase, WithAppId {
  String documentID;
  String appId;
  String? name;
  List<MenuItemModel>? menuItems;
  bool? admin;

  MenuDefModel({required this.documentID, required this.appId, this.name, this.menuItems, this.admin, })  {
    assert(documentID != null);
  }

  MenuDefModel copyWith({String? documentID, String? appId, String? name, List<MenuItemModel>? menuItems, bool? admin, }) {
    return MenuDefModel(documentID: documentID ?? this.documentID, appId: appId ?? this.appId, name: name ?? this.name, menuItems: menuItems ?? this.menuItems, admin: admin ?? this.admin, );
  }

  @override
  int get hashCode => documentID.hashCode ^ appId.hashCode ^ name.hashCode ^ menuItems.hashCode ^ admin.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is MenuDefModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          appId == other.appId &&
          name == other.name &&
          ListEquality().equals(menuItems, other.menuItems) &&
          admin == other.admin;

  String toJsonString({String? appId}) {
    return toEntity(appId: appId).toJsonString();
  }

  @override
  String toString() {
    String menuItemsCsv = (menuItems == null) ? '' : menuItems!.join(', ');

    return 'MenuDefModel{documentID: $documentID, appId: $appId, name: $name, menuItems: MenuItem[] { $menuItemsCsv }, admin: $admin}';
  }

  MenuDefEntity toEntity({String? appId}) {
    return MenuDefEntity(
          appId: (appId != null) ? appId : null, 
          name: (name != null) ? name : null, 
          menuItems: (menuItems != null) ? menuItems
            !.map((item) => item.toEntity(appId: appId))
            .toList() : null, 
          admin: (admin != null) ? admin : null, 
    );
  }

  static Future<MenuDefModel?> fromEntity(String documentID, MenuDefEntity? entity) async {
    if (entity == null) return null;
    var counter = 0;
    return MenuDefModel(
          documentID: documentID, 
          appId: entity.appId ?? '', 
          name: entity.name, 
          menuItems: 
            entity.menuItems == null ? null : List<MenuItemModel>.from(await Future.wait(entity. menuItems
            !.map((item) {
            counter++;
              return MenuItemModel.fromEntity(counter.toString(), item);
            })
            .toList())), 
          admin: entity.admin, 
    );
  }

  static Future<MenuDefModel?> fromEntityPlus(String documentID, MenuDefEntity? entity, { String? appId}) async {
    if (entity == null) return null;

    var counter = 0;
    return MenuDefModel(
          documentID: documentID, 
          appId: entity.appId ?? '', 
          name: entity.name, 
          menuItems: 
            entity. menuItems == null ? null : List<MenuItemModel>.from(await Future.wait(entity. menuItems
            !.map((item) {
            counter++;
            return MenuItemModel.fromEntityPlus(counter.toString(), item, appId: appId);})
            .toList())), 
          admin: entity.admin, 
    );
  }

}

