/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 grid_view_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:eliud_core/model/grid_view_model.dart';

typedef GridViewModelTrigger(List<GridViewModel> list);

abstract class GridViewRepository {
  Future<GridViewModel> add(GridViewModel value);
  Future<void> delete(GridViewModel value);
  Future<GridViewModel> get(String id);
  Future<GridViewModel> update(GridViewModel value);
  Stream<List<GridViewModel>> values({String orderBy, bool descending });
  Stream<List<GridViewModel>> valuesWithDetails({String orderBy, bool descending });  Future<List<GridViewModel>> valuesList({String orderBy, bool descending });
  Future<List<GridViewModel>> valuesListWithDetails({String orderBy, bool descending });
  StreamSubscription<List<GridViewModel>> listen(GridViewModelTrigger trigger, { String orderBy, bool descending });
  StreamSubscription<List<GridViewModel>> listenWithDetails(GridViewModelTrigger trigger, { String orderBy, bool descending });
  void flush();

  Future<void> deleteAll();
}


