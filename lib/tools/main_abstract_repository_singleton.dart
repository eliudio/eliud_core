import 'package:eliud_core/core/access/bloc/user_repository.dart';

import '../model/member_repository.dart';
import '../model/app_repository.dart';
import '../model/image_repository.dart';

ImageRepository imageRepository() => AbstractMainRepositorySingleton.singleton.imageRepository();
UserRepository userRepository() => AbstractMainRepositorySingleton.singleton.userRepository();
AppRepository appRepository() => AbstractMainRepositorySingleton.singleton.appRepository();

abstract class AbstractMainRepositorySingleton {
  static AbstractMainRepositorySingleton singleton;

  ImageRepository imageRepository();
  UserRepository userRepository();
  AppRepository appRepository();

  void flush() {
    imageRepository().flush();
  }
}
