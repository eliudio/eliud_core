/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'abstract_repository_singleton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_core/model/entity_export.dart';

import 'package:eliud_core/tools/common_tools.dart';
class MemberEntity {
  final String? name;
  final List<MemberSubscriptionEntity>? subscriptions;
  final List<String>? subscriptionsAsStrArr;
  final String? photoURL;
  final String? shipStreet1;
  final String? shipStreet2;
  final String? shipCity;
  final String? shipState;
  final String? postcode;
  final String? countryId;
  final bool? invoiceSame;
  final String? invoiceStreet1;
  final String? invoiceStreet2;
  final String? invoiceCity;
  final String? invoiceState;
  final String? invoicePostcode;
  final String? invoiceCountryId;
  final String? email;
  final bool? isAnonymous;

  MemberEntity({this.name, this.subscriptions, this.subscriptionsAsStrArr, this.photoURL, this.shipStreet1, this.shipStreet2, this.shipCity, this.shipState, this.postcode, this.countryId, this.invoiceSame, this.invoiceStreet1, this.invoiceStreet2, this.invoiceCity, this.invoiceState, this.invoicePostcode, this.invoiceCountryId, this.email, this.isAnonymous, });


  List<Object?> get props => [name, subscriptions, subscriptionsAsStrArr, photoURL, shipStreet1, shipStreet2, shipCity, shipState, postcode, countryId, invoiceSame, invoiceStreet1, invoiceStreet2, invoiceCity, invoiceState, invoicePostcode, invoiceCountryId, email, isAnonymous, ];

  @override
  String toString() {
    String subscriptionsCsv = (subscriptions == null) ? '' : subscriptions!.join(', ');
    String subscriptionsAsStrArrCsv = (subscriptionsAsStrArr == null) ? '' : subscriptionsAsStrArr!.join(', ');

    return 'MemberEntity{name: $name, subscriptions: MemberSubscription[] { $subscriptionsCsv }, subscriptionsAsStrArr: String[] { $subscriptionsAsStrArrCsv }, photoURL: $photoURL, shipStreet1: $shipStreet1, shipStreet2: $shipStreet2, shipCity: $shipCity, shipState: $shipState, postcode: $postcode, countryId: $countryId, invoiceSame: $invoiceSame, invoiceStreet1: $invoiceStreet1, invoiceStreet2: $invoiceStreet2, invoiceCity: $invoiceCity, invoiceState: $invoiceState, invoicePostcode: $invoicePostcode, invoiceCountryId: $invoiceCountryId, email: $email, isAnonymous: $isAnonymous}';
  }

  static MemberEntity? fromMap(Object? o) {
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

    return MemberEntity(
      name: map['name'], 
      subscriptions: subscriptionsList, 
      subscriptionsAsStrArr: map['subscriptionsAsStrArr'] == null ? null : List.from(map['subscriptionsAsStrArr']), 
      photoURL: map['photoURL'], 
      shipStreet1: map['shipStreet1'], 
      shipStreet2: map['shipStreet2'], 
      shipCity: map['shipCity'], 
      shipState: map['shipState'], 
      postcode: map['postcode'], 
      countryId: map['countryId'], 
      invoiceSame: map['invoiceSame'], 
      invoiceStreet1: map['invoiceStreet1'], 
      invoiceStreet2: map['invoiceStreet2'], 
      invoiceCity: map['invoiceCity'], 
      invoiceState: map['invoiceState'], 
      invoicePostcode: map['invoicePostcode'], 
      invoiceCountryId: map['invoiceCountryId'], 
      email: map['email'], 
      isAnonymous: map['isAnonymous'], 
    );
  }

  Map<String, Object?> toDocument() {
    final List<Map<String?, dynamic>>? subscriptionsListMap = subscriptions != null 
        ? subscriptions!.map((item) => item.toDocument()).toList()
        : null;

    Map<String, Object?> theDocument = HashMap();
    if (name != null) theDocument["name"] = name;
      else theDocument["name"] = null;
    if (subscriptions != null) theDocument["subscriptions"] = subscriptionsListMap;
      else theDocument["subscriptions"] = null;
    if (subscriptionsAsStrArr != null) theDocument["subscriptionsAsStrArr"] = subscriptionsAsStrArr!.toList();
      else theDocument["subscriptionsAsStrArr"] = null;
    if (photoURL != null) theDocument["photoURL"] = photoURL;
      else theDocument["photoURL"] = null;
    if (shipStreet1 != null) theDocument["shipStreet1"] = shipStreet1;
      else theDocument["shipStreet1"] = null;
    if (shipStreet2 != null) theDocument["shipStreet2"] = shipStreet2;
      else theDocument["shipStreet2"] = null;
    if (shipCity != null) theDocument["shipCity"] = shipCity;
      else theDocument["shipCity"] = null;
    if (shipState != null) theDocument["shipState"] = shipState;
      else theDocument["shipState"] = null;
    if (postcode != null) theDocument["postcode"] = postcode;
      else theDocument["postcode"] = null;
    if (countryId != null) theDocument["countryId"] = countryId;
      else theDocument["countryId"] = null;
    if (invoiceSame != null) theDocument["invoiceSame"] = invoiceSame;
      else theDocument["invoiceSame"] = null;
    if (invoiceStreet1 != null) theDocument["invoiceStreet1"] = invoiceStreet1;
      else theDocument["invoiceStreet1"] = null;
    if (invoiceStreet2 != null) theDocument["invoiceStreet2"] = invoiceStreet2;
      else theDocument["invoiceStreet2"] = null;
    if (invoiceCity != null) theDocument["invoiceCity"] = invoiceCity;
      else theDocument["invoiceCity"] = null;
    if (invoiceState != null) theDocument["invoiceState"] = invoiceState;
      else theDocument["invoiceState"] = null;
    if (invoicePostcode != null) theDocument["invoicePostcode"] = invoicePostcode;
      else theDocument["invoicePostcode"] = null;
    if (invoiceCountryId != null) theDocument["invoiceCountryId"] = invoiceCountryId;
      else theDocument["invoiceCountryId"] = null;
    if (email != null) theDocument["email"] = email;
      else theDocument["email"] = null;
    if (isAnonymous != null) theDocument["isAnonymous"] = isAnonymous;
      else theDocument["isAnonymous"] = null;
    return theDocument;
  }

  static MemberEntity? fromJsonString(String json) {
    Map<String, dynamic>? generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

}

