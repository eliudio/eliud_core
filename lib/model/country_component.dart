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


import 'package:eliud_core/model/country_component_bloc.dart';
import 'package:eliud_core/model/country_component_event.dart';
import 'package:eliud_core/model/country_model.dart';
import 'package:eliud_core/model/country_repository.dart';
import 'package:eliud_core/model/country_component_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'abstract_repository_singleton.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/app_model.dart';

abstract class AbstractCountryComponent extends StatelessWidget {
  static String componentName = "countrys";
  final AppModel app;
  final String countryId;

  AbstractCountryComponent({Key? key, required this.app, required this.countryId}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CountryComponentBloc> (
          create: (context) => CountryComponentBloc(
            countryRepository: countryRepository(appId: app.documentID!)!)
        ..add(FetchCountryComponent(id: countryId)),
      child: _countryBlockBuilder(context),
    );
  }

  Widget _countryBlockBuilder(BuildContext context) {
    return BlocBuilder<CountryComponentBloc, CountryComponentState>(builder: (context, state) {
      if (state is CountryComponentLoaded) {
        if (state.value == null) {
          return AlertWidget(app: app, title: "Error", content: 'No Country defined');
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
        return AlertWidget(app: app, title: 'Error', content: state.message);
      } else {
        return Center(
          child: StyleRegistry.registry().styleWithApp(app).frontEndStyle().progressIndicatorStyle().progressIndicator(app, context),
        );
      }
    });
  }

  Widget yourWidget(BuildContext context, CountryModel value);
}

