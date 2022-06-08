/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:collection/collection.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/core/base/model_base.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_core/model/entity_export.dart';


import 'package:eliud_core/model/member_entity.dart';

import 'package:eliud_core/tools/random.dart';



class MemberModel implements ModelBase {

  // User UUID
  String documentID;
  String? name;
  List<MemberSubscriptionModel>? subscriptions;
  List<String>? subscriptionsAsStrArr;
  PublicMediumModel? photo;

  // photoURL is the url for the avatar, which comes from the providing login platform, e.g. google, but can be set by the user, which is then the URL of the photo provided
  String? photoURL;
  String? shipStreet1;
  String? shipStreet2;
  String? shipCity;
  String? shipState;
  String? postcode;
  String? country;
  bool? invoiceSame;
  String? invoiceStreet1;
  String? invoiceStreet2;
  String? invoiceCity;
  String? invoiceState;
  String? invoicePostcode;
  String? invoiceCountry;
  String? email;
  bool? isAnonymous;

  MemberModel({required this.documentID, this.name, this.subscriptions, this.subscriptionsAsStrArr, this.photo, this.photoURL, this.shipStreet1, this.shipStreet2, this.shipCity, this.shipState, this.postcode, this.country, this.invoiceSame, this.invoiceStreet1, this.invoiceStreet2, this.invoiceCity, this.invoiceState, this.invoicePostcode, this.invoiceCountry, this.email, this.isAnonymous, })  {
    assert(documentID != null);
  }

  MemberModel copyWith({String? documentID, String? name, List<MemberSubscriptionModel>? subscriptions, List<String>? subscriptionsAsStrArr, PublicMediumModel? photo, String? photoURL, String? shipStreet1, String? shipStreet2, String? shipCity, String? shipState, String? postcode, String? country, bool? invoiceSame, String? invoiceStreet1, String? invoiceStreet2, String? invoiceCity, String? invoiceState, String? invoicePostcode, String? invoiceCountry, String? email, bool? isAnonymous, }) {
    return MemberModel(documentID: documentID ?? this.documentID, name: name ?? this.name, subscriptions: subscriptions ?? this.subscriptions, subscriptionsAsStrArr: subscriptionsAsStrArr ?? this.subscriptionsAsStrArr, photo: photo ?? this.photo, photoURL: photoURL ?? this.photoURL, shipStreet1: shipStreet1 ?? this.shipStreet1, shipStreet2: shipStreet2 ?? this.shipStreet2, shipCity: shipCity ?? this.shipCity, shipState: shipState ?? this.shipState, postcode: postcode ?? this.postcode, country: country ?? this.country, invoiceSame: invoiceSame ?? this.invoiceSame, invoiceStreet1: invoiceStreet1 ?? this.invoiceStreet1, invoiceStreet2: invoiceStreet2 ?? this.invoiceStreet2, invoiceCity: invoiceCity ?? this.invoiceCity, invoiceState: invoiceState ?? this.invoiceState, invoicePostcode: invoicePostcode ?? this.invoicePostcode, invoiceCountry: invoiceCountry ?? this.invoiceCountry, email: email ?? this.email, isAnonymous: isAnonymous ?? this.isAnonymous, );
  }

  @override
  int get hashCode => documentID.hashCode ^ name.hashCode ^ subscriptions.hashCode ^ subscriptionsAsStrArr.hashCode ^ photo.hashCode ^ photoURL.hashCode ^ shipStreet1.hashCode ^ shipStreet2.hashCode ^ shipCity.hashCode ^ shipState.hashCode ^ postcode.hashCode ^ country.hashCode ^ invoiceSame.hashCode ^ invoiceStreet1.hashCode ^ invoiceStreet2.hashCode ^ invoiceCity.hashCode ^ invoiceState.hashCode ^ invoicePostcode.hashCode ^ invoiceCountry.hashCode ^ email.hashCode ^ isAnonymous.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is MemberModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          name == other.name &&
          ListEquality().equals(subscriptions, other.subscriptions) &&
          ListEquality().equals(subscriptionsAsStrArr, other.subscriptionsAsStrArr) &&
          photo == other.photo &&
          photoURL == other.photoURL &&
          shipStreet1 == other.shipStreet1 &&
          shipStreet2 == other.shipStreet2 &&
          shipCity == other.shipCity &&
          shipState == other.shipState &&
          postcode == other.postcode &&
          country == other.country &&
          invoiceSame == other.invoiceSame &&
          invoiceStreet1 == other.invoiceStreet1 &&
          invoiceStreet2 == other.invoiceStreet2 &&
          invoiceCity == other.invoiceCity &&
          invoiceState == other.invoiceState &&
          invoicePostcode == other.invoicePostcode &&
          invoiceCountry == other.invoiceCountry &&
          email == other.email &&
          isAnonymous == other.isAnonymous;

  String toJsonString({String? appId}) {
    return toEntity(appId: appId).toJsonString();
  }

