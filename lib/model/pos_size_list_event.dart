/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 pos_size_list_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'pos_size_model.dart';

abstract class PosSizeListEvent extends Equatable {
  const PosSizeListEvent();
  @override
  List<Object> get props => [];
}

class LoadPosSizeList extends PosSizeListEvent {}
class LoadPosSizeListWithDetails extends PosSizeListEvent {}

class AddPosSizeList extends PosSizeListEvent {
  final PosSizeModel value;

  const AddPosSizeList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'AddPosSizeList{ value: $value }';
}

class UpdatePosSizeList extends PosSizeListEvent {
  final PosSizeModel value;

  const UpdatePosSizeList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'UpdatePosSizeList{ value: $value }';
}

class DeletePosSizeList extends PosSizeListEvent {
  final PosSizeModel value;

  const DeletePosSizeList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'DeletePosSizeList{ value: $value }';
}

class PosSizeListUpdated extends PosSizeListEvent {
  final List<PosSizeModel> value;

  const PosSizeListUpdated({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'PosSizeListUpdated{ value: $value }';
}

