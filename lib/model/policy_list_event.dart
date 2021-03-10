/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 policy_list_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/policy_model.dart';

abstract class PolicyListEvent extends Equatable {
  const PolicyListEvent();
  @override
  List<Object> get props => [];
}

class LoadPolicyList extends PolicyListEvent {}

class NewPage extends PolicyListEvent {}

class AddPolicyList extends PolicyListEvent {
  final PolicyModel value;

  const AddPolicyList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'AddPolicyList{ value: $value }';
}

class UpdatePolicyList extends PolicyListEvent {
  final PolicyModel value;

  const UpdatePolicyList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'UpdatePolicyList{ value: $value }';
}

class DeletePolicyList extends PolicyListEvent {
  final PolicyModel value;

  const DeletePolicyList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'DeletePolicyList{ value: $value }';
}

class PolicyListUpdated extends PolicyListEvent {
  final List<PolicyModel> value;
  final bool mightHaveMore;

  const PolicyListUpdated({ this.value, this.mightHaveMore });

  @override
  List<Object> get props => [ value, mightHaveMore ];

  @override
  String toString() => 'PolicyListUpdated{ value: $value, mightHaveMore: $mightHaveMore }';
}

