import 'package:equatable/equatable.dart';
import 'package:eliud_core_model/model/blocking_model.dart';

import 'maintain_blocking_list_state.dart';

abstract class MaintainBlockingListEvent extends Equatable {
  const MaintainBlockingListEvent();
  @override
  List<Object?> get props => [];
}

class LoadMaintainBlockingList extends MaintainBlockingListEvent {}

class MaintainBlockingNewPage extends MaintainBlockingListEvent {}

class AddMaintainBlockingList extends MaintainBlockingListEvent {
  final BlockingModel value;

  const AddMaintainBlockingList({required this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'AddAddMaintainBlockingList{ value: $value }';
}

class UpdateMaintainBlockingList extends MaintainBlockingListEvent {
  final BlockingModel value;

  const UpdateMaintainBlockingList({required this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'UpdateAddMaintainBlockingList{ value: $value }';
}

class DeleteMaintainBlockingList extends MaintainBlockingListEvent {
  final BlockedMember value;

  const DeleteMaintainBlockingList({required this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'DeleteMaintainBlockingList{ value: $value }';
}

class MaintainBlockingListUpdated extends MaintainBlockingListEvent {
  final List<BlockedMember> value;
  final bool? mightHaveMore;

  const MaintainBlockingListUpdated({required this.value, this.mightHaveMore});

  @override
  List<Object?> get props => [value, mightHaveMore];

  @override
  String toString() =>
      'BlockingListUpdated{ value: $value, mightHaveMore: $mightHaveMore }';
}
