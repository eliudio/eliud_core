import 'package:eliud_core/tools/action/action_model.dart';

abstract class ActionEntity {
  final String appID;
  final String actionType;

  final int readCondition;
  final int privilegeLevelRequired;
  final String packageCondition;

  const ActionEntity(this.appID, { this.readCondition, this.privilegeLevelRequired, this.packageCondition, this.actionType });

  Map<String, Object> toDocument();

  static ActionEntity fromMap(Map snap) => ActionModelRegistry.registry().getMapper(snap['actionType']).fromMap(snap);
}

class GotoPageEntity extends ActionEntity {
  static const String label = 'GotoPage';
  final String pageID;

  const GotoPageEntity(String appID, {int readCondition, int privilegeLevelRequired, String packageCondition, this.pageID }) : super(appID, readCondition: readCondition, privilegeLevelRequired: privilegeLevelRequired, packageCondition: packageCondition, actionType : label);

  @override
  Map<String, Object> toDocument() {
    return {
      'appID': appID,
      'actionType': actionType,
      'readCondition': readCondition,
      'privilegeLevelRequired': privilegeLevelRequired,
      'packageCondition': packageCondition,
      'pageID': pageID
    };
  }

  static ActionEntity fromMap(Map snap) {
    return GotoPageEntity(
      snap['appID'],
      readCondition: snap['readCondition'],
      privilegeLevelRequired: snap['privilegeLevelRequired'],
      packageCondition: snap['packageCondition'],
      pageID: snap['pageID'],
    );
  }
}

class OpenDialogEntity extends ActionEntity {
  static const String label = 'Dialog';
  final String dialogID;

  const OpenDialogEntity(String appID, { int readCondition, int privilegeLevelRequired, String packageCondition, this.dialogID }) : super(appID, readCondition: readCondition, privilegeLevelRequired: privilegeLevelRequired, packageCondition: packageCondition, actionType : label);

  @override
  Map<String, Object> toDocument() {
    return {
      'appID': appID,
      'actionType': actionType,
      'readCondition': readCondition,
      'privilegeLevelRequired': privilegeLevelRequired,
      'packageCondition': packageCondition,
      'dialogID': dialogID
    };
  }

  static ActionEntity fromMap(Map snap) {
    return OpenDialogEntity(
        snap['appID'],
        readCondition: snap['readCondition'],
        privilegeLevelRequired: snap['privilegeLevelRequired'],
        packageCondition: snap['packageCondition'],
        dialogID: snap['dialogID']
    );
  }
}

class SwitchAppEntity extends ActionEntity {
  static const String label = 'SwitchApp';
  final String toAppID;

  const SwitchAppEntity(String appID, { int readCondition, int privilegeLevelRequired, String packageCondition, this.toAppID }) : super(appID, readCondition: readCondition, privilegeLevelRequired: privilegeLevelRequired, packageCondition: packageCondition, actionType : label);

  @override
  Map<String, Object> toDocument() {
    return {
      'appID': appID,
      'actionType': actionType,
      'readCondition': readCondition,
      'privilegeLevelRequired': privilegeLevelRequired,
      'packageCondition': packageCondition,
      'toAppID': toAppID,
    };
  }

  static ActionEntity fromMap(Map snap) {
    return SwitchAppEntity(
        snap['appID'],
        readCondition: snap['readCondition'],
        privilegeLevelRequired: snap['privilegeLevelRequired'],
        packageCondition: snap['packageCondition'],
        toAppID: snap['toAppID']
    );
  }
}

class PopupMenuEntity extends ActionEntity {
  static const String label = 'PopupMenu';
  final String menuDefID;

  const PopupMenuEntity(String appID, { int readCondition, int privilegeLevelRequired, String packageCondition, this.menuDefID }) : super(appID, readCondition: readCondition, privilegeLevelRequired: privilegeLevelRequired, packageCondition: packageCondition, actionType : label);

  @override
  Map<String, Object> toDocument() {
    return {
      'actionType': actionType,
      'appID': appID,
      'readCondition': readCondition,
      'privilegeLevelRequired': privilegeLevelRequired,
      'packageCondition': packageCondition,
      'menuDefID': menuDefID
    };
  }

  static ActionEntity fromMap(Map snap) {
    return PopupMenuEntity(
        snap['appID'],
        readCondition: snap['readCondition'],
        privilegeLevelRequired: snap['privilegeLevelRequired'],
        packageCondition: snap['packageCondition'],
        menuDefID: snap['menuDefID']
    );
  }
}

class InternalActionEntity extends ActionEntity {
  static const String label = 'InternalAction';
  final String action;

  const InternalActionEntity(String appID, { int readCondition, int privilegeLevelRequired, String packageCondition, this.action }) : super(appID, readCondition: readCondition, privilegeLevelRequired: privilegeLevelRequired, packageCondition: packageCondition, actionType: label);

  @override
  Map<String, Object> toDocument() {
    return {
      'actionType': actionType,
      'appID': appID,
      'readCondition': readCondition,
      'privilegeLevelRequired': privilegeLevelRequired,
      'packageCondition': packageCondition,
      'action': action
    };
  }

  static ActionEntity fromMap(Map snap) {
    return InternalActionEntity(
        snap['appID'],
        readCondition: snap['readCondition'],
        privilegeLevelRequired: snap['privilegeLevelRequired'],
        packageCondition: snap['packageCondition'],
        action: snap['action']
    );
  }
}

