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
import 'package:eliud_core/style/style_registry.dart';

import 'package:eliud_core/model/country_component_bloc.dart';
import 'package:eliud_core/model/country_component_event.dart';
import 'package:eliud_core/model/country_model.dart';
import 'package:eliud_core/model/country_repository.dart';
import 'package:eliud_core/model/country_component_state.dart';

abstract class AbstractCountryComponent extends StatelessWidget {
  static String componentName = "countrys";
  final String? countryID;

  AbstractCountryComponent({this.countryID});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CountryComponentBloc> (
          create: (context) => CountryComponentBloc(
            countryRepository: getCountryRepository(context))
        ..add(FetchCountryComponent(id: countryID)),
      child: _countryBlockBuilder(context),
    );
  }

  Widget _countryBlockBuilder(BuildContext context) {
    return BlocBuilder<CountryComponentBloc, CountryComponentState>(builder: (context, state) {
      if (state is CountryComponentLoaded) {
        if (state.value == null) {
          return alertWidget(title: 'Error', content: 'No Country defined');
        } else {
          return yourWidget(context, state.value);
        }
      } else if (state is CountryComponentPermissionDenied) {
        return Icon(
          Icons.highlight_off,
          color: Colors.red,
          size: 30.0,
        );
      } else if (state is CountryComponentError) {
        return alertWidget(title: 'Error', content: state.message);
      } else {
        return Center(
          child: StyleRegistry.registry().styleWithContext(context).frontEndStyle().progressIndicatorStyle().progressIndicator(context),
        );
      }
    });
  }

  Widget yourWidget(BuildContext context, CountryModel? value);
  Widget alertWidget({ title: String, content: String});
  CountryRepository getCountryRepository(BuildContext context);
}

