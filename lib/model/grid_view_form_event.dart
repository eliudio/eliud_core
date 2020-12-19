/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 grid_view_form_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_core/model/entity_export.dart';


@immutable
abstract class GridViewFormEvent extends Equatable {
  const GridViewFormEvent();

  @override
  List<Object> get props => [];
}

class InitialiseNewGridViewFormEvent extends GridViewFormEvent {
}


class InitialiseGridViewFormEvent extends GridViewFormEvent {
  final GridViewModel value;

  @override
  List<Object> get props => [ value ];

  InitialiseGridViewFormEvent({this.value});
}

class InitialiseGridViewFormNoLoadEvent extends GridViewFormEvent {
  final GridViewModel value;

  @override
  List<Object> get props => [ value ];

  InitialiseGridViewFormNoLoadEvent({this.value});
}

class ChangedGridViewDocumentID extends GridViewFormEvent {
  final String value;

  ChangedGridViewDocumentID({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedGridViewDocumentID{ value: $value }';
}

class ChangedGridViewAppId extends GridViewFormEvent {
  final String value;

  ChangedGridViewAppId({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedGridViewAppId{ value: $value }';
}

class ChangedGridViewName extends GridViewFormEvent {
  final String value;

  ChangedGridViewName({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedGridViewName{ value: $value }';
}

class ChangedGridViewScrollDirection extends GridViewFormEvent {
  final GridViewScrollDirection value;

  ChangedGridViewScrollDirection({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedGridViewScrollDirection{ value: $value }';
}

class ChangedGridViewType extends GridViewFormEvent {
  final GridViewGridType value;

  ChangedGridViewType({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedGridViewType{ value: $value }';
}

class ChangedGridViewCrossAxisCount extends GridViewFormEvent {
  final String value;

  ChangedGridViewCrossAxisCount({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedGridViewCrossAxisCount{ value: $value }';
}

class ChangedGridViewMaxCrossAxisExtentType extends GridViewFormEvent {
  final MaxCrossAxisExtentType value;

  ChangedGridViewMaxCrossAxisExtentType({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedGridViewMaxCrossAxisExtentType{ value: $value }';
}

class ChangedGridViewAbsoluteMaxCrossAxisExtent extends GridViewFormEvent {
  final String value;

  ChangedGridViewAbsoluteMaxCrossAxisExtent({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedGridViewAbsoluteMaxCrossAxisExtent{ value: $value }';
}

class ChangedGridViewRelativeMaxCrossAxisExtent extends GridViewFormEvent {
  final String value;

  ChangedGridViewRelativeMaxCrossAxisExtent({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedGridViewRelativeMaxCrossAxisExtent{ value: $value }';
}

class ChangedGridViewChildAspectRatio extends GridViewFormEvent {
  final String value;

  ChangedGridViewChildAspectRatio({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedGridViewChildAspectRatio{ value: $value }';
}

class ChangedGridViewPadding extends GridViewFormEvent {
  final String value;

  ChangedGridViewPadding({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedGridViewPadding{ value: $value }';
}

class ChangedGridViewMainAxisSpacing extends GridViewFormEvent {
  final String value;

  ChangedGridViewMainAxisSpacing({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedGridViewMainAxisSpacing{ value: $value }';
}

class ChangedGridViewCrossAxisSpacing extends GridViewFormEvent {
  final String value;

  ChangedGridViewCrossAxisSpacing({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedGridViewCrossAxisSpacing{ value: $value }';
}

