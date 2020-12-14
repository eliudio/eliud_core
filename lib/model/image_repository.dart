/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 image_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/model/image_model.dart';

import 'dart:async';
import 'package:eliud_core/tools/firestore_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';

typedef ImageModelTrigger(List<ImageModel> list);

abstract class ImageRepository {
  Future<ImageModel> add(ImageModel value);
  Future<void> delete(ImageModel value);
  Future<ImageModel> get(String id);
  Future<ImageModel> update(ImageModel value);

  Stream<List<ImageModel>> values({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc});
  Stream<List<ImageModel>> valuesWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc});
  Future<List<ImageModel>> valuesList({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc});
  Future<List<ImageModel>> valuesListWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc});

  StreamSubscription<List<ImageModel>> listen(ImageModelTrigger trigger, {String currentMember, String orderBy, bool descending});
  StreamSubscription<List<ImageModel>> listenWithDetails(ImageModelTrigger trigger, {String currentMember, String orderBy, bool descending});
  void flush();

  Future<void> deleteAll();
}


