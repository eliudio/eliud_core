import 'package:eliud_core/model/app_model.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/page_model.dart';

abstract class CurrentPageState extends Equatable {
  const CurrentPageState();

  @override
  List<Object?> get props => [];
}

class CurrentPageUninitialized extends CurrentPageState {}

class CurrentPageError extends CurrentPageState {
  final String? message;
  CurrentPageError({ this.message });
}

class CurrentPagePermissionDenied extends CurrentPageState {
  CurrentPagePermissionDenied();
}

class CurrentPageLoaded extends CurrentPageState {
  final PageModel page;
  final AppModel app;

  const CurrentPageLoaded({ required this.page, required this.app, });

  CurrentPageLoaded copyWith({ PageModel? copyThis }) {
    return CurrentPageLoaded(page: copyThis ?? this.page, app: this.app);
  }

  @override
  List<Object?> get props => [page, app];

  @override
  String toString() => 'CurrentPageLoaded { value: $page }';
}

