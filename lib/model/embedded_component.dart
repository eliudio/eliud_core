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
import 'package:eliud_core/model/app_model.dart';

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/app_entry_pages_list_bloc.dart';
import '../model/app_entry_pages_list.dart';
import '../model/app_entry_pages_list_event.dart';
import '../model/app_entry_pages_model.dart';
import '../model/app_entry_pages_entity.dart';
import '../model/app_entry_pages_repository.dart';

import '../model/body_component_list_bloc.dart';
import '../model/body_component_list.dart';
import '../model/body_component_list_event.dart';
import '../model/body_component_model.dart';
import '../model/body_component_entity.dart';
import '../model/body_component_repository.dart';

import '../model/decoration_color_list_bloc.dart';
import '../model/decoration_color_list.dart';
import '../model/decoration_color_list_event.dart';
import '../model/decoration_color_model.dart';
import '../model/decoration_color_entity.dart';
import '../model/decoration_color_repository.dart';

import '../model/member_medium_list_bloc.dart';
import '../model/member_medium_list.dart';
import '../model/member_medium_list_event.dart';
import '../model/member_medium_model.dart';
import '../model/member_medium_entity.dart';
import '../model/member_medium_repository.dart';

import '../model/member_medium_container_list_bloc.dart';
import '../model/member_medium_container_list.dart';
import '../model/member_medium_container_list_event.dart';
import '../model/member_medium_container_model.dart';
import '../model/member_medium_container_entity.dart';
import '../model/member_medium_container_repository.dart';

import '../model/member_subscription_list_bloc.dart';
import '../model/member_subscription_list.dart';
import '../model/member_subscription_list_event.dart';
import '../model/member_subscription_model.dart';
import '../model/member_subscription_entity.dart';
import '../model/member_subscription_repository.dart';

import '../model/menu_item_list_bloc.dart';
import '../model/menu_item_list.dart';
import '../model/menu_item_list_event.dart';
import '../model/menu_item_model.dart';
import '../model/menu_item_entity.dart';
import '../model/menu_item_repository.dart';

typedef AppEntryPagesListChanged = Function(List<AppEntryPagesModel> values);
typedef BodyComponentListChanged = Function(List<BodyComponentModel> values);
typedef DecorationColorListChanged = Function(
    List<DecorationColorModel> values);
typedef MemberMediumListChanged = Function(List<MemberMediumModel> values);
typedef MemberMediumContainerListChanged = Function(
    List<MemberMediumContainerModel> values);
typedef MemberSubscriptionListChanged = Function(
    List<MemberSubscriptionModel> values);
typedef MenuItemListChanged = Function(List<MenuItemModel> values);

appEntryPagessList(app, context, value, trigger) =>
    EmbeddedComponentFactory.appEntryPagessList(app, context, value, trigger);
bodyComponentsList(app, context, value, trigger) =>
    EmbeddedComponentFactory.bodyComponentsList(app, context, value, trigger);
decorationColorsList(app, context, value, trigger) =>
    EmbeddedComponentFactory.decorationColorsList(app, context, value, trigger);
memberMediumsList(app, context, value, trigger) =>
    EmbeddedComponentFactory.memberMediumsList(app, context, value, trigger);
memberMediumContainersList(app, context, value, trigger) =>
    EmbeddedComponentFactory.memberMediumContainersList(
        app, context, value, trigger);
memberSubscriptionsList(app, context, value, trigger) =>
    EmbeddedComponentFactory.memberSubscriptionsList(
        app, context, value, trigger);
menuItemsList(app, context, value, trigger) =>
    EmbeddedComponentFactory.menuItemsList(app, context, value, trigger);

