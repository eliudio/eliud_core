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

import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/app_bar_model.dart';

/*
 * AppBarComponentEvent is the base class for events to be used with constructing a AppBarComponentBloc 
 */
abstract class AppBarComponentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

/*
 * FetchAppBarComponent is the event to instruct the bloc to fetch the component
 */
class FetchAppBarComponent extends AppBarComponentEvent {
  final String? id;

  /*
   * Construct the FetchAppBarComponent
   */
  FetchAppBarComponent({this.id});
}

/*
 * AppBarComponentUpdated is the event to inform the bloc that a component has been updated
 */
class AppBarComponentUpdated extends AppBarComponentEvent {
  final AppBarModel value;

  /*
   * Construct the AppBarComponentUpdated
   */
  AppBarComponentUpdated({required this.value});
}
