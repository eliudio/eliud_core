import 'package:eliud_core/core/access/bloc/user_repository.dart';

import 'package:eliud_core/model/member_repository.dart';
import 'package:eliud_core/model/app_repository.dart';
import 'package:eliud_core/model/image_repository.dart';

// to keep the generated code simple, these repository methods allow to specify the appID, although they're ignored
ImageRepository imageRepository({String appID}) => AbstractMainRepositorySingleton.singleton.imageRepository(appID);
UserRepository userRepository({String appID}) => AbstractMainRepositorySingleton.singleton.userRepository();
AppRepository appRepository({String appID}) => AbstractMainRepositorySingleton.singleton.appRepository();

abstract class AbstractMainRepositorySingleton {
  static AbstractMainRepositorySingleton singleton;

  ImageRepository imageRepository(String appId);
  UserRepository userRepository();
  AppRepository appRepository();

  void flush(String appId) {
    imageRepository(appId).flush();
  }
}
