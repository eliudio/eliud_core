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

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/body_component_model.dart';

abstract class BodyComponentListState extends Equatable {
  const BodyComponentListState();

  @override
  List<Object?> get props => [];
}

class BodyComponentListLoading extends BodyComponentListState {}

class BodyComponentListLoaded extends BodyComponentListState {
  final List<BodyComponentModel?>? values;
  final bool? mightHaveMore;

  const BodyComponentListLoaded({this.mightHaveMore, this.values = const []});

  @override
  List<Object?> get props => [ values, mightHaveMore ];

  @override
  String toString() => 'BodyComponentListLoaded { values: $values }';

  @override
  bool operator ==(Object other) => 
          other is BodyComponentListLoaded &&
              runtimeType == other.runtimeType &&
              ListEquality().equals(values, other.values) &&
              mightHaveMore == other.mightHaveMore;
}

class BodyComponentNotLoaded extends BodyComponentListState {}

