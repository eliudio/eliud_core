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

import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/grid_view_model.dart';

abstract class GridViewListEvent extends Equatable {
  const GridViewListEvent();
  @override
  List<Object> get props => [];
}

class LoadGridViewList extends GridViewListEvent {
  final String orderBy;
  final bool descending;

  LoadGridViewList({this.orderBy, this.descending});

  @override
  List<Object> get props => [orderBy, descending];

}

class LoadGridViewListWithDetails extends GridViewListEvent {}

class AddGridViewList extends GridViewListEvent {
  final GridViewModel value;

  const AddGridViewList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'AddGridViewList{ value: $value }';
}

class UpdateGridViewList extends GridViewListEvent {
  final GridViewModel value;

  const UpdateGridViewList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'UpdateGridViewList{ value: $value }';
}

class DeleteGridViewList extends GridViewListEvent {
  final GridViewModel value;

  const DeleteGridViewList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'DeleteGridViewList{ value: $value }';
}

class GridViewListUpdated extends GridViewListEvent {
  final List<GridViewModel> value;

  const GridViewListUpdated({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'GridViewListUpdated{ value: $value }';
}

