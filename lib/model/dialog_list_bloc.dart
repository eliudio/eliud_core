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
import 'package:eliud_core/tools/query/query_tools.dart';



class DialogListBloc extends Bloc<DialogListEvent, DialogListState> {
  final DialogRepository _dialogRepository;
  StreamSubscription? _dialogsListSubscription;
  EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int dialogLimit;

  DialogListBloc({this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required DialogRepository dialogRepository, this.dialogLimit = 5})
      : assert(dialogRepository != null),
        _dialogRepository = dialogRepository,
        super(DialogListLoading());

  Stream<DialogListState> _mapLoadDialogListToState() async* {
    int amountNow =  (state is DialogListLoaded) ? (state as DialogListLoaded).values!.length : 0;
    _dialogsListSubscription?.cancel();
    _dialogsListSubscription = _dialogRepository.listen(
          (list) => add(DialogListUpdated(value: list, mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && paged!) ? pages * dialogLimit : null
    );
  }

  Stream<DialogListState> _mapLoadDialogListWithDetailsToState() async* {
    int amountNow =  (state is DialogListLoaded) ? (state as DialogListLoaded).values!.length : 0;
    _dialogsListSubscription?.cancel();
    _dialogsListSubscription = _dialogRepository.listenWithDetails(
            (list) => add(DialogListUpdated(value: list, mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * dialogLimit : null
    );
  }

  Stream<DialogListState> _mapAddDialogListToState(AddDialogList event) async* {
    var value = event.value;
    if (value != null) 
      _dialogRepository.add(value);
  }

  Stream<DialogListState> _mapUpdateDialogListToState(UpdateDialogList event) async* {
    var value = event.value;
    if (value != null) 
      _dialogRepository.update(value);
  }

  Stream<DialogListState> _mapDeleteDialogListToState(DeleteDialogList event) async* {
    var value = event.value;
    if (value != null) 
      _dialogRepository.delete(value);
  }

  Stream<DialogListState> _mapDialogListUpdatedToState(
      DialogListUpdated event) async* {
    yield DialogListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);
  }

  @override
  Stream<DialogListState> mapEventToState(DialogListEvent event) async* {
    if (event is LoadDialogList) {
      if ((detailed == null) || (!detailed!)) {
        yield* _mapLoadDialogListToState();
      } else {
        yield* _mapLoadDialogListWithDetailsToState();
      }
    }
    if (event is NewPage) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      yield* _mapLoadDialogListWithDetailsToState();
    } else if (event is DialogChangeQuery) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        yield* _mapLoadDialogListToState();
      } else {
        yield* _mapLoadDialogListWithDetailsToState();
      }
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


