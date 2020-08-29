/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 country_component_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';

abstract class CountryEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchCountry extends CountryEvent {
  final String id;

  FetchCountry({ this.id });
}

