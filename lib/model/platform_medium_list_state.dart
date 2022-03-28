/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 platform_medium_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/platform_medium_model.dart';

abstract class PlatformMediumListState extends Equatable {
  const PlatformMediumListState();

  @override
  List<Object?> get props => [];
}

class PlatformMediumListLoading extends PlatformMediumListState {}

class PlatformMediumListLoaded extends PlatformMediumListState {
  final List<PlatformMediumModel?>? values;
  final bool? mightHaveMore;

  const PlatformMediumListLoaded({this.mightHaveMore, this.values = const []});

  @override
  List<Object?> get props => [ values, mightHaveMore ];

  @override
  String toString() => 'PlatformMediumListLoaded { values: $values }';

  @override
  bool operator ==(Object other) => 
          other is PlatformMediumListLoaded &&
              runtimeType == other.runtimeType &&
              ListEquality().equals(values, other.values) &&
              mightHaveMore == other.mightHaveMore;
}

class PlatformMediumNotLoaded extends PlatformMediumListState {}

