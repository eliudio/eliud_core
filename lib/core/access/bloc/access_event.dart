import 'package:eliud_core/model/app_model.dart';
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

class SwitchAppAndPageEvent extends SwitchAppEvent {
  final String? pageId;
  final Map<String, Object>? parameters;

  SwitchAppAndPageEvent(String? appId, this.pageId, this.parameters) : super(appId);

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


