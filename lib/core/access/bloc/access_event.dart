import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AccessEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SwitchedApp extends AccessEvent {
  final AppModel app;

  SwitchedApp(this.app);
}

class InitApp extends AccessEvent {
  final AppModel app;

  InitApp(this.app);
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

