import 'package:eliud_core/model/display_conditions_entity.dart';
import 'package:eliud_core/tools/action/action_model.dart';

abstract class ActionEntity {
  final String? appID;
  final String? actionType;

  final DisplayConditionsEntity? conditions;
/*
  final int readCondition;
  final int privilegeLevelRequired;
  final String packageCondition;
*/

  const ActionEntity(this.appID, { this.conditions, /*this.readCondition, this.privilegeLevelRequired, this.packageCondition, */this.actionType });

  Map<String, Object?> toDocument();

  ActionEntity copyWith({String? appId});

  static ActionEntity fromMap(Map snap) {
    var actionType = snap['actionType'];
    if (actionType != null) {
      var mapper = ActionModelRegistry.registry()!.getMapper(actionType);
      if (mapper != null) {
        var fromSnap = ActionModelRegistry.registry()!.getMapper(actionType)!
            .fromMap(snap);
        if (fromSnap != null) {
          return fromSnap;
        } else {
          throw Exception("fromSnap is null");
        }
      } else {
        throw Exception("Mapper for $actionType is null");
      }
    } else {
      throw Exception("actionType is null");
    }
  }
}

class GotoPageEntity extends ActionEntity {
  static const String label = 'GotoPage';
  final String? pageID;

  const GotoPageEntity(String? appID, {DisplayConditionsEntity? conditions, this.pageID }) : super(appID, conditions: conditions, actionType : label);

  @override
  Map<String, Object?> toDocument() {
    return {
      'appID': appID,
      'actionType': actionType,
      'conditions': conditions == null ? null : conditions!.toDocument(),
      'pageID': pageID
    };
  }

  static ActionEntity fromMap(Map snap) {
    return GotoPageEntity(
      snap['appID'],
      conditions: DisplayConditionsEntity.fromMap(snap['conditions']),
      pageID: snap['pageID'],
    );
  }

  @override
  ActionEntity copyWith({String? appId, DisplayConditionsEntity? conditions, String? pageID }) {
    return GotoPageEntity(appId ?? this.appID, conditions : conditions ?? this.conditions, pageID: pageID ?? this.pageID);
  }
}

class OpenDialogEntity extends ActionEntity {
  static const String label = 'Dialog';
  final String? dialogID;

  const OpenDialogEntity(String? appID, { DisplayConditionsEntity? conditions, this.dialogID }) : super(appID, conditions: conditions, actionType : label);

  @override
  Map<String, Object?> toDocument() {
    return {
      'appID': appID,
      'actionType': actionType,
      'conditions': conditions == null ? null : conditions!.toDocument(),
      'dialogID': dialogID
    };
  }

  static ActionEntity fromMap(Map snap) {
    return OpenDialogEntity(
        snap['appID'],
        conditions: DisplayConditionsEntity.fromMap(snap['conditions']),
        dialogID: snap['dialogID']
    );
  }

  @override
  ActionEntity copyWith({String? appId, DisplayConditionsEntity? conditions, String? dialogID }) {
    return OpenDialogEntity(appId ?? this.appID, conditions : conditions ?? this.conditions, dialogID: dialogID ?? this.dialogID);
  }
}

class SwitchAppEntity extends ActionEntity {
  static const String label = 'SwitchApp';
  final String? toAppID;

  const SwitchAppEntity(String? appID, { DisplayConditionsEntity? conditions, this.toAppID }) : super(appID, conditions: conditions, actionType : label);

  @override
  Map<String, Object?> toDocument() {
    return {
      'appID': appID,
      'actionType': actionType,
      'conditions': conditions == null ? null : conditions!.toDocument(),
      'toAppID': toAppID,
    };
  }

  static ActionEntity fromMap(Map snap) {
    return SwitchAppEntity(
        snap['appID'],
        conditions: DisplayConditionsEntity.fromMap(snap['conditions']),
        toAppID: snap['toAppID']
    );
  }

  @override
  ActionEntity copyWith({String? appId, DisplayConditionsEntity? conditions, String? toAppID }) {
    return SwitchAppEntity(appId ?? this.appID, conditions : conditions ?? this.conditions, toAppID: toAppID ?? this.toAppID);
  }
}

class PopupMenuEntity extends ActionEntity {
  static const String label = 'PopupMenu';
  final String? menuDefID;

  const PopupMenuEntity(String? appID, { DisplayConditionsEntity? conditions, this.menuDefID }) : super(appID, conditions: conditions, actionType : label);

  @override
  Map<String, Object?> toDocument() {
    return {
      'actionType': actionType,
      'appID': appID,
      'conditions': conditions == null ? null : conditions!.toDocument(),
      'menuDefID': menuDefID
    };
  }

  static ActionEntity fromMap(Map snap) {
    return PopupMenuEntity(
        snap['appID'],
        conditions: DisplayConditionsEntity.fromMap(snap['conditions']),
        menuDefID: snap['menuDefID']
    );
  }

  @override
  ActionEntity copyWith({String? appId, DisplayConditionsEntity? conditions, String? menuDefID }) {
    return PopupMenuEntity(appId ?? this.appID, conditions : conditions ?? this.conditions, menuDefID: menuDefID ?? this.menuDefID);
  }
}

class InternalActionEntity extends ActionEntity {
  static const String label = 'InternalAction';
  final String? action;

  const InternalActionEntity(String? appID, { DisplayConditionsEntity? conditions, this.action }) : super(appID, conditions: conditions, actionType: label);

  @override
  Map<String, Object?> toDocument() {
    return {
      'actionType': actionType,
      'appID': appID,
      'conditions': conditions == null ? null : conditions!.toDocument(),
      'action': action
    };
  }

  static ActionEntity fromMap(Map snap) {
    return InternalActionEntity(
        snap['appID'],
        conditions: DisplayConditionsEntity.fromMap(snap['conditions']),
        action: snap['action']
    );
  }

  @override
  InternalActionEntity copyWith({String? appId, DisplayConditionsEntity? conditions, String? action }) {
    return InternalActionEntity(appId ?? this.appID, conditions : conditions ?? this.conditions, action: action ?? this.action);
  }
}

