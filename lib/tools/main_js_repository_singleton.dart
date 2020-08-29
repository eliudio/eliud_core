import 'package:eliud_core/core/access/bloc/user_repository.dart';
import 'package:eliud_core/model/app_cache.dart';
import 'package:eliud_core/model/app_js_firestore.dart';
import 'package:eliud_core/model/app_repository.dart';
import 'package:eliud_core/model/image_cache.dart';
import 'package:eliud_core/model/image_js_firestore_bespoke.dart';
import 'package:eliud_core/model/image_repository.dart';

import 'main_abstract_repository_singleton.dart';

class JsMainRepositorySingleton extends AbstractMainRepositorySingleton {
  JsMainRepositorySingleton(String appID) {
    _imageRepository = ImageCache(ImageJsFirestore(appID));
    _appRepository = AppCache(AppJsFirestore());
    _userRepository = UserRepository();
  }

  @override
  ImageRepository imageRepository() => _imageRepository;
  ImageRepository _imageRepository;

  @override
  AppRepository appRepository() => _appRepository;
  AppRepository _appRepository;

  @override
  UserRepository userRepository() => _userRepository;
  UserRepository _userRepository;
}
