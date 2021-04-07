/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 decoration_color_list_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/decoration_color_model.dart';

abstract class DecorationColorListEvent extends Equatable {
  const DecorationColorListEvent();
  @override
  List<Object?> get props => [];
}

class LoadDecorationColorList extends DecorationColorListEvent {}

class NewPage extends DecorationColorListEvent {}

class AddDecorationColorList extends DecorationColorListEvent {
  final DecorationColorModel? value;

  const AddDecorationColorList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'AddDecorationColorList{ value: $value }';
}

class UpdateDecorationColorList extends DecorationColorListEvent {
  final DecorationColorModel? value;

  const UpdateDecorationColorList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'UpdateDecorationColorList{ value: $value }';
}

class DeleteDecorationColorList extends DecorationColorListEvent {
  final DecorationColorModel? value;

  const DeleteDecorationColorList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'DeleteDecorationColorList{ value: $value }';
}

class DecorationColorListUpdated extends DecorationColorListEvent {
  final List<DecorationColorModel>? value;
  final bool? mightHaveMore;

  const DecorationColorListUpdated({ this.value, this.mightHaveMore });

  @override
  List<Object?> get props => [ value, mightHaveMore ];

  @override
  String toString() => 'DecorationColorListUpdated{ value: $value, mightHaveMore: $mightHaveMore }';
}

