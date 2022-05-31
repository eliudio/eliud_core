/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 app_entry_pages_list_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/app_entry_pages_model.dart';

abstract class AppEntryPagesListEvent extends Equatable {
  const AppEntryPagesListEvent();
  @override
  List<Object?> get props => [];
}

class LoadAppEntryPagesList extends AppEntryPagesListEvent {}

class NewPage extends AppEntryPagesListEvent {}

class AddAppEntryPagesList extends AppEntryPagesListEvent {
  final AppEntryPagesModel? value;

  const AddAppEntryPagesList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'AddAppEntryPagesList{ value: $value }';
}

class UpdateAppEntryPagesList extends AppEntryPagesListEvent {
  final AppEntryPagesModel? value;

  const UpdateAppEntryPagesList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'UpdateAppEntryPagesList{ value: $value }';
}

class DeleteAppEntryPagesList extends AppEntryPagesListEvent {
  final AppEntryPagesModel? value;

  const DeleteAppEntryPagesList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'DeleteAppEntryPagesList{ value: $value }';
}

class AppEntryPagesListUpdated extends AppEntryPagesListEvent {
  final List<AppEntryPagesModel?>? value;
  final bool? mightHaveMore;

  const AppEntryPagesListUpdated({ this.value, this.mightHaveMore });

  @override
  List<Object?> get props => [ value, mightHaveMore ];

  @override
  String toString() => 'AppEntryPagesListUpdated{ value: $value, mightHaveMore: $mightHaveMore }';
}

class AppEntryPagesChangeQuery extends AppEntryPagesListEvent {
  final EliudQuery? newQuery;

  const AppEntryPagesChangeQuery({ required this.newQuery });

  @override
  List<Object?> get props => [ newQuery ];

  @override
  String toString() => 'AppEntryPagesChangeQuery{ value: $newQuery }';
}

