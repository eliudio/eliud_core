/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 page_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:eliud_core/model/page_model.dart';

typedef PageModelTrigger(List<PageModel> list);

abstract class PageRepository {
  Future<PageModel> add(PageModel value);
  Future<void> delete(PageModel value);
  Future<PageModel> get(String id);
  Future<PageModel> update(PageModel value);
  Stream<List<PageModel>> values({String orderBy, bool descending });
  Stream<List<PageModel>> valuesWithDetails({String orderBy, bool descending });  Future<List<PageModel>> valuesList({String orderBy, bool descending });
  Future<List<PageModel>> valuesListWithDetails({String orderBy, bool descending });
  StreamSubscription<List<PageModel>> listen(PageModelTrigger trigger, { String orderBy, bool descending });
  StreamSubscription<List<PageModel>> listenWithDetails(PageModelTrigger trigger, { String orderBy, bool descending });
  void flush();

  Future<void> deleteAll();
}


