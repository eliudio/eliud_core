import 'package:eliud_core_main/model/home_menu_model.dart';
import 'package:equatable/equatable.dart';

abstract class ExtendedHomeMenuComponentState extends Equatable {
  const ExtendedHomeMenuComponentState();

  @override
  List<Object?> get props => [];
}

class ExtendedHomeMenuComponentUninitialized
    extends ExtendedHomeMenuComponentState {}

class ExtendedHomeMenuComponentError extends ExtendedHomeMenuComponentState {
  final String? message;
  ExtendedHomeMenuComponentError({this.message});
}

class ExtendedHomeMenuComponentPermissionDenied
    extends ExtendedHomeMenuComponentState {
  ExtendedHomeMenuComponentPermissionDenied();
}

class ExtendedHomeMenuComponentLoaded extends ExtendedHomeMenuComponentState {
  final HomeMenuModel? value;

  const ExtendedHomeMenuComponentLoaded({this.value});

  ExtendedHomeMenuComponentLoaded copyWith({HomeMenuModel? copyThis}) {
    return ExtendedHomeMenuComponentLoaded(value: copyThis ?? value);
  }

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'HomeMenuComponentLoaded { value: $value }';
}