class EmbeddedComponentFactory {
  static Widget appEntryPagessList(AppModel app, BuildContext context,
      List<AppEntryPagesModel> values, AppEntryPagesListChanged trigger) {
    AppEntryPagesInMemoryRepository inMemoryRepository =
        AppEntryPagesInMemoryRepository(
      trigger,
      values,
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppEntryPagesListBloc>(
          create: (context) => AppEntryPagesListBloc(
            appEntryPagesRepository: inMemoryRepository,
          )..add(LoadAppEntryPagesList()),
        )
      ],
      child: AppEntryPagesListWidget(app: app, isEmbedded: true),
    );
  }

  static Widget bodyComponentsList(AppModel app, BuildContext context,
      List<BodyComponentModel> values, BodyComponentListChanged trigger) {
    BodyComponentInMemoryRepository inMemoryRepository =
        BodyComponentInMemoryRepository(
      trigger,
      values,
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider<BodyComponentListBloc>(
          create: (context) => BodyComponentListBloc(
            bodyComponentRepository: inMemoryRepository,
          )..add(LoadBodyComponentList()),
        )
      ],
      child: BodyComponentListWidget(app: app, isEmbedded: true),
    );
  }

  static Widget decorationColorsList(AppModel app, BuildContext context,
      List<DecorationColorModel> values, DecorationColorListChanged trigger) {
    DecorationColorInMemoryRepository inMemoryRepository =
        DecorationColorInMemoryRepository(
      trigger,
      values,
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider<DecorationColorListBloc>(
          create: (context) => DecorationColorListBloc(
            decorationColorRepository: inMemoryRepository,
          )..add(LoadDecorationColorList()),
        )
      ],
      child: DecorationColorListWidget(app: app, isEmbedded: true),
    );
  }

  static Widget memberMediumsList(AppModel app, BuildContext context,
      List<MemberMediumModel> values, MemberMediumListChanged trigger) {
    MemberMediumInMemoryRepository inMemoryRepository =
        MemberMediumInMemoryRepository(
      trigger,
      values,
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider<MemberMediumListBloc>(
          create: (context) => MemberMediumListBloc(
            memberMediumRepository: inMemoryRepository,
          )..add(LoadMemberMediumList()),
        )
      ],
      child: MemberMediumListWidget(app: app, isEmbedded: true),
    );
  }

  static Widget memberMediumContainersList(
      AppModel app,
      BuildContext context,
      List<MemberMediumContainerModel> values,
      MemberMediumContainerListChanged trigger) {
    MemberMediumContainerInMemoryRepository inMemoryRepository =
        MemberMediumContainerInMemoryRepository(
      trigger,
      values,
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider<MemberMediumContainerListBloc>(
          create: (context) => MemberMediumContainerListBloc(
            memberMediumContainerRepository: inMemoryRepository,
          )..add(LoadMemberMediumContainerList()),
        )
      ],
      child: MemberMediumContainerListWidget(app: app, isEmbedded: true),
    );
  }

  static Widget memberSubscriptionsList(
      AppModel app,
      BuildContext context,
      List<MemberSubscriptionModel> values,
      MemberSubscriptionListChanged trigger) {
    MemberSubscriptionInMemoryRepository inMemoryRepository =
        MemberSubscriptionInMemoryRepository(
      trigger,
      values,
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider<MemberSubscriptionListBloc>(
          create: (context) => MemberSubscriptionListBloc(
            memberSubscriptionRepository: inMemoryRepository,
          )..add(LoadMemberSubscriptionList()),
        )
      ],
      child: MemberSubscriptionListWidget(app: app, isEmbedded: true),
    );
  }

  static Widget menuItemsList(AppModel app, BuildContext context,
      List<MenuItemModel> values, MenuItemListChanged trigger) {
    MenuItemInMemoryRepository inMemoryRepository = MenuItemInMemoryRepository(
      trigger,
      values,
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider<MenuItemListBloc>(
          create: (context) => MenuItemListBloc(
            menuItemRepository: inMemoryRepository,
          )..add(LoadMenuItemList()),
        )
      ],
      child: MenuItemListWidget(app: app, isEmbedded: true),
    );
  }
}

class AppEntryPagesInMemoryRepository implements AppEntryPagesRepository {
  final List<AppEntryPagesModel> items;
  final AppEntryPagesListChanged trigger;
  Stream<List<AppEntryPagesModel>>? theValues;

