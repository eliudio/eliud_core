import 'package:eliud_core/core/access/bloc/user_repository.dart';

import 'package:eliud_core/model/member_repository.dart';
import 'package:eliud_core/model/app_repository.dart';
import 'package:eliud_core/model/image_repository.dart';

// to keep the generated code simple, these repository methods allow to specify the appID, although they're ignored
ImageRepository imageRepository({String appId}) => AbstractMainRepositorySingleton.singleton.imageRepository(appId);
UserRepository userRepository({String appId}) => AbstractMainRepositorySingleton.singleton.userRepository();
AppRepository appRepository({String appId}) => AbstractMainRepositorySingleton.singleton.appRepository();
MemberRepository memberRepository({String appId}) => AbstractMainRepositorySingleton.singleton.memberRepository();

abstract class AbstractMainRepositorySingleton {
  static AbstractMainRepositorySingleton singleton;

  ImageRepository imageRepository(String appId);
  UserRepository userRepository();
  AppRepository appRepository();
  MemberRepository memberRepository();

  void flush(String appId) {
    imageRepository(appId).flush();
  }
}
