import 'package:eliud_core/model/access_model.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AccessEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AccessInit extends AccessEvent {
  final AppModel app;

  AccessInit(this.app);

  @override
  List<Object?> get props => [ app ];
}

class LogoutEvent extends AccessEvent {
  LogoutEvent();
}

abstract class PostLoginAction {
  PostLoginAction();

  // run this after login
  void runTheAction();
}

class LoginEvent extends AccessEvent {
  PostLoginAction? actions;

  LoginEvent({this.actions});

  @override
  List<Object?> get props => [ actions ];
}

class AcceptedMembership extends AccessEvent{
  final MemberModel member;
  final User usr;

  AcceptedMembership(this.member, this.usr);

  @override
  List<Object> get props => [ member, usr ];
}

// when current member is owner he can send this event to allow to change his privilege to a lower
class ChangePrivilegeEvent extends AccessEvent {
  final PrivilegeLevel privilege;
  final bool blocked;

  ChangePrivilegeEvent(this.privilege, this.blocked);

  @override
  List<Object?> get props => [ privilege, blocked ];
}

class UpdatePackageCondition extends AccessEvent {
  final AppModel app;
  final String packageCondition;
  final bool condition;

  UpdatePackageCondition(this.app, this.packageCondition, this.condition);
}

class SelectApp extends AccessEvent {
  final AppModel app;

  SelectApp(this.app);
}

class SelectAppWithID extends AccessEvent {
  final String appId;

  SelectAppWithID(this.appId);
}

class AppUpdated extends AccessEvent {
  final AppModel app;

  AppUpdated(this.app);
}

class GotoPageEvent extends AccessEvent {
  final String appId;
  final String pageId;
  final Map<String, dynamic>? parameters;

  GotoPageEvent(this.appId, this.pageId, {this.parameters});
}

class OpenDialogEvent extends AccessEvent {
  final String dialogId;
  final Map<String, dynamic>? parameters;

  OpenDialogEvent(this.dialogId, {this.parameters});
}