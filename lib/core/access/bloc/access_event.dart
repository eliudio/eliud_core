import 'package:eliud_core/model/member_model.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AccessEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SwitchAppEvent extends AccessEvent {
  final String appId;

  SwitchAppEvent(this.appId);
}

class InitApp extends AccessEvent {
  final String appId;

  InitApp(this.appId);
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
  PostLoginAction actions;

  LoginEvent({this.actions});
}

class AcceptedMembership extends AccessEvent{
  final MemberModel member;
  final FirebaseUser usr;

  AcceptedMembership(this.member, this.usr);
}

class MemberUpdated extends AccessEvent {
  final MemberModel member;

  MemberUpdated(this.member);
}

