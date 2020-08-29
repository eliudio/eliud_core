/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 decoration_color_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'decoration_color_model.dart';

abstract class DecorationColorListState extends Equatable {
  const DecorationColorListState();

  @override
  List<Object> get props => [];
}

class DecorationColorListLoading extends DecorationColorListState {}

class DecorationColorListLoaded extends DecorationColorListState {
  final List<DecorationColorModel> values;

  const DecorationColorListLoaded({this.values = const []});

  @override
  List<Object> get props => [ values ];

  @override
  String toString() => 'DecorationColorListLoaded { values: $values }';
}

class DecorationColorNotLoaded extends DecorationColorListState {}

