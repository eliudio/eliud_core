/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 app_form_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
// import the main classes
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';

// import the shared classes
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/model/entity_export.dart';
  
// import the classes of this package:
import '../model/abstract_repository_singleton.dart';
import '../model/repository_export.dart';
import 'package:eliud_core/model/repository_export.dart';
import '../model/model_export.dart';
import 'package:eliud_core/model/model_export.dart';
import '../model/entity_export.dart';
import 'package:eliud_core/model/entity_export.dart';


@immutable
abstract class AppFormEvent extends Equatable {
  const AppFormEvent();

  @override
  List<Object> get props => [];
}

class InitialiseNewAppFormEvent extends AppFormEvent {
}


class InitialiseAppFormEvent extends AppFormEvent {
  final AppModel value;

  @override
  List<Object> get props => [ value ];

  InitialiseAppFormEvent({this.value});
}

class InitialiseAppFormNoLoadEvent extends AppFormEvent {
  final AppModel value;

  @override
  List<Object> get props => [ value ];

  InitialiseAppFormNoLoadEvent({this.value});
}

class ChangedAppDocumentID extends AppFormEvent {
  final String value;

  ChangedAppDocumentID({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedAppDocumentID{ value: $value }';
}

class ChangedAppOwnerID extends AppFormEvent {
  final String value;

  ChangedAppOwnerID({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedAppOwnerID{ value: $value }';
}

class ChangedAppTitle extends AppFormEvent {
  final String value;

  ChangedAppTitle({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedAppTitle{ value: $value }';
}

class ChangedAppEmail extends AppFormEvent {
  final String value;

  ChangedAppEmail({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedAppEmail{ value: $value }';
}

class ChangedAppDescription extends AppFormEvent {
  final String value;

  ChangedAppDescription({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedAppDescription{ value: $value }';
}

class ChangedAppAppStatus extends AppFormEvent {
  final AppStatus value;

  ChangedAppAppStatus({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedAppAppStatus{ value: $value }';
}

class ChangedAppDarkOrLight extends AppFormEvent {
  final DarkOrLight value;

  ChangedAppDarkOrLight({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedAppDarkOrLight{ value: $value }';
}

class ChangedAppEntryPage extends AppFormEvent {
  final String value;

  ChangedAppEntryPage({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedAppEntryPage{ value: $value }';
}

class ChangedAppLogo extends AppFormEvent {
  final String value;

  ChangedAppLogo({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedAppLogo{ value: $value }';
}

class ChangedAppFormSubmitButtonColor extends AppFormEvent {
  final RgbModel value;

  ChangedAppFormSubmitButtonColor({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedAppFormSubmitButtonColor{ value: $value }';
}

class ChangedAppFormBackground extends AppFormEvent {
  final String value;

  ChangedAppFormBackground({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedAppFormBackground{ value: $value }';
}

class ChangedAppFormSubmitButtonTextColor extends AppFormEvent {
  final RgbModel value;

  ChangedAppFormSubmitButtonTextColor({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedAppFormSubmitButtonTextColor{ value: $value }';
}

class ChangedAppFormGroupTitleColor extends AppFormEvent {
  final RgbModel value;

  ChangedAppFormGroupTitleColor({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedAppFormGroupTitleColor{ value: $value }';
}

class ChangedAppFormFieldTextColor extends AppFormEvent {
  final RgbModel value;

  ChangedAppFormFieldTextColor({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedAppFormFieldTextColor{ value: $value }';
}

class ChangedAppFormFieldHeaderColor extends AppFormEvent {
  final RgbModel value;

  ChangedAppFormFieldHeaderColor({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedAppFormFieldHeaderColor{ value: $value }';
}

class ChangedAppFormFieldFocusColor extends AppFormEvent {
  final RgbModel value;

  ChangedAppFormFieldFocusColor({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedAppFormFieldFocusColor{ value: $value }';
}

class ChangedAppFormAppBarBackground extends AppFormEvent {
  final String value;

  ChangedAppFormAppBarBackground({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedAppFormAppBarBackground{ value: $value }';
}

class ChangedAppFormAppBarTextColor extends AppFormEvent {
  final RgbModel value;

  ChangedAppFormAppBarTextColor({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedAppFormAppBarTextColor{ value: $value }';
}

class ChangedAppListBackground extends AppFormEvent {
  final String value;

  ChangedAppListBackground({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedAppListBackground{ value: $value }';
}

class ChangedAppListTextItemColor extends AppFormEvent {
  final RgbModel value;

  ChangedAppListTextItemColor({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedAppListTextItemColor{ value: $value }';
}

class ChangedAppFloatingButtonForegroundColor extends AppFormEvent {
  final RgbModel value;

  ChangedAppFloatingButtonForegroundColor({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedAppFloatingButtonForegroundColor{ value: $value }';
}

class ChangedAppFloatingButtonBackgroundColor extends AppFormEvent {
  final RgbModel value;

  ChangedAppFloatingButtonBackgroundColor({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedAppFloatingButtonBackgroundColor{ value: $value }';
}

class ChangedAppDividerColor extends AppFormEvent {
  final RgbModel value;

  ChangedAppDividerColor({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedAppDividerColor{ value: $value }';
}

class ChangedAppRouteBuilder extends AppFormEvent {
  final PageTransitionAnimation value;

  ChangedAppRouteBuilder({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedAppRouteBuilder{ value: $value }';
}

class ChangedAppRouteAnimationDuration extends AppFormEvent {
  final String value;

  ChangedAppRouteAnimationDuration({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedAppRouteAnimationDuration{ value: $value }';
}

class ChangedAppLogoURL extends AppFormEvent {
  final String value;

  ChangedAppLogoURL({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedAppLogoURL{ value: $value }';
}

class ChangedAppH1 extends AppFormEvent {
  final String value;

  ChangedAppH1({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedAppH1{ value: $value }';
}

class ChangedAppH2 extends AppFormEvent {
  final String value;

  ChangedAppH2({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedAppH2{ value: $value }';
}

class ChangedAppH3 extends AppFormEvent {
  final String value;

  ChangedAppH3({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedAppH3{ value: $value }';
}

class ChangedAppH4 extends AppFormEvent {
  final String value;

  ChangedAppH4({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedAppH4{ value: $value }';
}

class ChangedAppH5 extends AppFormEvent {
  final String value;

  ChangedAppH5({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedAppH5{ value: $value }';
}

class ChangedAppFontText extends AppFormEvent {
  final String value;

  ChangedAppFontText({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedAppFontText{ value: $value }';
}

class ChangedAppFontHighlight1 extends AppFormEvent {
  final String value;

  ChangedAppFontHighlight1({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedAppFontHighlight1{ value: $value }';
}

class ChangedAppFontHighlight2 extends AppFormEvent {
  final String value;

  ChangedAppFontHighlight2({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedAppFontHighlight2{ value: $value }';
}

class ChangedAppFontLink extends AppFormEvent {
  final String value;

  ChangedAppFontLink({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedAppFontLink{ value: $value }';
}

