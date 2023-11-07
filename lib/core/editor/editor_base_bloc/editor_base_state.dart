import 'package:equatable/equatable.dart';

abstract class EditorBaseState<T> extends Equatable {
  const EditorBaseState();

  @override
  List<Object?> get props => [];
}

class EditorBaseUninitialised<T> extends EditorBaseState<T> {
  @override
  List<Object?> get props => [];

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is EditorBaseUninitialised;

  @override
  int get hashCode => 0;
}

class EditorBaseInitialised<T> extends EditorBaseState<T> {
  final T model;

  const EditorBaseInitialised({required this.model});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EditorBaseInitialised && model == other.model;

  @override
  List<Object?> get props => [
        model,
      ];

  @override
  int get hashCode => model.hashCode;
}

class EditorBaseLoaded<T> extends EditorBaseInitialised<T> {
  const EditorBaseLoaded({
    required super.model,
  });
}

class EditorBaseError<T> extends EditorBaseInitialised<T> {
  final String error;

  const EditorBaseError({
    required this.error,
    required super.model,
  });
}
