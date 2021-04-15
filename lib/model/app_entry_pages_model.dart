/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 app_entry_pages_model.dart
                       
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


import 'package:eliud_core/model/app_entry_pages_entity.dart';

import 'package:eliud_core/tools/random.dart';



class AppEntryPagesModel {
  String? documentID;
  PageModel? entryPage;

  // Members with a privilege more or equal to this privilege have this homepage, unless a 
  int? minPrivilege;

  AppEntryPagesModel({this.documentID, this.entryPage, this.minPrivilege, })  {
    assert(documentID != null);
  }

  AppEntryPagesModel copyWith({String? documentID, PageModel? entryPage, int? minPrivilege, }) {
    return AppEntryPagesModel(documentID: documentID ?? this.documentID, entryPage: entryPage ?? this.entryPage, minPrivilege: minPrivilege ?? this.minPrivilege, );
  }

  @override
  int get hashCode => documentID.hashCode ^ entryPage.hashCode ^ minPrivilege.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is AppEntryPagesModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          entryPage == other.entryPage &&
          minPrivilege == other.minPrivilege;

  @override
  String toString() {
    return 'AppEntryPagesModel{documentID: $documentID, entryPage: $entryPage, minPrivilege: $minPrivilege}';
  }

  AppEntryPagesEntity toEntity({String? appId}) {
    return AppEntryPagesEntity(
          entryPageId: (entryPage != null) ? entryPage!.documentID : null, 
          minPrivilege: (minPrivilege != null) ? minPrivilege : null, 
    );
  }

  static AppEntryPagesModel? fromEntity(String documentID, AppEntryPagesEntity? entity) {
    if (entity == null) return null;
    return AppEntryPagesModel(
          documentID: documentID, 
          minPrivilege: entity.minPrivilege, 
    );
  }

  static Future<AppEntryPagesModel?> fromEntityPlus(String documentID, AppEntryPagesEntity? entity, { String? appId}) async {
    if (entity == null) return null;

    PageModel? entryPageHolder;
    if (entity.entryPageId != null) {
      try {
          entryPageHolder = await pageRepository(appId: appId)!.get(entity.entryPageId);
      } on Exception catch(e) {
        print('Error whilst trying to initialise entryPage');
        print('Error whilst retrieving page with id ${entity.entryPageId}');
        print('Exception: $e');
      }
    }

    return AppEntryPagesModel(
          documentID: documentID, 
          entryPage: entryPageHolder, 
          minPrivilege: entity.minPrivilege, 
    );
  }

}

