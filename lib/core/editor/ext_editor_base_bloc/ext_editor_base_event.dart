import 'package:equatable/equatable.dart';

import '../../base/model_base.dart';

abstract class ExtEditorBaseEvent<T> extends Equatable {
  @override
  List<Object?> get props => [];
}

class ExtEditorBaseInitialise<T extends ModelBase>
    extends ExtEditorBaseEvent<T> {
  final T model;
  // re-retrieve the model from store, to retrieve the referring links?
  final bool reretrieveModel;

  ExtEditorBaseInitialise(this.model, {this.reretrieveModel = true});

  @override
  List<Object?> get props => [model];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExtEditorBaseInitialise && model == other.model;

  @override
  int get hashCode => model.hashCode ^ reretrieveModel.hashCode;
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

  @override
  int get hashCode => item.hashCode;
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

  @override
  int get hashCode => model.hashCode;
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

  @override
  int get hashCode => oldItem.hashCode ^ newItem.hashCode;
}

class AddItemEvent<T, U> extends ExtEditorBaseEvent<T> {
  final U itemModel;

  AddItemEvent({required this.itemModel});

  @override
  List<Object?> get props => [itemModel];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddItemEvent && itemModel == other.itemModel;

  @override
  int get hashCode => itemModel.hashCode;
}

class DeleteItemEvent<T, U> extends ExtEditorBaseEvent<T> {
  final U itemModel;

  DeleteItemEvent({required this.itemModel});

  @override
  List<Object?> get props => [itemModel];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DeleteItemEvent && itemModel == other.itemModel;

  @override
  int get hashCode => itemModel.hashCode;
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
      other is MoveEvent && isUp == other.isUp && item == other.item;

  @override
  int get hashCode => isUp.hashCode ^ item.hashCode;
}
