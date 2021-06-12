/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 eliud_style_attributes_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/eliud_style_attributes_model.dart';

abstract class EliudStyleAttributesListState extends Equatable {
  const EliudStyleAttributesListState();

  @override
  List<Object?> get props => [];
}

class EliudStyleAttributesListLoading extends EliudStyleAttributesListState {}

class EliudStyleAttributesListLoaded extends EliudStyleAttributesListState {
  final List<EliudStyleAttributesModel?>? values;
  final bool? mightHaveMore;

  const EliudStyleAttributesListLoaded({this.mightHaveMore, this.values = const []});

  @override
  List<Object?> get props => [ values, mightHaveMore ];

  @override
  String toString() => 'EliudStyleAttributesListLoaded { values: $values }';
}

class EliudStyleAttributesNotLoaded extends EliudStyleAttributesListState {}

