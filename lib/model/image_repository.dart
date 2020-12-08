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

import 'dart:async';
import 'package:eliud_core/model/image_model.dart';

typedef ImageModelTrigger(List<ImageModel> list);

abstract class ImageRepository {
  Future<ImageModel> add(ImageModel value);
  Future<void> delete(ImageModel value);
  Future<ImageModel> get(String id);
  Future<ImageModel> update(ImageModel value);
  Stream<List<ImageModel>> values();
  Stream<List<ImageModel>> valuesWithDetails();  Future<List<ImageModel>> valuesList();
  Future<List<ImageModel>> valuesListWithDetails();
  StreamSubscription<List<ImageModel>> listen(ImageModelTrigger trigger, { String orderBy, bool descending });
  StreamSubscription<List<ImageModel>> listenWithDetails(ImageModelTrigger trigger);
  void flush();

  Future<void> deleteAll();
}


