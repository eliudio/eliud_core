/*
Bespoke
*/

import 'dart:async';
import 'package:eliud_core/model/member_model.dart';

typedef MemberModelTrigger(List<MemberModel> list);

abstract class MemberRepository {
  Future<MemberModel> add(MemberModel value);
  Future<void> delete(MemberModel value);
  Future<MemberModel> get(String id);
  Future<MemberModel> update(MemberModel value);
  Stream<List<MemberModel>> values(String currentMember);
  Stream<List<MemberModel>> valuesWithDetails(String currentMember);
  StreamSubscription<List<MemberModel>> listen(String currentMember,MemberModelTrigger trigger, { String orderBy, bool descending });
  StreamSubscription<List<MemberModel>> listenWithDetails(String currentMember,MemberModelTrigger trigger);
  void flush();
  Future<List<MemberModel>> valuesList(String currentMember);
  Future<List<MemberModel>> valuesListWithDetails(String currentMember);

  Future<void> deleteAll();
}


