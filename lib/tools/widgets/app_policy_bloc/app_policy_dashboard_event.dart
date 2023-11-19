import 'package:eliud_core_model/model/app_policy_model.dart';
import 'package:eliud_core_model/model/platform_medium_model.dart';
import 'package:equatable/equatable.dart';

abstract class AppPolicyDashboardBaseEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AppPolicyDashboardInitialise extends AppPolicyDashboardBaseEvent {
  final AppPolicyModel model;

  AppPolicyDashboardInitialise(this.model);
}

/*
class PlatformMediumListUpdated extends AppPolicyDashboardBaseEvent {
  final List<PlatformMediumModel> values;

  PlatformMediumListUpdated(this.values);
}

*/
class AppPolicyDashboardApplyChanges extends AppPolicyDashboardBaseEvent {
  final AppPolicyModel model;

  AppPolicyDashboardApplyChanges({required this.model});
}

class AppPolicyDashboardAddItem extends AppPolicyDashboardBaseEvent {
  final PlatformMediumModel item;

  AppPolicyDashboardAddItem({required this.item});
}

class AppPolicyDashboardDeleteItem extends AppPolicyDashboardBaseEvent {
  final PlatformMediumModel item;

  AppPolicyDashboardDeleteItem({required this.item});
}
