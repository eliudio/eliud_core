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
import 'package:eliud_core/tools/query/query_tools.dart';


const _countryLimit = 5;

class CountryListBloc extends Bloc<CountryListEvent, CountryListState> {
  final CountryRepository _countryRepository;
  StreamSubscription? _countrysListSubscription;
  final EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;

  CountryListBloc({this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required CountryRepository countryRepository})
      : assert(countryRepository != null),
        _countryRepository = countryRepository,
        super(CountryListLoading());

  Stream<CountryListState> _mapLoadCountryListToState() async* {
    int amountNow =  (state is CountryListLoaded) ? (state as CountryListLoaded).values!.length : 0;
    _countrysListSubscription?.cancel();
    _countrysListSubscription = _countryRepository.listen(
          (list) => add(CountryListUpdated(value: list, mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && paged!) ? pages * _countryLimit : null
    );
  }

  Stream<CountryListState> _mapLoadCountryListWithDetailsToState() async* {
    int amountNow =  (state is CountryListLoaded) ? (state as CountryListLoaded).values!.length : 0;
    _countrysListSubscription?.cancel();
    _countrysListSubscription = _countryRepository.listenWithDetails(
            (list) => add(CountryListUpdated(value: list, mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * _countryLimit : null
    );
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

  Stream<CountryListState> _mapCountryListUpdatedToState(
      CountryListUpdated event) async* {
    yield CountryListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);
  }

  @override
  Stream<CountryListState> mapEventToState(CountryListEvent event) async* {
    if (event is LoadCountryList) {
      if ((detailed == null) || (!detailed!)) {
        yield* _mapLoadCountryListToState();
      } else {
        yield* _mapLoadCountryListWithDetailsToState();
      }
    }
    if (event is NewPage) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
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


