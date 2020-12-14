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
  Stream<List<MemberModel>> values(String currentMember, {String orderBy, bool descending });
  Stream<List<MemberModel>> valuesWithDetails(String currentMember, {String orderBy, bool descending });
  Future<List<MemberModel>> valuesList(String currentMember, {String orderBy, bool descending });
  Future<List<MemberModel>> valuesListWithDetails(String currentMember, {String orderBy, bool descending });
  StreamSubscription<List<MemberModel>> listen(String currentMember, MemberModelTrigger trigger, { String orderBy, bool descending });
  StreamSubscription<List<MemberModel>> listenWithDetails(String currentMember, MemberModelTrigger trigger, { String orderBy, bool descending });
  void flush();

  Future<void> deleteAll();
}


