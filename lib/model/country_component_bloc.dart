/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 country_component_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';

import 'country_model.dart';
import 'country_component_event.dart';
import 'country_component_state.dart';
import 'country_repository.dart';
class CountryBloc extends Bloc<CountryEvent, CountryState> {
  final CountryRepository countryRepository;

  CountryBloc({ this.countryRepository }): super(CountryUninitialized());
  @override
  Stream<CountryState> mapEventToState(CountryEvent event) async* {
    final currentState = state;
    if (event is FetchCountry) {
      try {
        if (currentState is CountryUninitialized) {
          final CountryModel model = await _fetchCountry(event.id);

          if (model != null) {
            yield CountryLoaded(value: model);
          } else {
            String id = event.id;
            yield CountryError(message: "Country with id = '$id' not found");
          }
          return;
        }
      } catch (_) {
        yield CountryError(message: "Unknown error whilst retrieving Country");
      }
    }
  }

  Future<CountryModel> _fetchCountry(String id) async {
    return countryRepository.get(id);
  }

  @override
  Future<void> close() {
    return super.close();
  }

}


