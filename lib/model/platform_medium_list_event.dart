/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 platform_medium_list_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/platform_medium_model.dart';

abstract class PlatformMediumListEvent extends Equatable {
  const PlatformMediumListEvent();
  @override
  List<Object?> get props => [];
}

class LoadPlatformMediumList extends PlatformMediumListEvent {}

class NewPage extends PlatformMediumListEvent {}

class AddPlatformMediumList extends PlatformMediumListEvent {
  final PlatformMediumModel? value;

  const AddPlatformMediumList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'AddPlatformMediumList{ value: $value }';
}

class UpdatePlatformMediumList extends PlatformMediumListEvent {
  final PlatformMediumModel? value;

  const UpdatePlatformMediumList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'UpdatePlatformMediumList{ value: $value }';
}

class DeletePlatformMediumList extends PlatformMediumListEvent {
  final PlatformMediumModel? value;

  const DeletePlatformMediumList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'DeletePlatformMediumList{ value: $value }';
}

class PlatformMediumListUpdated extends PlatformMediumListEvent {
  final List<PlatformMediumModel?>? value;
  final bool? mightHaveMore;

  const PlatformMediumListUpdated({ this.value, this.mightHaveMore });

  @override
  List<Object?> get props => [ value, mightHaveMore ];

  @override
  String toString() => 'PlatformMediumListUpdated{ value: $value, mightHaveMore: $mightHaveMore }';
}

class PlatformMediumChangeQuery extends PlatformMediumListEvent {
  final EliudQuery? newQuery;

  const PlatformMediumChangeQuery({ required this.newQuery });

  @override
  List<Object?> get props => [ newQuery ];

  @override
  String toString() => 'PlatformMediumChangeQuery{ value: $newQuery }';
}

