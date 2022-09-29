import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/app_policy_model.dart';
import 'package:eliud_core/model/public_medium_model.dart';
import 'package:eliud_core/tools/component/component_spec.dart';
import 'package:eliud_core/tools/random.dart';

//import 'appPolicy_dashboard_event.dart';
import '../../../model/storage_conditions_model.dart';
import '../../storage/medium_info.dart';
import 'app_policy_dashboard_event.dart';
import 'app_policy_dashboard_state.dart';

class AppPolicyDashboardBloc
    extends Bloc<AppPolicyDashboardBaseEvent, AppPolicyDashboardBaseState> {
  final String appId;
  final EditorFeedback feedback;

  AppPolicyModel deleteItem(
      AppPolicyModel model, PublicMediumModel deleteItem) {
    // delete from a list
    return model;
  }

  void updateItem(AppPolicyModel model, PublicMediumModel oldItem,
      PublicMediumModel newItem) {
    // update in the list
  }

  AppPolicyDashboardBloc(this.appId, this.feedback)
      : super(AppPolicyDashboardUninitialised()) {
    on<AppPolicyDashboardInitialise>((event, emit) async {
      // retrieve the model, as it was retrieved without links
      var modelWithLinks =
          await appPolicyRepository(appId: appId)!.get(event.model.documentID);
      if (modelWithLinks == null) {
        var appPolicyId = newRandomKey();
        modelWithLinks = AppPolicyModel(
          appId: appId,
          documentID: appPolicyId,
          name: 'new appPolicy',
          conditions: StorageConditionsModel(
            privilegeLevelRequired:
                PrivilegeLevelRequiredSimple.NoPrivilegeRequiredSimple,
          ),
        );
      }

      var values = modelWithLinks.policy != null
          ? await ChainOfMediumModels.getPlatformMediumModelChainOfMedium(
              appId, modelWithLinks.policy!)
          : null;
      emit(AppPolicyDashboardLoaded(
          appPolicy: modelWithLinks, values: values, ));
    });

    on<AppPolicyDashboardAddItem> ((event, emit) async {
      if (state is AppPolicyDashboardInitialised) {
        var theState = state as AppPolicyDashboardInitialised;
        var values = theState.values ?? [];
        var newValues = values.map((v) => v).toList();
        newValues.add(event.item);
        emit(AppPolicyDashboardLoaded(
          appPolicy: theState.appPolicy, values: newValues,));
      }
    });

    on<AppPolicyDashboardDeleteItem> ((event, emit) async {
      if (state is AppPolicyDashboardInitialised) {
        var theState = state as AppPolicyDashboardInitialised;
        var values = theState.values ?? [];
        var newValues = values.map((v) => v).toList();
        newValues.removeWhere((value) => value.documentID == event.item.documentID);
        emit(AppPolicyDashboardLoaded(
          appPolicy: theState.appPolicy, values: newValues,));
      }
    });

/*
    on<PlatformMediumListUpdated>((event, emit) {
      if (state is AppPolicyDashboardInitialised) {
        var theState = state as AppPolicyDashboardInitialised;
        emit(AppPolicyDashboardLoaded(
            appPolicy: theState.appPolicy,
            values: event.values,
            ));
      }
    });
*/

  }

  Future<void> save(AppPolicyDashboardApplyChanges event) async {
    if (state is AppPolicyDashboardInitialised) {
      var theState = state as AppPolicyDashboardInitialised;
      var theList = theState.values;
      var newModel = theState.appPolicy;
      if (theList != null) {
        var previousId;
        var firstOne;
        for (var value in theList.reversed.toList()) {
          if (value.relatedMediumId != previousId) {
            value.relatedMediumId = previousId;
            await platformMediumRepository(appId: appId)!.update(value);
          }
          previousId = value.documentID;
          firstOne = value;
        }

        newModel.policy = firstOne;
      }
      if (await appPolicyRepository(appId: appId)!.get(newModel.documentID) ==
          null) {
        await appPolicyRepository(appId: appId)!.add(newModel);
      } else {
        await appPolicyRepository(appId: appId)!.update(newModel);
      }
      feedback(true, newModel);
    }
  }
}
