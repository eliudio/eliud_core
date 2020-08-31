/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 country_list_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/country_model.dart';

abstract class CountryListEvent extends Equatable {
  const CountryListEvent();
  @override
  List<Object> get props => [];
}

class LoadCountryList extends CountryListEvent {}
class LoadCountryListWithDetails extends CountryListEvent {}

class AddCountryList extends CountryListEvent {
  final CountryModel value;

  const AddCountryList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'AddCountryList{ value: $value }';
}

class UpdateCountryList extends CountryListEvent {
  final CountryModel value;

  const UpdateCountryList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'UpdateCountryList{ value: $value }';
}

class DeleteCountryList extends CountryListEvent {
  final CountryModel value;

  const DeleteCountryList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'DeleteCountryList{ value: $value }';
}

class CountryListUpdated extends CountryListEvent {
  final List<CountryModel> value;

  const CountryListUpdated({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'CountryListUpdated{ value: $value }';
}

