/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 dialog_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:eliud_core/model/dialog_repository.dart';
import 'package:eliud_core/model/dialog_list_event.dart';
import 'package:eliud_core/model/dialog_list_state.dart';
import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_event.dart';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';


class DialogListBloc extends Bloc<DialogListEvent, DialogListState> {
  final DialogRepository _dialogRepository;
  StreamSubscription _dialogsListSubscription;
  final AccessBloc accessBloc;
  final EliudQuery eliudQuery;


  DialogListBloc(this.accessBloc,{ this.eliudQuery, @required DialogRepository dialogRepository })
      : assert(dialogRepository != null),
      _dialogRepository = dialogRepository,
      super(DialogListLoading());

  Stream<DialogListState> _mapLoadDialogListToState({ String orderBy, bool descending }) async* {
    _dialogsListSubscription?.cancel();
    _dialogsListSubscription = _dialogRepository.listen((list) => add(DialogListUpdated(value: list)), orderBy: orderBy, descending: descending, eliudQuery: eliudQuery, );
  }

  Stream<DialogListState> _mapLoadDialogListWithDetailsToState() async* {
    _dialogsListSubscription?.cancel();
    _dialogsListSubscription = _dialogRepository.listenWithDetails((list) => add(DialogListUpdated(value: list)), );
  }

  Stream<DialogListState> _mapAddDialogListToState(AddDialogList event) async* {
    _dialogRepository.add(event.value);
  }

  Stream<DialogListState> _mapUpdateDialogListToState(UpdateDialogList event) async* {
    _dialogRepository.update(event.value);
  }

  Stream<DialogListState> _mapDeleteDialogListToState(DeleteDialogList event) async* {
    _dialogRepository.delete(event.value);
  }

  Stream<DialogListState> _mapDialogListUpdatedToState(DialogListUpdated event) async* {
    yield DialogListLoaded(values: event.value);
  }


  @override
  Stream<DialogListState> mapEventToState(DialogListEvent event) async* {
    final currentState = state;
    if (event is LoadDialogList) {
      yield* _mapLoadDialogListToState(orderBy: event.orderBy, descending: event.descending);
    } if (event is LoadDialogListWithDetails) {
      yield* _mapLoadDialogListWithDetailsToState();
    } else if (event is AddDialogList) {
      yield* _mapAddDialogListToState(event);
    } else if (event is UpdateDialogList) {
      yield* _mapUpdateDialogListToState(event);
    } else if (event is DeleteDialogList) {
      yield* _mapDeleteDialogListToState(event);
    } else if (event is DialogListUpdated) {
      yield* _mapDialogListUpdatedToState(event);
    }
  }

  @override
  Future<void> close() {
    _dialogsListSubscription?.cancel();
    return super.close();
  }

}


