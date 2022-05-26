/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_dashboard_list_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/model/member_dashboard_model.dart';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:equatable/equatable.dart';

abstract class MemberDashboardListEvent extends Equatable {
  const MemberDashboardListEvent();
  @override
  List<Object?> get props => [];
}

class LoadMemberDashboardList extends MemberDashboardListEvent {}

class NewPage extends MemberDashboardListEvent {}

class AddMemberDashboardList extends MemberDashboardListEvent {
  final MemberDashboardModel? value;

  const AddMemberDashboardList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'AddMemberDashboardList{ value: $value }';
}

class UpdateMemberDashboardList extends MemberDashboardListEvent {
  final MemberDashboardModel? value;

  const UpdateMemberDashboardList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'UpdateMemberDashboardList{ value: $value }';
}

class DeleteMemberDashboardList extends MemberDashboardListEvent {
  final MemberDashboardModel? value;

  const DeleteMemberDashboardList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'DeleteMemberDashboardList{ value: $value }';
}

class MemberDashboardListUpdated extends MemberDashboardListEvent {
  final List<MemberDashboardModel?>? value;
  final bool? mightHaveMore;

  const MemberDashboardListUpdated({ this.value, this.mightHaveMore });

  @override
  List<Object?> get props => [ value, mightHaveMore ];

  @override
  String toString() => 'MemberDashboardListUpdated{ value: $value, mightHaveMore: $mightHaveMore }';
}

class MemberDashboardChangeQuery extends MemberDashboardListEvent {
  final EliudQuery? newQuery;

  const MemberDashboardChangeQuery({ required this.newQuery });

  @override
  List<Object?> get props => [ newQuery ];

  @override
  String toString() => 'MemberDashboardChangeQuery{ value: $newQuery }';
}

