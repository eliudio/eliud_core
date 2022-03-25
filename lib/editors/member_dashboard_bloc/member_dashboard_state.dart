import 'package:eliud_core/model/member_dashboard_model.dart';
import 'package:equatable/equatable.dart';

abstract class MemberDashboardState extends Equatable {
  const MemberDashboardState();

  @override
  List<Object?> get props => [];
}

class MemberDashboardUninitialised extends MemberDashboardState {
  @override
  List<Object?> get props => [];

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is MemberDashboardUninitialised;
}

class MemberDashboardInitialised extends MemberDashboardState {
  final MemberDashboardModel model;

  const MemberDashboardInitialised(
      {required this.model});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MemberDashboardInitialised &&
          model == other.model;

  @override
  List<Object?> get props => [model, ];
}

class MemberDashboardLoaded extends MemberDashboardInitialised {
  const MemberDashboardLoaded(
      {required MemberDashboardModel model, })
      : super(model: model, );
}

class MemberDashboardError extends MemberDashboardInitialised {
  final String error;

  const MemberDashboardError({
    required this.error,
    required MemberDashboardModel model,
      }) : super(
          model: model,
        );
}
