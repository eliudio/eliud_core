import 'package:eliud_core/model/conditions_entity.dart';
import 'package:eliud_core/tools/action/action_model.dart';

abstract class ActionEntity {
  final String appID;
  final String actionType;

  final ConditionsEntity conditions;
/*
  final int readCondition;
  final int privilegeLevelRequired;
  final String packageCondition;
*/

  const ActionEntity(this.appID, { this.conditions, /*this.readCondition, this.privilegeLevelRequired, this.packageCondition, */this.actionType });

  Map<String, Object> toDocument();

  static ActionEntity fromMap(Map snap) => ActionModelRegistry.registry().getMapper(snap['actionType']).fromMap(snap);
}

class GotoPageEntity extends ActionEntity {
  static const String label = 'GotoPage';
  final String pageID;

  const GotoPageEntity(String appID, {ConditionsEntity conditions, this.pageID }) : super(appID, conditions: conditions, actionType : label);

  @override
  Map<String, Object> toDocument() {
    return {
      'appID': appID,
      'actionType': actionType,
      'conditions': conditions == null ? null : conditions.toDocument(),
      'pageID': pageID
    };
  }

  static ActionEntity fromMap(Map snap) {
    return GotoPageEntity(
      snap['appID'],
      conditions: ConditionsEntity.fromMap(snap['conditions']),
      pageID: snap['pageID'],
    );
  }
}

class OpenDialogEntity extends ActionEntity {
  static const String label = 'Dialog';
  final String dialogID;

  const OpenDialogEntity(String appID, { ConditionsEntity conditions, this.dialogID }) : super(appID, conditions: conditions, actionType : label);

  @override
  Map<String, Object> toDocument() {
    return {
      'appID': appID,
      'actionType': actionType,
      'conditions': conditions == null ? null : conditions.toDocument(),
      'dialogID': dialogID
    };
  }

  static ActionEntity fromMap(Map snap) {
    return OpenDialogEntity(
        snap['appID'],
        conditions: ConditionsEntity.fromMap(snap['conditions']),
        dialogID: snap['dialogID']
    );
  }
}

class SwitchAppEntity extends ActionEntity {
  static const String label = 'SwitchApp';
  final String toAppID;

  const SwitchAppEntity(String appID, { ConditionsEntity conditions, this.toAppID }) : super(appID, conditions: conditions, actionType : label);

  @override
  Map<String, Object> toDocument() {
    return {
      'appID': appID,
      'actionType': actionType,
      'conditions': conditions == null ? null : conditions.toDocument(),
      'toAppID': toAppID,
    };
  }

  static ActionEntity fromMap(Map snap) {
    return SwitchAppEntity(
        snap['appID'],
        conditions: ConditionsEntity.fromMap(snap['conditions']),
        toAppID: snap['toAppID']
    );
  }
}

class PopupMenuEntity extends ActionEntity {
  static const String label = 'PopupMenu';
  final String menuDefID;

  const PopupMenuEntity(String appID, { ConditionsEntity conditions, this.menuDefID }) : super(appID, conditions: conditions, actionType : label);

  @override
  Map<String, Object> toDocument() {
    return {
      'actionType': actionType,
      'appID': appID,
      'conditions': conditions == null ? null : conditions.toDocument(),
      'menuDefID': menuDefID
    };
  }

  static ActionEntity fromMap(Map snap) {
    return PopupMenuEntity(
        snap['appID'],
        conditions: ConditionsEntity.fromMap(snap['conditions']),
        menuDefID: snap['menuDefID']
    );
  }
}

class InternalActionEntity extends ActionEntity {
  static const String label = 'InternalAction';
  final String action;

  const InternalActionEntity(String appID, { ConditionsEntity conditions, this.action }) : super(appID, conditions: conditions, actionType: label);

  @override
  Map<String, Object> toDocument() {
    return {
      'actionType': actionType,
      'appID': appID,
      'conditions': conditions == null ? null : conditions.toDocument(),
      'action': action
    };
  }

  static ActionEntity fromMap(Map snap) {
    return InternalActionEntity(
        snap['appID'],
        conditions: ConditionsEntity.fromMap(snap['conditions']),
        action: snap['action']
    );
  }
}

