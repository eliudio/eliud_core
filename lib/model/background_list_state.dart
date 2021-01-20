/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 background_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/background_model.dart';

abstract class BackgroundListState extends Equatable {
  const BackgroundListState();

  @override
  List<Object> get props => [];
}

class BackgroundListLoading extends BackgroundListState {}

class BackgroundListLoaded extends BackgroundListState {
  final List<BackgroundModel> values;
  final bool mightHaveMore;

  const BackgroundListLoaded({this.mightHaveMore, this.values = const []});

  @override
  List<Object> get props => [ values, mightHaveMore ];

  @override
  String toString() => 'BackgroundListLoaded { values: $values }';
}

class BackgroundNotLoaded extends BackgroundListState {}

