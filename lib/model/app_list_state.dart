/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 app_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'app_model.dart';

abstract class AppListState extends Equatable {
  const AppListState();

  @override
  List<Object> get props => [];
}

class AppListLoading extends AppListState {}

class AppListLoaded extends AppListState {
  final List<AppModel> values;

  const AppListLoaded({this.values = const []});

  @override
  List<Object> get props => [ values ];

  @override
  String toString() => 'AppListLoaded { values: $values }';
}

class AppNotLoaded extends AppListState {}

