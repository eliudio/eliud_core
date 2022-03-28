/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 country_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/country_model.dart';

abstract class CountryListState extends Equatable {
  const CountryListState();

  @override
  List<Object?> get props => [];
}

class CountryListLoading extends CountryListState {}

class CountryListLoaded extends CountryListState {
  final List<CountryModel?>? values;
  final bool? mightHaveMore;

  const CountryListLoaded({this.mightHaveMore, this.values = const []});

  @override
  List<Object?> get props => [ values, mightHaveMore ];

  @override
  String toString() => 'CountryListLoaded { values: $values }';

  @override
  bool operator ==(Object other) => 
          other is CountryListLoaded &&
              runtimeType == other.runtimeType &&
              ListEquality().equals(values, other.values) &&
              mightHaveMore == other.mightHaveMore;
}

class CountryNotLoaded extends CountryListState {}

