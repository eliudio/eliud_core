/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 country_form_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
// import the main classes
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';

// import the shared classes
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/model/entity_export.dart';
  
// import the classes of this package:
import '../model/abstract_repository_singleton.dart';
import '../model/repository_export.dart';
import 'package:eliud_core/model/repository_export.dart';
import '../model/model_export.dart';
import 'package:eliud_core/model/model_export.dart';
import '../model/entity_export.dart';
import 'package:eliud_core/model/entity_export.dart';


@immutable
abstract class CountryFormEvent extends Equatable {
  const CountryFormEvent();

  @override
  List<Object> get props => [];
}

class InitialiseNewCountryFormEvent extends CountryFormEvent {
}


class InitialiseCountryFormEvent extends CountryFormEvent {
  final CountryModel value;

  @override
  List<Object> get props => [ value ];

  InitialiseCountryFormEvent({this.value});
}

class InitialiseCountryFormNoLoadEvent extends CountryFormEvent {
  final CountryModel value;

  @override
  List<Object> get props => [ value ];

  InitialiseCountryFormNoLoadEvent({this.value});
}

class ChangedCountryDocumentID extends CountryFormEvent {
  final String value;

  ChangedCountryDocumentID({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedCountryDocumentID{ value: $value }';
}

class ChangedCountryCountryCode extends CountryFormEvent {
  final String value;

  ChangedCountryCountryCode({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedCountryCountryCode{ value: $value }';
}

class ChangedCountryCountryName extends CountryFormEvent {
  final String value;

  ChangedCountryCountryName({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedCountryCountryName{ value: $value }';
}

