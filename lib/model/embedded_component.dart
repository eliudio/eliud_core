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
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/tools/query/query_tools.dart';

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_bloc.dart';

import '../model/app_entry_pages_list_bloc.dart';
import '../model/app_entry_pages_list.dart';
import '../model/app_entry_pages_list_event.dart';
import '../model/app_entry_pages_model.dart';
import '../model/app_entry_pages_repository.dart';

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

typedef AppEntryPagesListChanged(List<AppEntryPagesModel> values);
typedef BodyComponentListChanged(List<BodyComponentModel> values);
typedef DecorationColorListChanged(List<DecorationColorModel> values);
typedef MemberSubscriptionListChanged(List<MemberSubscriptionModel> values);
typedef MenuItemListChanged(List<MenuItemModel> values);

appEntryPagessList(context, value, trigger) => EmbeddedComponentFactory.appEntryPagessList(context, value, trigger);
bodyComponentsList(context, value, trigger) => EmbeddedComponentFactory.bodyComponentsList(context, value, trigger);
decorationColorsList(context, value, trigger) => EmbeddedComponentFactory.decorationColorsList(context, value, trigger);
memberSubscriptionsList(context, value, trigger) => EmbeddedComponentFactory.memberSubscriptionsList(context, value, trigger);
menuItemsList(context, value, trigger) => EmbeddedComponentFactory.menuItemsList(context, value, trigger);

class EmbeddedComponentFactory {

static Widget appEntryPagessList(BuildContext context, List<AppEntryPagesModel> values, AppEntryPagesListChanged trigger) {
  AppEntryPagesInMemoryRepository inMemoryRepository = AppEntryPagesInMemoryRepository(
    trigger: trigger,
    items: values,
  );
  return MultiBlocProvider(
    providers: [
      BlocProvider<AppEntryPagesListBloc>(
        create: (context) => AppEntryPagesListBloc(
          AccessBloc.getBloc(context), 
          appEntryPagesRepository: inMemoryRepository,
          )..add(LoadAppEntryPagesList()),
        )
        ],
    child: AppEntryPagesListWidget(isEmbedded: true),
  );
}

static Widget bodyComponentsList(BuildContext context, List<BodyComponentModel> values, BodyComponentListChanged trigger) {
  BodyComponentInMemoryRepository inMemoryRepository = BodyComponentInMemoryRepository(
    trigger: trigger,
    items: values,
  );
  return MultiBlocProvider(
    providers: [
      BlocProvider<BodyComponentListBloc>(
        create: (context) => BodyComponentListBloc(
          AccessBloc.getBloc(context), 
          bodyComponentRepository: inMemoryRepository,
          )..add(LoadBodyComponentList()),
        )
        ],
    child: BodyComponentListWidget(isEmbedded: true),
  );
}

static Widget decorationColorsList(BuildContext context, List<DecorationColorModel> values, DecorationColorListChanged trigger) {
  DecorationColorInMemoryRepository inMemoryRepository = DecorationColorInMemoryRepository(
    trigger: trigger,
    items: values,
  );
  return MultiBlocProvider(
    providers: [
      BlocProvider<DecorationColorListBloc>(
        create: (context) => DecorationColorListBloc(
          AccessBloc.getBloc(context), 
          decorationColorRepository: inMemoryRepository,
          )..add(LoadDecorationColorList()),
        )
        ],
    child: DecorationColorListWidget(isEmbedded: true),
  );
}

static Widget memberSubscriptionsList(BuildContext context, List<MemberSubscriptionModel> values, MemberSubscriptionListChanged trigger) {
  MemberSubscriptionInMemoryRepository inMemoryRepository = MemberSubscriptionInMemoryRepository(
    trigger: trigger,
    items: values,
  );
  return MultiBlocProvider(
    providers: [
      BlocProvider<MemberSubscriptionListBloc>(
        create: (context) => MemberSubscriptionListBloc(
          AccessBloc.getBloc(context), 
          memberSubscriptionRepository: inMemoryRepository,
          )..add(LoadMemberSubscriptionList()),
        )
        ],
    child: MemberSubscriptionListWidget(isEmbedded: true),
  );
}

static Widget menuItemsList(BuildContext context, List<MenuItemModel> values, MenuItemListChanged trigger) {
  MenuItemInMemoryRepository inMemoryRepository = MenuItemInMemoryRepository(
    trigger: trigger,
    items: values,
  );
  return MultiBlocProvider(
    providers: [
      BlocProvider<MenuItemListBloc>(
        create: (context) => MenuItemListBloc(
          AccessBloc.getBloc(context), 
          menuItemRepository: inMemoryRepository,
          )..add(LoadMenuItemList()),
        )
        ],
    child: MenuItemListWidget(isEmbedded: true),
  );
}


}

