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
import 'country_model.dart';

abstract class CountryState extends Equatable {
  const CountryState();

  @override
  List<Object> get props => [];
}

class CountryUninitialized extends CountryState {}

class CountryError extends CountryState {
  final String message;
  CountryError({ this.message });
}

class CountryLoaded extends CountryState {
  final CountryModel value;

  const CountryLoaded({ this.value });

  CountryLoaded copyWith({ CountryModel copyThis }) {
    return CountryLoaded(value: copyThis ?? this.value);
  }

  @override
  List<Object> get props => [value];

  @override
  String toString() => 'CountryModelLoaded { value: $value }';
}


