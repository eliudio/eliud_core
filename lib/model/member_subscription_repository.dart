/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_subscription_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/model/member_subscription_model.dart';

import 'dart:async';
import 'package:eliud_core/tools/firestore_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';

typedef MemberSubscriptionModelTrigger(List<MemberSubscriptionModel> list);

abstract class MemberSubscriptionRepository {
  Future<MemberSubscriptionModel> add(MemberSubscriptionModel value);
  Future<void> delete(MemberSubscriptionModel value);
  Future<MemberSubscriptionModel> get(String id);
  Future<MemberSubscriptionModel> update(MemberSubscriptionModel value);

  Stream<List<MemberSubscriptionModel>> values({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc});
  Stream<List<MemberSubscriptionModel>> valuesWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc});
  Future<List<MemberSubscriptionModel>> valuesList({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc});
  Future<List<MemberSubscriptionModel>> valuesListWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc});

  StreamSubscription<List<MemberSubscriptionModel>> listen(MemberSubscriptionModelTrigger trigger, {String currentMember, String orderBy, bool descending});
  StreamSubscription<List<MemberSubscriptionModel>> listenWithDetails(MemberSubscriptionModelTrigger trigger, {String currentMember, String orderBy, bool descending});
  void flush();

  Future<void> deleteAll();
}


