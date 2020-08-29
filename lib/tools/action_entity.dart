import 'package:equatable/equatable.dart';

abstract class ActionEntity extends Equatable {
  final String actionType;

  const ActionEntity({ this.actionType });
  Map<String, Object> toJson();
  @override
  List<Object> get props;
  @override
  String toString();
  Map<String, Object> toDocument();

  static ActionEntity fromMap(Map snap) {
    String actionType = snap["actionType"];
    if (actionType == GotoPageEntity.label) {
      return GotoPageEntity.fromMap(snap);
    } else if (actionType == InternalActionEntity.label) {
      return InternalActionEntity.fromMap(snap);
    } else if (actionType == PopupMenuEntity.label) {
      return PopupMenuEntity.fromMap(snap);
    } else {
      return null;
    }
  }
}

class GotoPageEntity extends ActionEntity {
  static const String label = "GotoPage";
  final String pageID;

  const GotoPageEntity({ this.pageID }) : super(actionType : label);

  Map<String, Object> toJson() {
    return <String, dynamic>{
      "pageID": pageID
    };
  }

  @override
  List<Object> get props => [ pageID];

  @override
  String toString() {
    return 'GotoPageEntity { pageID: $pageID }';
  }

  Map<String, Object> toDocument() {
    return {
      "actionType": actionType,
      "pageID": pageID
    };
  }

  static ActionEntity fromMap(Map snap) {
    return GotoPageEntity(
        pageID: snap["pageID"]
    );
  }
}

class SwitchAppEntity extends ActionEntity {
  static const String label = "SwitchApp";
  final String appID;

  const SwitchAppEntity({ this.appID }) : super(actionType : label);

  Map<String, Object> toJson() {
    return <String, dynamic>{
      "appID": appID
    };
  }

  @override
  List<Object> get props => [ appID ];

  @override
  String toString() {
    return 'SwitchAppEntity { appID: $appID }';
  }

  Map<String, Object> toDocument() {
    return {
      "actionType": actionType,
      "appID": appID
    };
  }

  static ActionEntity fromMap(Map snap) {
    return SwitchAppEntity(
        appID: snap["appID"]
    );
  }
}

class PopupMenuEntity extends ActionEntity {
  static const String label = "PopupMenu";
  final String menuDefID;

  const PopupMenuEntity({ this.menuDefID }) : super(actionType : label);

  Map<String, Object> toJson() {
    return <String, dynamic>{
      "menuDefID": menuDefID
    };
  }

  @override
  List<Object> get props => [ menuDefID ];

  @override
  String toString() {
    return 'PopupMenuEntity { menuDefID: $menuDefID }';
  }

  Map<String, Object> toDocument() {
    return {
      "actionType": actionType,
      "menuDefID": menuDefID
    };
  }

  static ActionEntity fromMap(Map snap) {
    return PopupMenuEntity(
        menuDefID: snap["menuDefID"]
    );
  }
}

class InternalActionEntity extends ActionEntity {
  static const String label = "InternalAction";
  final String action;

  const InternalActionEntity({ this.action }) : super(actionType: label);

  Map<String, Object> toJson() {
    return <String, dynamic>{
      "action": action
    };
  }

  @override
  List<Object> get props => [ action ];

  @override
  String toString() {
    return 'InternalActionEntity { action: $action }';
  }

  Map<String, Object> toDocument() {
    return {
      "actionType": actionType,
      "action": action
    };
  }

  static ActionEntity fromJson(Map<String, Object> json) {
    return InternalActionEntity(
      action: json["action"] as String,
    );
  }

  static ActionEntity fromMap(Map snap) {
    return InternalActionEntity(
        action: snap["action"]
    );
  }
}

