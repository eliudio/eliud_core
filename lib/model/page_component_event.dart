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

abstract class PageEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchPage extends PageEvent {
  final String id;

  FetchPage({ this.id });
}

