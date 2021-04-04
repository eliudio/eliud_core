import 'package:eliud_core/model/member_model.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class NavigatorEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class Pop extends NavigatorEvent {}

class JustASecondWait extends NavigatorEvent {
  final String message;

  JustASecondWait(this.message);
}

class GoToPageEvent extends NavigatorEvent {
  final String ID;
  final Map<String, Object> parameters;

  GoToPageEvent(this.ID, { this.parameters });
}

class MessageEvent extends NavigatorEvent {
  final String message;

  MessageEvent(this.message);
}

class GoHome extends NavigatorEvent {
  GoHome();
}

class OpenRegisteredWidgetEvent extends NavigatorEvent {
  final String ID;

  OpenRegisteredWidgetEvent(this.ID);
}
