/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 app_bar_form_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:eliud_core/model/model_export.dart';

@immutable
abstract class AppBarFormEvent extends Equatable {
  const AppBarFormEvent();

  @override
  List<Object?> get props => [];
}

class InitialiseNewAppBarFormEvent extends AppBarFormEvent {}

class InitialiseAppBarFormEvent extends AppBarFormEvent {
  final AppBarModel? value;

  @override
  List<Object?> get props => [value];

  InitialiseAppBarFormEvent({this.value});
}

class InitialiseAppBarFormNoLoadEvent extends AppBarFormEvent {
  final AppBarModel? value;

  @override
  List<Object?> get props => [value];

  InitialiseAppBarFormNoLoadEvent({this.value});
}

class ChangedAppBarDocumentID extends AppBarFormEvent {
  final String? value;

  ChangedAppBarDocumentID({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedAppBarDocumentID{ value: $value }';
}

class ChangedAppBarAppId extends AppBarFormEvent {
  final String? value;

  ChangedAppBarAppId({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedAppBarAppId{ value: $value }';
}

class ChangedAppBarTitle extends AppBarFormEvent {
  final String? value;

  ChangedAppBarTitle({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedAppBarTitle{ value: $value }';
}

class ChangedAppBarHeader extends AppBarFormEvent {
  final HeaderSelection? value;

  ChangedAppBarHeader({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedAppBarHeader{ value: $value }';
}

class ChangedAppBarIcon extends AppBarFormEvent {
  final IconModel? value;

  ChangedAppBarIcon({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedAppBarIcon{ value: $value }';
}

class ChangedAppBarImage extends AppBarFormEvent {
  final String? value;

  ChangedAppBarImage({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedAppBarImage{ value: $value }';
}

class ChangedAppBarIconMenu extends AppBarFormEvent {
  final String? value;

  ChangedAppBarIconMenu({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedAppBarIconMenu{ value: $value }';
}

class ChangedAppBarBackgroundOverride extends AppBarFormEvent {
  final BackgroundModel? value;

  ChangedAppBarBackgroundOverride({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedAppBarBackgroundOverride{ value: $value }';
}

class ChangedAppBarIconColorOverride extends AppBarFormEvent {
  final RgbModel? value;

  ChangedAppBarIconColorOverride({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedAppBarIconColorOverride{ value: $value }';
}

class ChangedAppBarSelectedIconColorOverride extends AppBarFormEvent {
  final RgbModel? value;

  ChangedAppBarSelectedIconColorOverride({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() =>
      'ChangedAppBarSelectedIconColorOverride{ value: $value }';
}

class ChangedAppBarMenuBackgroundColorOverride extends AppBarFormEvent {
  final RgbModel? value;

  ChangedAppBarMenuBackgroundColorOverride({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() =>
      'ChangedAppBarMenuBackgroundColorOverride{ value: $value }';
}
