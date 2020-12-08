/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 font_list_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/font_model.dart';

abstract class FontListEvent extends Equatable {
  const FontListEvent();
  @override
  List<Object> get props => [];
}

class LoadFontList extends FontListEvent {
  final String orderBy;
  final bool descending;

  LoadFontList({this.orderBy, this.descending});

  @override
  List<Object> get props => [orderBy, descending];

}

class LoadFontListWithDetails extends FontListEvent {}

class AddFontList extends FontListEvent {
  final FontModel value;

  const AddFontList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'AddFontList{ value: $value }';
}

class UpdateFontList extends FontListEvent {
  final FontModel value;

  const UpdateFontList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'UpdateFontList{ value: $value }';
}

class DeleteFontList extends FontListEvent {
  final FontModel value;

  const DeleteFontList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'DeleteFontList{ value: $value }';
}

class FontListUpdated extends FontListEvent {
  final List<FontModel> value;

  const FontListUpdated({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'FontListUpdated{ value: $value }';
}

