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
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import '../model/abstract_repository_singleton.dart';
import 'repository_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import '../model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import '../model/entity_export.dart';


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

