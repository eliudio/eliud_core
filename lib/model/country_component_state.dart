/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 country_component_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/country_model.dart';

abstract class CountryComponentState extends Equatable {
  const CountryComponentState();

  @override
  List<Object> get props => [];
}

class CountryComponentUninitialized extends CountryComponentState {}

class CountryComponentError extends CountryComponentState {
  final String message;
  CountryComponentError({ this.message });
}

class CountryComponentPermissionDenied extends CountryComponentState {
  CountryComponentPermissionDenied();
}

class CountryComponentLoaded extends CountryComponentState {
  final CountryModel value;

  const CountryComponentLoaded({ this.value });

  CountryComponentLoaded copyWith({ CountryModel copyThis }) {
    return CountryComponentLoaded(value: copyThis ?? this.value);
  }

  @override
  List<Object> get props => [value];

  @override
  String toString() => 'CountryComponentLoaded { value: $value }';
}

