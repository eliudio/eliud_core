import 'package:eliud_core/model/member_dashboard_model.dart';
import 'package:equatable/equatable.dart';

abstract class MemberDashboardEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class MemberDashboardInitialise extends MemberDashboardEvent {
  final MemberDashboardModel model;

  MemberDashboardInitialise(this.model);

  @override
  List<Object?> get props => [model];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MemberDashboardInitialise && model == other.model;
}


class MemberDashboardApplyChanges extends MemberDashboardEvent {
  final MemberDashboardModel model;

  MemberDashboardApplyChanges({required this.model});

  @override
  List<Object?> get props => [
        model,
      ];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MemberDashboardApplyChanges && model == other.model;
}