  AppEntryPagesInMemoryRepository(this.trigger, this.items) {
    List<List<AppEntryPagesModel>> myList = <List<AppEntryPagesModel>>[];
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

  @override
  Future<AppEntryPagesEntity> addEntity(
      String documentID, AppEntryPagesEntity value) {
    throw Exception('Not implemented');
  }

  @override
  Future<AppEntryPagesEntity> updateEntity(
      String documentID, AppEntryPagesEntity value) {
    throw Exception('Not implemented');
  }

  @override
  Future<AppEntryPagesModel> add(AppEntryPagesModel value) {
    items.add(value.copyWith(documentID: newRandomKey()));
    trigger(items);
    return Future.value(value);
  }

  @override
  Future<void> delete(AppEntryPagesModel value) {
    int index = _index(value.documentID);
    if (index >= 0) items.removeAt(index);
    trigger(items);
    return Future.value();
  }

  @override
  Future<AppEntryPagesModel> update(AppEntryPagesModel value) {
    int index = _index(value.documentID);
    if (index >= 0) {
      items.replaceRange(index, index + 1, [value]);
      trigger(items);
    }
    return Future.value(value);
  }

  @override
  Future<AppEntryPagesModel> get(String? id, {Function(Exception)? onError}) {
    int index = _index(id!);
    var completer = Completer<AppEntryPagesModel>();
    completer.complete(items[index]);
    return completer.future;
  }

  @override
  Stream<List<AppEntryPagesModel>> values(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!;
  }

  @override
  Stream<List<AppEntryPagesModel>> valuesWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!;
  }

  @override
  StreamSubscription<List<AppEntryPagesModel>> listen(trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!.listen((theList) => trigger(theList));
  }

  @override
  StreamSubscription<List<AppEntryPagesModel>> listenWithDetails(trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!.listen((theList) => trigger(theList));
  }

  @override
  void flush() {}

  @override
  Future<List<AppEntryPagesModel>> valuesList(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return Future.value(items);
  }

  @override
  Future<List<AppEntryPagesModel>> valuesListWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
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
  StreamSubscription<AppEntryPagesModel> listenTo(
      String documentId, AppEntryPagesChanged changed,
      {AppEntryPagesErrorHandler? errorHandler}) {
    throw UnimplementedError();
  }

  @override
  Future<AppEntryPagesModel> changeValue(
      String documentId, String fieldName, num changeByThisValue) {
    throw UnimplementedError();
  }

  @override
  Future<AppEntryPagesEntity?> getEntity(String? id,
      {Function(Exception p1)? onError}) {
    throw UnimplementedError();
  }

  @override
  AppEntryPagesEntity? fromMap(Object? o,
      {Map<String, String>? newDocumentIds}) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteAll() async {}
}

class BodyComponentInMemoryRepository implements BodyComponentRepository {
  final List<BodyComponentModel> items;
  final BodyComponentListChanged trigger;
  Stream<List<BodyComponentModel>>? theValues;

  BodyComponentInMemoryRepository(this.trigger, this.items) {
    List<List<BodyComponentModel>> myList = <List<BodyComponentModel>>[];
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

  @override
  Future<BodyComponentEntity> addEntity(
      String documentID, BodyComponentEntity value) {
    throw Exception('Not implemented');
  }

  @override
  Future<BodyComponentEntity> updateEntity(
      String documentID, BodyComponentEntity value) {
    throw Exception('Not implemented');
  }

  @override
  Future<BodyComponentModel> add(BodyComponentModel value) {
    items.add(value.copyWith(documentID: newRandomKey()));
    trigger(items);
    return Future.value(value);
  }

  @override
  Future<void> delete(BodyComponentModel value) {
    int index = _index(value.documentID);
    if (index >= 0) items.removeAt(index);
    trigger(items);
    return Future.value();
  }

  @override
  Future<BodyComponentModel> update(BodyComponentModel value) {
    int index = _index(value.documentID);
    if (index >= 0) {
      items.replaceRange(index, index + 1, [value]);
      trigger(items);
    }
    return Future.value(value);
  }

  @override
  Future<BodyComponentModel> get(String? id, {Function(Exception)? onError}) {
    int index = _index(id!);
    var completer = Completer<BodyComponentModel>();
    completer.complete(items[index]);
    return completer.future;
  }

  @override
  Stream<List<BodyComponentModel>> values(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!;
  }

  @override
  Stream<List<BodyComponentModel>> valuesWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!;
  }

