/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 grid_view_list_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/model/grid_view_model.dart';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:equatable/equatable.dart';

abstract class GridViewListEvent extends Equatable {
  const GridViewListEvent();
  @override
  List<Object?> get props => [];
}

class LoadGridViewList extends GridViewListEvent {}

class NewPage extends GridViewListEvent {}

class AddGridViewList extends GridViewListEvent {
  final GridViewModel? value;

  const AddGridViewList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'AddGridViewList{ value: $value }';
}

class UpdateGridViewList extends GridViewListEvent {
  final GridViewModel? value;

  const UpdateGridViewList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'UpdateGridViewList{ value: $value }';
}

class DeleteGridViewList extends GridViewListEvent {
  final GridViewModel? value;

  const DeleteGridViewList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'DeleteGridViewList{ value: $value }';
}

class GridViewListUpdated extends GridViewListEvent {
  final List<GridViewModel?>? value;
  final bool? mightHaveMore;

  const GridViewListUpdated({ this.value, this.mightHaveMore });

  @override
  List<Object?> get props => [ value, mightHaveMore ];

  @override
  String toString() => 'GridViewListUpdated{ value: $value, mightHaveMore: $mightHaveMore }';
}

class GridViewChangeQuery extends GridViewListEvent {
  final EliudQuery? newQuery;

  const GridViewChangeQuery({ required this.newQuery });

  @override
  List<Object?> get props => [ newQuery ];

  @override
  String toString() => 'GridViewChangeQuery{ value: $newQuery }';
}

