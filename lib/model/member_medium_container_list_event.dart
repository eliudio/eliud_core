/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_medium_container_list_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/member_medium_container_model.dart';

abstract class MemberMediumContainerListEvent extends Equatable {
  const MemberMediumContainerListEvent();
  @override
  List<Object?> get props => [];
}

class LoadMemberMediumContainerList extends MemberMediumContainerListEvent {}

class NewPage extends MemberMediumContainerListEvent {}

class AddMemberMediumContainerList extends MemberMediumContainerListEvent {
  final MemberMediumContainerModel? value;

  const AddMemberMediumContainerList({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'AddMemberMediumContainerList{ value: $value }';
}

class UpdateMemberMediumContainerList extends MemberMediumContainerListEvent {
  final MemberMediumContainerModel? value;

  const UpdateMemberMediumContainerList({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'UpdateMemberMediumContainerList{ value: $value }';
}

class DeleteMemberMediumContainerList extends MemberMediumContainerListEvent {
  final MemberMediumContainerModel? value;

  const DeleteMemberMediumContainerList({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'DeleteMemberMediumContainerList{ value: $value }';
}

class MemberMediumContainerListUpdated extends MemberMediumContainerListEvent {
  final List<MemberMediumContainerModel?>? value;
  final bool? mightHaveMore;

  const MemberMediumContainerListUpdated({this.value, this.mightHaveMore});

  @override
  List<Object?> get props => [value, mightHaveMore];

  @override
  String toString() =>
      'MemberMediumContainerListUpdated{ value: $value, mightHaveMore: $mightHaveMore }';
}

class MemberMediumContainerChangeQuery extends MemberMediumContainerListEvent {
  final EliudQuery? newQuery;

  const MemberMediumContainerChangeQuery({required this.newQuery});

  @override
  List<Object?> get props => [newQuery];

  @override
  String toString() => 'MemberMediumContainerChangeQuery{ value: $newQuery }';
}
