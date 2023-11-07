/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_public_info_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:collection/collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/core/base/model_base.dart';

import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';

import 'package:eliud_core/model/member_public_info_entity.dart';

class MemberPublicInfoModel implements ModelBase {
  static const String packageName = 'eliud_core';
  static const String id = 'memberPublicInfos';

  // User UUID
  @override
  String documentID;
  String? name;
  String? photoURL;
  List<MemberSubscriptionModel>? subscriptions;

  MemberPublicInfoModel({
    required this.documentID,
    this.name,
    this.photoURL,
    this.subscriptions,
  });

  @override
  MemberPublicInfoModel copyWith({
    String? documentID,
    String? name,
    String? photoURL,
    List<MemberSubscriptionModel>? subscriptions,
  }) {
    return MemberPublicInfoModel(
      documentID: documentID ?? this.documentID,
      name: name ?? this.name,
      photoURL: photoURL ?? this.photoURL,
      subscriptions: subscriptions ?? this.subscriptions,
    );
  }

  @override
  int get hashCode =>
      documentID.hashCode ^
      name.hashCode ^
      photoURL.hashCode ^
      subscriptions.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MemberPublicInfoModel &&
          runtimeType == other.runtimeType &&
          documentID == other.documentID &&
          name == other.name &&
          photoURL == other.photoURL &&
          ListEquality().equals(subscriptions, other.subscriptions);

  @override
  String toString() {
    String subscriptionsCsv =
        (subscriptions == null) ? '' : subscriptions!.join(', ');

    return 'MemberPublicInfoModel{documentID: $documentID, name: $name, photoURL: $photoURL, subscriptions: MemberSubscription[] { $subscriptionsCsv }}';
  }

  @override
  Future<List<ModelReference>> collectReferences({String? appId}) async {
    List<ModelReference> referencesCollector = [];
    if (subscriptions != null) {
      for (var item in subscriptions!) {
        referencesCollector.addAll(await item.collectReferences(appId: appId));
      }
    }
    return referencesCollector;
  }

  @override
  MemberPublicInfoEntity toEntity({String? appId}) {
    return MemberPublicInfoEntity(
      name: (name != null) ? name : null,
      photoURL: (photoURL != null) ? photoURL : null,
      subscriptions: (subscriptions != null)
          ? subscriptions!.map((item) => item.toEntity(appId: appId)).toList()
          : null,
    );
  }

  static Future<MemberPublicInfoModel?> fromEntity(
      String documentID, MemberPublicInfoEntity? entity) async {
    if (entity == null) return null;
    var counter = 0;
    return MemberPublicInfoModel(
      documentID: documentID,
      name: entity.name,
      photoURL: entity.photoURL,
      subscriptions: entity.subscriptions == null
          ? null
          : List<MemberSubscriptionModel>.from(
              await Future.wait(entity.subscriptions!.map((item) {
              counter++;
              return MemberSubscriptionModel.fromEntity(
                  counter.toString(), item);
            }).toList())),
    );
  }

  static Future<MemberPublicInfoModel?> fromEntityPlus(
      String documentID, MemberPublicInfoEntity? entity,
      {String? appId}) async {
    if (entity == null) return null;

    var counter = 0;
    return MemberPublicInfoModel(
      documentID: documentID,
      name: entity.name,
      photoURL: entity.photoURL,
      subscriptions: entity.subscriptions == null
          ? null
          : List<MemberSubscriptionModel>.from(
              await Future.wait(entity.subscriptions!.map((item) {
              counter++;
              return MemberSubscriptionModel.fromEntityPlus(
                  counter.toString(), item,
                  appId: appId);
            }).toList())),
    );
  }
}
