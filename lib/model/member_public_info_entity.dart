/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_public_info_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';

import 'package:eliud_core/model/entity_export.dart';
class MemberPublicInfoEntity {
  final String? name;
  final String? photoURL;
  final List<MemberSubscriptionEntity>? subscriptions;

  MemberPublicInfoEntity({this.name, this.photoURL, this.subscriptions, });


  List<Object?> get props => [name, photoURL, subscriptions, ];

  @override
  String toString() {
    String subscriptionsCsv = (subscriptions == null) ? '' : subscriptions!.join(', ');

    return 'MemberPublicInfoEntity{name: $name, photoURL: $photoURL, subscriptions: MemberSubscription[] { $subscriptionsCsv }}';
  }

  static MemberPublicInfoEntity? fromMap(Object? o) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    var subscriptionsFromMap;
    subscriptionsFromMap = map['subscriptions'];
    var subscriptionsList;
    if (subscriptionsFromMap != null)
      subscriptionsList = (map['subscriptions'] as List<dynamic>)
        .map((dynamic item) =>
        MemberSubscriptionEntity.fromMap(item as Map)!)
        .toList();

    return MemberPublicInfoEntity(
      name: map['name'], 
      photoURL: map['photoURL'], 
      subscriptions: subscriptionsList, 
    );
  }

  Map<String, Object?> toDocument() {
    final List<Map<String?, dynamic>>? subscriptionsListMap = subscriptions != null 
        ? subscriptions!.map((item) => item.toDocument()).toList()
        : null;

    Map<String, Object?> theDocument = HashMap();
    if (name != null) theDocument["name"] = name;
      else theDocument["name"] = null;
    if (photoURL != null) theDocument["photoURL"] = photoURL;
      else theDocument["photoURL"] = null;
    if (subscriptions != null) theDocument["subscriptions"] = subscriptionsListMap;
      else theDocument["subscriptions"] = null;
    return theDocument;
  }

  static MemberPublicInfoEntity? fromJsonString(String json) {
    Map<String, dynamic>? generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

}

