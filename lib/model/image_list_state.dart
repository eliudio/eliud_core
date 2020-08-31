/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 image_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/image_model.dart';

abstract class ImageListState extends Equatable {
  const ImageListState();

  @override
  List<Object> get props => [];
}

class ImageListLoading extends ImageListState {}

class ImageListLoaded extends ImageListState {
  final List<ImageModel> values;

  const ImageListLoaded({this.values = const []});

  @override
  List<Object> get props => [ values ];

  @override
  String toString() => 'ImageListLoaded { values: $values }';
}

class ImageNotLoaded extends ImageListState {}

