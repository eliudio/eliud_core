import 'dart:collection';
import 'package:eliud_core/core/access/bloc/user_repository.dart';
import 'package:eliud_core/model/app_cache.dart';
import 'package:eliud_core/model/app_firestore.dart';
import 'package:eliud_core/model/app_repository.dart';
import 'package:eliud_core/model/member_cache.dart';
import 'package:eliud_core/model/member_firestore_bespoke.dart';
import 'package:eliud_core/model/member_repository.dart';
import 'main_abstract_repository_singleton.dart';

class MainRepositorySingleton extends AbstractMainRepositorySingleton {
  MainRepositorySingleton() {
    _appRepository = AppCache(AppFirestore());
    _userRepository = UserRepository();
    _memberRepository = MemberCache(MemberFirestore());
  }

  @override
  AppRepository appRepository() => _appRepository;
  AppRepository _appRepository;

  @override
  UserRepository userRepository() => _userRepository;
  UserRepository _userRepository;

  @override
  MemberRepository memberRepository() => _memberRepository;
  MemberRepository _memberRepository;
}
