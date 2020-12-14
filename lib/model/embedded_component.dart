/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 model/embedded_component.dart
                       
 This code is generated. This is read only. Don't touch!

*/


import 'package:eliud_core/tools/random.dart';

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/body_component_list_bloc.dart';
import '../model/body_component_list.dart';
import '../model/body_component_list_event.dart';
import '../model/body_component_model.dart';
import '../model/body_component_repository.dart';

import '../model/decoration_color_list_bloc.dart';
import '../model/decoration_color_list.dart';
import '../model/decoration_color_list_event.dart';
import '../model/decoration_color_model.dart';
import '../model/decoration_color_repository.dart';

import '../model/member_subscription_list_bloc.dart';
import '../model/member_subscription_list.dart';
import '../model/member_subscription_list_event.dart';
import '../model/member_subscription_model.dart';
import '../model/member_subscription_repository.dart';

import '../model/menu_item_list_bloc.dart';
import '../model/menu_item_list.dart';
import '../model/menu_item_list_event.dart';
import '../model/menu_item_model.dart';
import '../model/menu_item_repository.dart';

typedef BodyComponentListChanged(List<BodyComponentModel> values);
typedef DecorationColorListChanged(List<DecorationColorModel> values);
typedef MemberSubscriptionListChanged(List<MemberSubscriptionModel> values);
typedef MenuItemListChanged(List<MenuItemModel> values);

bodyComponentsList(value, trigger) => EmbeddedComponentFactory.bodyComponentsList(value, trigger);
decorationColorsList(value, trigger) => EmbeddedComponentFactory.decorationColorsList(value, trigger);
memberSubscriptionsList(value, trigger) => EmbeddedComponentFactory.memberSubscriptionsList(value, trigger);
menuItemsList(value, trigger) => EmbeddedComponentFactory.menuItemsList(value, trigger);

class EmbeddedComponentFactory {

static Widget bodyComponentsList(List<BodyComponentModel> values, BodyComponentListChanged trigger) {
  BodyComponentInMemoryRepository inMemoryRepository = BodyComponentInMemoryRepository(
    trigger: trigger,
    items: values,
  );
  return MultiBlocProvider(
    providers: [
      BlocProvider<BodyComponentListBloc>(
        create: (context) => BodyComponentListBloc(
          bodyComponentRepository: inMemoryRepository,
          )..add(LoadBodyComponentList()),
        )
        ],
    child: BodyComponentListWidget(isEmbedded: true),
  );
}

static Widget decorationColorsList(List<DecorationColorModel> values, DecorationColorListChanged trigger) {
  DecorationColorInMemoryRepository inMemoryRepository = DecorationColorInMemoryRepository(
    trigger: trigger,
    items: values,
  );
  return MultiBlocProvider(
    providers: [
      BlocProvider<DecorationColorListBloc>(
        create: (context) => DecorationColorListBloc(
          decorationColorRepository: inMemoryRepository,
          )..add(LoadDecorationColorList()),
        )
        ],
    child: DecorationColorListWidget(isEmbedded: true),
  );
}

static Widget memberSubscriptionsList(List<MemberSubscriptionModel> values, MemberSubscriptionListChanged trigger) {
  MemberSubscriptionInMemoryRepository inMemoryRepository = MemberSubscriptionInMemoryRepository(
    trigger: trigger,
    items: values,
  );
  return MultiBlocProvider(
    providers: [
      BlocProvider<MemberSubscriptionListBloc>(
        create: (context) => MemberSubscriptionListBloc(
          memberSubscriptionRepository: inMemoryRepository,
          )..add(LoadMemberSubscriptionList()),
        )
        ],
    child: MemberSubscriptionListWidget(isEmbedded: true),
  );
}

static Widget menuItemsList(List<MenuItemModel> values, MenuItemListChanged trigger) {
  MenuItemInMemoryRepository inMemoryRepository = MenuItemInMemoryRepository(
    trigger: trigger,
    items: values,
  );
  return MultiBlocProvider(
    providers: [
      BlocProvider<MenuItemListBloc>(
        create: (context) => MenuItemListBloc(
          menuItemRepository: inMemoryRepository,
          )..add(LoadMenuItemList()),
        )
        ],
    child: MenuItemListWidget(isEmbedded: true),
  );
}


}

class BodyComponentInMemoryRepository implements BodyComponentRepository {
    final List<BodyComponentModel> items;
    final BodyComponentListChanged trigger;
    Stream<List<BodyComponentModel>> theValues;

