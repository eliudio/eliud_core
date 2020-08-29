import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'access_details.dart';
import 'access_event.dart';

abstract class AccessState extends Equatable {
  const AccessState();

  @override
  List<Object> get props => [];
}

class UndeterminedAccessState extends AccessState {
  UndeterminedAccessState();
}

class AccessStateWithDetails extends AccessState {
  final AppModel app;
  final AccessDetails details;

  AccessStateWithDetails(this.app, this.details);
}

class LoggedOut extends AccessStateWithDetails {

  LoggedOut(AppModel app, AccessDetails details, ): super(app, details);
}

class LoggedIn extends AccessStateWithDetails {
  final FirebaseUser usr;
  final MemberModel member;

  LoggedIn({this.usr, this.member, AppModel app, AccessDetails details}) : super(app, details);

  LoggedIn copyWith({ MemberModel member, AccessDetails details}) {
    return LoggedIn(usr: this.usr, member: member ?? this.member, app: this.app, details: details ?? this.details);
  }
}

class LoggedInWithoutMembership extends LoggedIn {
  // What is the event that should be triggered after the membership will be accepted...
  final PostLoginAction postLoginAction;
  LoggedInWithoutMembership({FirebaseUser usr, MemberModel member, AppModel app, AccessDetails details, this.postLoginAction}): super(usr: usr, member: member, app: app, details: details);

  LoggedInWithoutMembership copyWith({ MemberModel member, AccessDetails details}) {
    return LoggedInWithoutMembership(usr: this.usr, member: member ?? this.member, app: this.app, details: details ?? this.details, postLoginAction: postLoginAction);
  }
}

class LoggedInWithMembership extends LoggedIn {
  LoggedInWithMembership({FirebaseUser usr, MemberModel member, AppModel app, AccessDetails details}): super(usr: usr, member: member, app: app, details: details);

  LoggedInWithMembership copyWith({ MemberModel member, AccessDetails details}) {
    return LoggedInWithMembership(usr: this.usr, member: member ?? this.member, app: this.app, details: details ?? this.details);
  }
}
