/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 blocking_component_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/blocking_model.dart';

abstract class BlockingComponentState extends Equatable {
  const BlockingComponentState();

  @override
  List<Object?> get props => [];
}

class BlockingComponentUninitialized extends BlockingComponentState {}

class BlockingComponentError extends BlockingComponentState {
  final String? message;
  BlockingComponentError({this.message});
}

class BlockingComponentPermissionDenied extends BlockingComponentState {
  BlockingComponentPermissionDenied();
}

class BlockingComponentLoaded extends BlockingComponentState {
  final BlockingModel value;

  const BlockingComponentLoaded({required this.value});

  BlockingComponentLoaded copyWith({BlockingModel? copyThis}) {
    return BlockingComponentLoaded(value: copyThis ?? value);
  }

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'BlockingComponentLoaded { value: $value }';
}
