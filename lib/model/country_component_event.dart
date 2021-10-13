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
import 'package:eliud_core/model/country_model.dart';

abstract class CountryComponentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchCountryComponent extends CountryComponentEvent {
  final String? id;

  FetchCountryComponent({ this.id });
}

class CountryComponentUpdated extends CountryComponentEvent {
  final CountryModel value;

  CountryComponentUpdated({ required this.value });
}


