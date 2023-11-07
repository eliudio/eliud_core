import 'package:eliud_core/core/wizards/builders/dialog_builder.dart';
import 'package:eliud_core/core/wizards/tools/document_identifier.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart'
    as corerepo;
import 'package:eliud_core/model/blocking_dashboard_component.dart';
import 'package:eliud_core/model/model_export.dart';

class BlockingDashboardDialogBuilder extends DialogBuilder {
  BlockingDashboardDialogBuilder(
      super.uniqueId, super.app, super.dialogDocumentId);

  Future<DialogModel> _setupDialog() async {
    return await corerepo.AbstractRepositorySingleton.singleton
        .dialogRepository(app.documentID)!
        .add(_dialog());
  }

  DialogModel _dialog() {
    var components = <BodyComponentModel>[];
    components.add(BodyComponentModel(
        documentID: '1',
        componentName: AbstractBlockingDashboardComponent.componentName,
        componentId: constructDocumentId(
            uniqueId: uniqueId, documentId: dialogDocumentId)));

    return DialogModel(
        documentID: constructDocumentId(
            uniqueId: uniqueId, documentId: dialogDocumentId),
        appId: app.documentID,
        title: 'Blocked members',
        description: 'Blocked members',
        layout: DialogLayout.listView,
        bodyComponents: components);
  }

  BlockingDashboardModel _dashboardModel() {
    return BlockingDashboardModel(
      documentID:
          constructDocumentId(uniqueId: uniqueId, documentId: dialogDocumentId),
      appId: app.documentID,
      description: 'Blocked members',
      conditions: StorageConditionsModel(
          privilegeLevelRequired:
              PrivilegeLevelRequiredSimple.noPrivilegeRequiredSimple),
    );
  }

  Future<BlockingDashboardModel> _setupDashboard() async {
    return await corerepo.AbstractRepositorySingleton.singleton
        .blockingDashboardRepository(app.documentID)!
        .add(_dashboardModel());
  }

  Future<DialogModel> create() async {
    await _setupDashboard();
    return await _setupDialog();
  }
}
