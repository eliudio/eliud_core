/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 page_component_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/page_model.dart';

abstract class PageComponentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchPageComponent extends PageComponentEvent {
  final String? id;

  FetchPageComponent({this.id});
}

class PageComponentUpdated extends PageComponentEvent {
  final PageModel value;

  PageComponentUpdated({required this.value});
}
