import 'package:eliud_core/extensions/blocking/bloc/maintain_blocking_list_bloc.dart';
import 'package:eliud_core/access/access_bloc.dart';
import 'package:eliud_core/access/state/access_determined.dart';
import 'package:eliud_core/access/state/access_state.dart';
import 'package:eliud_core/access/state/logged_in.dart';
import 'package:eliud_core_main/apis/registryapi/component/component_constructor.dart';
import 'package:eliud_core_main/widgets/alert_widget.dart';
import 'package:eliud_core_model/model/abstract_repository_singleton.dart';
import 'package:eliud_core_main/model/app_model.dart';
import 'package:eliud_core_model/model/blocking_dashboard_component.dart';
import 'package:eliud_core_model/model/blocking_dashboard_model.dart';
import 'package:eliud_core_model/model/blocking_dashboard_repository.dart';
import 'package:eliud_core_main/apis/style/style_registry.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocking/bloc/maintain_blocking_list_event.dart';
import 'blocking/maintain_blocking_list.dart';

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
  final Map<String, dynamic>? parameters;

  BlockingDashboard(
      {super.key, required super.app, required String id, this.parameters})
      : super(blockingDashboardId: id);

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
        return StyleRegistry.registry()
            .styleWithApp(app)
            .adminListStyle()
            .progressIndicator(app, context);
      }
    });
  }

  BlockingDashboardRepository getBlockingDashboardRepository(
      BuildContext context) {
    return blockingDashboardRepository(appId: app.documentID)!;
  }
}
