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
import 'image_model.dart';

typedef ImageModelTrigger(List<ImageModel> list);

abstract class ImageRepository {
  Future<ImageModel> add(ImageModel value);
  Future<void> delete(ImageModel value);
  Future<ImageModel> get(String id);
  Future<ImageModel> update(ImageModel value);
  Stream<List<ImageModel>> values();
  Stream<List<ImageModel>> valuesWithDetails();
  StreamSubscription<List<ImageModel>> listen(ImageModelTrigger trigger);
StreamSubscription<List<ImageModel>> listenWithDetails(ImageModelTrigger trigger);
  void flush();
  Future<List<ImageModel>> valuesList();
  Future<List<ImageModel>> valuesListWithDetails();

  Future<void> deleteAll();
}


