/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'member_model.dart';

abstract class MemberListState extends Equatable {
  const MemberListState();

  @override
  List<Object> get props => [];
}

class MemberListLoading extends MemberListState {}

class MemberListLoaded extends MemberListState {
  final List<MemberModel> values;

  const MemberListLoaded({this.values = const []});

  @override
  List<Object> get props => [ values ];

  @override
  String toString() => 'MemberListLoaded { values: $values }';
}

class MemberNotLoaded extends MemberListState {}

