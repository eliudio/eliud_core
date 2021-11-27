import 'package:eliud_core/model/home_menu_model.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/app_bar_model.dart';

abstract class ExtendedHomeMenuComponentState extends Equatable {
  const ExtendedHomeMenuComponentState();

  @override
  List<Object?> get props => [];
}

class ExtendedHomeMenuComponentUninitialized extends ExtendedHomeMenuComponentState {}

class ExtendedHomeMenuComponentError extends ExtendedHomeMenuComponentState {
  final String? message;
  ExtendedHomeMenuComponentError({ this.message });
}

class ExtendedHomeMenuComponentPermissionDenied extends ExtendedHomeMenuComponentState {
  ExtendedHomeMenuComponentPermissionDenied();
}

class ExtendedHomeMenuComponentLoaded extends ExtendedHomeMenuComponentState {
  final HomeMenuModel? value;

  const ExtendedHomeMenuComponentLoaded({ this.value });

  ExtendedHomeMenuComponentLoaded copyWith({ HomeMenuModel? copyThis }) {
    return ExtendedHomeMenuComponentLoaded(value: copyThis ?? this.value);
  }

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'HomeMenuComponentLoaded { value: $value }';
}

