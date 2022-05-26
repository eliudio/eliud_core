/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 app_bar_component_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/model/app_bar_model.dart';
import 'package:equatable/equatable.dart';

abstract class AppBarComponentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchAppBarComponent extends AppBarComponentEvent {
  final String? id;

  FetchAppBarComponent({ this.id });
}

class AppBarComponentUpdated extends AppBarComponentEvent {
  final AppBarModel value;

  AppBarComponentUpdated({ required this.value });
}


