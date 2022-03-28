/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 app_entry_pages_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/app_entry_pages_model.dart';

abstract class AppEntryPagesListState extends Equatable {
  const AppEntryPagesListState();

  @override
  List<Object?> get props => [];
}

class AppEntryPagesListLoading extends AppEntryPagesListState {}

class AppEntryPagesListLoaded extends AppEntryPagesListState {
  final List<AppEntryPagesModel?>? values;
  final bool? mightHaveMore;

  const AppEntryPagesListLoaded({this.mightHaveMore, this.values = const []});

  @override
  List<Object?> get props => [ values, mightHaveMore ];

  @override
  String toString() => 'AppEntryPagesListLoaded { values: $values }';

  @override
  bool operator ==(Object other) => 
          other is AppEntryPagesListLoaded &&
              runtimeType == other.runtimeType &&
              ListEquality().equals(values, other.values) &&
              mightHaveMore == other.mightHaveMore;
}

class AppEntryPagesNotLoaded extends AppEntryPagesListState {}

