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
import 'package:eliud_core/model/background_model.dart';
import 'package:eliud_core/model/background_repository.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/cache_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_core/model/entity_export.dart';

class BackgroundCache implements BackgroundRepository {

  final BackgroundRepository reference;
  final Map<String, BackgroundModel> fullCache = Map();

  BackgroundCache(this.reference);

  Future<BackgroundModel> add(BackgroundModel value) {
    return reference.add(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  Future<void> delete(BackgroundModel value){
    fullCache.remove(value.documentID);
    reference.delete(value);
    return Future.value();
  }

  Future<BackgroundModel> get(String id){
    BackgroundModel value = fullCache[id];
    if (value != null) return refreshRelations(value);
    return reference.get(id).then((value) {
      fullCache[id] = value;
      return value;
    });
  }

  Future<BackgroundModel> update(BackgroundModel value) {
    return reference.update(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  @override
  Stream<List<BackgroundModel>> values() {
    return reference.values();
  }

  @override
  Stream<List<BackgroundModel>> valuesWithDetails() {
    return reference.valuesWithDetails();
  }

  @override
  Future<List<BackgroundModel>> valuesList() async {
    return await reference.valuesList();
  }
  
  @override
  Future<List<BackgroundModel>> valuesListWithDetails() async {
    return await reference.valuesListWithDetails();
  }

  void flush() {
    fullCache.clear();
  }
  

  Future<void> deleteAll() {
    return reference.deleteAll();
  }

  @override
  StreamSubscription<List<BackgroundModel>> listen(trigger) {
    return reference.listen(trigger);
  }

  @override
  StreamSubscription<List<BackgroundModel>> listenWithDetails(trigger) {
    return reference.listenWithDetails(trigger);
  }


  static Future<BackgroundModel> refreshRelations(BackgroundModel model) async {

    ImageModel backgroundImageHolder;
    if (model.backgroundImage != null) {
      try {
        await imageRepository().get(model.backgroundImage.documentID).then((val) {
          backgroundImageHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    ShadowModel shadowHolder;
    if (model.shadow != null) {
      try {
        await shadowRepository(appId: model.shadow.appId).get(model.shadow.documentID).then((val) {
          shadowHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    List<DecorationColorModel> decorationColorsHolder = List<DecorationColorModel>.from(await Future.wait(await model.decorationColors.map((element) async {
      return await DecorationColorCache.refreshRelations(element);
    }))).toList();

    return model.copyWith(
        backgroundImage: backgroundImageHolder,

        shadow: shadowHolder,

        decorationColors: decorationColorsHolder,


    );
  }

}

