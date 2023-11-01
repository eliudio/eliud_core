import 'package:eliud_core/core/wizards/builders/page_builder.dart';
import 'package:eliud_core/core/wizards/tools/documentIdentifier.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart'
    as corerepo;
import 'package:eliud_core/model/model_export.dart';

class SingleComponentPageBuilder extends PageBuilder {
  SingleComponentPageBuilder(
      String uniqueId,
      String pageId,
      AppModel app,
      String memberId,
      HomeMenuModel theHomeMenu,
      AppBarModel theAppBar,
      DrawerModel leftDrawer,
      DrawerModel rightDrawer,
      )
      : super(uniqueId, pageId, app, memberId, theHomeMenu, theAppBar,
            leftDrawer, rightDrawer,  );

  Future<PageModel> _setupPage(
      {required String componentName,
      required String componentIdentifier,
      required String title,
        required String description}) async {
    return await corerepo.AbstractRepositorySingleton.singleton
        .pageRepository(app.documentID)!
        .add(_page(
            componentName: componentName,
            componentIdentifier: componentIdentifier,
            title: title,
            description: description));
  }

  PageModel _page(
      {required String componentName,
      required String componentIdentifier,
      required String title,
      required String description,
      }) {
    List<BodyComponentModel> components = [];
    components.add(BodyComponentModel(
        documentID: "1",
        componentName: componentName,
        componentId: constructDocumentId(uniqueId: uniqueId, documentId: componentIdentifier)));

    return PageModel(
        documentID: constructDocumentId(uniqueId: uniqueId, documentId: pageId),
        appId: app.documentID,
        title: title,
        description: description,
        drawer: leftDrawer,
        endDrawer: rightDrawer,
        appBar: theAppBar,
        homeMenu: theHomeMenu,
        layout: PageLayout.ListView,
        conditions: StorageConditionsModel(
          privilegeLevelRequired:
              PrivilegeLevelRequiredSimple.Level1PrivilegeRequiredSimple,
        ),
        bodyComponents: components);
  }

  Future<PageModel> doIt(
      {required String componentName,
      required String componentIdentifier,
      required String title,
      required String description,}) async {
    return await _setupPage(
        componentName: componentName,
        componentIdentifier: componentIdentifier,
        title: title,
        description: description);
  }
}