  @override
  StreamSubscription<List<BodyComponentModel>> listen(trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!.listen((theList) => trigger(theList));
  }

  @override
  StreamSubscription<List<BodyComponentModel>> listenWithDetails(trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!.listen((theList) => trigger(theList));
  }

  @override
  void flush() {}

  @override
  Future<List<BodyComponentModel>> valuesList(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return Future.value(items);
  }

  @override
  Future<List<BodyComponentModel>> valuesListWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
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
  StreamSubscription<BodyComponentModel> listenTo(
      String documentId, BodyComponentChanged changed,
      {BodyComponentErrorHandler? errorHandler}) {
    throw UnimplementedError();
  }

  @override
  Future<BodyComponentModel> changeValue(
      String documentId, String fieldName, num changeByThisValue) {
    throw UnimplementedError();
  }

  @override
  Future<BodyComponentEntity?> getEntity(String? id,
      {Function(Exception p1)? onError}) {
    throw UnimplementedError();
  }

  @override
  BodyComponentEntity? fromMap(Object? o,
      {Map<String, String>? newDocumentIds}) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteAll() async {}
}

class DecorationColorInMemoryRepository implements DecorationColorRepository {
  final List<DecorationColorModel> items;
  final DecorationColorListChanged trigger;
  Stream<List<DecorationColorModel>>? theValues;

  DecorationColorInMemoryRepository(this.trigger, this.items) {
    List<List<DecorationColorModel>> myList = <List<DecorationColorModel>>[];
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

  @override
  Future<DecorationColorEntity> addEntity(
      String documentID, DecorationColorEntity value) {
    throw Exception('Not implemented');
  }

  @override
  Future<DecorationColorEntity> updateEntity(
      String documentID, DecorationColorEntity value) {
    throw Exception('Not implemented');
  }

  @override
  Future<DecorationColorModel> add(DecorationColorModel value) {
    items.add(value.copyWith(documentID: newRandomKey()));
    trigger(items);
    return Future.value(value);
  }

  @override
  Future<void> delete(DecorationColorModel value) {
    int index = _index(value.documentID);
    if (index >= 0) items.removeAt(index);
    trigger(items);
    return Future.value();
  }

  @override
  Future<DecorationColorModel> update(DecorationColorModel value) {
    int index = _index(value.documentID);
    if (index >= 0) {
      items.replaceRange(index, index + 1, [value]);
      trigger(items);
    }
    return Future.value(value);
  }

  @override
  Future<DecorationColorModel> get(String? id, {Function(Exception)? onError}) {
    int index = _index(id!);
    var completer = Completer<DecorationColorModel>();
    completer.complete(items[index]);
    return completer.future;
  }

  @override
  Stream<List<DecorationColorModel>> values(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!;
  }

  @override
  Stream<List<DecorationColorModel>> valuesWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!;
  }

  @override
  StreamSubscription<List<DecorationColorModel>> listen(trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!.listen((theList) => trigger(theList));
  }

  @override
  StreamSubscription<List<DecorationColorModel>> listenWithDetails(trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!.listen((theList) => trigger(theList));
  }

  @override
  void flush() {}

  @override
  Future<List<DecorationColorModel>> valuesList(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return Future.value(items);
  }

  @override
  Future<List<DecorationColorModel>> valuesListWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
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
  StreamSubscription<DecorationColorModel> listenTo(
      String documentId, DecorationColorChanged changed,
      {DecorationColorErrorHandler? errorHandler}) {
    throw UnimplementedError();
  }

  @override
  Future<DecorationColorModel> changeValue(
      String documentId, String fieldName, num changeByThisValue) {
    throw UnimplementedError();
  }

