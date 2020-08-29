/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 font_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'font_model.dart';
import 'font_repository.dart';
// import the main classes
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';

// import the shared classes
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/cache_export.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/model/entity_export.dart';
  
// import the classes of this package:
import '../model/abstract_repository_singleton.dart';
import '../model/repository_export.dart';
import 'package:eliud_core/model/repository_export.dart';
import '../model/cache_export.dart';
import 'package:eliud_core/model/cache_export.dart';
import '../model/model_export.dart';
import 'package:eliud_core/model/model_export.dart';
import '../model/entity_export.dart';
import 'package:eliud_core/model/entity_export.dart';

class FontCache implements FontRepository {

  final FontRepository reference;
  final Map<String, FontModel> fullCache = Map();

  FontCache(this.reference);

  Future<FontModel> add(FontModel value) {
    return reference.add(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  Future<void> delete(FontModel value){
    fullCache.remove(value.documentID);
    reference.delete(value);
    return Future.value();
  }

  Future<FontModel> get(String id){
    FontModel value = fullCache[id];
    if (value != null) return refreshRelations(value);
    return reference.get(id).then((value) {
      fullCache[id] = value;
      return value;
    });
  }

  Future<FontModel> update(FontModel value) {
    return reference.update(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  @override
  Stream<List<FontModel>> values() {
    return reference.values();
  }

  @override
  Stream<List<FontModel>> valuesWithDetails() {
    return reference.valuesWithDetails();
  }

  @override
  Future<List<FontModel>> valuesList() async {
    return await reference.valuesList();
  }
  
  @override
  Future<List<FontModel>> valuesListWithDetails() async {
    return await reference.valuesListWithDetails();
  }

  void flush() {
    fullCache.clear();
  }
  

  Future<void> deleteAll() {
    return reference.deleteAll();
  }

  @override
  StreamSubscription<List<FontModel>> listen(trigger) {
    return reference.listen(trigger);
  }

  @override
  StreamSubscription<List<FontModel>> listenWithDetails(trigger) {
    return reference.listenWithDetails(trigger);
  }


  static Future<FontModel> refreshRelations(FontModel model) async {

    return model.copyWith(

    );
  }

}

