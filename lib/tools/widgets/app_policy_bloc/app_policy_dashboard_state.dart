import 'package:eliud_core_model/model/app_policy_model.dart';
import 'package:eliud_core_model/model/platform_medium_model.dart';
import 'package:equatable/equatable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class AppPolicyDashboardBaseState extends Equatable {
  const AppPolicyDashboardBaseState();

  @override
  List<Object?> get props => [];
}

class AppPolicyDashboardUninitialised extends AppPolicyDashboardBaseState {
  @override
  List<Object?> get props => [];

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is AppPolicyDashboardUninitialised;

  @override
  int get hashCode => 0;
}

class AppPolicyDashboardInitialised extends AppPolicyDashboardBaseState {
  final AppPolicyModel appPolicy;
  final List<PlatformMediumModel>? values;

  const AppPolicyDashboardInitialised({required this.appPolicy, this.values});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppPolicyDashboardInitialised &&
          appPolicy == other.appPolicy &&
          ListEquality().equals(values, other.values);

  @override
  int get hashCode => appPolicy.hashCode ^ values.hashCode;
}

class AppPolicyDashboardLoaded extends AppPolicyDashboardInitialised {
  AppPolicyDashboardLoaded({required super.appPolicy, super.values});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppPolicyDashboardLoaded &&
          appPolicy == other.appPolicy &&
          ListEquality().equals(values, other.values);

  @override
  int get hashCode => appPolicy.hashCode ^ values.hashCode;
}

class AppPolicyDashboardError extends AppPolicyDashboardInitialised {
  final String error;

  AppPolicyDashboardError(
      {required this.error,
      required super.appPolicy,
      required List<PlatformMediumModel> super.values});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppPolicyDashboardError &&
          appPolicy == other.appPolicy &&
          error == other.error &&
          ListEquality().equals(values, other.values);

  @override
  int get hashCode => appPolicy.hashCode ^ values.hashCode ^ error.hashCode;
}
