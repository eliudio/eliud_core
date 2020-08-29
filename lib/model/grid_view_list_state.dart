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
import 'grid_view_model.dart';

abstract class GridViewListState extends Equatable {
  const GridViewListState();

  @override
  List<Object> get props => [];
}

class GridViewListLoading extends GridViewListState {}

class GridViewListLoaded extends GridViewListState {
  final List<GridViewModel> values;

  const GridViewListLoaded({this.values = const []});

  @override
  List<Object> get props => [ values ];

  @override
  String toString() => 'GridViewListLoaded { values: $values }';
}

class GridViewNotLoaded extends GridViewListState {}

