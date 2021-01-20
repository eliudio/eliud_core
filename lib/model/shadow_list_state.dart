/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 shadow_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/shadow_model.dart';

abstract class ShadowListState extends Equatable {
  const ShadowListState();

  @override
  List<Object> get props => [];
}

class ShadowListLoading extends ShadowListState {}

class ShadowListLoaded extends ShadowListState {
  final List<ShadowModel> values;
  final bool mightHaveMore;

  const ShadowListLoaded({this.mightHaveMore, this.values = const []});

  @override
  List<Object> get props => [ values, mightHaveMore ];

  @override
  String toString() => 'ShadowListLoaded { values: $values }';
}

class ShadowNotLoaded extends ShadowListState {}

