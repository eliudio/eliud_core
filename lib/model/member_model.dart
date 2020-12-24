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
import 'package:eliud_core/core/global_data.dart';
import 'package:eliud_core/tools/common_tools.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_core/model/entity_export.dart';


import 'package:eliud_core/model/member_entity.dart';

import 'package:eliud_core/tools/random.dart';



class MemberModel {

  // User UUID
  String documentID;
  String name;
  List<MemberSubscriptionModel> subscriptions;
  String photoURL;
  String shipStreet1;
  String shipStreet2;
  String shipCity;
  String shipState;
  String postcode;
  CountryModel country;
  bool invoiceSame;
  String invoiceStreet1;
  String invoiceStreet2;
  String invoiceCity;
  String invoiceState;
  String invoicePostcode;
  CountryModel invoiceCountry;
  List<String> readAccess;
  String email;
  bool isAnonymous;
  Map<String, Object> packageData;

  MemberModel({this.documentID, this.name, this.subscriptions, this.photoURL, this.shipStreet1, this.shipStreet2, this.shipCity, this.shipState, this.postcode, this.country, this.invoiceSame, this.invoiceStreet1, this.invoiceStreet2, this.invoiceCity, this.invoiceState, this.invoicePostcode, this.invoiceCountry, this.readAccess, this.email, this.isAnonymous, this.packageData, })  {
    assert(documentID != null);
  }

  MemberModel copyWith({String documentID, String name, List<MemberSubscriptionModel> subscriptions, String photoURL, String shipStreet1, String shipStreet2, String shipCity, String shipState, String postcode, CountryModel country, bool invoiceSame, String invoiceStreet1, String invoiceStreet2, String invoiceCity, String invoiceState, String invoicePostcode, CountryModel invoiceCountry, List<String> readAccess, String email, bool isAnonymous, Map<String, Object> packageData, }) {
    return MemberModel(documentID: documentID ?? this.documentID, name: name ?? this.name, subscriptions: subscriptions ?? this.subscriptions, photoURL: photoURL ?? this.photoURL, shipStreet1: shipStreet1 ?? this.shipStreet1, shipStreet2: shipStreet2 ?? this.shipStreet2, shipCity: shipCity ?? this.shipCity, shipState: shipState ?? this.shipState, postcode: postcode ?? this.postcode, country: country ?? this.country, invoiceSame: invoiceSame ?? this.invoiceSame, invoiceStreet1: invoiceStreet1 ?? this.invoiceStreet1, invoiceStreet2: invoiceStreet2 ?? this.invoiceStreet2, invoiceCity: invoiceCity ?? this.invoiceCity, invoiceState: invoiceState ?? this.invoiceState, invoicePostcode: invoicePostcode ?? this.invoicePostcode, invoiceCountry: invoiceCountry ?? this.invoiceCountry, readAccess: readAccess ?? this.readAccess, email: email ?? this.email, isAnonymous: isAnonymous ?? this.isAnonymous, packageData: packageData ?? this.packageData, );
  }

  @override
  int get hashCode => documentID.hashCode ^ name.hashCode ^ subscriptions.hashCode ^ photoURL.hashCode ^ shipStreet1.hashCode ^ shipStreet2.hashCode ^ shipCity.hashCode ^ shipState.hashCode ^ postcode.hashCode ^ country.hashCode ^ invoiceSame.hashCode ^ invoiceStreet1.hashCode ^ invoiceStreet2.hashCode ^ invoiceCity.hashCode ^ invoiceState.hashCode ^ invoicePostcode.hashCode ^ invoiceCountry.hashCode ^ readAccess.hashCode ^ email.hashCode ^ isAnonymous.hashCode ^ packageData.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is MemberModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          name == other.name &&
          ListEquality().equals(subscriptions, other.subscriptions) &&
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
          ListEquality().equals(readAccess, other.readAccess) &&
          email == other.email &&
          isAnonymous == other.isAnonymous &&
          packageData == other.packageData;

  @override
  String toString() {
    String subscriptionsCsv = (subscriptions == null) ? '' : subscriptions.join(', ');
    String readAccessCsv = (readAccess == null) ? '' : readAccess.join(', ');

    return 'MemberModel{documentID: $documentID, name: $name, subscriptions: MemberSubscription[] { $subscriptionsCsv }, photoURL: $photoURL, shipStreet1: $shipStreet1, shipStreet2: $shipStreet2, shipCity: $shipCity, shipState: $shipState, postcode: $postcode, country: $country, invoiceSame: $invoiceSame, invoiceStreet1: $invoiceStreet1, invoiceStreet2: $invoiceStreet2, invoiceCity: $invoiceCity, invoiceState: $invoiceState, invoicePostcode: $invoicePostcode, invoiceCountry: $invoiceCountry, readAccess: String[] { $readAccessCsv }, email: $email, isAnonymous: $isAnonymous, packageData: $packageData}';
  }

