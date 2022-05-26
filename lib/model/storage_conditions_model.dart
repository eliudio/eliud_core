/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 storage_conditions_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/model/entity_export.dart';
import 'package:eliud_core/model/storage_conditions_entity.dart';

enum PrivilegeLevelRequiredSimple {
  NoPrivilegeRequiredSimple, Level1PrivilegeRequiredSimple, Level2PrivilegeRequiredSimple, OwnerPrivilegeRequiredSimple, Unknown
}


PrivilegeLevelRequiredSimple toPrivilegeLevelRequiredSimple(int? index) {
  switch (index) {
    case 0: return PrivilegeLevelRequiredSimple.NoPrivilegeRequiredSimple;
    case 1: return PrivilegeLevelRequiredSimple.Level1PrivilegeRequiredSimple;
    case 2: return PrivilegeLevelRequiredSimple.Level2PrivilegeRequiredSimple;
    case 3: return PrivilegeLevelRequiredSimple.OwnerPrivilegeRequiredSimple;
  }
  return PrivilegeLevelRequiredSimple.Unknown;
}


class StorageConditionsModel {

  // see firestore rules
  PrivilegeLevelRequiredSimple? privilegeLevelRequired;

  StorageConditionsModel({this.privilegeLevelRequired, })  {
  }

  StorageConditionsModel copyWith({PrivilegeLevelRequiredSimple? privilegeLevelRequired, }) {
    return StorageConditionsModel(privilegeLevelRequired: privilegeLevelRequired ?? this.privilegeLevelRequired, );
  }

  @override
  int get hashCode => privilegeLevelRequired.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is StorageConditionsModel &&
          runtimeType == other.runtimeType && 
          privilegeLevelRequired == other.privilegeLevelRequired;

  @override
  String toString() {
    return 'StorageConditionsModel{privilegeLevelRequired: $privilegeLevelRequired}';
  }

  StorageConditionsEntity toEntity({String? appId}) {
    return StorageConditionsEntity(
          privilegeLevelRequired: (privilegeLevelRequired != null) ? privilegeLevelRequired!.index : null, 
    );
  }

  static Future<StorageConditionsModel?> fromEntity(StorageConditionsEntity? entity) async {
    if (entity == null) return null;
    var counter = 0;
    return StorageConditionsModel(
          privilegeLevelRequired: toPrivilegeLevelRequiredSimple(entity.privilegeLevelRequired), 
    );
  }

  static Future<StorageConditionsModel?> fromEntityPlus(StorageConditionsEntity? entity, { String? appId}) async {
    if (entity == null) return null;

    var counter = 0;
    return StorageConditionsModel(
          privilegeLevelRequired: toPrivilegeLevelRequiredSimple(entity.privilegeLevelRequired), 
    );
  }

}

