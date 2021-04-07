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


const _bodyComponentLimit = 5;

class BodyComponentListBloc extends Bloc<BodyComponentListEvent, BodyComponentListState> {
  final BodyComponentRepository _bodyComponentRepository;
  StreamSubscription? _bodyComponentsListSubscription;
  final EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;

  BodyComponentListBloc({this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required BodyComponentRepository bodyComponentRepository})
      : assert(bodyComponentRepository != null),
        _bodyComponentRepository = bodyComponentRepository,
        super(BodyComponentListLoading());

  Stream<BodyComponentListState> _mapLoadBodyComponentListToState() async* {
    int amountNow =  (state is BodyComponentListLoaded) ? (state as BodyComponentListLoaded).values!.length : 0;
    _bodyComponentsListSubscription?.cancel();
    _bodyComponentsListSubscription = _bodyComponentRepository.listen(
          (list) => add(BodyComponentListUpdated(value: list, mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && paged!) ? pages * _bodyComponentLimit : null
    );
  }

  Stream<BodyComponentListState> _mapLoadBodyComponentListWithDetailsToState() async* {
    int amountNow =  (state is BodyComponentListLoaded) ? (state as BodyComponentListLoaded).values!.length : 0;
    _bodyComponentsListSubscription?.cancel();
    _bodyComponentsListSubscription = _bodyComponentRepository.listenWithDetails(
            (list) => add(BodyComponentListUpdated(value: list, mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * _bodyComponentLimit : null
    );
  }

  Stream<BodyComponentListState> _mapAddBodyComponentListToState(AddBodyComponentList event) async* {
    _bodyComponentRepository.add(event.value);
  }

  Stream<BodyComponentListState> _mapUpdateBodyComponentListToState(UpdateBodyComponentList event) async* {
    _bodyComponentRepository.update(event.value);
  }

  Stream<BodyComponentListState> _mapDeleteBodyComponentListToState(DeleteBodyComponentList event) async* {
    _bodyComponentRepository.delete(event.value);
  }

  Stream<BodyComponentListState> _mapBodyComponentListUpdatedToState(
      BodyComponentListUpdated event) async* {
    yield BodyComponentListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);
  }

  @override
  Stream<BodyComponentListState> mapEventToState(BodyComponentListEvent event) async* {
    if (event is LoadBodyComponentList) {
      if ((detailed == null) || (!detailed!)) {
        yield* _mapLoadBodyComponentListToState();
      } else {
        yield* _mapLoadBodyComponentListWithDetailsToState();
      }
    }
    if (event is NewPage) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      yield* _mapLoadBodyComponentListWithDetailsToState();
    } else if (event is AddBodyComponentList) {
      yield* _mapAddBodyComponentListToState(event);
    } else if (event is UpdateBodyComponentList) {
      yield* _mapUpdateBodyComponentListToState(event);
    } else if (event is DeleteBodyComponentList) {
      yield* _mapDeleteBodyComponentListToState(event);
    } else if (event is BodyComponentListUpdated) {
      yield* _mapBodyComponentListUpdatedToState(event);
    }
  }

  @override
  Future<void> close() {
    _bodyComponentsListSubscription?.cancel();
    return super.close();
  }
}


