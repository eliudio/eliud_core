import 'package:eliud_core/model/app_model.dart';
import 'package:equatable/equatable.dart';

abstract class AppState extends Equatable {

  const AppState();

  @override
  List<Object?> get props => [];
}

class UndeterminedAppState extends AppState {
}

class AppLoaded extends AppState {
  final AppModel app;

  AppLoaded(this.app);

  // determine in
  @override
  List<Object> get props => [app];

  @override
  bool operator == (Object other) =>
      identical(this, other) ||
          other is AppLoaded &&
              runtimeType == other.runtimeType &&
              app == other.app;
}