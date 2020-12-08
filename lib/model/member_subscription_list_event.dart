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

import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/member_subscription_model.dart';

abstract class MemberSubscriptionListEvent extends Equatable {
  const MemberSubscriptionListEvent();
  @override
  List<Object> get props => [];
}

class LoadMemberSubscriptionList extends MemberSubscriptionListEvent {
  final String orderBy;
  final bool descending;

  LoadMemberSubscriptionList({this.orderBy, this.descending});

  @override
  List<Object> get props => [orderBy, descending];

}

class LoadMemberSubscriptionListWithDetails extends MemberSubscriptionListEvent {}

class AddMemberSubscriptionList extends MemberSubscriptionListEvent {
  final MemberSubscriptionModel value;

  const AddMemberSubscriptionList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'AddMemberSubscriptionList{ value: $value }';
}

class UpdateMemberSubscriptionList extends MemberSubscriptionListEvent {
  final MemberSubscriptionModel value;

  const UpdateMemberSubscriptionList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'UpdateMemberSubscriptionList{ value: $value }';
}

class DeleteMemberSubscriptionList extends MemberSubscriptionListEvent {
  final MemberSubscriptionModel value;

  const DeleteMemberSubscriptionList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'DeleteMemberSubscriptionList{ value: $value }';
}

class MemberSubscriptionListUpdated extends MemberSubscriptionListEvent {
  final List<MemberSubscriptionModel> value;

  const MemberSubscriptionListUpdated({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'MemberSubscriptionListUpdated{ value: $value }';
}

