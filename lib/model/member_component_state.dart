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
import 'package:eliud_core/model/member_model.dart';

abstract class MemberComponentState extends Equatable {
  const MemberComponentState();

  @override
  List<Object?> get props => [];
}

class MemberComponentUninitialized extends MemberComponentState {}

class MemberComponentError extends MemberComponentState {
  final String? message;
  MemberComponentError({ this.message });
}

class MemberComponentPermissionDenied extends MemberComponentState {
  MemberComponentPermissionDenied();
}

class MemberComponentLoaded extends MemberComponentState {
  final MemberModel value;

  const MemberComponentLoaded({ required this.value });

  MemberComponentLoaded copyWith({ MemberModel? copyThis }) {
    return MemberComponentLoaded(value: copyThis ?? this.value);
  }

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'MemberComponentLoaded { value: $value }';
}

