/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 app_policy_component_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/app_policy_model.dart';

abstract class AppPolicyComponentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchAppPolicyComponent extends AppPolicyComponentEvent {
  final String? id;

  FetchAppPolicyComponent({ this.id });
}

class AppPolicyComponentUpdated extends AppPolicyComponentEvent {
  final AppPolicyModel value;

  AppPolicyComponentUpdated({ required this.value });
}


