/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 body_component_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'body_component_model.dart';

abstract class BodyComponentListState extends Equatable {
  const BodyComponentListState();

  @override
  List<Object> get props => [];
}

class BodyComponentListLoading extends BodyComponentListState {}

class BodyComponentListLoaded extends BodyComponentListState {
  final List<BodyComponentModel> values;

  const BodyComponentListLoaded({this.values = const []});

  @override
  List<Object> get props => [ values ];

  @override
  String toString() => 'BodyComponentListLoaded { values: $values }';
}

class BodyComponentNotLoaded extends BodyComponentListState {}

