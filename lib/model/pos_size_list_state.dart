/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 pos_size_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/pos_size_model.dart';

abstract class PosSizeListState extends Equatable {
  const PosSizeListState();

  @override
  List<Object> get props => [];
}

class PosSizeListLoading extends PosSizeListState {}

class PosSizeListLoaded extends PosSizeListState {
  final List<PosSizeModel> values;
  final bool mightHaveMore;

  const PosSizeListLoaded({this.mightHaveMore, this.values = const []});

  @override
  List<Object> get props => [ values, mightHaveMore ];

  @override
  String toString() => 'PosSizeListLoaded { values: $values }';
}

class PosSizeNotLoaded extends PosSizeListState {}

