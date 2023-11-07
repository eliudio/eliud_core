/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 dialog_component_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/dialog_model.dart';

abstract class DialogComponentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchDialogComponent extends DialogComponentEvent {
  final String? id;

  FetchDialogComponent({this.id});
}

class DialogComponentUpdated extends DialogComponentEvent {
  final DialogModel value;

  DialogComponentUpdated({required this.value});
}
