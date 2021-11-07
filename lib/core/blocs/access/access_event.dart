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

class MemberUpdated extends AccessEvent {
  final MemberModel? member;
  bool? refresh; // goto the (potentially new) homepage?

  MemberUpdated(this.member, {this.refresh});

  @override
  List<Object?> get props => [ member, refresh ];
}

// when current member is owner he can send this event to allow to change his privilege to a lower
class ChangePrivilegeEvent extends AccessEvent {
  final PrivilegeLevel privilege;
  final bool blocked;

  ChangePrivilegeEvent(this.privilege, this.blocked);

  @override
  List<Object?> get props => [ privilege, blocked ];
}

class AddAppEvent extends AccessEvent {
  final AppModel app;

  AddAppEvent(this.app);

}

class UpdatePackageCondition extends AccessEvent {
  final AppModel app;
  final String packageCondition;
  final bool condition;

  UpdatePackageCondition(this.app, this.packageCondition, this.condition);
}