  @override
  String toString() {
    String subscriptionsCsv = (subscriptions == null) ? '' : subscriptions!.join(', ');
    String subscriptionsAsStrArrCsv = (subscriptionsAsStrArr == null) ? '' : subscriptionsAsStrArr!.join(', ');

    return 'MemberModel{documentID: $documentID, name: $name, subscriptions: MemberSubscription[] { $subscriptionsCsv }, subscriptionsAsStrArr: String[] { $subscriptionsAsStrArrCsv }, photo: $photo, photoURL: $photoURL, shipStreet1: $shipStreet1, shipStreet2: $shipStreet2, shipCity: $shipCity, shipState: $shipState, postcode: $postcode, country: $country, invoiceSame: $invoiceSame, invoiceStreet1: $invoiceStreet1, invoiceStreet2: $invoiceStreet2, invoiceCity: $invoiceCity, invoiceState: $invoiceState, invoicePostcode: $invoicePostcode, invoiceCountry: $invoiceCountry, email: $email, isAnonymous: $isAnonymous}';
  }

  MemberEntity toEntity({String? appId}) {
    return MemberEntity(
          name: (name != null) ? name : null, 
          subscriptions: (subscriptions != null) ? subscriptions
            !.map((item) => item.toEntity(appId: appId))
            .toList() : null, 
          subscriptionsAsStrArr: (subscriptionsAsStrArr != null) ? subscriptionsAsStrArr : null, 
          photoId: (photo != null) ? photo!.documentID : null, 
          photoURL: (photoURL != null) ? photoURL : null, 
          shipStreet1: (shipStreet1 != null) ? shipStreet1 : null, 
          shipStreet2: (shipStreet2 != null) ? shipStreet2 : null, 
          shipCity: (shipCity != null) ? shipCity : null, 
          shipState: (shipState != null) ? shipState : null, 
          postcode: (postcode != null) ? postcode : null, 
          country: (country != null) ? country : null, 
          invoiceSame: (invoiceSame != null) ? invoiceSame : null, 
          invoiceStreet1: (invoiceStreet1 != null) ? invoiceStreet1 : null, 
          invoiceStreet2: (invoiceStreet2 != null) ? invoiceStreet2 : null, 
          invoiceCity: (invoiceCity != null) ? invoiceCity : null, 
          invoiceState: (invoiceState != null) ? invoiceState : null, 
          invoicePostcode: (invoicePostcode != null) ? invoicePostcode : null, 
          invoiceCountry: (invoiceCountry != null) ? invoiceCountry : null, 
          email: (email != null) ? email : null, 
          isAnonymous: (isAnonymous != null) ? isAnonymous : null, 
    );
  }

  static Future<MemberModel?> fromEntity(String documentID, MemberEntity? entity) async {
    if (entity == null) return null;
    var counter = 0;
    return MemberModel(
          documentID: documentID, 
          name: entity.name, 
          subscriptions: 
            entity.subscriptions == null ? null : List<MemberSubscriptionModel>.from(await Future.wait(entity. subscriptions
            !.map((item) {
            counter++;
              return MemberSubscriptionModel.fromEntity(counter.toString(), item);
            })
            .toList())), 
          subscriptionsAsStrArr: entity.subscriptionsAsStrArr, 
          photoURL: entity.photoURL, 
          shipStreet1: entity.shipStreet1, 
          shipStreet2: entity.shipStreet2, 
          shipCity: entity.shipCity, 
          shipState: entity.shipState, 
          postcode: entity.postcode, 
          country: entity.country, 
          invoiceSame: entity.invoiceSame, 
          invoiceStreet1: entity.invoiceStreet1, 
          invoiceStreet2: entity.invoiceStreet2, 
          invoiceCity: entity.invoiceCity, 
          invoiceState: entity.invoiceState, 
          invoicePostcode: entity.invoicePostcode, 
          invoiceCountry: entity.invoiceCountry, 
          email: entity.email, 
          isAnonymous: entity.isAnonymous, 
    );
  }

  static Future<MemberModel?> fromEntityPlus(String documentID, MemberEntity? entity, { String? appId}) async {
    if (entity == null) return null;

    PublicMediumModel? photoHolder;
    if (entity.photoId != null) {
      try {
          photoHolder = await publicMediumRepository(appId: appId)!.get(entity.photoId);
      } on Exception catch(e) {
        print('Error whilst trying to initialise photo');
        print('Error whilst retrieving publicMedium with id ${entity.photoId}');
        print('Exception: $e');
      }
    }

    var counter = 0;
    return MemberModel(
          documentID: documentID, 
          name: entity.name, 
          subscriptions: 
            entity. subscriptions == null ? null : List<MemberSubscriptionModel>.from(await Future.wait(entity. subscriptions
            !.map((item) {
            counter++;
            return MemberSubscriptionModel.fromEntityPlus(counter.toString(), item, appId: appId);})
            .toList())), 
          subscriptionsAsStrArr: entity.subscriptionsAsStrArr, 
          photo: photoHolder, 
          photoURL: entity.photoURL, 
          shipStreet1: entity.shipStreet1, 
          shipStreet2: entity.shipStreet2, 
          shipCity: entity.shipCity, 
          shipState: entity.shipState, 
          postcode: entity.postcode, 
          country: entity.country, 
          invoiceSame: entity.invoiceSame, 
          invoiceStreet1: entity.invoiceStreet1, 
          invoiceStreet2: entity.invoiceStreet2, 
          invoiceCity: entity.invoiceCity, 
          invoiceState: entity.invoiceState, 
          invoicePostcode: entity.invoicePostcode, 
          invoiceCountry: entity.invoiceCountry, 
          email: entity.email, 
          isAnonymous: entity.isAnonymous, 
    );
  }

}

