/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 decoration_color_form_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/model/model_export.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';


@immutable
abstract class DecorationColorFormEvent extends Equatable {
  const DecorationColorFormEvent();

  @override
  List<Object?> get props => [];
}

class InitialiseNewDecorationColorFormEvent extends DecorationColorFormEvent {
}


class InitialiseDecorationColorFormEvent extends DecorationColorFormEvent {
  final DecorationColorModel? value;

  @override
  List<Object?> get props => [ value ];

  InitialiseDecorationColorFormEvent({this.value});
}

class InitialiseDecorationColorFormNoLoadEvent extends DecorationColorFormEvent {
  final DecorationColorModel? value;

  @override
  List<Object?> get props => [ value ];

  InitialiseDecorationColorFormNoLoadEvent({this.value});
}

class ChangedDecorationColorDocumentID extends DecorationColorFormEvent {
  final String? value;

  ChangedDecorationColorDocumentID({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedDecorationColorDocumentID{ value: $value }';
}

class ChangedDecorationColorColor extends DecorationColorFormEvent {
  final RgbModel? value;

  ChangedDecorationColorColor({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedDecorationColorColor{ value: $value }';
}

class ChangedDecorationColorStop extends DecorationColorFormEvent {
  final String? value;

  ChangedDecorationColorStop({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedDecorationColorStop{ value: $value }';
}

