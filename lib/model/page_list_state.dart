/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 page_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'page_model.dart';

abstract class PageListState extends Equatable {
  const PageListState();

  @override
  List<Object> get props => [];
}

class PageListLoading extends PageListState {}

class PageListLoaded extends PageListState {
  final List<PageModel> values;

  const PageListLoaded({this.values = const []});

  @override
  List<Object> get props => [ values ];

  @override
  String toString() => 'PageListLoaded { values: $values }';
}

class PageNotLoaded extends PageListState {}

