/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 blocking_dashboard_component_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/blocking_dashboard_model.dart';

abstract class BlockingDashboardComponentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchBlockingDashboardComponent extends BlockingDashboardComponentEvent {
  final String? id;

  FetchBlockingDashboardComponent({ this.id });
}

class BlockingDashboardComponentUpdated extends BlockingDashboardComponentEvent {
  final BlockingDashboardModel value;

  BlockingDashboardComponentUpdated({ required this.value });
}


