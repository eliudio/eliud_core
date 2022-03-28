/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_subscription_list_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/member_subscription_model.dart';

abstract class MemberSubscriptionListEvent extends Equatable {
  const MemberSubscriptionListEvent();
  @override
  List<Object?> get props => [];
}

class LoadMemberSubscriptionList extends MemberSubscriptionListEvent {}

class NewPage extends MemberSubscriptionListEvent {}

class AddMemberSubscriptionList extends MemberSubscriptionListEvent {
  final MemberSubscriptionModel? value;

  const AddMemberSubscriptionList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'AddMemberSubscriptionList{ value: $value }';
}

class UpdateMemberSubscriptionList extends MemberSubscriptionListEvent {
  final MemberSubscriptionModel? value;

  const UpdateMemberSubscriptionList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'UpdateMemberSubscriptionList{ value: $value }';
}

class DeleteMemberSubscriptionList extends MemberSubscriptionListEvent {
  final MemberSubscriptionModel? value;

  const DeleteMemberSubscriptionList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'DeleteMemberSubscriptionList{ value: $value }';
}

class MemberSubscriptionListUpdated extends MemberSubscriptionListEvent {
  final List<MemberSubscriptionModel?>? value;
  final bool? mightHaveMore;

  const MemberSubscriptionListUpdated({ this.value, this.mightHaveMore });

  @override
  List<Object?> get props => [ value, mightHaveMore ];

  @override
  String toString() => 'MemberSubscriptionListUpdated{ value: $value, mightHaveMore: $mightHaveMore }';
}

class MemberSubscriptionChangeQuery extends MemberSubscriptionListEvent {
  final EliudQuery newQuery;

  const MemberSubscriptionChangeQuery({ required this.newQuery });

  @override
  List<Object?> get props => [ newQuery ];

  @override
  String toString() => 'MemberSubscriptionChangeQuery{ value: $newQuery }';
}

