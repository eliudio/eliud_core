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

  CountryComponentBloc({ this.countryRepository }): super(CountryComponentUninitialized());
  @override
  Stream<CountryComponentState> mapEventToState(CountryComponentEvent event) async* {
    final CountryComponentState currentState = state;
    if (event is FetchCountryComponent) {
      try {
        if (currentState is CountryComponentUninitialized) {
          bool permissionDenied = false;
          final model = await countryRepository!.get(event.id, onError: (error) {
            // Unfortunatly the below is currently the only way we know how to identify if a document is read protected
            if ((error is PlatformException) &&  (error.message!.startsWith("PERMISSION_DENIED"))) {
              permissionDenied = true;
            }
          });
          if (permissionDenied) {
            yield CountryComponentPermissionDenied();
          } else {
            if (model != null) {
              yield CountryComponentLoaded(value: model);
            } else {
              String? id = event.id;
              yield CountryComponentError(
                  message: "Country with id = '$id' not found");
            }
          }
          return;
        }
      } catch (_) {
        yield CountryComponentError(message: "Unknown error whilst retrieving Country");
      }
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }

}

