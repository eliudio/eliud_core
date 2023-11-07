/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 app_component_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/app_model.dart';

abstract class AppComponentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchAppComponent extends AppComponentEvent {
  final String? id;

  FetchAppComponent({this.id});
}

class AppComponentUpdated extends AppComponentEvent {
  final AppModel value;

  AppComponentUpdated({required this.value});
}
