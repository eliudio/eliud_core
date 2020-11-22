/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:eliud_core/model/member_model.dart';

typedef MemberModelTrigger(List<MemberModel> list);

abstract class MemberRepository {
  Future<MemberModel> add(MemberModel value);
  Future<void> delete(MemberModel value);
  Future<MemberModel> get(String id);
  Future<MemberModel> update(MemberModel value);
  Stream<List<MemberModel>> valuesTest();
  Stream<List<MemberModel>> valuesWithDetailsTest();
  StreamSubscription<List<MemberModel>> listenTest(MemberModelTrigger trigger);
StreamSubscription<List<MemberModel>> listenWithDetailsTest(MemberModelTrigger trigger);
  void flush();
  Future<List<MemberModel>> valuesList();
  Future<List<MemberModel>> valuesListWithDetails();

  Future<void> deleteAll();
}


