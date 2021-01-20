/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_subscription_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/member_subscription_model.dart';

abstract class MemberSubscriptionListState extends Equatable {
  const MemberSubscriptionListState();

  @override
  List<Object> get props => [];
}

class MemberSubscriptionListLoading extends MemberSubscriptionListState {}

class MemberSubscriptionListLoaded extends MemberSubscriptionListState {
  final List<MemberSubscriptionModel> values;
  final bool mightHaveMore;

  const MemberSubscriptionListLoaded({this.mightHaveMore, this.values = const []});

  @override
  List<Object> get props => [ values, mightHaveMore ];

  @override
  String toString() => 'MemberSubscriptionListLoaded { values: $values }';
}

class MemberSubscriptionNotLoaded extends MemberSubscriptionListState {}

