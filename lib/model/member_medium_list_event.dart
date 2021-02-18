/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_medium_list_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/member_medium_model.dart';

abstract class MemberMediumListEvent extends Equatable {
  const MemberMediumListEvent();
  @override
  List<Object> get props => [];
}

class LoadMemberMediumList extends MemberMediumListEvent {}

class NewPage extends MemberMediumListEvent {}

class AddMemberMediumList extends MemberMediumListEvent {
  final MemberMediumModel value;

  const AddMemberMediumList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'AddMemberMediumList{ value: $value }';
}

class UpdateMemberMediumList extends MemberMediumListEvent {
  final MemberMediumModel value;

  const UpdateMemberMediumList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'UpdateMemberMediumList{ value: $value }';
}

class DeleteMemberMediumList extends MemberMediumListEvent {
  final MemberMediumModel value;

  const DeleteMemberMediumList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'DeleteMemberMediumList{ value: $value }';
}

class MemberMediumListUpdated extends MemberMediumListEvent {
  final List<MemberMediumModel> value;
  final bool mightHaveMore;

  const MemberMediumListUpdated({ this.value, this.mightHaveMore });

  @override
  List<Object> get props => [ value, mightHaveMore ];

  @override
  String toString() => 'MemberMediumListUpdated{ value: $value, mightHaveMore: $mightHaveMore }';
}