    BodyComponentInMemoryRepository({this.trigger, this.items}) {
        List<List<BodyComponentModel>> myList = new List<List<BodyComponentModel>>();
        myList.add(items);
        theValues = Stream<List<BodyComponentModel>>.fromIterable(myList);
    }

    int _index(String documentID) {
      int i = 0;
      for (final item in items) {
        if (item.documentID == documentID) {
          return i;
        }
        i++;
      }
      return -1;
    }

    Future<BodyComponentModel> add(BodyComponentModel value) {
        items.add(value.copyWith(documentID: newRandomKey()));
        trigger(items);
    }

    Future<void> delete(BodyComponentModel value) {
      int index = _index(value.documentID);
      if (index >= 0) items.removeAt(index);
      trigger(items);
    }

    Future<BodyComponentModel> update(BodyComponentModel value) {
      int index = _index(value.documentID);
      if (index >= 0) {
        items.replaceRange(index, index+1, [value]);
        trigger(items);
      }
    }

    Future<BodyComponentModel> get(String id) {
      int index = _index(id);
      var completer = new Completer<BodyComponentModel>();
      completer.complete(items[index]);
      return completer.future;
    }

    Stream<List<BodyComponentModel>> values({String orderBy, bool descending }) {
      return theValues;
    }
    
    Stream<List<BodyComponentModel>> valuesWithDetails({String orderBy, bool descending }) {
      return theValues;
    }
    
    @override
    StreamSubscription<List<BodyComponentModel>> listen(trigger, { String orderBy, bool descending }) {
      return theValues.listen((theList) => trigger(theList));
    }
  
    @override
    StreamSubscription<List<BodyComponentModel>> listenWithDetails(trigger, {String orderBy, bool descending }) {
      return theValues.listen((theList) => trigger(theList));
    }
    
    void flush() {}

    Future<List<BodyComponentModel>> valuesList({String orderBy, bool descending }) {
      return Future.value(items);
    }
    
    Future<List<BodyComponentModel>> valuesListWithDetails({String orderBy, bool descending }) {
      return Future.value(items);
    }

    Future<void> deleteAll() {}
}

class DecorationColorInMemoryRepository implements DecorationColorRepository {
    final List<DecorationColorModel> items;
    final DecorationColorListChanged trigger;
    Stream<List<DecorationColorModel>> theValues;

    DecorationColorInMemoryRepository({this.trigger, this.items}) {
        List<List<DecorationColorModel>> myList = new List<List<DecorationColorModel>>();
        myList.add(items);
        theValues = Stream<List<DecorationColorModel>>.fromIterable(myList);
    }

    int _index(String documentID) {
      int i = 0;
      for (final item in items) {
        if (item.documentID == documentID) {
          return i;
        }
        i++;
      }
      return -1;
    }

    Future<DecorationColorModel> add(DecorationColorModel value) {
        items.add(value.copyWith(documentID: newRandomKey()));
        trigger(items);
    }

    Future<void> delete(DecorationColorModel value) {
      int index = _index(value.documentID);
      if (index >= 0) items.removeAt(index);
      trigger(items);
    }

    Future<DecorationColorModel> update(DecorationColorModel value) {
      int index = _index(value.documentID);
      if (index >= 0) {
        items.replaceRange(index, index+1, [value]);
        trigger(items);
      }
    }

    Future<DecorationColorModel> get(String id) {
      int index = _index(id);
      var completer = new Completer<DecorationColorModel>();
      completer.complete(items[index]);
      return completer.future;
    }

    Stream<List<DecorationColorModel>> values({String orderBy, bool descending }) {
      return theValues;
    }
    
    Stream<List<DecorationColorModel>> valuesWithDetails({String orderBy, bool descending }) {
      return theValues;
    }
    
    @override
    StreamSubscription<List<DecorationColorModel>> listen(trigger, { String orderBy, bool descending }) {
      return theValues.listen((theList) => trigger(theList));
    }
  
    @override
    StreamSubscription<List<DecorationColorModel>> listenWithDetails(trigger, {String orderBy, bool descending }) {
      return theValues.listen((theList) => trigger(theList));
    }
    
    void flush() {}

    Future<List<DecorationColorModel>> valuesList({String orderBy, bool descending }) {
      return Future.value(items);
    }
    
    Future<List<DecorationColorModel>> valuesListWithDetails({String orderBy, bool descending }) {
      return Future.value(items);
    }

    Future<void> deleteAll() {}
}

class MemberSubscriptionInMemoryRepository implements MemberSubscriptionRepository {
    final List<MemberSubscriptionModel> items;
    final MemberSubscriptionListChanged trigger;
    Stream<List<MemberSubscriptionModel>> theValues;

