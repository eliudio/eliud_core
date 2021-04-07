/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 grid_view_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/grid_view_model.dart';

abstract class GridViewListState extends Equatable {
  const GridViewListState();

  @override
  List<Object?> get props => [];
}

class GridViewListLoading extends GridViewListState {}

class GridViewListLoaded extends GridViewListState {
  final List<GridViewModel?>? values;
  final bool? mightHaveMore;

  const GridViewListLoaded({this.mightHaveMore, this.values = const []});

  @override
  List<Object?> get props => [ values, mightHaveMore ];

  @override
  String toString() => 'GridViewListLoaded { values: $values }';
}

class GridViewNotLoaded extends GridViewListState {}

