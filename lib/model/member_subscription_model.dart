/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_subscription_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/tools/common_tools.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/core/base/model_base.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:eliud_core/model/app_model.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_core/model/entity_export.dart';


import 'package:eliud_core/model/member_subscription_entity.dart';

import 'package:eliud_core/tools/random.dart';



class MemberSubscriptionModel implements ModelBase {
  static const String packageName = 'eliud_core';
  static const String id = 'MemberSubscription';

  String documentID;
  AppModel? app;

  MemberSubscriptionModel({required this.documentID, this.app, })  {
    assert(documentID != null);
  }

  MemberSubscriptionModel copyWith({String? documentID, AppModel? app, }) {
    return MemberSubscriptionModel(documentID: documentID ?? this.documentID, app: app ?? this.app, );
  }

  @override
  int get hashCode => documentID.hashCode ^ app.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is MemberSubscriptionModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          app == other.app;

  @override
  String toString() {
    return 'MemberSubscriptionModel{documentID: $documentID, app: $app}';
  }

  MemberSubscriptionEntity toEntity({String? appId, List<ModelReference>? referencesCollector}) {
    if (referencesCollector != null) {
      if (app != null) referencesCollector.add(ModelReference(AppModel.packageName, AppModel.id, app!));
    }
    return MemberSubscriptionEntity(
          appId: (app != null) ? app!.documentID : null, 
    );
  }

  static Future<MemberSubscriptionModel?> fromEntity(String documentID, MemberSubscriptionEntity? entity) async {
    if (entity == null) return null;
    var counter = 0;
    return MemberSubscriptionModel(
          documentID: documentID, 
    );
  }

  static Future<MemberSubscriptionModel?> fromEntityPlus(String documentID, MemberSubscriptionEntity? entity, { String? appId}) async {
    if (entity == null) return null;

    AppModel? appHolder;
    if (entity.appId != null) {
      try {
          appHolder = await appRepository(appId: appId)!.get(entity.appId);
      } on Exception catch(e) {
        print('Error whilst trying to initialise app');
        print('Error whilst retrieving app with id ${entity.appId}');
        print('Exception: $e');
      }
    }

    var counter = 0;
    return MemberSubscriptionModel(
          documentID: documentID, 
          app: appHolder, 
    );
  }

}

