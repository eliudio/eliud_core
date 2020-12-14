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
  Stream<List<DecorationColorModel>> values({String orderBy, bool descending });
  Stream<List<DecorationColorModel>> valuesWithDetails({String orderBy, bool descending });  Future<List<DecorationColorModel>> valuesList({String orderBy, bool descending });
  Future<List<DecorationColorModel>> valuesListWithDetails({String orderBy, bool descending });
  StreamSubscription<List<DecorationColorModel>> listen(DecorationColorModelTrigger trigger, { String orderBy, bool descending });
  StreamSubscription<List<DecorationColorModel>> listenWithDetails(DecorationColorModelTrigger trigger, { String orderBy, bool descending });
  void flush();

  Future<void> deleteAll();
}


