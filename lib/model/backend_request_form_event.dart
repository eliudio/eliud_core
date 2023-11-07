/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 backend_request_form_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:eliud_core/model/model_export.dart';

@immutable
abstract class BackendRequestFormEvent extends Equatable {
  const BackendRequestFormEvent();

  @override
  List<Object?> get props => [];
}

class InitialiseNewBackendRequestFormEvent extends BackendRequestFormEvent {}

class InitialiseBackendRequestFormEvent extends BackendRequestFormEvent {
  final BackendRequestModel? value;

  @override
  List<Object?> get props => [value];

  InitialiseBackendRequestFormEvent({this.value});
}

class InitialiseBackendRequestFormNoLoadEvent extends BackendRequestFormEvent {
  final BackendRequestModel? value;

  @override
  List<Object?> get props => [value];

  InitialiseBackendRequestFormNoLoadEvent({this.value});
}

class ChangedBackendRequestDocumentID extends BackendRequestFormEvent {
  final String? value;

  ChangedBackendRequestDocumentID({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedBackendRequestDocumentID{ value: $value }';
}

class ChangedBackendRequestDescription extends BackendRequestFormEvent {
  final String? value;

  ChangedBackendRequestDescription({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedBackendRequestDescription{ value: $value }';
}

class ChangedBackendRequestAppId extends BackendRequestFormEvent {
  final String? value;

  ChangedBackendRequestAppId({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedBackendRequestAppId{ value: $value }';
}

class ChangedBackendRequestAuthorId extends BackendRequestFormEvent {
  final String? value;

  ChangedBackendRequestAuthorId({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedBackendRequestAuthorId{ value: $value }';
}

class ChangedBackendRequestName extends BackendRequestFormEvent {
  final String? value;

  ChangedBackendRequestName({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedBackendRequestName{ value: $value }';
}

class ChangedBackendRequestSendTo extends BackendRequestFormEvent {
  final String? value;

  ChangedBackendRequestSendTo({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedBackendRequestSendTo{ value: $value }';
}

class ChangedBackendRequestCollections extends BackendRequestFormEvent {
  final List<Map<String, String>>? value;

  ChangedBackendRequestCollections({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedBackendRequestCollections{ value: $value }';
}

class ChangedBackendRequestProcessed extends BackendRequestFormEvent {
  final bool? value;

  ChangedBackendRequestProcessed({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedBackendRequestProcessed{ value: $value }';
}

class ChangedBackendRequestRequestType extends BackendRequestFormEvent {
  final RequestType? value;

  ChangedBackendRequestRequestType({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedBackendRequestRequestType{ value: $value }';
}
