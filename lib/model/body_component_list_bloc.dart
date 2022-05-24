/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 body_component_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:eliud_core/model/body_component_repository.dart';
import 'package:eliud_core/model/body_component_list_event.dart';
import 'package:eliud_core/model/body_component_list_state.dart';
import 'package:eliud_core/tools/query/query_tools.dart';



class BodyComponentListBloc extends Bloc<BodyComponentListEvent, BodyComponentListState> {
  final BodyComponentRepository _bodyComponentRepository;
  StreamSubscription? _bodyComponentsListSubscription;
  EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int bodyComponentLimit;

  BodyComponentListBloc({this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required BodyComponentRepository bodyComponentRepository, this.bodyComponentLimit = 5})
      : assert(bodyComponentRepository != null),
        _bodyComponentRepository = bodyComponentRepository,
        super(BodyComponentListLoading()) {
    on <LoadBodyComponentList> ((event, emit) {
      if ((detailed == null) || (!detailed!)) {
        _mapLoadBodyComponentListToState();
      } else {
        _mapLoadBodyComponentListWithDetailsToState();
      }
    });
    
    on <NewPage> ((event, emit) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      _mapLoadBodyComponentListWithDetailsToState();
    });
    
    on <BodyComponentChangeQuery> ((event, emit) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        _mapLoadBodyComponentListToState();
      } else {
        _mapLoadBodyComponentListWithDetailsToState();
      }
    });
      
    on <AddBodyComponentList> ((event, emit) async {
      await _mapAddBodyComponentListToState(event);
    });
    
    on <UpdateBodyComponentList> ((event, emit) async {
      await _mapUpdateBodyComponentListToState(event);
    });
    
    on <DeleteBodyComponentList> ((event, emit) async {
      await _mapDeleteBodyComponentListToState(event);
    });
    
    on <BodyComponentListUpdated> ((event, emit) {
      emit(_mapBodyComponentListUpdatedToState(event));
    });
  }

  Future<void> _mapLoadBodyComponentListToState() async {
    int amountNow =  (state is BodyComponentListLoaded) ? (state as BodyComponentListLoaded).values!.length : 0;
    _bodyComponentsListSubscription?.cancel();
    _bodyComponentsListSubscription = _bodyComponentRepository.listen(
          (list) => add(BodyComponentListUpdated(value: list, mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && paged!) ? pages * bodyComponentLimit : null
    );
  }

  Future<void> _mapLoadBodyComponentListWithDetailsToState() async {
    int amountNow =  (state is BodyComponentListLoaded) ? (state as BodyComponentListLoaded).values!.length : 0;
    _bodyComponentsListSubscription?.cancel();
    _bodyComponentsListSubscription = _bodyComponentRepository.listenWithDetails(
            (list) => add(BodyComponentListUpdated(value: list, mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * bodyComponentLimit : null
    );
  }

  Future<void> _mapAddBodyComponentListToState(AddBodyComponentList event) async {
    var value = event.value;
    if (value != null) {
      await _bodyComponentRepository.add(value);
    }
  }

  Future<void> _mapUpdateBodyComponentListToState(UpdateBodyComponentList event) async {
    var value = event.value;
    if (value != null) {
      await _bodyComponentRepository.update(value);
    }
  }

  Future<void> _mapDeleteBodyComponentListToState(DeleteBodyComponentList event) async {
    var value = event.value;
    if (value != null) {
      await _bodyComponentRepository.delete(value);
    }
  }

  BodyComponentListLoaded _mapBodyComponentListUpdatedToState(
      BodyComponentListUpdated event) => BodyComponentListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);

  @override
  Future<void> close() {
    _bodyComponentsListSubscription?.cancel();
    return super.close();
  }
}


