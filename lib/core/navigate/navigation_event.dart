import 'package:equatable/equatable.dart';

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
  final String appId;
  final String pageId;
  final Map<String, dynamic>? parameters;

  GoToPageEvent(this.appId, this.pageId, { this.parameters });
}

class MessageEvent extends NavigatorEvent {
  final String message;

  MessageEvent(this.message);
}

/*
class GoHome extends NavigatorEvent {
  GoHome();
}

*/
class OpenRegisteredWidgetEvent extends NavigatorEvent {
  final String ID;

  OpenRegisteredWidgetEvent(this.ID);
}
