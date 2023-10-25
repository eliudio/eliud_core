/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 blocking_list_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/blocking_model.dart';

abstract class BlockingListEvent extends Equatable {
  const BlockingListEvent();
  @override
  List<Object?> get props => [];
}

class LoadBlockingList extends BlockingListEvent {}

class NewPage extends BlockingListEvent {}

class AddBlockingList extends BlockingListEvent {
  final BlockingModel? value;

  const AddBlockingList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'AddBlockingList{ value: $value }';
}

class UpdateBlockingList extends BlockingListEvent {
  final BlockingModel? value;

  const UpdateBlockingList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'UpdateBlockingList{ value: $value }';
}

class DeleteBlockingList extends BlockingListEvent {
  final BlockingModel? value;

  const DeleteBlockingList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'DeleteBlockingList{ value: $value }';
}

class BlockingListUpdated extends BlockingListEvent {
  final List<BlockingModel?>? value;
  final bool? mightHaveMore;

  const BlockingListUpdated({ this.value, this.mightHaveMore });

  @override
  List<Object?> get props => [ value, mightHaveMore ];

  @override
  String toString() => 'BlockingListUpdated{ value: $value, mightHaveMore: $mightHaveMore }';
}

class BlockingChangeQuery extends BlockingListEvent {
  final EliudQuery? newQuery;

  const BlockingChangeQuery({ required this.newQuery });

  @override
  List<Object?> get props => [ newQuery ];

  @override
  String toString() => 'BlockingChangeQuery{ value: $newQuery }';
}

