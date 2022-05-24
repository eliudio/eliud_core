import 'package:eliud_core/model/app_bar_model.dart';
import 'package:eliud_core/model/dialog_model.dart';
import 'package:eliud_core/model/drawer_model.dart';
import 'package:eliud_core/model/menu_def_model.dart';
import 'package:eliud_core/model/menu_item_model.dart';
import 'package:eliud_core/model/page_model.dart';
import 'package:eliud_core/model/platform_medium_model.dart';
import 'package:eliud_core/model/public_medium_model.dart';
import 'package:equatable/equatable.dart';
import 'package:collection/collection.dart';

import '../../base/model_base.dart';

abstract class ExtEditorBaseEvent<T> extends Equatable {
  @override
  List<Object?> get props => [];
}

class ExtEditorBaseInitialise<T extends ModelBase> extends ExtEditorBaseEvent<T> {
  final T model;

  ExtEditorBaseInitialise(this.model);

  @override
  List<Object?> get props => [model];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExtEditorBaseInitialise && model == other.model;
}

class SelectForEditEvent<T, U> extends ExtEditorBaseEvent<T> {
  final U item;

  SelectForEditEvent({required this.item});

  @override
  List<Object?> get props => [item];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is SelectForEditEvent && item == other.item;
}

class ExtEditorBaseApplyChanges<T> extends ExtEditorBaseEvent<T> {
  final T model;

  ExtEditorBaseApplyChanges({required this.model});

  @override
  List<Object?> get props => [
        model,
      ];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExtEditorBaseApplyChanges && model == other.model;
}

class UpdateItemEvent<T, U> extends ExtEditorBaseEvent<T> {
  final U oldItem;
  final U newItem;

  UpdateItemEvent({required this.oldItem, required this.newItem});

  @override
  List<Object?> get props => [oldItem, newItem];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is UpdateItemEvent &&
              oldItem == other.oldItem &&
              newItem == other.newItem;
}

class AddItemEvent<T, U> extends ExtEditorBaseEvent<T> {
  final U itemModel;

  AddItemEvent({required this.itemModel});

  @override
  List<Object?> get props => [itemModel];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is AddItemEvent &&
              itemModel == other.itemModel;
}

class DeleteItemEvent<T, U> extends ExtEditorBaseEvent<T> {
  final U itemModel;

  DeleteItemEvent({required this.itemModel});

  @override
  List<Object?> get props => [itemModel];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is DeleteItemEvent &&
              itemModel == other.itemModel;
}

class MoveEvent<T, U> extends ExtEditorBaseEvent<T> {
  final bool isUp;
  final U item;

  MoveEvent({required this.isUp, required this.item});

  @override
  List<Object?> get props => [isUp, item];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is MoveEvent &&
              isUp == other.isUp &&
              item == other.item;
}

