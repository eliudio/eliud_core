import 'dart:async';

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
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../registry.dart';

class PageComponent extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
  final String appId;
  final String pageId;
  final Map<String, dynamic>? parameters;

  PageComponent({required this.appId, required this.pageId, this.parameters});

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
    return FutureBuilder<PageModel?>(
        future: getPage(widget.appId, widget.pageId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var page = snapshot.data!;
            return BlocBuilder(
                bloc: BlocProvider.of<AccessBloc>(context),
                builder: (BuildContext context, accessState) {
                  if (accessState is AccessDetermined) {
                    var appId = widget.appId;
                    var pageId = widget.pageId;
                    var parameters = widget.parameters;
                    var componentInfo = ComponentInfo.getComponentInfo(
                        context,
                        page.bodyComponents!,
                        parameters,
                        accessState,
                        fromPageLayout(page.layout),
                        page.backgroundOverride,
                        page.gridView);
                    theBody = PageBody(
                      componentInfo: componentInfo,
                    );
//    }

                    var drawer = page.drawer == null
                        ? null
                        : EliudDrawer(
                        drawerType: DrawerType.Left,
                        drawer: page.drawer!,
                        currentPage: page.documentID!);
                    var endDrawer = page.endDrawer == null
                        ? null
                        : EliudDrawer(
                        drawerType: DrawerType.Right,
                        drawer: page.endDrawer!,
                        currentPage: page.documentID!);
                    var bottomNavigationBar = EliudBottomNavigationBar(
                        homeMenu: page.homeMenu!,
                        currentPage: page.documentID!);
                    var appBar = page.appBar == null
                        ? null
                        : PreferredSize(
                        preferredSize: const Size(
                            double.infinity, kToolbarHeight),
                        child: EliudAppBar(
                            pageTitle: page.title,
                            currentPage: page.documentID!,
                            scaffoldKey: widget.scaffoldKey,
                            theTitle: page.title ?? '',
                            value: page.appBar!));
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
                    return Center(child: CircularProgressIndicator());
                  }
                });
          } else {
            return Center(child: CircularProgressIndicator());
          }
        }
    );
  }

}
