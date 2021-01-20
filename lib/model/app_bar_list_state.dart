/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 app_bar_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/app_bar_model.dart';

abstract class AppBarListState extends Equatable {
  const AppBarListState();

  @override
  List<Object> get props => [];
}

class AppBarListLoading extends AppBarListState {}

class AppBarListLoaded extends AppBarListState {
  final List<AppBarModel> values;
  final bool mightHaveMore;

  const AppBarListLoaded({this.mightHaveMore, this.values = const []});

  @override
  List<Object> get props => [ values, mightHaveMore ];

  @override
  String toString() => 'AppBarListLoaded { values: $values }';
}

class AppBarNotLoaded extends AppBarListState {}

