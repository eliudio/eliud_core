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

/*
 * DialogComponentEvent is the base class for events to be used with constructing a DialogComponentBloc 
 */
abstract class DialogComponentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

/*
 * FetchDialogComponent is the event to instruct the bloc to fetch the component
 */
class FetchDialogComponent extends DialogComponentEvent {
  final String? id;

  /*
   * Construct the FetchDialogComponent
   */
  FetchDialogComponent({this.id});
}

/*
 * DialogComponentUpdated is the event to inform the bloc that a component has been updated
 */
class DialogComponentUpdated extends DialogComponentEvent {
  final DialogModel value;

  /*
   * Construct the DialogComponentUpdated
   */
  DialogComponentUpdated({required this.value});
}
