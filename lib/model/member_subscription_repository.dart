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

import 'dart:async';
import 'package:eliud_core/model/member_subscription_model.dart';

typedef MemberSubscriptionModelTrigger(List<MemberSubscriptionModel> list);

abstract class MemberSubscriptionRepository {
  Future<MemberSubscriptionModel> add(MemberSubscriptionModel value);
  Future<void> delete(MemberSubscriptionModel value);
  Future<MemberSubscriptionModel> get(String id);
  Future<MemberSubscriptionModel> update(MemberSubscriptionModel value);
  Stream<List<MemberSubscriptionModel>> values();
  Stream<List<MemberSubscriptionModel>> valuesWithDetails();
  StreamSubscription<List<MemberSubscriptionModel>> listen(MemberSubscriptionModelTrigger trigger, { String orderBy, bool descending });
  StreamSubscription<List<MemberSubscriptionModel>> listenWithDetails(MemberSubscriptionModelTrigger trigger);
  void flush();
  Future<List<MemberSubscriptionModel>> valuesList();
  Future<List<MemberSubscriptionModel>> valuesListWithDetails();

  Future<void> deleteAll();
}


