/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 country_form_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import 'package:eliud_core/tools/enums.dart';
import 'package:eliud_core/tools/common_tools.dart';

import 'package:eliud_core/model/rgb_model.dart';

import 'package:eliud_core/tools/string_validator.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_core/model/entity_export.dart';

import 'package:eliud_core/model/country_form_event.dart';
import 'package:eliud_core/model/country_form_state.dart';
import 'package:eliud_core/model/country_repository.dart';

class CountryFormBloc extends Bloc<CountryFormEvent, CountryFormState> {
  final FormAction? formAction;
  final String? appId;

  CountryFormBloc(this.appId, { this.formAction }): super(CountryFormUninitialized());
  @override
  Stream<CountryFormState> mapEventToState(CountryFormEvent event) async* {
    final CountryFormState currentState = state;
    if (currentState is CountryFormUninitialized) {
      if (event is InitialiseNewCountryFormEvent) {
        CountryFormLoaded loaded = CountryFormLoaded(value: CountryModel(
                                               documentID: "",
                                 countryCode: "",
                                 countryName: "",

        ));
        yield loaded;
        return;

      }


      if (event is InitialiseCountryFormEvent) {
        // Need to re-retrieve the document from the repository so that I get all associated types
        CountryFormLoaded loaded = CountryFormLoaded(value: await countryRepository(appId: appId).get(event.value!.documentID));
        yield loaded;
        return;
      } else if (event is InitialiseCountryFormNoLoadEvent) {
        CountryFormLoaded loaded = CountryFormLoaded(value: event.value);
        yield loaded;
        return;
      }
    } else if (currentState is CountryFormInitialized) {
      CountryModel? newValue = null;
      if (event is ChangedCountryDocumentID) {
        newValue = currentState.value!.copyWith(documentID: event.value);
        if (formAction == FormAction.AddAction) {
          yield* _isDocumentIDValid(event.value, newValue).asStream();
        } else {
          yield SubmittableCountryForm(value: newValue);
        }

        return;
      }
      if (event is ChangedCountryCountryCode) {
        newValue = currentState.value!.copyWith(countryCode: event.value);
        yield SubmittableCountryForm(value: newValue);

        return;
      }
      if (event is ChangedCountryCountryName) {
        newValue = currentState.value!.copyWith(countryName: event.value);
        yield SubmittableCountryForm(value: newValue);

        return;
      }
    }
  }


  DocumentIDCountryFormError error(String message, CountryModel newValue) => DocumentIDCountryFormError(message: message, value: newValue);

  Future<CountryFormState> _isDocumentIDValid(String? value, CountryModel newValue) async {
    if (value == null) return Future.value(error("Provide value for documentID", newValue));
    if (value.length == 0) return Future.value(error("Provide value for documentID", newValue));
    Future<CountryModel?> findDocument = countryRepository(appId: appId).get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittableCountryForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }


}

