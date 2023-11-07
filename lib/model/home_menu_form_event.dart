/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 home_menu_form_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:eliud_core/model/model_export.dart';

@immutable
abstract class HomeMenuFormEvent extends Equatable {
  const HomeMenuFormEvent();

  @override
  List<Object?> get props => [];
}

class InitialiseNewHomeMenuFormEvent extends HomeMenuFormEvent {}

class InitialiseHomeMenuFormEvent extends HomeMenuFormEvent {
  final HomeMenuModel? value;

  @override
  List<Object?> get props => [value];

  InitialiseHomeMenuFormEvent({this.value});
}

class InitialiseHomeMenuFormNoLoadEvent extends HomeMenuFormEvent {
  final HomeMenuModel? value;

  @override
  List<Object?> get props => [value];

  InitialiseHomeMenuFormNoLoadEvent({this.value});
}

class ChangedHomeMenuDocumentID extends HomeMenuFormEvent {
  final String? value;

  ChangedHomeMenuDocumentID({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedHomeMenuDocumentID{ value: $value }';
}

class ChangedHomeMenuAppId extends HomeMenuFormEvent {
  final String? value;

  ChangedHomeMenuAppId({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedHomeMenuAppId{ value: $value }';
}

class ChangedHomeMenuName extends HomeMenuFormEvent {
  final String? value;

  ChangedHomeMenuName({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedHomeMenuName{ value: $value }';
}

class ChangedHomeMenuMenu extends HomeMenuFormEvent {
  final String? value;

  ChangedHomeMenuMenu({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedHomeMenuMenu{ value: $value }';
}

class ChangedHomeMenuIconColorOverride extends HomeMenuFormEvent {
  final RgbModel? value;

  ChangedHomeMenuIconColorOverride({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedHomeMenuIconColorOverride{ value: $value }';
}

class ChangedHomeMenuBackgroundOverride extends HomeMenuFormEvent {
  final BackgroundModel? value;

  ChangedHomeMenuBackgroundOverride({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedHomeMenuBackgroundOverride{ value: $value }';
}

class ChangedHomeMenuPopupMenuBackgroundColorOverride
    extends HomeMenuFormEvent {
  final RgbModel? value;

  ChangedHomeMenuPopupMenuBackgroundColorOverride({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() =>
      'ChangedHomeMenuPopupMenuBackgroundColorOverride{ value: $value }';
}
