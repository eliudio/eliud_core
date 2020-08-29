/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 country_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'country_model.dart';

typedef CountryModelTrigger(List<CountryModel> list);

abstract class CountryRepository {
  Future<CountryModel> add(CountryModel value);
  Future<void> delete(CountryModel value);
  Future<CountryModel> get(String id);
  Future<CountryModel> update(CountryModel value);
  Stream<List<CountryModel>> values();
  Stream<List<CountryModel>> valuesWithDetails();
  StreamSubscription<List<CountryModel>> listen(CountryModelTrigger trigger);
StreamSubscription<List<CountryModel>> listenWithDetails(CountryModelTrigger trigger);
  void flush();
  Future<List<CountryModel>> valuesList();
  Future<List<CountryModel>> valuesListWithDetails();

  Future<void> deleteAll();
}


