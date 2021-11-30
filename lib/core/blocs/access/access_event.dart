import 'package:eliud_core/model/access_model.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/package/package.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

abstract class AccessEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AccessInitEvent extends AccessEvent {
  final AppModel app;
  final AppModel? playstoreApp;

  AccessInitEvent(this.app, this.playstoreApp);

  @override
  List<Object?> get props => [app, playstoreApp];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AccessInitEvent &&
          app == other.app &&
          playstoreApp == other.playstoreApp &&
          runtimeType == other.runtimeType;
}

class LogoutEvent extends AccessEvent {
  final String appId;
  final bool _isProcessing;

  LogoutEvent({required this.appId, bool? isProcessing}) : _isProcessing = isProcessing ?? false;

  bool isProcessing() => _isProcessing;

  LogoutEvent asProcessing() {
    return LogoutEvent(appId: appId, isProcessing: true);
  }

  @override
  List<Object?> get props => [];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LogoutEvent &&
          _isProcessing == other._isProcessing &&
          runtimeType == other.runtimeType;
}

abstract class PostLoginAction {
  PostLoginAction();

  // run this after login
  void runTheAction();
}

class LoginEvent extends AccessEvent {
  final String appId;
  final PostLoginAction? actions;
  final bool _isProcessing;

  LoginEvent({required this.appId, this.actions, bool? isProcessing})
      : _isProcessing = isProcessing ?? false;

  bool isProcessing() => _isProcessing;

  LoginEvent asProcessing() {
    return LoginEvent(appId: appId, actions: actions, isProcessing: true);
  }

  @override
  List<Object?> get props => [actions];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoginEvent &&
          actions == other.actions &&
          _isProcessing == other._isProcessing &&
          runtimeType == other.runtimeType;
}

class AcceptedMembershipEvent extends AccessEvent {
  final MemberModel member;
  final User usr;

  AcceptedMembershipEvent(this.member, this.usr);

  @override
  List<Object?> get props => [member, usr];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AcceptedMembershipEvent &&
          member == other.member &&
          usr == other.usr &&
          runtimeType == other.runtimeType;
}

// when current member is owner he can send this event to allow to change his privilege to a lower
class ChangePrivilegeEvent extends AccessEvent {
  final PrivilegeLevel privilege;
  final bool blocked;

  ChangePrivilegeEvent(this.privilege, this.blocked);

  @override
  List<Object?> get props => [privilege, blocked];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChangePrivilegeEvent &&
          privilege == other.privilege &&
          blocked == other.blocked &&
          runtimeType == other.runtimeType;
}

class UpdatePackageConditionEvent extends AccessEvent {
  final AppModel app;
  final Package package;
  final String packageCondition;
  final bool condition;

  UpdatePackageConditionEvent(this.app, this.package, this.packageCondition, this.condition);
}

class SwitchAppWithIDEvent extends AccessEvent {
  final String appId;
  final bool _isProcessing;
  final bool goHome;

  SwitchAppWithIDEvent({required this.appId, required this.goHome, bool? isProcessing})
      : _isProcessing = isProcessing ?? false;

  SwitchAppWithIDEvent asProcessing() {
    return SwitchAppWithIDEvent(appId: appId, goHome: goHome, isProcessing: true);
  }

  bool isProcessing() => _isProcessing;

  @override
  List<Object?> get props => [appId, goHome, _isProcessing];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SwitchAppWithIDEvent &&
          _isProcessing == other._isProcessing &&
          appId == other.appId &&
          goHome == other.goHome &&
          runtimeType == other.runtimeType;
}

class AppUpdatedEvent extends AccessEvent {
  final AppModel app;

  AppUpdatedEvent(this.app);

  @override
  List<Object?> get props => [app];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppUpdatedEvent &&
          app == other.app &&
          runtimeType == other.runtimeType;
}

class GotoPageEvent extends AccessEvent {
  final String appId;
  final String pageId;
  final Map<String, dynamic>? parameters;

  GotoPageEvent(this.appId, this.pageId, {this.parameters});

  @override
  List<Object?> get props => [appId, pageId, parameters];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GotoPageEvent &&
          mapEquals(parameters, other.parameters) &&
          appId == other.appId &&
          pageId == other.pageId &&
          runtimeType == other.runtimeType;
}

class OpenDialogEvent extends AccessEvent {
  final String dialogId;
  final Map<String, dynamic>? parameters;

  OpenDialogEvent(this.dialogId, {this.parameters});

  @override
  List<Object?> get props => [dialogId, parameters];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OpenDialogEvent &&
          mapEquals(parameters, other.parameters) &&
          dialogId == other.dialogId &&
          runtimeType == other.runtimeType;
}
