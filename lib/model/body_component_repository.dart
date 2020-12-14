/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 body_component_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/model/body_component_model.dart';

import 'dart:async';
import 'package:eliud_core/tools/firestore_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';

typedef BodyComponentModelTrigger(List<BodyComponentModel> list);

abstract class BodyComponentRepository {
  Future<BodyComponentModel> add(BodyComponentModel value);
  Future<void> delete(BodyComponentModel value);
  Future<BodyComponentModel> get(String id);
  Future<BodyComponentModel> update(BodyComponentModel value);

  Stream<List<BodyComponentModel>> values({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc});
  Stream<List<BodyComponentModel>> valuesWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc});
  Future<List<BodyComponentModel>> valuesList({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc});
  Future<List<BodyComponentModel>> valuesListWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc});

  StreamSubscription<List<BodyComponentModel>> listen(BodyComponentModelTrigger trigger, {String currentMember, String orderBy, bool descending});
  StreamSubscription<List<BodyComponentModel>> listenWithDetails(BodyComponentModelTrigger trigger, {String currentMember, String orderBy, bool descending});
  void flush();

  Future<void> deleteAll();
}