  @override
  Future<DecorationColorEntity?> getEntity(String? id,
      {Function(Exception p1)? onError}) {
    throw UnimplementedError();
  }

  @override
  DecorationColorEntity? fromMap(Object? o,
      {Map<String, String>? newDocumentIds}) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteAll() async {}
}

class MemberMediumInMemoryRepository implements MemberMediumRepository {
  final List<MemberMediumModel> items;
  final MemberMediumListChanged trigger;
  Stream<List<MemberMediumModel>>? theValues;

  MemberMediumInMemoryRepository(this.trigger, this.items) {
    List<List<MemberMediumModel>> myList = <List<MemberMediumModel>>[];
    myList.add(items);
    theValues = Stream<List<MemberMediumModel>>.fromIterable(myList);
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

  @override
  Future<MemberMediumEntity> addEntity(
      String documentID, MemberMediumEntity value) {
    throw Exception('Not implemented');
  }

  @override
  Future<MemberMediumEntity> updateEntity(
      String documentID, MemberMediumEntity value) {
    throw Exception('Not implemented');
  }

  @override
  Future<MemberMediumModel> add(MemberMediumModel value) {
    items.add(value.copyWith(documentID: newRandomKey()));
    trigger(items);
    return Future.value(value);
  }

  @override
  Future<void> delete(MemberMediumModel value) {
    int index = _index(value.documentID);
    if (index >= 0) items.removeAt(index);
    trigger(items);
    return Future.value();
  }

  @override
  Future<MemberMediumModel> update(MemberMediumModel value) {
    int index = _index(value.documentID);
    if (index >= 0) {
      items.replaceRange(index, index + 1, [value]);
      trigger(items);
    }
    return Future.value(value);
  }

  @override
  Future<MemberMediumModel> get(String? id, {Function(Exception)? onError}) {
    int index = _index(id!);
    var completer = Completer<MemberMediumModel>();
    completer.complete(items[index]);
    return completer.future;
  }

  @override
  Stream<List<MemberMediumModel>> values(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!;
  }

  @override
  Stream<List<MemberMediumModel>> valuesWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!;
  }

  @override
  StreamSubscription<List<MemberMediumModel>> listen(trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!.listen((theList) => trigger(theList));
  }

  @override
  StreamSubscription<List<MemberMediumModel>> listenWithDetails(trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!.listen((theList) => trigger(theList));
  }

  @override
  void flush() {}

  @override
  Future<List<MemberMediumModel>> valuesList(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return Future.value(items);
  }

  @override
  Future<List<MemberMediumModel>> valuesListWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
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
  StreamSubscription<MemberMediumModel> listenTo(
      String documentId, MemberMediumChanged changed,
      {MemberMediumErrorHandler? errorHandler}) {
    throw UnimplementedError();
  }

  @override
  Future<MemberMediumModel> changeValue(
      String documentId, String fieldName, num changeByThisValue) {
    throw UnimplementedError();
  }

  @override
  Future<MemberMediumEntity?> getEntity(String? id,
      {Function(Exception p1)? onError}) {
    throw UnimplementedError();
  }

  @override
  MemberMediumEntity? fromMap(Object? o,
      {Map<String, String>? newDocumentIds}) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteAll() async {}
}

