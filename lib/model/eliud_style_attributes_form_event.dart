/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 eliud_style_attributes_form_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_core/model/entity_export.dart';


@immutable
abstract class EliudStyleAttributesFormEvent extends Equatable {
  const EliudStyleAttributesFormEvent();

  @override
  List<Object?> get props => [];
}

class InitialiseNewEliudStyleAttributesFormEvent extends EliudStyleAttributesFormEvent {
}


class InitialiseEliudStyleAttributesFormEvent extends EliudStyleAttributesFormEvent {
  final EliudStyleAttributesModel? value;

  @override
  List<Object?> get props => [ value ];

  InitialiseEliudStyleAttributesFormEvent({this.value});
}

class InitialiseEliudStyleAttributesFormNoLoadEvent extends EliudStyleAttributesFormEvent {
  final EliudStyleAttributesModel? value;

  @override
  List<Object?> get props => [ value ];

  InitialiseEliudStyleAttributesFormNoLoadEvent({this.value});
}

class ChangedEliudStyleAttributesDocumentID extends EliudStyleAttributesFormEvent {
  final String? value;

  ChangedEliudStyleAttributesDocumentID({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedEliudStyleAttributesDocumentID{ value: $value }';
}

class ChangedEliudStyleAttributesDescription extends EliudStyleAttributesFormEvent {
  final String? value;

  ChangedEliudStyleAttributesDescription({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedEliudStyleAttributesDescription{ value: $value }';
}

class ChangedEliudStyleAttributesFormSubmitButtonColor extends EliudStyleAttributesFormEvent {
  final RgbModel? value;

  ChangedEliudStyleAttributesFormSubmitButtonColor({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedEliudStyleAttributesFormSubmitButtonColor{ value: $value }';
}

class ChangedEliudStyleAttributesFormBackground extends EliudStyleAttributesFormEvent {
  final String? value;

  ChangedEliudStyleAttributesFormBackground({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedEliudStyleAttributesFormBackground{ value: $value }';
}

class ChangedEliudStyleAttributesAppBackground extends EliudStyleAttributesFormEvent {
  final String? value;

  ChangedEliudStyleAttributesAppBackground({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedEliudStyleAttributesAppBackground{ value: $value }';
}

class ChangedEliudStyleAttributesFormSubmitButtonTextColor extends EliudStyleAttributesFormEvent {
  final RgbModel? value;

  ChangedEliudStyleAttributesFormSubmitButtonTextColor({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedEliudStyleAttributesFormSubmitButtonTextColor{ value: $value }';
}

class ChangedEliudStyleAttributesFormGroupTitleColor extends EliudStyleAttributesFormEvent {
  final RgbModel? value;

  ChangedEliudStyleAttributesFormGroupTitleColor({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedEliudStyleAttributesFormGroupTitleColor{ value: $value }';
}

class ChangedEliudStyleAttributesFormFieldTextColor extends EliudStyleAttributesFormEvent {
  final RgbModel? value;

  ChangedEliudStyleAttributesFormFieldTextColor({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedEliudStyleAttributesFormFieldTextColor{ value: $value }';
}

class ChangedEliudStyleAttributesFormFieldHeaderColor extends EliudStyleAttributesFormEvent {
  final RgbModel? value;

  ChangedEliudStyleAttributesFormFieldHeaderColor({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedEliudStyleAttributesFormFieldHeaderColor{ value: $value }';
}

class ChangedEliudStyleAttributesFormFieldFocusColor extends EliudStyleAttributesFormEvent {
  final RgbModel? value;

  ChangedEliudStyleAttributesFormFieldFocusColor({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedEliudStyleAttributesFormFieldFocusColor{ value: $value }';
}

class ChangedEliudStyleAttributesFormAppBarBackground extends EliudStyleAttributesFormEvent {
  final String? value;

  ChangedEliudStyleAttributesFormAppBarBackground({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedEliudStyleAttributesFormAppBarBackground{ value: $value }';
}

class ChangedEliudStyleAttributesFormAppBarTextColor extends EliudStyleAttributesFormEvent {
  final RgbModel? value;

  ChangedEliudStyleAttributesFormAppBarTextColor({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedEliudStyleAttributesFormAppBarTextColor{ value: $value }';
}

class ChangedEliudStyleAttributesListBackground extends EliudStyleAttributesFormEvent {
  final String? value;

  ChangedEliudStyleAttributesListBackground({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedEliudStyleAttributesListBackground{ value: $value }';
}

class ChangedEliudStyleAttributesListTextItemColor extends EliudStyleAttributesFormEvent {
  final RgbModel? value;

  ChangedEliudStyleAttributesListTextItemColor({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedEliudStyleAttributesListTextItemColor{ value: $value }';
}

class ChangedEliudStyleAttributesFloatingButtonForegroundColor extends EliudStyleAttributesFormEvent {
  final RgbModel? value;

  ChangedEliudStyleAttributesFloatingButtonForegroundColor({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedEliudStyleAttributesFloatingButtonForegroundColor{ value: $value }';
}

class ChangedEliudStyleAttributesFloatingButtonBackgroundColor extends EliudStyleAttributesFormEvent {
  final RgbModel? value;

  ChangedEliudStyleAttributesFloatingButtonBackgroundColor({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedEliudStyleAttributesFloatingButtonBackgroundColor{ value: $value }';
}

class ChangedEliudStyleAttributesDividerColor extends EliudStyleAttributesFormEvent {
  final RgbModel? value;

  ChangedEliudStyleAttributesDividerColor({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedEliudStyleAttributesDividerColor{ value: $value }';
}

class ChangedEliudStyleAttributesIconColor extends EliudStyleAttributesFormEvent {
  final RgbModel? value;

  ChangedEliudStyleAttributesIconColor({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedEliudStyleAttributesIconColor{ value: $value }';
}

class ChangedEliudStyleAttributesBackgroundHomeMenu extends EliudStyleAttributesFormEvent {
  final String? value;

  ChangedEliudStyleAttributesBackgroundHomeMenu({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedEliudStyleAttributesBackgroundHomeMenu{ value: $value }';
}

class ChangedEliudStyleAttributesBackgroundColorHomeMenu extends EliudStyleAttributesFormEvent {
  final RgbModel? value;

  ChangedEliudStyleAttributesBackgroundColorHomeMenu({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedEliudStyleAttributesBackgroundColorHomeMenu{ value: $value }';
}

class ChangedEliudStyleAttributesIconColorHomeMenu extends EliudStyleAttributesFormEvent {
  final RgbModel? value;

  ChangedEliudStyleAttributesIconColorHomeMenu({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedEliudStyleAttributesIconColorHomeMenu{ value: $value }';
}

class ChangedEliudStyleAttributesH1 extends EliudStyleAttributesFormEvent {
  final String? value;

  ChangedEliudStyleAttributesH1({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedEliudStyleAttributesH1{ value: $value }';
}

class ChangedEliudStyleAttributesH2 extends EliudStyleAttributesFormEvent {
  final String? value;

  ChangedEliudStyleAttributesH2({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedEliudStyleAttributesH2{ value: $value }';
}

class ChangedEliudStyleAttributesH3 extends EliudStyleAttributesFormEvent {
  final String? value;

  ChangedEliudStyleAttributesH3({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedEliudStyleAttributesH3{ value: $value }';
}

class ChangedEliudStyleAttributesH4 extends EliudStyleAttributesFormEvent {
  final String? value;

  ChangedEliudStyleAttributesH4({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedEliudStyleAttributesH4{ value: $value }';
}

class ChangedEliudStyleAttributesH5 extends EliudStyleAttributesFormEvent {
  final String? value;

  ChangedEliudStyleAttributesH5({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedEliudStyleAttributesH5{ value: $value }';
}

class ChangedEliudStyleAttributesFontText extends EliudStyleAttributesFormEvent {
  final String? value;

  ChangedEliudStyleAttributesFontText({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedEliudStyleAttributesFontText{ value: $value }';
}

class ChangedEliudStyleAttributesFontHighlight1 extends EliudStyleAttributesFormEvent {
  final String? value;

  ChangedEliudStyleAttributesFontHighlight1({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedEliudStyleAttributesFontHighlight1{ value: $value }';
}

class ChangedEliudStyleAttributesFontHighlight2 extends EliudStyleAttributesFormEvent {
  final String? value;

  ChangedEliudStyleAttributesFontHighlight2({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedEliudStyleAttributesFontHighlight2{ value: $value }';
}

class ChangedEliudStyleAttributesFontLink extends EliudStyleAttributesFormEvent {
  final String? value;

  ChangedEliudStyleAttributesFontLink({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedEliudStyleAttributesFontLink{ value: $value }';
}

