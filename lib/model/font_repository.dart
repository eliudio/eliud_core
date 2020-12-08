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
import 'package:eliud_core/model/font_model.dart';

typedef FontModelTrigger(List<FontModel> list);

abstract class FontRepository {
  Future<FontModel> add(FontModel value);
  Future<void> delete(FontModel value);
  Future<FontModel> get(String id);
  Future<FontModel> update(FontModel value);
  Stream<List<FontModel>> values();
  Stream<List<FontModel>> valuesWithDetails();  Future<List<FontModel>> valuesList();
  Future<List<FontModel>> valuesListWithDetails();
  StreamSubscription<List<FontModel>> listen(FontModelTrigger trigger, { String orderBy, bool descending });
  StreamSubscription<List<FontModel>> listenWithDetails(FontModelTrigger trigger);
  void flush();

  Future<void> deleteAll();
}