    MemberSubscriptionInMemoryRepository({this.trigger, this.items}) {
        List<List<MemberSubscriptionModel>> myList = new List<List<MemberSubscriptionModel>>();
        myList.add(items);
        theValues = Stream<List<MemberSubscriptionModel>>.fromIterable(myList);
    }

    int _index(String documentID) {
      int i = 0;
      for (final item in items) {
        if (item.documentID == documentID) {
          return i;
        }
        i++;
      }
      return -1;
    }

    Future<MemberSubscriptionModel> add(MemberSubscriptionModel value) {
        items.add(value.copyWith(documentID: newRandomKey()));
        trigger(items);
    }

    Future<void> delete(MemberSubscriptionModel value) {
      int index = _index(value.documentID);
      if (index >= 0) items.removeAt(index);
      trigger(items);
    }

    Future<MemberSubscriptionModel> update(MemberSubscriptionModel value) {
      int index = _index(value.documentID);
      if (index >= 0) {
        items.replaceRange(index, index+1, [value]);
        trigger(items);
      }
    }

    Future<MemberSubscriptionModel> get(String id) {
      int index = _index(id);
      var completer = new Completer<MemberSubscriptionModel>();
      completer.complete(items[index]);
      return completer.future;
    }

    Stream<List<MemberSubscriptionModel>> values({String orderBy, bool descending }) {
      return theValues;
    }
    
    Stream<List<MemberSubscriptionModel>> valuesWithDetails({String orderBy, bool descending }) {
      return theValues;
    }
    
    @override
    StreamSubscription<List<MemberSubscriptionModel>> listen(trigger, { String orderBy, bool descending }) {
      return theValues.listen((theList) => trigger(theList));
    }
  
    @override
    StreamSubscription<List<MemberSubscriptionModel>> listenWithDetails(trigger, {String orderBy, bool descending }) {
      return theValues.listen((theList) => trigger(theList));
    }
    
    void flush() {}

    Future<List<MemberSubscriptionModel>> valuesList({String orderBy, bool descending }) {
      return Future.value(items);
    }
    
    Future<List<MemberSubscriptionModel>> valuesListWithDetails({String orderBy, bool descending }) {
      return Future.value(items);
    }

    Future<void> deleteAll() {}
}

class MenuItemInMemoryRepository implements MenuItemRepository {
    final List<MenuItemModel> items;
    final MenuItemListChanged trigger;
    Stream<List<MenuItemModel>> theValues;

    MenuItemInMemoryRepository({this.trigger, this.items}) {
        List<List<MenuItemModel>> myList = new List<List<MenuItemModel>>();
        myList.add(items);
        theValues = Stream<List<MenuItemModel>>.fromIterable(myList);
    }

    int _index(String documentID) {
      int i = 0;
      for (final item in items) {
        if (item.documentID == documentID) {
          return i;
        }
        i++;
      }
      return -1;
    }

    Future<MenuItemModel> add(MenuItemModel value) {
        items.add(value.copyWith(documentID: newRandomKey()));
        trigger(items);
    }

    Future<void> delete(MenuItemModel value) {
      int index = _index(value.documentID);
      if (index >= 0) items.removeAt(index);
      trigger(items);
    }

    Future<MenuItemModel> update(MenuItemModel value) {
      int index = _index(value.documentID);
      if (index >= 0) {
        items.replaceRange(index, index+1, [value]);
        trigger(items);
      }
    }

    Future<MenuItemModel> get(String id) {
      int index = _index(id);
      var completer = new Completer<MenuItemModel>();
      completer.complete(items[index]);
      return completer.future;
    }

    Stream<List<MenuItemModel>> values({String orderBy, bool descending }) {
      return theValues;
    }
    
    Stream<List<MenuItemModel>> valuesWithDetails({String orderBy, bool descending }) {
      return theValues;
    }
    
    @override
    StreamSubscription<List<MenuItemModel>> listen(trigger, { String orderBy, bool descending }) {
      return theValues.listen((theList) => trigger(theList));
    }
  
    @override
    StreamSubscription<List<MenuItemModel>> listenWithDetails(trigger, {String orderBy, bool descending }) {
      return theValues.listen((theList) => trigger(theList));
    }
    
    void flush() {}

    Future<List<MenuItemModel>> valuesList({String orderBy, bool descending }) {
      return Future.value(items);
    }
    
    Future<List<MenuItemModel>> valuesListWithDetails({String orderBy, bool descending }) {
      return Future.value(items);
    }

    Future<void> deleteAll() {}
}

