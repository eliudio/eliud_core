import 'package:eliud_core/model/drawer_model.dart';
import 'package:equatable/equatable.dart';

abstract class ExtendedDrawerComponentState extends Equatable {
  const ExtendedDrawerComponentState();

  @override
  List<Object?> get props => [];
}

class ExtendedDrawerComponentUninitialized extends ExtendedDrawerComponentState {}

class ExtendedDrawerComponentError extends ExtendedDrawerComponentState {
  final String? message;
  ExtendedDrawerComponentError({ this.message });
}

class ExtendedDrawerComponentPermissionDenied extends ExtendedDrawerComponentState {
  ExtendedDrawerComponentPermissionDenied();
}

class ExtendedDrawerComponentLoaded extends ExtendedDrawerComponentState {
  final DrawerModel? value;

  const ExtendedDrawerComponentLoaded({ this.value });

  ExtendedDrawerComponentLoaded copyWith({ DrawerModel? copyThis }) {
    return ExtendedDrawerComponentLoaded(value: copyThis ?? this.value);
  }

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'DrawerComponentLoaded { value: $value }';
}

