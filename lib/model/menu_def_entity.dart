/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 menu_def_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'package:eliud_core/tools/random.dart';
import 'abstract_repository_singleton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/core/base/entity_base.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_core/model/entity_export.dart';

import 'package:eliud_core/tools/common_tools.dart';
class MenuDefEntity implements EntityBase {
  final String? appId;
  final String? name;
  final List<MenuItemEntity>? menuItems;
  final bool? admin;

  MenuDefEntity({required this.appId, this.name, this.menuItems, this.admin, });

  MenuDefEntity copyWith({String? documentID, String? appId, String? name, List<MenuItemEntity>? menuItems, bool? admin, }) {
    return MenuDefEntity(appId : appId ?? this.appId, name : name ?? this.name, menuItems : menuItems ?? this.menuItems, admin : admin ?? this.admin, );
  }
  List<Object?> get props => [appId, name, menuItems, admin, ];

  @override
  String toString() {
    String menuItemsCsv = (menuItems == null) ? '' : menuItems!.join(', ');

    return 'MenuDefEntity{appId: $appId, name: $name, menuItems: MenuItem[] { $menuItemsCsv }, admin: $admin}';
  }

  static MenuDefEntity? fromMap(Object? o, {Map<String, String>? newDocumentIds}) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    var menuItemsFromMap;
    menuItemsFromMap = map['menuItems'];
    var menuItemsList;
    if (menuItemsFromMap != null)
      menuItemsList = (map['menuItems'] as List<dynamic>)
        .map((dynamic item) =>
        MenuItemEntity.fromMap(item as Map, newDocumentIds: newDocumentIds)!)
        .toList();

    return MenuDefEntity(
      appId: map['appId'], 
      name: map['name'], 
      menuItems: menuItemsList, 
      admin: map['admin'], 
    );
  }

  Map<String, Object?> toDocument() {
    final List<Map<String?, dynamic>>? menuItemsListMap = menuItems != null 
        ? menuItems!.map((item) => item.toDocument()).toList()
        : null;

    Map<String, Object?> theDocument = HashMap();
    if (appId != null) theDocument["appId"] = appId;
      else theDocument["appId"] = null;
    if (name != null) theDocument["name"] = name;
      else theDocument["name"] = null;
    if (menuItems != null) theDocument["menuItems"] = menuItemsListMap;
      else theDocument["menuItems"] = null;
    if (admin != null) theDocument["admin"] = admin;
      else theDocument["admin"] = null;
    return theDocument;
  }

  @override
  MenuDefEntity switchAppId({required String newAppId}) {
    var newEntity = copyWith(appId: newAppId);
    return newEntity;
  }

  static MenuDefEntity? fromJsonString(String json, {Map<String, String>? newDocumentIds}) {
    Map<String, dynamic>? generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap, newDocumentIds: newDocumentIds);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

  Future<Map<String, Object?>> enrichedDocument(Map<String, Object?> theDocument) async {
    return theDocument;
  }

}

