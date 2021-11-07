import 'package:eliud_core/model/app_model.dart';
import 'package:equatable/equatable.dart';

abstract class AppEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SelectMainApp extends AppEvent {
  final String appId;

  SelectMainApp(this.appId);
}

class SelectOtherApp extends AppEvent {
  final String appId;

  SelectOtherApp(this.appId);
}

class AppUpdated extends AppEvent {
  final AppModel app;

  AppUpdated(this.app);
}

class GotoPageEvent extends AppEvent {
  final String appId;
  final String pageId;
  final Map<String, dynamic>? parameters;

  GotoPageEvent(this.appId, this.pageId, this.parameters);
}
