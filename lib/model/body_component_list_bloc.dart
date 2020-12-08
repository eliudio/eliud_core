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


class BodyComponentListBloc extends Bloc<BodyComponentListEvent, BodyComponentListState> {
  final BodyComponentRepository _bodyComponentRepository;
  StreamSubscription _bodyComponentsListSubscription;

  BodyComponentListBloc({ @required BodyComponentRepository bodyComponentRepository })
      : assert(bodyComponentRepository != null),
      _bodyComponentRepository = bodyComponentRepository,
      super(BodyComponentListLoading());

  Stream<BodyComponentListState> _mapLoadBodyComponentListToState({ String orderBy, bool descending }) async* {
    _bodyComponentsListSubscription?.cancel();
    _bodyComponentsListSubscription = _bodyComponentRepository.listen( (list) => add(BodyComponentListUpdated(value: list)), orderBy: orderBy, descending: descending);
  }

  Stream<BodyComponentListState> _mapLoadBodyComponentListWithDetailsToState() async* {
    _bodyComponentsListSubscription?.cancel();
    _bodyComponentsListSubscription = _bodyComponentRepository.listenWithDetails( (list) => add(BodyComponentListUpdated(value: list)));
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

  Stream<BodyComponentListState> _mapBodyComponentListUpdatedToState(BodyComponentListUpdated event) async* {
    yield BodyComponentListLoaded(values: event.value);
  }


  @override
  Stream<BodyComponentListState> mapEventToState(BodyComponentListEvent event) async* {
    final currentState = state;
    if (event is LoadBodyComponentList) {
      yield* _mapLoadBodyComponentListToState(orderBy: event.orderBy, descending: event.descending);
    } if (event is LoadBodyComponentListWithDetails) {
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


