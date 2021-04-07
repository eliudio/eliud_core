/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 font_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/font_model.dart';

abstract class FontListState extends Equatable {
  const FontListState();

  @override
  List<Object?> get props => [];
}

class FontListLoading extends FontListState {}

class FontListLoaded extends FontListState {
  final List<FontModel?>? values;
  final bool? mightHaveMore;

  const FontListLoaded({this.mightHaveMore, this.values = const []});

  @override
  List<Object?> get props => [ values, mightHaveMore ];

  @override
  String toString() => 'FontListLoaded { values: $values }';
}

class FontNotLoaded extends FontListState {}

