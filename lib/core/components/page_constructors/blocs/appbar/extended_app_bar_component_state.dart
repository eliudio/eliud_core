import 'package:equatable/equatable.dart';
import 'package:eliud_core_main/model/app_bar_model.dart';

abstract class ExtendedAppBarComponentState extends Equatable {
  const ExtendedAppBarComponentState();

  @override
  List<Object?> get props => [];
}

class ExtendedAppBarComponentUninitialized
    extends ExtendedAppBarComponentState {}

class ExtendedAppBarComponentError extends ExtendedAppBarComponentState {
  final String? message;
  ExtendedAppBarComponentError({this.message});
}

class ExtendedAppBarComponentPermissionDenied
    extends ExtendedAppBarComponentState {
  ExtendedAppBarComponentPermissionDenied();
}

class ExtendedAppBarComponentLoaded extends ExtendedAppBarComponentState {
  final AppBarModel value;

  const ExtendedAppBarComponentLoaded({required this.value});

  ExtendedAppBarComponentLoaded copyWith({AppBarModel? copyThis}) {
    return ExtendedAppBarComponentLoaded(value: copyThis ?? value);
  }

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'AppBarComponentLoaded { value: $value }';
}