class MemberMediumContainerInMemoryRepository
    implements MemberMediumContainerRepository {
  final List<MemberMediumContainerModel> items;
  final MemberMediumContainerListChanged trigger;
  Stream<List<MemberMediumContainerModel>>? theValues;

  MemberMediumContainerInMemoryRepository(this.trigger, this.items) {
    List<List<MemberMediumContainerModel>> myList =
        <List<MemberMediumContainerModel>>[];
    myList.add(items);
    theValues = Stream<List<MemberMediumContainerModel>>.fromIterable(myList);
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

  @override
  Future<MemberMediumContainerEntity> addEntity(
      String documentID, MemberMediumContainerEntity value) {
    throw Exception('Not implemented');
  }

  @override
  Future<MemberMediumContainerEntity> updateEntity(
      String documentID, MemberMediumContainerEntity value) {
    throw Exception('Not implemented');
  }

  @override
  Future<MemberMediumContainerModel> add(MemberMediumContainerModel value) {
    items.add(value.copyWith(documentID: newRandomKey()));
    trigger(items);
    return Future.value(value);
  }

  @override
  Future<void> delete(MemberMediumContainerModel value) {
    int index = _index(value.documentID);
    if (index >= 0) items.removeAt(index);
    trigger(items);
    return Future.value();
  }

  @override
  Future<MemberMediumContainerModel> update(MemberMediumContainerModel value) {
    int index = _index(value.documentID);
    if (index >= 0) {
      items.replaceRange(index, index + 1, [value]);
      trigger(items);
    }
    return Future.value(value);
  }

  @override
  Future<MemberMediumContainerModel> get(String? id,
      {Function(Exception)? onError}) {
    int index = _index(id!);
    var completer = Completer<MemberMediumContainerModel>();
    completer.complete(items[index]);
    return completer.future;
  }

  @override
  Stream<List<MemberMediumContainerModel>> values(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!;
  }

  @override
  Stream<List<MemberMediumContainerModel>> valuesWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!;
  }

  @override
  StreamSubscription<List<MemberMediumContainerModel>> listen(trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!.listen((theList) => trigger(theList));
  }

  @override
  StreamSubscription<List<MemberMediumContainerModel>> listenWithDetails(
      trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!.listen((theList) => trigger(theList));
  }

  @override
  void flush() {}

  @override
  Future<List<MemberMediumContainerModel>> valuesList(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return Future.value(items);
  }

  @override
  Future<List<MemberMediumContainerModel>> valuesListWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
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
  StreamSubscription<MemberMediumContainerModel> listenTo(
      String documentId, MemberMediumContainerChanged changed,
      {MemberMediumContainerErrorHandler? errorHandler}) {
    throw UnimplementedError();
  }

  @override
  Future<MemberMediumContainerModel> changeValue(
      String documentId, String fieldName, num changeByThisValue) {
    throw UnimplementedError();
  }

  @override
  Future<MemberMediumContainerEntity?> getEntity(String? id,
      {Function(Exception p1)? onError}) {
    throw UnimplementedError();
  }

  @override
  MemberMediumContainerEntity? fromMap(Object? o,
      {Map<String, String>? newDocumentIds}) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteAll() async {}
}

class MemberSubscriptionInMemoryRepository
    implements MemberSubscriptionRepository {
  final List<MemberSubscriptionModel> items;
  final MemberSubscriptionListChanged trigger;
  Stream<List<MemberSubscriptionModel>>? theValues;

  MemberSubscriptionInMemoryRepository(this.trigger, this.items) {
    List<List<MemberSubscriptionModel>> myList =
        <List<MemberSubscriptionModel>>[];
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

  @override
  Future<MemberSubscriptionEntity> addEntity(
      String documentID, MemberSubscriptionEntity value) {
    throw Exception('Not implemented');
  }

  @override
  Future<MemberSubscriptionEntity> updateEntity(
      String documentID, MemberSubscriptionEntity value) {
    throw Exception('Not implemented');
  }

  @override
  Future<MemberSubscriptionModel> add(MemberSubscriptionModel value) {
    items.add(value.copyWith(documentID: newRandomKey()));
    trigger(items);
    return Future.value(value);
  }

  @override
  Future<void> delete(MemberSubscriptionModel value) {
    int index = _index(value.documentID);
    if (index >= 0) items.removeAt(index);
    trigger(items);
    return Future.value();
  }

  @override
  Future<MemberSubscriptionModel> update(MemberSubscriptionModel value) {
    int index = _index(value.documentID);
    if (index >= 0) {
      items.replaceRange(index, index + 1, [value]);
      trigger(items);
    }
    return Future.value(value);
  }

  @override
  Future<MemberSubscriptionModel> get(String? id,
      {Function(Exception)? onError}) {
    int index = _index(id!);
    var completer = Completer<MemberSubscriptionModel>();
    completer.complete(items[index]);
    return completer.future;
  }

  @override
  Stream<List<MemberSubscriptionModel>> values(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!;
  }

  @override
  Stream<List<MemberSubscriptionModel>> valuesWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!;
  }

  @override
  StreamSubscription<List<MemberSubscriptionModel>> listen(trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!.listen((theList) => trigger(theList));
  }

  @override
  StreamSubscription<List<MemberSubscriptionModel>> listenWithDetails(trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!.listen((theList) => trigger(theList));
  }

  @override
  void flush() {}

  @override
  Future<List<MemberSubscriptionModel>> valuesList(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return Future.value(items);
  }

  @override
  Future<List<MemberSubscriptionModel>> valuesListWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
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
  StreamSubscription<MemberSubscriptionModel> listenTo(
      String documentId, MemberSubscriptionChanged changed,
      {MemberSubscriptionErrorHandler? errorHandler}) {
    throw UnimplementedError();
  }

  @override
  Future<MemberSubscriptionModel> changeValue(
      String documentId, String fieldName, num changeByThisValue) {
    throw UnimplementedError();
  }

  @override
  Future<MemberSubscriptionEntity?> getEntity(String? id,
      {Function(Exception p1)? onError}) {
    throw UnimplementedError();
  }

  @override
  MemberSubscriptionEntity? fromMap(Object? o,
      {Map<String, String>? newDocumentIds}) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteAll() async {}
}

