/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 pos_size_component_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';

abstract class PosSizeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchPosSize extends PosSizeEvent {
  final String id;

  FetchPosSize({ this.id });
}

