/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_dashboard_component_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/member_dashboard_model.dart';

abstract class MemberDashboardComponentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchMemberDashboardComponent extends MemberDashboardComponentEvent {
  final String? id;

  FetchMemberDashboardComponent({ this.id });
}

class MemberDashboardComponentUpdated extends MemberDashboardComponentEvent {
  final MemberDashboardModel value;

  MemberDashboardComponentUpdated({ required this.value });
}


