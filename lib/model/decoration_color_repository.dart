/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 decoration_color_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:eliud_core/model/decoration_color_model.dart';

typedef DecorationColorModelTrigger(List<DecorationColorModel> list);

abstract class DecorationColorRepository {
  Future<DecorationColorModel> add(DecorationColorModel value);
  Future<void> delete(DecorationColorModel value);
  Future<DecorationColorModel> get(String id);
  Future<DecorationColorModel> update(DecorationColorModel value);
  Stream<List<DecorationColorModel>> values();
  Stream<List<DecorationColorModel>> valuesWithDetails();
  StreamSubscription<List<DecorationColorModel>> listen(DecorationColorModelTrigger trigger);
StreamSubscription<List<DecorationColorModel>> listenWithDetails(DecorationColorModelTrigger trigger);
  void flush();
  Future<List<DecorationColorModel>> valuesList();
  Future<List<DecorationColorModel>> valuesListWithDetails();

  Future<void> deleteAll();
}


