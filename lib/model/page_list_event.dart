/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 page_list_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/page_model.dart';

abstract class PageListEvent extends Equatable {
  const PageListEvent();
  @override
  List<Object> get props => [];
}

class LoadPageList extends PageListEvent {}

class NewPage extends PageListEvent {}

class AddPageList extends PageListEvent {
  final PageModel value;

  const AddPageList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'AddPageList{ value: $value }';
}

class UpdatePageList extends PageListEvent {
  final PageModel value;

  const UpdatePageList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'UpdatePageList{ value: $value }';
}

class DeletePageList extends PageListEvent {
  final PageModel value;

  const DeletePageList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'DeletePageList{ value: $value }';
}

class PageListUpdated extends PageListEvent {
  final List<PageModel> value;
  final bool mightHaveMore;

  const PageListUpdated({ this.value, this.mightHaveMore });

  @override
  List<Object> get props => [ value, mightHaveMore ];

  @override
  String toString() => 'PageListUpdated{ value: $value, mightHaveMore: $mightHaveMore }';
}

