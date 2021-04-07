/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 app_home_page_references_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/core/global_data.dart';
import 'package:eliud_core/tools/common_tools.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_core/model/entity_export.dart';


import 'package:eliud_core/model/app_home_page_references_entity.dart';

import 'package:eliud_core/tools/random.dart';



class AppHomePageReferencesModel {

  // Entry page for blocked member
  String? homePageBlockedMemberId;

  // Entry page for subscribed member
  String? homePageSubscribedMemberId;

  // Entry page for level 1 privileged member
  String? homePageLevel1MemberId;

  // Entry page for level 2 privileged member
  String? homePageLevel2MemberId;

  // Entry page for the owner
  String? homePageOwnerId;

  AppHomePageReferencesModel({this.homePageBlockedMemberId, this.homePageSubscribedMemberId, this.homePageLevel1MemberId, this.homePageLevel2MemberId, this.homePageOwnerId, })  {
  }

  AppHomePageReferencesModel copyWith({String? homePageBlockedMemberId, String? homePageSubscribedMemberId, String? homePageLevel1MemberId, String? homePageLevel2MemberId, String? homePageOwnerId, }) {
    return AppHomePageReferencesModel(homePageBlockedMemberId: homePageBlockedMemberId ?? this.homePageBlockedMemberId, homePageSubscribedMemberId: homePageSubscribedMemberId ?? this.homePageSubscribedMemberId, homePageLevel1MemberId: homePageLevel1MemberId ?? this.homePageLevel1MemberId, homePageLevel2MemberId: homePageLevel2MemberId ?? this.homePageLevel2MemberId, homePageOwnerId: homePageOwnerId ?? this.homePageOwnerId, );
  }

  @override
  int get hashCode => homePageBlockedMemberId.hashCode ^ homePageSubscribedMemberId.hashCode ^ homePageLevel1MemberId.hashCode ^ homePageLevel2MemberId.hashCode ^ homePageOwnerId.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is AppHomePageReferencesModel &&
          runtimeType == other.runtimeType && 
          homePageBlockedMemberId == other.homePageBlockedMemberId &&
          homePageSubscribedMemberId == other.homePageSubscribedMemberId &&
          homePageLevel1MemberId == other.homePageLevel1MemberId &&
          homePageLevel2MemberId == other.homePageLevel2MemberId &&
          homePageOwnerId == other.homePageOwnerId;

  @override
  String toString() {
    return 'AppHomePageReferencesModel{homePageBlockedMemberId: $homePageBlockedMemberId, homePageSubscribedMemberId: $homePageSubscribedMemberId, homePageLevel1MemberId: $homePageLevel1MemberId, homePageLevel2MemberId: $homePageLevel2MemberId, homePageOwnerId: $homePageOwnerId}';
  }

  AppHomePageReferencesEntity toEntity({String? appId}) {
    return AppHomePageReferencesEntity(
          homePageBlockedMemberId: (homePageBlockedMemberId != null) ? homePageBlockedMemberId : null, 
          homePageSubscribedMemberId: (homePageSubscribedMemberId != null) ? homePageSubscribedMemberId : null, 
          homePageLevel1MemberId: (homePageLevel1MemberId != null) ? homePageLevel1MemberId : null, 
          homePageLevel2MemberId: (homePageLevel2MemberId != null) ? homePageLevel2MemberId : null, 
          homePageOwnerId: (homePageOwnerId != null) ? homePageOwnerId : null, 
    );
  }

  static AppHomePageReferencesModel? fromEntity(AppHomePageReferencesEntity? entity) {
    if (entity == null) return null;
    return AppHomePageReferencesModel(
          homePageBlockedMemberId: entity.homePageBlockedMemberId, 
          homePageSubscribedMemberId: entity.homePageSubscribedMemberId, 
          homePageLevel1MemberId: entity.homePageLevel1MemberId, 
          homePageLevel2MemberId: entity.homePageLevel2MemberId, 
          homePageOwnerId: entity.homePageOwnerId, 
    );
  }

  static Future<AppHomePageReferencesModel?> fromEntityPlus(AppHomePageReferencesEntity? entity, { String? appId}) async {
    if (entity == null) return null;

    return AppHomePageReferencesModel(
          homePageBlockedMemberId: entity.homePageBlockedMemberId, 
          homePageSubscribedMemberId: entity.homePageSubscribedMemberId, 
          homePageLevel1MemberId: entity.homePageLevel1MemberId, 
          homePageLevel2MemberId: entity.homePageLevel2MemberId, 
          homePageOwnerId: entity.homePageOwnerId, 
    );
  }

}

