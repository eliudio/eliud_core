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

import 'package:eliud_core/model/dialog_repository.dart';
import 'package:eliud_core/model/dialog_list_event.dart';
import 'package:eliud_core/model/dialog_list_state.dart';
import 'package:eliud_core/tools/query/query_tools.dart';

import 'dialog_model.dart';

typedef List<DialogModel?> FilterDialogModels(List<DialogModel?> values);



class DialogListBloc extends Bloc<DialogListEvent, DialogListState> {
  final FilterDialogModels? filter;
  final DialogRepository _dialogRepository;
  StreamSubscription? _dialogsListSubscription;
  EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int dialogLimit;

  DialogListBloc({this.filter, this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required DialogRepository dialogRepository, this.dialogLimit = 5})
      : _dialogRepository = dialogRepository,
        super(DialogListLoading()) {
    on <LoadDialogList> ((event, emit) {
      if ((detailed == null) || (!detailed!)) {
        _mapLoadDialogListToState();
      } else {
        _mapLoadDialogListWithDetailsToState();
      }
    });
    
    on <NewPage> ((event, emit) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      _mapLoadDialogListWithDetailsToState();
    });
    
    on <DialogChangeQuery> ((event, emit) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        _mapLoadDialogListToState();
      } else {
        _mapLoadDialogListWithDetailsToState();
      }
    });
      
    on <AddDialogList> ((event, emit) async {
      await _mapAddDialogListToState(event);
    });
    
    on <UpdateDialogList> ((event, emit) async {
      await _mapUpdateDialogListToState(event);
    });
    
    on <DeleteDialogList> ((event, emit) async {
      await _mapDeleteDialogListToState(event);
    });
    
    on <DialogListUpdated> ((event, emit) {
      emit(_mapDialogListUpdatedToState(event));
    });
  }

  List<DialogModel?> _filter(List<DialogModel?> original) {
    if (filter != null) {
      return filter!(original);
    } else {
      return original;
    }
  }

  Future<void> _mapLoadDialogListToState() async {
    int amountNow =  (state is DialogListLoaded) ? (state as DialogListLoaded).values!.length : 0;
    _dialogsListSubscription?.cancel();
    _dialogsListSubscription = _dialogRepository.listen(
          (list) => add(DialogListUpdated(value: _filter(list), mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && paged!) ? pages * dialogLimit : null
    );
  }

  Future<void> _mapLoadDialogListWithDetailsToState() async {
    int amountNow =  (state is DialogListLoaded) ? (state as DialogListLoaded).values!.length : 0;
    _dialogsListSubscription?.cancel();
    _dialogsListSubscription = _dialogRepository.listenWithDetails(
            (list) => add(DialogListUpdated(value: _filter(list), mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * dialogLimit : null
    );
  }

  Future<void> _mapAddDialogListToState(AddDialogList event) async {
    var value = event.value;
    if (value != null) {
      await _dialogRepository.add(value);
    }
  }

  Future<void> _mapUpdateDialogListToState(UpdateDialogList event) async {
    var value = event.value;
    if (value != null) {
      await _dialogRepository.update(value);
    }
  }

  Future<void> _mapDeleteDialogListToState(DeleteDialogList event) async {
    var value = event.value;
    if (value != null) {
      await _dialogRepository.delete(value);
    }
  }

  DialogListLoaded _mapDialogListUpdatedToState(
      DialogListUpdated event) => DialogListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);

  @override
  Future<void> close() {
    _dialogsListSubscription?.cancel();
    return super.close();
  }
}


