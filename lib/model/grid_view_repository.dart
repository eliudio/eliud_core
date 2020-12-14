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

import 'package:eliud_core/model/grid_view_model.dart';

import 'dart:async';
import 'package:eliud_core/tools/firestore_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';

typedef GridViewModelTrigger(List<GridViewModel> list);

abstract class GridViewRepository {
  Future<GridViewModel> add(GridViewModel value);
  Future<void> delete(GridViewModel value);
  Future<GridViewModel> get(String id);
  Future<GridViewModel> update(GridViewModel value);

  Stream<List<GridViewModel>> values({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc});
  Stream<List<GridViewModel>> valuesWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc});
  Future<List<GridViewModel>> valuesList({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc});
  Future<List<GridViewModel>> valuesListWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc});

  StreamSubscription<List<GridViewModel>> listen(GridViewModelTrigger trigger, {String currentMember, String orderBy, bool descending});
  StreamSubscription<List<GridViewModel>> listenWithDetails(GridViewModelTrigger trigger, {String currentMember, String orderBy, bool descending});
  void flush();

  Future<void> deleteAll();
}


