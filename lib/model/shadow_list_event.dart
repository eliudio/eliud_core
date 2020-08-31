/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 shadow_list_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/shadow_model.dart';

abstract class ShadowListEvent extends Equatable {
  const ShadowListEvent();
  @override
  List<Object> get props => [];
}

class LoadShadowList extends ShadowListEvent {}
class LoadShadowListWithDetails extends ShadowListEvent {}

class AddShadowList extends ShadowListEvent {
  final ShadowModel value;

  const AddShadowList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'AddShadowList{ value: $value }';
}

class UpdateShadowList extends ShadowListEvent {
  final ShadowModel value;

  const UpdateShadowList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'UpdateShadowList{ value: $value }';
}

class DeleteShadowList extends ShadowListEvent {
  final ShadowModel value;

  const DeleteShadowList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'DeleteShadowList{ value: $value }';
}

class ShadowListUpdated extends ShadowListEvent {
  final List<ShadowModel> value;

  const ShadowListUpdated({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ShadowListUpdated{ value: $value }';
}

