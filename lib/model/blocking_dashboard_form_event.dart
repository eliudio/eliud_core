/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 blocking_dashboard_form_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:eliud_core/model/model_export.dart';

@immutable
abstract class BlockingDashboardFormEvent extends Equatable {
  const BlockingDashboardFormEvent();

  @override
  List<Object?> get props => [];
}

class InitialiseNewBlockingDashboardFormEvent
    extends BlockingDashboardFormEvent {}

class InitialiseBlockingDashboardFormEvent extends BlockingDashboardFormEvent {
  final BlockingDashboardModel? value;

  @override
  List<Object?> get props => [value];

  InitialiseBlockingDashboardFormEvent({this.value});
}

class InitialiseBlockingDashboardFormNoLoadEvent
    extends BlockingDashboardFormEvent {
  final BlockingDashboardModel? value;

  @override
  List<Object?> get props => [value];

  InitialiseBlockingDashboardFormNoLoadEvent({this.value});
}

class ChangedBlockingDashboardDocumentID extends BlockingDashboardFormEvent {
  final String? value;

  ChangedBlockingDashboardDocumentID({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedBlockingDashboardDocumentID{ value: $value }';
}

class ChangedBlockingDashboardAppId extends BlockingDashboardFormEvent {
  final String? value;

  ChangedBlockingDashboardAppId({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedBlockingDashboardAppId{ value: $value }';
}

class ChangedBlockingDashboardDescription extends BlockingDashboardFormEvent {
  final String? value;

  ChangedBlockingDashboardDescription({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedBlockingDashboardDescription{ value: $value }';
}

class ChangedBlockingDashboardConditions extends BlockingDashboardFormEvent {
  final StorageConditionsModel? value;

  ChangedBlockingDashboardConditions({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedBlockingDashboardConditions{ value: $value }';
}
