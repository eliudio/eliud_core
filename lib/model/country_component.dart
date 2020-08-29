/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 country_component.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'country_component_bloc.dart';
import 'country_component_event.dart';
import 'country_model.dart';
import 'country_repository.dart';
import 'country_component_state.dart';

abstract class AbstractCountryComponent extends StatelessWidget {
  static String componentName = "countrys";
  final String countryID;

  AbstractCountryComponent({this.countryID});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CountryBloc> (
          create: (context) => CountryBloc(
            countryRepository: getCountryRepository())
        ..add(FetchCountry(id: countryID)),
      child: _countryBlockBuilder(context),
    );
  }

  Widget _countryBlockBuilder(BuildContext context) {
    return BlocBuilder<CountryBloc, CountryState>(builder: (context, state) {
      if (state is CountryLoaded) {
        if (state.value == null) {
          return alertWidget(title: 'Error', content: 'No country defined');
        } else {
          return yourWidget(context, state.value);
        }
      } else if (state is CountryError) {
        return alertWidget(title: 'Error', content: state.message);
      } else {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }

  Widget yourWidget(BuildContext context, CountryModel value);
  Widget alertWidget({ title: String, content: String});
  CountryRepository getCountryRepository();
}


