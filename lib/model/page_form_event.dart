/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 page_form_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/model/model_export.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';


@immutable
abstract class PageFormEvent extends Equatable {
  const PageFormEvent();

  @override
  List<Object?> get props => [];
}

class InitialiseNewPageFormEvent extends PageFormEvent {
}


class InitialisePageFormEvent extends PageFormEvent {
  final PageModel? value;

  @override
  List<Object?> get props => [ value ];

  InitialisePageFormEvent({this.value});
}

class InitialisePageFormNoLoadEvent extends PageFormEvent {
  final PageModel? value;

  @override
  List<Object?> get props => [ value ];

  InitialisePageFormNoLoadEvent({this.value});
}

class ChangedPageDocumentID extends PageFormEvent {
  final String? value;

  ChangedPageDocumentID({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedPageDocumentID{ value: $value }';
}

class ChangedPageAppId extends PageFormEvent {
  final String? value;

  ChangedPageAppId({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedPageAppId{ value: $value }';
}

class ChangedPageDescription extends PageFormEvent {
  final String? value;

  ChangedPageDescription({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedPageDescription{ value: $value }';
}

class ChangedPageTitle extends PageFormEvent {
  final String? value;

  ChangedPageTitle({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedPageTitle{ value: $value }';
}

class ChangedPageAppBar extends PageFormEvent {
  final String? value;

  ChangedPageAppBar({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedPageAppBar{ value: $value }';
}

class ChangedPageDrawer extends PageFormEvent {
  final String? value;

  ChangedPageDrawer({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedPageDrawer{ value: $value }';
}

class ChangedPageEndDrawer extends PageFormEvent {
  final String? value;

  ChangedPageEndDrawer({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedPageEndDrawer{ value: $value }';
}

class ChangedPageHomeMenu extends PageFormEvent {
  final String? value;

  ChangedPageHomeMenu({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedPageHomeMenu{ value: $value }';
}

class ChangedPageBodyComponents extends PageFormEvent {
  final List<BodyComponentModel>? value;

  ChangedPageBodyComponents({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedPageBodyComponents{ value: $value }';
}

class ChangedPageBackgroundOverride extends PageFormEvent {
  final BackgroundModel? value;

  ChangedPageBackgroundOverride({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedPageBackgroundOverride{ value: $value }';
}

class ChangedPageLayout extends PageFormEvent {
  final PageLayout? value;

  ChangedPageLayout({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedPageLayout{ value: $value }';
}

class ChangedPageGridView extends PageFormEvent {
  final String? value;

  ChangedPageGridView({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedPageGridView{ value: $value }';
}

class ChangedPageConditions extends PageFormEvent {
  final StorageConditionsModel? value;

  ChangedPageConditions({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedPageConditions{ value: $value }';
}

