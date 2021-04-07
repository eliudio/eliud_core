/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 background_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/model/background_model.dart';
import 'package:eliud_core/model/background_repository.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/cache_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_core/model/entity_export.dart';

class BackgroundCache implements BackgroundRepository {

  final BackgroundRepository reference;
  final Map<String?, BackgroundModel?> fullCache = Map();

  BackgroundCache(this.reference);

  Future<BackgroundModel> add(BackgroundModel? value) {
    return reference.add(value).then((newValue) {
      fullCache[value!.documentID] = newValue;
      return newValue;
    });
  }

  Future<void> delete(BackgroundModel? value){
    fullCache.remove(value!.documentID);
    reference.delete(value);
    return Future.value();
  }

  Future<BackgroundModel> get(String? id, {Function(Exception)? onError}) {
    BackgroundModel? value = fullCache[id];
    if (value != null) return refreshRelations(value);
    return reference.get(id, onError: onError).then((value) {
      fullCache[id] = value;
      return value!;
    });
  }

  Future<BackgroundModel> update(BackgroundModel? value) {
    return reference.update(value).then((newValue) {
      fullCache[value!.documentID] = newValue;
      return newValue;
    });
  }

  @override
  Stream<List<BackgroundModel?>> values({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery }) {
    return reference.values(orderBy: orderBy, descending: descending, startAfter: startAfter, limit: limit, setLastDoc: setLastDoc, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery);
  }

  @override
  Stream<List<BackgroundModel?>> valuesWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery }) {
    return reference.valuesWithDetails(orderBy: orderBy, descending: descending, startAfter: startAfter, limit: limit, setLastDoc: setLastDoc, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery);
  }

  @override
  Future<List<BackgroundModel?>> valuesList({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery }) async {
    return await reference.valuesList(orderBy: orderBy, descending: descending, startAfter: startAfter, limit: limit, setLastDoc: setLastDoc, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery);
  }
  
  @override
  Future<List<BackgroundModel?>> valuesListWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery }) async {
    return await reference.valuesListWithDetails(orderBy: orderBy, descending: descending, startAfter: startAfter, limit: limit, setLastDoc: setLastDoc, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery);
  }

  void flush() {
    fullCache.clear();
  }
  
  String? timeStampToString(dynamic timeStamp) {
    return reference.timeStampToString(timeStamp);
  } 

  dynamic getSubCollection(String documentId, String name) {
    return reference.getSubCollection(documentId, name);
  }

  Future<BackgroundModel> changeValue(String documentId, String fieldName, num changeByThisValue) {
    return reference.changeValue(documentId, fieldName, changeByThisValue).then((newValue) {
      fullCache[documentId] = newValue;
      return newValue!;
    });
  }

  Future<void> deleteAll() {
    return reference.deleteAll();
  }

  @override
  StreamSubscription<List<BackgroundModel?>> listen(trigger, {String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery}) {
    return reference.listen(trigger, orderBy: orderBy, descending: descending, startAfter: startAfter, limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery);
  }

  @override
  StreamSubscription<List<BackgroundModel?>> listenWithDetails(trigger, {String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery}) {
    return reference.listenWithDetails(trigger, orderBy: orderBy, descending: descending, startAfter: startAfter, limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery);
  }

  @override
  StreamSubscription<BackgroundModel> listenTo(String documentId, changed) {
    reference.listenTo(documentId, changed);
  }

  static Future<BackgroundModel> refreshRelations(BackgroundModel model) async {

    MemberMediumModel? backgroundImageHolder;
    if (model.backgroundImage != null) {
      try {
        await memberMediumRepository(appId: model.backgroundImage!.appId)!.get(model.backgroundImage!.documentID).then((val) {
          backgroundImageHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    ShadowModel? shadowHolder;
    if (model.shadow != null) {
      try {
        await shadowRepository(appId: model.shadow!.appId)!.get(model.shadow!.documentID).then((val) {
          shadowHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    List<DecorationColorModel>? decorationColorsHolder;
    if (model.decorationColors != null) {
      decorationColorsHolder = List<DecorationColorModel>.from(await Future.wait(await model.decorationColors!.map((element) async {
        return await DecorationColorCache.refreshRelations(element);
      }))).toList();
    }

    return model.copyWith(
        backgroundImage: backgroundImageHolder,

        shadow: shadowHolder,

        decorationColors: decorationColorsHolder,


    );
  }

}

