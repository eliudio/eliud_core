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
import 'package:flutter/services.dart';

class CountryComponentBloc extends Bloc<CountryComponentEvent, CountryComponentState> {
  final CountryRepository? countryRepository;
  StreamSubscription? _countrySubscription;

  Stream<CountryComponentState> _mapLoadCountryComponentUpdateToState(String documentId) async* {
    _countrySubscription?.cancel();
    _countrySubscription = countryRepository!.listenTo(documentId, (value) {
      if (value != null) add(CountryComponentUpdated(value: value!));
    });
  }

  CountryComponentBloc({ this.countryRepository }): super(CountryComponentUninitialized());

  @override
  Stream<CountryComponentState> mapEventToState(CountryComponentEvent event) async* {
    final currentState = state;
    if (event is FetchCountryComponent) {
      yield* _mapLoadCountryComponentUpdateToState(event.id!);
    } else if (event is CountryComponentUpdated) {
      yield CountryComponentLoaded(value: event.value);
    }
  }

  @override
  Future<void> close() {
    _countrySubscription?.cancel();
    return super.close();
  }

}

