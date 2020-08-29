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
import 'member_subscription_model.dart';

abstract class MemberSubscriptionListState extends Equatable {
  const MemberSubscriptionListState();

  @override
  List<Object> get props => [];
}

class MemberSubscriptionListLoading extends MemberSubscriptionListState {}

class MemberSubscriptionListLoaded extends MemberSubscriptionListState {
  final List<MemberSubscriptionModel> values;

  const MemberSubscriptionListLoaded({this.values = const []});

  @override
  List<Object> get props => [ values ];

  @override
  String toString() => 'MemberSubscriptionListLoaded { values: $values }';
}

class MemberSubscriptionNotLoaded extends MemberSubscriptionListState {}

