/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_dashboard_component_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/member_dashboard_model.dart';

abstract class MemberDashboardComponentState extends Equatable {
  const MemberDashboardComponentState();

  @override
  List<Object?> get props => [];
}

class MemberDashboardComponentUninitialized extends MemberDashboardComponentState {}

class MemberDashboardComponentError extends MemberDashboardComponentState {
  final String? message;
  MemberDashboardComponentError({ this.message });
}

class MemberDashboardComponentPermissionDenied extends MemberDashboardComponentState {
  MemberDashboardComponentPermissionDenied();
}

class MemberDashboardComponentLoaded extends MemberDashboardComponentState {
  final MemberDashboardModel value;

  const MemberDashboardComponentLoaded({ required this.value });

  MemberDashboardComponentLoaded copyWith({ MemberDashboardModel? copyThis }) {
    return MemberDashboardComponentLoaded(value: copyThis ?? this.value);
  }

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'MemberDashboardComponentLoaded { value: $value }';
}

