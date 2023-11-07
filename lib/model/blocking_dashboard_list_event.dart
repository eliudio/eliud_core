/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 blocking_dashboard_list_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/blocking_dashboard_model.dart';

abstract class BlockingDashboardListEvent extends Equatable {
  const BlockingDashboardListEvent();
  @override
  List<Object?> get props => [];
}

class LoadBlockingDashboardList extends BlockingDashboardListEvent {}

class NewPage extends BlockingDashboardListEvent {}

class AddBlockingDashboardList extends BlockingDashboardListEvent {
  final BlockingDashboardModel? value;

  const AddBlockingDashboardList({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'AddBlockingDashboardList{ value: $value }';
}

class UpdateBlockingDashboardList extends BlockingDashboardListEvent {
  final BlockingDashboardModel? value;

  const UpdateBlockingDashboardList({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'UpdateBlockingDashboardList{ value: $value }';
}

class DeleteBlockingDashboardList extends BlockingDashboardListEvent {
  final BlockingDashboardModel? value;

  const DeleteBlockingDashboardList({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'DeleteBlockingDashboardList{ value: $value }';
}

class BlockingDashboardListUpdated extends BlockingDashboardListEvent {
  final List<BlockingDashboardModel?>? value;
  final bool? mightHaveMore;

  const BlockingDashboardListUpdated({this.value, this.mightHaveMore});

  @override
  List<Object?> get props => [value, mightHaveMore];

  @override
  String toString() =>
      'BlockingDashboardListUpdated{ value: $value, mightHaveMore: $mightHaveMore }';
}

class BlockingDashboardChangeQuery extends BlockingDashboardListEvent {
  final EliudQuery? newQuery;

  const BlockingDashboardChangeQuery({required this.newQuery});

  @override
  List<Object?> get props => [newQuery];

  @override
  String toString() => 'BlockingDashboardChangeQuery{ value: $newQuery }';
}
