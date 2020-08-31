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

import 'package:eliud_core/core/global_data.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import '../model/abstract_repository_singleton.dart';
import 'repository_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import '../model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import '../model/entity_export.dart';


import 'member_subscription_entity.dart';
import 'package:eliud_core/tools/random.dart';



class MemberSubscriptionModel {
  String documentID;
  AppModel app;

  MemberSubscriptionModel({this.documentID, this.app, })  {
    assert(documentID != null);
  }

  MemberSubscriptionModel copyWith({String documentID, AppModel app, }) {
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

  MemberSubscriptionEntity toEntity() {
    return MemberSubscriptionEntity(
          appId: (app != null) ? app.documentID : null, 
    );
  }

  static MemberSubscriptionModel fromEntity(String documentID, MemberSubscriptionEntity entity) {
    if (entity == null) return null;
    return MemberSubscriptionModel(
          documentID: documentID, 
    );
  }

  static Future<MemberSubscriptionModel> fromEntityPlus(String documentID, MemberSubscriptionEntity entity) async {
    if (entity == null) return null;

    AppModel appHolder;
    if (entity.appId != null) {
      try {
        await appRepository().get(entity.appId).then((val) {
          appHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    return MemberSubscriptionModel(
          documentID: documentID, 
          app: appHolder, 
    );
  }

}

