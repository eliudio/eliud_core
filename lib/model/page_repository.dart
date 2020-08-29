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
import 'page_model.dart';

typedef PageModelTrigger(List<PageModel> list);

abstract class PageRepository {
  Future<PageModel> add(PageModel value);
  Future<void> delete(PageModel value);
  Future<PageModel> get(String id);
  Future<PageModel> update(PageModel value);
  Stream<List<PageModel>> values();
  Stream<List<PageModel>> valuesWithDetails();
  StreamSubscription<List<PageModel>> listen(PageModelTrigger trigger);
StreamSubscription<List<PageModel>> listenWithDetails(PageModelTrigger trigger);
  void flush();
  Future<List<PageModel>> valuesList();
  Future<List<PageModel>> valuesListWithDetails();

  Future<void> deleteAll();
}


