import 'package:eliud_core/core/access/bloc/user_repository.dart';
import 'package:eliud_core/model/app_cache.dart';
import 'package:eliud_core/model/app_firestore.dart';
import 'package:eliud_core/model/app_repository.dart';
import 'package:eliud_core/model/member_cache.dart';
import 'package:eliud_core/model/member_firestore.dart';
import 'package:eliud_core/model/member_repository.dart';

import '../model/image_repository.dart';
import '../model/image_cache.dart';

import '../model/image_firestore_bespoke.dart';
import 'main_abstract_repository_singleton.dart';

class MainRepositorySingleton extends AbstractMainRepositorySingleton {
  MainRepositorySingleton(String appID) {
    _imageRepository = ImageCache(ImageFirestore(appID));
    _appRepository = AppCache(AppFirestore());
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
