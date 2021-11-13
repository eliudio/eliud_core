import 'package:eliud_core/core/navigate/router.dart' as eliudrouter;
import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:eliud_core/core/blocs/access/state/access_determined.dart';
import 'package:eliud_core/core/blocs/access/state/access_state.dart';
import 'package:eliud_core/core/blocs/access/state/logged_in.dart';
import 'package:eliud_core/core/components/page_constructors/eliud_appbar.dart';
import 'package:eliud_core/core/components/page_constructors/eliud_bottom_navigation_bar.dart';
import 'package:eliud_core/core/components/page_constructors/eliud_drawer.dart';
import 'package:eliud_core/core/tools/component_info.dart';
import 'package:eliud_core/core/tools/page_body.dart';
import 'package:eliud_core/core/widgets/accept_membership.dart';
import 'package:eliud_core/decoration/decorations.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/page_model.dart';
import 'package:eliud_core/style/frontend/has_drawer.dart';
import 'package:eliud_core/style/frontend/has_progress_indicator.dart';
import 'package:eliud_core/style/frontend/has_text.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'package:eliud_core/tools/has_fab.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../registry.dart';

class PageComponent extends StatefulWidget {
  final GlobalKey _pageKey = GlobalKey();

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  PageComponent();

  @override
  State<StatefulWidget> createState() {
    return _PageComponentState();
  }
}

class _PageComponentState extends State<PageComponent> {
  Widget? theBody;
  HasFab? hasFab;

  Future<PageModel?> getPage(String appId, String pageId) {
    return pageRepository(appId: appId)!.get(pageId);
  }

  @override
  Widget build(BuildContext context) {
    hasFab = null;
    return BlocConsumer<AccessBloc, AccessState>(
      buildWhen: (previousState, state) {
        return state != previousState;
      },
      builder: (BuildContext context, accessState) {
        if (accessState is AccessDetermined) {
          var currentContext = accessState.currentContext;
          if (currentContext is PageContext) {
            var value = currentContext.page;
            var appId = value.appId!;
            var pageID = value.documentID!;
            var parameters = accessState.currentContext.parameters;
            var componentInfo = ComponentInfo.getComponentInfo(
                context,
                value.bodyComponents!,
                parameters,
                accessState,
                fromPageLayout(value.layout),
                value.backgroundOverride,
                value.gridView);
            theBody = PageBody(
              componentInfo: componentInfo,
            );
//    }

            var drawer = value.drawer == null
                ? null
                : EliudDrawer(
                drawerType: DrawerType.Left,
                drawer: value.drawer!,
                currentPage: pageID);
            var endDrawer = value.endDrawer == null
                ? null
                : EliudDrawer(
                drawerType: DrawerType.Right,
                drawer: value.endDrawer!,
                currentPage: pageID);
            var bottomNavigationBar = EliudBottomNavigationBar(
                homeMenu: value.homeMenu!, currentPage: pageID);
            var appBar = value.appBar == null
                ? null
                : PreferredSize(
                preferredSize: const Size(double.infinity, kToolbarHeight),
                child: EliudAppBar(
                    pageTitle: value.title,
                    currentPage: pageID,
                    scaffoldKey: widget.scaffoldKey,
                    theTitle: value.title == null ? '' : value.title!,
                    value: value.appBar!));
            var fab = hasFab != null ? hasFab!.fab(context) : null;
            var scaffold = Scaffold(
              key: widget.scaffoldKey,
              endDrawer: endDrawer,
              appBar: appBar,
              body: theBody,
              drawer: drawer,
              floatingActionButton: fab,
              floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
              bottomNavigationBar: bottomNavigationBar,
            );
            var scaffoldMessenger = ScaffoldMessenger(
                key: widget.scaffoldMessengerKey, child: scaffold);
            return scaffoldMessenger;
          } else {
            return text(context,
                'Error: PageComponent with context which is not a PageContext ');
          }
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
      listener: (BuildContext context, accessState) {
        if (accessState is AccessDetermined) {
          var currentContext = accessState.currentContext;
          if (currentContext is PageContext) {
              Navigator.of(context).pushNamed(eliudrouter.Router.pageRoute,
                  arguments: eliudrouter.Arguments(
                      currentContext.page.appId! +
                          '/' +
                          currentContext.page.documentID!,
                      currentContext.parameters));
          } else if (currentContext is DialogContext) {
            Registry.registry()!.openDialog(context,
                id: currentContext.dialog.documentID!,
                parameters: currentContext.parameters);
          }
        }
      },
    );

    return /*BlocListener<AccessBloc, AccessState>(listener:
        (BuildContext context, AccessState accessState) {
      if (accessState is AccessDetermined) {
        var modalRoute = ModalRoute.of(context) as ModalRoute;
        var settings = modalRoute.settings;
        var fullPageId = settings.name;
        var currentContext = accessState.currentContext;
        if (currentContext is PageContext) {
          if (!fullPageId!.contains(currentContext.page.documentID!)) {
            Navigator.of(context).pushNamed(eliudrouter.Router.pageRoute,
                arguments: eliudrouter.Arguments(
                    currentContext.page.appId! +
                        '/' +
                        currentContext.page.documentID!,
                    currentContext.parameters));
          }
        } else if (currentContext is DialogContext) {
          Registry.registry()!.openDialog(context,
              id: currentContext.dialog.documentID!,
              parameters: currentContext.parameters);
        }
      }
    }, child: */BlocBuilder<AccessBloc, AccessState>(builder: (context, accessState) {
    })/*)*/;
  }
}
