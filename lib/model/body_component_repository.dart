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

import 'dart:async';
import 'package:eliud_core/model/body_component_model.dart';

typedef BodyComponentModelTrigger(List<BodyComponentModel> list);

abstract class BodyComponentRepository {
  Future<BodyComponentModel> add(BodyComponentModel value);
  Future<void> delete(BodyComponentModel value);
  Future<BodyComponentModel> get(String id);
  Future<BodyComponentModel> update(BodyComponentModel value);
  Stream<List<BodyComponentModel>> values({String orderBy, bool descending });
  Stream<List<BodyComponentModel>> valuesWithDetails({String orderBy, bool descending });  Future<List<BodyComponentModel>> valuesList({String orderBy, bool descending });
  Future<List<BodyComponentModel>> valuesListWithDetails({String orderBy, bool descending });
  StreamSubscription<List<BodyComponentModel>> listen(BodyComponentModelTrigger trigger, { String orderBy, bool descending });
  StreamSubscription<List<BodyComponentModel>> listenWithDetails(BodyComponentModelTrigger trigger, { String orderBy, bool descending });
  void flush();

  Future<void> deleteAll();
}


