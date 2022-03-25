import 'package:bloc/bloc.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/member_dashboard_model.dart';
import 'package:eliud_core/model/public_medium_model.dart';
import 'package:eliud_core/model/storage_conditions_model.dart';
import 'package:eliud_core/tools/component/component_spec.dart';
import 'package:eliud_core/tools/random.dart';
import 'member_dashboard_state.dart';
import 'member_dashoard_event.dart';

class MemberDashboardBloc
    extends Bloc<MemberDashboardEvent, MemberDashboardState> {
  final String appId;
//  final bool create; // don't think I need this!!!
  final EditorFeedback feedback;

  MemberDashboardBloc(this.appId, /*this.create, */ this.feedback)
      : super(MemberDashboardUninitialised());

  @override
  Stream<MemberDashboardState> mapEventToState(
      MemberDashboardEvent event) async* {
    if (event is MemberDashboardInitialise) {
      List<PublicMediumModel>? media = [];
      // retrieve the model, as it was retrieved without links
      var modelWithLinks = await memberDashboardRepository(appId: appId)!
          .get(event.model.documentID);
      if (modelWithLinks == null) {
        modelWithLinks = MemberDashboardModel(
          documentID: newRandomKey(),
          conditions: StorageConditionsModel(
              privilegeLevelRequired:
                  PrivilegeLevelRequiredSimple.NoPrivilegeRequiredSimple),
        );
      } else {
        modelWithLinks = modelWithLinks.copyWith(
          conditions: modelWithLinks.conditions ??
              StorageConditionsModel(
                  privilegeLevelRequired:
                      PrivilegeLevelRequiredSimple.NoPrivilegeRequiredSimple),
        );
      }
      yield MemberDashboardInitialised(
        model: modelWithLinks,
      );
    }
  }

  Future<void> save(MemberDashboardApplyChanges event) async {
    if (state is MemberDashboardInitialised) {
      var theState = state as MemberDashboardInitialised;
      var newModel = theState.model;
      if (await memberDashboardRepository(appId: appId)!
              .get(newModel.documentID!) ==
          null) {
        await memberDashboardRepository(appId: appId)!.add(newModel);
      } else {
        await memberDashboardRepository(appId: appId)!.update(newModel);
      }
      feedback(true);
    }
  }
}
