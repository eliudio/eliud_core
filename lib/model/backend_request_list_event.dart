/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 backend_request_list_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/backend_request_model.dart';

abstract class BackendRequestListEvent extends Equatable {
  const BackendRequestListEvent();
  @override
  List<Object?> get props => [];
}

class LoadBackendRequestList extends BackendRequestListEvent {}

class NewPage extends BackendRequestListEvent {}

class AddBackendRequestList extends BackendRequestListEvent {
  final BackendRequestModel? value;

  const AddBackendRequestList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'AddBackendRequestList{ value: $value }';
}

class UpdateBackendRequestList extends BackendRequestListEvent {
  final BackendRequestModel? value;

  const UpdateBackendRequestList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'UpdateBackendRequestList{ value: $value }';
}

class DeleteBackendRequestList extends BackendRequestListEvent {
  final BackendRequestModel? value;

  const DeleteBackendRequestList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'DeleteBackendRequestList{ value: $value }';
}

class BackendRequestListUpdated extends BackendRequestListEvent {
  final List<BackendRequestModel?>? value;
  final bool? mightHaveMore;

  const BackendRequestListUpdated({ this.value, this.mightHaveMore });

  @override
  List<Object?> get props => [ value, mightHaveMore ];

  @override
  String toString() => 'BackendRequestListUpdated{ value: $value, mightHaveMore: $mightHaveMore }';
}

class BackendRequestChangeQuery extends BackendRequestListEvent {
  final EliudQuery? newQuery;

  const BackendRequestChangeQuery({ required this.newQuery });

  @override
  List<Object?> get props => [ newQuery ];

  @override
  String toString() => 'BackendRequestChangeQuery{ value: $newQuery }';
}

