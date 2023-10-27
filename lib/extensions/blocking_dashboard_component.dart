import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:eliud_core/core/blocs/access/access_event.dart';
import 'package:eliud_core/core/blocs/access/state/access_determined.dart';
import 'package:eliud_core/core/blocs/access/state/access_state.dart';
import 'package:eliud_core/core/blocs/access/state/logged_in.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/extensions/blocking/bloc/maintain_blocking_list_bloc.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/blocking_dashboard_component.dart';
import 'package:eliud_core/model/blocking_dashboard_model.dart';
import 'package:eliud_core/model/blocking_dashboard_repository.dart';
import 'package:eliud_core/model/blocking_form.dart';
import 'package:eliud_core/model/blocking_list_bloc.dart';
import 'package:eliud_core/model/blocking_list_event.dart';
import 'package:eliud_core/model/blocking_model.dart';
import 'package:eliud_core/package/package.dart';
import 'package:eliud_core/style/frontend/has_button.dart';
import 'package:eliud_core/style/frontend/has_dialog.dart';
import 'package:eliud_core/style/frontend/has_divider.dart';
import 'package:eliud_core/style/frontend/has_progress_indicator.dart';
import 'package:eliud_core/style/frontend/has_table.dart';
import 'package:eliud_core/style/frontend/has_text.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'package:eliud_core/tools/component/component_constructor.dart';
import 'package:eliud_core/tools/enums.dart';
import 'package:eliud_core/tools/gdpr/gdpr_functions.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/tools/router_builders.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/editor/ext_editor_base_bloc/ext_editor_base_event.dart';
import '../core/widgets/login_widget.dart';
import '../model/blocking_list.dart';
import '../tools/screen_size.dart';
import 'blocking/bloc/maintain_blocking_list_event.dart';
import 'blocking/maintain_blocking_list.dart';
import 'open_dialog_post_login.dart';

class BlockingDashboardComponentConstructorDefault
    implements ComponentConstructor {
  @override
  Widget createNew(
      {Key? key,
      required AppModel app,
      required String id,
      Map<String, dynamic>? parameters}) {
    return BlockingDashboard(
      key: key,
      app: app,
      id: id,
      parameters: parameters,
    );
  }

  @override
  Future<dynamic> getModel({required AppModel app, required String id}) async =>
      await blockingDashboardRepository(appId: app.documentID)!.get(id);
}

class BlockingDashboard extends AbstractBlockingDashboardComponent {
  Map<String, dynamic>? parameters;

  BlockingDashboard(
      {Key? key, required AppModel app, required String id, this.parameters})
      : super(key: key, app: app, blockingDashboardId: id);

  @override
  Widget alertWidget({title = String, content = String}) {
    return AlertWidget(app: app, title: title, content: content);
  }

  @override
  Widget yourWidget(BuildContext context, BlockingDashboardModel value) {
    return BlocBuilder<AccessBloc, AccessState>(
        builder: (context, accessState) {
          if (accessState is AccessDetermined) {
            var memberId = accessState.getMember()!.documentID;
            return BlocProvider<MaintainBlockingListBloc>(
                create: (context) => MaintainBlockingListBloc(
                  memberId: memberId,
                  loggedIn: accessState is LoggedIn ? accessState : null,
                  detailed: true,
                  appId: app.documentID,
                )..add(LoadMaintainBlockingList()),
                child: MaintainBlockingListWidget(
                  app: app,
                ));
          } else {
            return StyleRegistry.registry().styleWithApp(app).adminListStyle().progressIndicator(app, context);
          }
        });
  }

  @override
  BlockingDashboardRepository getBlockingDashboardRepository(
      BuildContext context) {
    return blockingDashboardRepository(appId: app.documentID)!;
  }
}
