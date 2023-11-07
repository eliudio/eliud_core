/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 backend_request_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/core/base/model_base.dart';

import 'package:eliud_core/model/entity_export.dart';

import 'package:eliud_core/model/backend_request_entity.dart';

enum RequestType { requestEmailData, destroyAccount, unknown }

RequestType toRequestType(int? index) {
  switch (index) {
    case 0:
      return RequestType.requestEmailData;
    case 1:
      return RequestType.destroyAccount;
  }
  return RequestType.unknown;
}

class BackendRequestModel implements ModelBase, WithAppId {
  static const String packageName = 'eliud_core';
  static const String id = 'backendRequests';

  @override
  String documentID;
  String? description;
  @override
  String appId;
  String? authorId;
  String? name;
  String? sendTo;
  List<Map<String, String>>? collections;
  bool? processed;
  RequestType? requestType;

  BackendRequestModel({
    required this.documentID,
    this.description,
    required this.appId,
    this.authorId,
    this.name,
    this.sendTo,
    this.collections,
    this.processed,
    this.requestType,
  });

  @override
  BackendRequestModel copyWith({
    String? documentID,
    String? description,
    String? appId,
    String? authorId,
    String? name,
    String? sendTo,
    List<Map<String, String>>? collections,
    bool? processed,
    RequestType? requestType,
  }) {
    return BackendRequestModel(
      documentID: documentID ?? this.documentID,
      description: description ?? this.description,
      appId: appId ?? this.appId,
      authorId: authorId ?? this.authorId,
      name: name ?? this.name,
      sendTo: sendTo ?? this.sendTo,
      collections: collections ?? this.collections,
      processed: processed ?? this.processed,
      requestType: requestType ?? this.requestType,
    );
  }

  @override
  int get hashCode =>
      documentID.hashCode ^
      description.hashCode ^
      appId.hashCode ^
      authorId.hashCode ^
      name.hashCode ^
      sendTo.hashCode ^
      collections.hashCode ^
      processed.hashCode ^
      requestType.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BackendRequestModel &&
          runtimeType == other.runtimeType &&
          documentID == other.documentID &&
          description == other.description &&
          appId == other.appId &&
          authorId == other.authorId &&
          name == other.name &&
          sendTo == other.sendTo &&
          collections == other.collections &&
          processed == other.processed &&
          requestType == other.requestType;

  @override
  String toString() {
    return 'BackendRequestModel{documentID: $documentID, description: $description, appId: $appId, authorId: $authorId, name: $name, sendTo: $sendTo, collections: $collections, processed: $processed, requestType: $requestType}';
  }

  @override
  Future<List<ModelReference>> collectReferences({String? appId}) async {
    List<ModelReference> referencesCollector = [];
    return referencesCollector;
  }

  @override
  BackendRequestEntity toEntity({String? appId}) {
    return BackendRequestEntity(
      description: (description != null) ? description : null,
      appId: appId,
      authorId: (authorId != null) ? authorId : null,
      name: (name != null) ? name : null,
      sendTo: (sendTo != null) ? sendTo : null,
      collections: collections,
      processed: (processed != null) ? processed : null,
      requestType: (requestType != null) ? requestType!.index : null,
    );
  }

  static Future<BackendRequestModel?> fromEntity(
      String documentID, BackendRequestEntity? entity) async {
    if (entity == null) return null;
    return BackendRequestModel(
      documentID: documentID,
      description: entity.description,
      appId: entity.appId ?? '',
      authorId: entity.authorId,
      name: entity.name,
      sendTo: entity.sendTo,
      collections: entity.collections,
      processed: entity.processed,
      requestType: toRequestType(entity.requestType),
    );
  }

  static Future<BackendRequestModel?> fromEntityPlus(
      String documentID, BackendRequestEntity? entity,
      {String? appId}) async {
    if (entity == null) return null;

    return BackendRequestModel(
      documentID: documentID,
      description: entity.description,
      appId: entity.appId ?? '',
      authorId: entity.authorId,
      name: entity.name,
      sendTo: entity.sendTo,
      collections: entity.collections,
      processed: entity.processed,
      requestType: toRequestType(entity.requestType),
    );
  }
}
