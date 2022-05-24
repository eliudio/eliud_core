import 'package:equatable/equatable.dart';

import '../../base/model_base.dart';

abstract class EditorBaseEvent<T> extends Equatable {
  @override
  List<Object?> get props => [];
}

class EditorBaseInitialise<T extends ModelBase> extends EditorBaseEvent<T> {
  final T model;

  EditorBaseInitialise(this.model);

  @override
  List<Object?> get props => [model];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EditorBaseInitialise && model == other.model;
}


class EditorBaseApplyChanges<T> extends EditorBaseEvent<T> {
  final T model;

  EditorBaseApplyChanges({required this.model});

  @override
  List<Object?> get props => [
        model,
      ];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EditorBaseApplyChanges && model == other.model;
}

