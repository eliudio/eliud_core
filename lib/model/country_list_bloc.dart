/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 country_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:eliud_core/model/country_repository.dart';
import 'package:eliud_core/model/country_list_event.dart';
import 'package:eliud_core/model/country_list_state.dart';


class CountryListBloc extends Bloc<CountryListEvent, CountryListState> {
  final CountryRepository _countryRepository;
  StreamSubscription _countrysListSubscription;

  CountryListBloc({ @required CountryRepository countryRepository })
      : assert(countryRepository != null),
      _countryRepository = countryRepository,
      super(CountryListLoading());

  Stream<CountryListState> _mapLoadCountryListToState({ String orderBy, bool descending }) async* {
    _countrysListSubscription?.cancel();
    _countrysListSubscription = _countryRepository.listen( (list) => add(CountryListUpdated(value: list)), orderBy: orderBy, descending: descending);
  }

  Stream<CountryListState> _mapLoadCountryListWithDetailsToState() async* {
    _countrysListSubscription?.cancel();
    _countrysListSubscription = _countryRepository.listenWithDetails( (list) => add(CountryListUpdated(value: list)));
  }

  Stream<CountryListState> _mapAddCountryListToState(AddCountryList event) async* {
    _countryRepository.add(event.value);
  }

  Stream<CountryListState> _mapUpdateCountryListToState(UpdateCountryList event) async* {
    _countryRepository.update(event.value);
  }

  Stream<CountryListState> _mapDeleteCountryListToState(DeleteCountryList event) async* {
    _countryRepository.delete(event.value);
  }

  Stream<CountryListState> _mapCountryListUpdatedToState(CountryListUpdated event) async* {
    yield CountryListLoaded(values: event.value);
  }


  @override
  Stream<CountryListState> mapEventToState(CountryListEvent event) async* {
    final currentState = state;
    if (event is LoadCountryList) {
      yield* _mapLoadCountryListToState(orderBy: event.orderBy, descending: event.descending);
    } if (event is LoadCountryListWithDetails) {
      yield* _mapLoadCountryListWithDetailsToState();
    } else if (event is AddCountryList) {
      yield* _mapAddCountryListToState(event);
    } else if (event is UpdateCountryList) {
      yield* _mapUpdateCountryListToState(event);
    } else if (event is DeleteCountryList) {
      yield* _mapDeleteCountryListToState(event);
    } else if (event is CountryListUpdated) {
      yield* _mapCountryListUpdatedToState(event);
    }
  }

  @override
  Future<void> close() {
    _countrysListSubscription?.cancel();
    return super.close();
  }

}