class AppEntryPagesInMemoryRepository implements AppEntryPagesRepository {
    final List<AppEntryPagesModel> items;
    final AppEntryPagesListChanged trigger;
    Stream<List<AppEntryPagesModel>> theValues;

    AppEntryPagesInMemoryRepository({this.trigger, this.items}) {
        List<List<AppEntryPagesModel>> myList = new List<List<AppEntryPagesModel>>();
        myList.add(items);
        theValues = Stream<List<AppEntryPagesModel>>.fromIterable(myList);
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

    Future<AppEntryPagesModel> add(AppEntryPagesModel value) {
        items.add(value.copyWith(documentID: newRandomKey()));
        trigger(items);
    }

    Future<void> delete(AppEntryPagesModel value) {
      int index = _index(value.documentID);
      if (index >= 0) items.removeAt(index);
      trigger(items);
    }

    Future<AppEntryPagesModel> update(AppEntryPagesModel value) {
      int index = _index(value.documentID);
      if (index >= 0) {
        items.replaceRange(index, index+1, [value]);
        trigger(items);
      }
    }

    Future<AppEntryPagesModel> get(String id, { Function(Exception) onError }) {
      int index = _index(id);
      var completer = new Completer<AppEntryPagesModel>();
      completer.complete(items[index]);
      return completer.future;
    }

    Stream<List<AppEntryPagesModel>> values({String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel, EliudQuery eliudQuery }) {
      return theValues;
    }
    
    Stream<List<AppEntryPagesModel>> valuesWithDetails({String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel, EliudQuery eliudQuery }) {
      return theValues;
    }
    
    @override
    StreamSubscription<List<AppEntryPagesModel>> listen(trigger, { String orderBy, bool descending, Object startAfter, int limit, int privilegeLevel, EliudQuery eliudQuery }) {
      return theValues.listen((theList) => trigger(theList));
    }
  
    @override
    StreamSubscription<List<AppEntryPagesModel>> listenWithDetails(trigger, { String orderBy, bool descending, Object startAfter, int limit, int privilegeLevel, EliudQuery eliudQuery }) {
      return theValues.listen((theList) => trigger(theList));
    }
    
    void flush() {}

    Future<List<AppEntryPagesModel>> valuesList({String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel, EliudQuery eliudQuery }) {
      return Future.value(items);
    }
    
    Future<List<AppEntryPagesModel>> valuesListWithDetails({String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel, EliudQuery eliudQuery }) {
      return Future.value(items);
    }

    @override
    getSubCollection(String documentId, String name) {
      throw UnimplementedError();
    }

  @override
  String timeStampToString(timeStamp) {
    throw UnimplementedError();
  }
  
  @override
  StreamSubscription<AppEntryPagesModel> listenTo(String documentId, AppEntryPagesChanged changed) {
    throw UnimplementedError();
  }
  

    Future<void> deleteAll() {}
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

    Future<BodyComponentModel> get(String id, { Function(Exception) onError }) {
      int index = _index(id);
      var completer = new Completer<BodyComponentModel>();
      completer.complete(items[index]);
      return completer.future;
    }

    Stream<List<BodyComponentModel>> values({String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel, EliudQuery eliudQuery }) {
      return theValues;
    }
    
    Stream<List<BodyComponentModel>> valuesWithDetails({String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel, EliudQuery eliudQuery }) {
      return theValues;
    }
    
    @override
    StreamSubscription<List<BodyComponentModel>> listen(trigger, { String orderBy, bool descending, Object startAfter, int limit, int privilegeLevel, EliudQuery eliudQuery }) {
      return theValues.listen((theList) => trigger(theList));
    }
  
    @override
    StreamSubscription<List<BodyComponentModel>> listenWithDetails(trigger, { String orderBy, bool descending, Object startAfter, int limit, int privilegeLevel, EliudQuery eliudQuery }) {
      return theValues.listen((theList) => trigger(theList));
    }
    
    void flush() {}

    Future<List<BodyComponentModel>> valuesList({String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel, EliudQuery eliudQuery }) {
      return Future.value(items);
    }
    
    Future<List<BodyComponentModel>> valuesListWithDetails({String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel, EliudQuery eliudQuery }) {
      return Future.value(items);
    }

    @override
    getSubCollection(String documentId, String name) {
      throw UnimplementedError();
    }

  @override
  String timeStampToString(timeStamp) {
    throw UnimplementedError();
  }
  
  @override
  StreamSubscription<BodyComponentModel> listenTo(String documentId, BodyComponentChanged changed) {
    throw UnimplementedError();
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

    Future<DecorationColorModel> get(String id, { Function(Exception) onError }) {
      int index = _index(id);
      var completer = new Completer<DecorationColorModel>();
      completer.complete(items[index]);
      return completer.future;
    }

    Stream<List<DecorationColorModel>> values({String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel, EliudQuery eliudQuery }) {
      return theValues;
    }
    
    Stream<List<DecorationColorModel>> valuesWithDetails({String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel, EliudQuery eliudQuery }) {
      return theValues;
    }
    
    @override
    StreamSubscription<List<DecorationColorModel>> listen(trigger, { String orderBy, bool descending, Object startAfter, int limit, int privilegeLevel, EliudQuery eliudQuery }) {
      return theValues.listen((theList) => trigger(theList));
    }
  
    @override
    StreamSubscription<List<DecorationColorModel>> listenWithDetails(trigger, { String orderBy, bool descending, Object startAfter, int limit, int privilegeLevel, EliudQuery eliudQuery }) {
      return theValues.listen((theList) => trigger(theList));
    }
    
    void flush() {}

    Future<List<DecorationColorModel>> valuesList({String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel, EliudQuery eliudQuery }) {
      return Future.value(items);
    }
    
    Future<List<DecorationColorModel>> valuesListWithDetails({String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel, EliudQuery eliudQuery }) {
      return Future.value(items);
    }

    @override
    getSubCollection(String documentId, String name) {
      throw UnimplementedError();
    }

  @override
  String timeStampToString(timeStamp) {
    throw UnimplementedError();
  }
  
  @override
  StreamSubscription<DecorationColorModel> listenTo(String documentId, DecorationColorChanged changed) {
    throw UnimplementedError();
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

    Future<MemberSubscriptionModel> get(String id, { Function(Exception) onError }) {
      int index = _index(id);
      var completer = new Completer<MemberSubscriptionModel>();
      completer.complete(items[index]);
      return completer.future;
    }

    Stream<List<MemberSubscriptionModel>> values({String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel, EliudQuery eliudQuery }) {
      return theValues;
    }
    
    Stream<List<MemberSubscriptionModel>> valuesWithDetails({String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel, EliudQuery eliudQuery }) {
      return theValues;
    }
    
    @override
    StreamSubscription<List<MemberSubscriptionModel>> listen(trigger, { String orderBy, bool descending, Object startAfter, int limit, int privilegeLevel, EliudQuery eliudQuery }) {
      return theValues.listen((theList) => trigger(theList));
    }
  
    @override
    StreamSubscription<List<MemberSubscriptionModel>> listenWithDetails(trigger, { String orderBy, bool descending, Object startAfter, int limit, int privilegeLevel, EliudQuery eliudQuery }) {
      return theValues.listen((theList) => trigger(theList));
    }
    
    void flush() {}

    Future<List<MemberSubscriptionModel>> valuesList({String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel, EliudQuery eliudQuery }) {
      return Future.value(items);
    }
    
    Future<List<MemberSubscriptionModel>> valuesListWithDetails({String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel, EliudQuery eliudQuery }) {
      return Future.value(items);
    }

    @override
    getSubCollection(String documentId, String name) {
      throw UnimplementedError();
    }

  @override
  String timeStampToString(timeStamp) {
    throw UnimplementedError();
  }
  
  @override
  StreamSubscription<MemberSubscriptionModel> listenTo(String documentId, MemberSubscriptionChanged changed) {
    throw UnimplementedError();
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

    Future<MenuItemModel> get(String id, { Function(Exception) onError }) {
      int index = _index(id);
      var completer = new Completer<MenuItemModel>();
      completer.complete(items[index]);
      return completer.future;
    }

    Stream<List<MenuItemModel>> values({String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel, EliudQuery eliudQuery }) {
      return theValues;
    }
    
    Stream<List<MenuItemModel>> valuesWithDetails({String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel, EliudQuery eliudQuery }) {
      return theValues;
    }
    
    @override
    StreamSubscription<List<MenuItemModel>> listen(trigger, { String orderBy, bool descending, Object startAfter, int limit, int privilegeLevel, EliudQuery eliudQuery }) {
      return theValues.listen((theList) => trigger(theList));
    }
  
    @override
    StreamSubscription<List<MenuItemModel>> listenWithDetails(trigger, { String orderBy, bool descending, Object startAfter, int limit, int privilegeLevel, EliudQuery eliudQuery }) {
      return theValues.listen((theList) => trigger(theList));
    }
    
    void flush() {}

    Future<List<MenuItemModel>> valuesList({String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel, EliudQuery eliudQuery }) {
      return Future.value(items);
    }
    
    Future<List<MenuItemModel>> valuesListWithDetails({String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel, EliudQuery eliudQuery }) {
      return Future.value(items);
    }

    @override
    getSubCollection(String documentId, String name) {
      throw UnimplementedError();
    }

  @override
  String timeStampToString(timeStamp) {
    throw UnimplementedError();
  }
  
  @override
  StreamSubscription<MenuItemModel> listenTo(String documentId, MenuItemChanged changed) {
    throw UnimplementedError();
  }
  

    Future<void> deleteAll() {}
}

