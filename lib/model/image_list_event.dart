/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 image_list_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/image_model.dart';

abstract class ImageListEvent extends Equatable {
  const ImageListEvent();
  @override
  List<Object> get props => [];
}

class LoadImageList extends ImageListEvent {}
class LoadImageListWithDetails extends ImageListEvent {}

class AddImageList extends ImageListEvent {
  final ImageModel value;

  const AddImageList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'AddImageList{ value: $value }';
}

class UpdateImageList extends ImageListEvent {
  final ImageModel value;

  const UpdateImageList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'UpdateImageList{ value: $value }';
}

class DeleteImageList extends ImageListEvent {
  final ImageModel value;

  const DeleteImageList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'DeleteImageList{ value: $value }';
}

class ImageListUpdated extends ImageListEvent {
  final List<ImageModel> value;

  const ImageListUpdated({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ImageListUpdated{ value: $value }';
}

