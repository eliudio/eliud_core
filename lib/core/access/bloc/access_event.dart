import 'package:eliud_core/model/member_model.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AccessEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SwitchAppEvent extends AccessEvent {
  final String? appId;

  SwitchAppEvent(this.appId);

  @override
  List<Object?> get props => [ appId ];
}

class SwitchAppProcessingEvent extends AccessEvent {
  final String? appId;

  SwitchAppProcessingEvent(this.appId);

  @override
  List<Object?> get props => [ appId ];
}

class SwitchAppAndPageEvent extends SwitchAppEvent {
  final String? pageId;
  final Map<String, dynamic>? parameters;

  SwitchAppAndPageEvent(String? appId, this.pageId, this.parameters) : super(appId);

  @override
  List<Object?> get props => [ appId, pageId, parameters ];
}

class SwitchAppAndPageProcessingEvent extends SwitchAppEvent {
  final String? pageId;
  final Map<String, dynamic>? parameters;

  SwitchAppAndPageProcessingEvent(String? appId, this.pageId, this.parameters) : super(appId);

  @override
  List<Object?> get props => [ appId, pageId, parameters ];
}

class InitApp extends AccessEvent {
  final String? appId;
  final bool? isPlaystore;

  InitApp(this.appId, this.isPlaystore);

  @override
  List<Object?> get props => [ appId ];
}

class LogoutEvent extends AccessEvent {
  LogoutEvent();
}

class LogoutProcessingEvent extends AccessEvent {
  LogoutProcessingEvent();
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

class LoginProcessEvent extends AccessEvent {
  PostLoginAction? actions;

  LoginProcessEvent(this.actions);

  @override
  List<Object?> get props => [ actions ];
}

class GoogleLoginProcessEvent extends LoginProcessEvent {
  final User usr;

  GoogleLoginProcessEvent(PostLoginAction? actions, this.usr): super(actions);

  @override
  List<Object?> get props => [ actions, usr ];
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


