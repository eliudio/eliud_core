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

import 'package:eliud_core/model/country_model.dart';
import 'package:eliud_core/model/country_component_event.dart';
import 'package:eliud_core/model/country_component_state.dart';
import 'package:eliud_core/model/country_repository.dart';
class CountryComponentBloc extends Bloc<CountryComponentEvent, CountryComponentState> {
  final CountryRepository countryRepository;

  CountryComponentBloc({ this.countryRepository }): super(CountryComponentUninitialized());
  @override
  Stream<CountryComponentState> mapEventToState(CountryComponentEvent event) async* {
    final currentState = state;
    if (event is FetchCountryComponent) {
      try {
        if (currentState is CountryComponentUninitialized) {
          final CountryModel model = await _fetchCountry(event.id);

          if (model != null) {
            yield CountryComponentLoaded(value: model);
          } else {
            String id = event.id;
            yield CountryComponentError(message: "Country with id = '$id' not found");
          }
          return;
        }
      } catch (_) {
        yield CountryComponentError(message: "Unknown error whilst retrieving Country");
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


