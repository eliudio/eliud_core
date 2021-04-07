/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_list_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/member_model.dart';

abstract class MemberListEvent extends Equatable {
  const MemberListEvent();
  @override
  List<Object?> get props => [];
}

class LoadMemberList extends MemberListEvent {}

class NewPage extends MemberListEvent {}

class AddMemberList extends MemberListEvent {
  final MemberModel? value;

  const AddMemberList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'AddMemberList{ value: $value }';
}

class UpdateMemberList extends MemberListEvent {
  final MemberModel? value;

  const UpdateMemberList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'UpdateMemberList{ value: $value }';
}

class DeleteMemberList extends MemberListEvent {
  final MemberModel? value;

  const DeleteMemberList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'DeleteMemberList{ value: $value }';
}

class MemberListUpdated extends MemberListEvent {
  final List<MemberModel?>? value;
  final bool? mightHaveMore;

  const MemberListUpdated({ this.value, this.mightHaveMore });

  @override
  List<Object?> get props => [ value, mightHaveMore ];

  @override
  String toString() => 'MemberListUpdated{ value: $value, mightHaveMore: $mightHaveMore }';
}

