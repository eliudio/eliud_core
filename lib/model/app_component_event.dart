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

/*
 * AppComponentEvent is the base class for events to be used with constructing a AppComponentBloc 
 */
abstract class AppComponentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

/*
 * FetchAppComponent is the event to instruct the bloc to fetch the component
 */
class FetchAppComponent extends AppComponentEvent {
  final String? id;

  /*
   * Construct the FetchAppComponent
   */
  FetchAppComponent({this.id});
}

/*
 * AppComponentUpdated is the event to inform the bloc that a component has been updated
 */
class AppComponentUpdated extends AppComponentEvent {
  final AppModel value;

  /*
   * Construct the AppComponentUpdated
   */
  AppComponentUpdated({required this.value});
}
