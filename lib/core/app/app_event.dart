/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 cart_component_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';

abstract class AppEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchApp extends AppEvent {
  final String id;

  FetchApp({ this.id });

  @override
  List<Object> get props => [id ];
}

class SwitchAppEvent extends AppEvent {
  final String id;

  SwitchAppEvent(this.id);
}

