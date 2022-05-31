/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 public_medium_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/public_medium_model.dart';

abstract class PublicMediumListState extends Equatable {
  const PublicMediumListState();

  @override
  List<Object?> get props => [];
}

class PublicMediumListLoading extends PublicMediumListState {}

class PublicMediumListLoaded extends PublicMediumListState {
  final List<PublicMediumModel?>? values;
  final bool? mightHaveMore;

  const PublicMediumListLoaded({this.mightHaveMore, this.values = const []});

  @override
  List<Object?> get props => [ values, mightHaveMore ];

  @override
  String toString() => 'PublicMediumListLoaded { values: $values }';

  @override
  bool operator ==(Object other) => 
          other is PublicMediumListLoaded &&
              runtimeType == other.runtimeType &&
              ListEquality().equals(values, other.values) &&
              mightHaveMore == other.mightHaveMore;
}

class PublicMediumNotLoaded extends PublicMediumListState {}