class MenuItemInMemoryRepository implements MenuItemRepository {
  final List<MenuItemModel> items;
  final MenuItemListChanged trigger;
  Stream<List<MenuItemModel>>? theValues;

  MenuItemInMemoryRepository(this.trigger, this.items) {
    List<List<MenuItemModel>> myList = <List<MenuItemModel>>[];
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

  @override
  Future<MenuItemEntity> addEntity(String documentID, MenuItemEntity value) {
    throw Exception('Not implemented');
  }

  @override
  Future<MenuItemEntity> updateEntity(String documentID, MenuItemEntity value) {
    throw Exception('Not implemented');
  }

  @override
  Future<MenuItemModel> add(MenuItemModel value) {
    items.add(value.copyWith(documentID: newRandomKey()));
    trigger(items);
    return Future.value(value);
  }

  @override
  Future<void> delete(MenuItemModel value) {
    int index = _index(value.documentID);
    if (index >= 0) items.removeAt(index);
    trigger(items);
    return Future.value();
  }

  @override
  Future<MenuItemModel> update(MenuItemModel value) {
    int index = _index(value.documentID);
    if (index >= 0) {
      items.replaceRange(index, index + 1, [value]);
      trigger(items);
    }
    return Future.value(value);
  }

  @override
  Future<MenuItemModel> get(String? id, {Function(Exception)? onError}) {
    int index = _index(id!);
    var completer = Completer<MenuItemModel>();
    completer.complete(items[index]);
    return completer.future;
  }

  @override
  Stream<List<MenuItemModel>> values(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!;
  }

  @override
  Stream<List<MenuItemModel>> valuesWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!;
  }

  @override
  StreamSubscription<List<MenuItemModel>> listen(trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!.listen((theList) => trigger(theList));
  }

  @override
  StreamSubscription<List<MenuItemModel>> listenWithDetails(trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!.listen((theList) => trigger(theList));
  }

  @override
  void flush() {}

  @override
  Future<List<MenuItemModel>> valuesList(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return Future.value(items);
  }

  @override
  Future<List<MenuItemModel>> valuesListWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
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
  StreamSubscription<MenuItemModel> listenTo(
      String documentId, MenuItemChanged changed,
      {MenuItemErrorHandler? errorHandler}) {
    throw UnimplementedError();
  }

  @override
  Future<MenuItemModel> changeValue(
      String documentId, String fieldName, num changeByThisValue) {
    throw UnimplementedError();
  }

  @override
  Future<MenuItemEntity?> getEntity(String? id,
      {Function(Exception p1)? onError}) {
    throw UnimplementedError();
  }

  @override
  MenuItemEntity? fromMap(Object? o, {Map<String, String>? newDocumentIds}) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteAll() async {}
}
