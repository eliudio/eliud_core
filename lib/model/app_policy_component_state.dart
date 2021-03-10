/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 app_policy_component_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/app_policy_model.dart';

abstract class AppPolicyComponentState extends Equatable {
  const AppPolicyComponentState();

  @override
  List<Object> get props => [];
}

class AppPolicyComponentUninitialized extends AppPolicyComponentState {}

class AppPolicyComponentError extends AppPolicyComponentState {
  final String message;
  AppPolicyComponentError({ this.message });
}

class AppPolicyComponentPermissionDenied extends AppPolicyComponentState {
  AppPolicyComponentPermissionDenied();
}

class AppPolicyComponentLoaded extends AppPolicyComponentState {
  final AppPolicyModel value;

  const AppPolicyComponentLoaded({ this.value });

  AppPolicyComponentLoaded copyWith({ AppPolicyModel copyThis }) {
    return AppPolicyComponentLoaded(value: copyThis ?? this.value);
  }

  @override
  List<Object> get props => [value];

  @override
  String toString() => 'AppPolicyComponentLoaded { value: $value }';
}

