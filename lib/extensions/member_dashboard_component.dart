import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/core/widgets/progress_indicator.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/background_model.dart';
import 'package:eliud_core/model/member_dashboard_component.dart';
import 'package:eliud_core/model/member_dashboard_model.dart';
import 'package:eliud_core/model/member_dashboard_repository.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/tools/component_constructor.dart';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/tools/widgets/message_dialog.dart';
import 'package:eliud_core/tools/widgets/yes_no_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:eliud_core/tools/widgets/dialog_helper.dart';
import 'package:flutter/cupertino.dart';

class MemberDashboardComponentConstructorDefault
    implements ComponentConstructor {
  Widget createNew({String id, Map<String, Object> parameters}) {
    return MemberDashboard(id: id);
  }
}

class MemberDashboard extends AbstractMemberDashboardComponent {
  MemberDashboard({String id}) : super(memberDashboardID: id);

  @override
  Widget alertWidget({title = String, content = String}) {
    return AlertWidget(title: title, content: content);
  }

  static EliudQuery getSubscribedMembers(String appId) {
    return EliudQuery(theConditions: [
      EliudQueryCondition('subscriptionsAsString', arrayContains: appId),
    ]);
  }

  @override
  Widget yourWidget(BuildContext context, MemberDashboardModel dashboardModel) {
    return Text("Member Dashboard. TODO. Grab logic from member_profile_componentx.dart, add buttons for delete account, download all data, update profile");
  }

  @override
  MemberDashboardRepository getMemberDashboardRepository(BuildContext context) {
    return memberDashboardRepository(appId: AccessBloc.appId(context));
  }
}
