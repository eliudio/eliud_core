import 'package:equatable/equatable.dart';

abstract class ExtEditorBaseState<T> extends Equatable {
  const ExtEditorBaseState();

  @override
  List<Object?> get props => [];
}

class ExtEditorBaseUninitialised<T> extends ExtEditorBaseState<T> {
  @override
  List<Object?> get props => [];

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is ExtEditorBaseUninitialised;
}

class ExtEditorBaseInitialised<T, U> extends ExtEditorBaseState<T> {
  final T model;
  final U? currentEdit;

  const ExtEditorBaseInitialised(
      {required this.model, this.currentEdit});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExtEditorBaseInitialised &&
          model == other.model &&
          currentEdit == other.currentEdit;

  @override
  List<Object?> get props => [model, currentEdit];
}

class ExtEditorBaseLoaded<T, U> extends ExtEditorBaseInitialised<T, U> {
  const ExtEditorBaseLoaded(
      {required T model, U? currentEdit})
      : super(model: model, currentEdit: currentEdit);
}

class ExtEditorBaseError<T, U> extends ExtEditorBaseInitialised<T, U> {
  final String error;

  const ExtEditorBaseError({
    required this.error,
    required T model,
    U? currentEdit
  }) : super(
          model: model,
      currentEdit: currentEdit,
        );
}