  MemberEntity toEntity({String appId}) {
    readAccess = subscriptions.map((subscription) => subscription.app.ownerID).toList();
    return MemberEntity(
          name: (name != null) ? name : null, 
          subscriptions: (subscriptions != null) ? subscriptions
            .map((item) => item.toEntity(appId: appId))
            .toList() : null, 
          photoURL: (photoURL != null) ? photoURL : null, 
          shipStreet1: (shipStreet1 != null) ? shipStreet1 : null, 
          shipStreet2: (shipStreet2 != null) ? shipStreet2 : null, 
          shipCity: (shipCity != null) ? shipCity : null, 
          shipState: (shipState != null) ? shipState : null, 
          postcode: (postcode != null) ? postcode : null, 
          countryId: (country != null) ? country.documentID : null, 
          invoiceSame: (invoiceSame != null) ? invoiceSame : null, 
          invoiceStreet1: (invoiceStreet1 != null) ? invoiceStreet1 : null, 
          invoiceStreet2: (invoiceStreet2 != null) ? invoiceStreet2 : null, 
          invoiceCity: (invoiceCity != null) ? invoiceCity : null, 
          invoiceState: (invoiceState != null) ? invoiceState : null, 
          invoicePostcode: (invoicePostcode != null) ? invoicePostcode : null, 
          invoiceCountryId: (invoiceCountry != null) ? invoiceCountry.documentID : null, 
          readAccess: (readAccess != null) ? readAccess : null, 
          email: (email != null) ? email : null, 
          isAnonymous: (isAnonymous != null) ? isAnonymous : null, 
          packageData: packageData,     );
  }

  static MemberModel fromEntity(String documentID, MemberEntity entity) {
    if (entity == null) return null;
    return MemberModel(
          documentID: documentID, 
          name: entity.name, 
          subscriptions: 
            entity. subscriptions
            .map((item) => MemberSubscriptionModel.fromEntity(newRandomKey(), item))
            .toList(), 
          photoURL: entity.photoURL, 
          shipStreet1: entity.shipStreet1, 
          shipStreet2: entity.shipStreet2, 
          shipCity: entity.shipCity, 
          shipState: entity.shipState, 
          postcode: entity.postcode, 
          invoiceSame: entity.invoiceSame, 
          invoiceStreet1: entity.invoiceStreet1, 
          invoiceStreet2: entity.invoiceStreet2, 
          invoiceCity: entity.invoiceCity, 
          invoiceState: entity.invoiceState, 
          invoicePostcode: entity.invoicePostcode, 
          readAccess: entity.readAccess, 
          email: entity.email, 
          isAnonymous: entity.isAnonymous, 
          packageData: entity.packageData, 
    );
  }

  static Future<MemberModel> fromEntityPlus(String documentID, MemberEntity entity, { String appId}) async {
    if (entity == null) return null;

    CountryModel countryHolder;
    if (entity.countryId != null) {
      try {
        await countryRepository(appId: appId).get(entity.countryId).then((val) {
          countryHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    CountryModel invoiceCountryHolder;
    if (entity.invoiceCountryId != null) {
      try {
        await countryRepository(appId: appId).get(entity.invoiceCountryId).then((val) {
          invoiceCountryHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    return MemberModel(
          documentID: documentID, 
          name: entity.name, 
          subscriptions: 
            new List<MemberSubscriptionModel>.from(await Future.wait(entity. subscriptions
            .map((item) => MemberSubscriptionModel.fromEntityPlus(newRandomKey(), item, appId: appId))
            .toList())), 
          photoURL: entity.photoURL, 
          shipStreet1: entity.shipStreet1, 
          shipStreet2: entity.shipStreet2, 
          shipCity: entity.shipCity, 
          shipState: entity.shipState, 
          postcode: entity.postcode, 
          country: countryHolder, 
          invoiceSame: entity.invoiceSame, 
          invoiceStreet1: entity.invoiceStreet1, 
          invoiceStreet2: entity.invoiceStreet2, 
          invoiceCity: entity.invoiceCity, 
          invoiceState: entity.invoiceState, 
          invoicePostcode: entity.invoicePostcode, 
          invoiceCountry: invoiceCountryHolder, 
          readAccess: entity.readAccess, 
          email: entity.email, 
          isAnonymous: entity.isAnonymous, 
          packageData: entity.packageData, 
    );
  }

}

