/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_component_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'member_model.dart';

abstract class MemberState extends Equatable {
  const MemberState();

  @override
  List<Object> get props => [];
}

class MemberUninitialized extends MemberState {}

class MemberError extends MemberState {
  final String message;
  MemberError({ this.message });
}

class MemberLoaded extends MemberState {
  final MemberModel value;

  const MemberLoaded({ this.value });

  MemberLoaded copyWith({ MemberModel copyThis }) {
    return MemberLoaded(value: copyThis ?? this.value);
  }

  @override
  List<Object> get props => [value];

  @override
  String toString() => 'MemberModelLoaded { value: $value }';
}


