/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 blocking_dashboard_component_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/blocking_dashboard_model.dart';

abstract class BlockingDashboardComponentState extends Equatable {
  const BlockingDashboardComponentState();

  @override
  List<Object?> get props => [];
}

class BlockingDashboardComponentUninitialized extends BlockingDashboardComponentState {}

class BlockingDashboardComponentError extends BlockingDashboardComponentState {
  final String? message;
  BlockingDashboardComponentError({ this.message });
}

class BlockingDashboardComponentPermissionDenied extends BlockingDashboardComponentState {
  BlockingDashboardComponentPermissionDenied();
}

class BlockingDashboardComponentLoaded extends BlockingDashboardComponentState {
  final BlockingDashboardModel value;

  const BlockingDashboardComponentLoaded({ required this.value });

  BlockingDashboardComponentLoaded copyWith({ BlockingDashboardModel? copyThis }) {
    return BlockingDashboardComponentLoaded(value: copyThis ?? this.value);
  }

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'BlockingDashboardComponentLoaded { value: $value }';
}

