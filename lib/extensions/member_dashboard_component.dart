import 'package:eliud_core/extensions/widgets/member_model_widget.dart';
import 'package:eliud_core_helpers/etc/screen_size.dart';
import 'package:eliud_core_helpers/query/query_tools.dart';
import 'package:eliud_core/access/access_bloc.dart';
import 'package:eliud_core/access/state/access_determined.dart';
import 'package:eliud_core/access/state/access_state.dart';
import 'package:eliud_core_main/apis/registryapi/component/component_constructor.dart';
import 'package:eliud_core_main/editor/ext_editor_base_bloc/ext_editor_base_event.dart';
import 'package:eliud_core_main/widgets/alert_widget.dart';
import 'package:eliud_core_model/model/abstract_repository_singleton.dart';
import 'package:eliud_core_main/model/app_model.dart';
import 'package:eliud_core_model/model/member_dashboard_component.dart';
import 'package:eliud_core_model/model/member_dashboard_model.dart';
import 'package:eliud_core_model/model/member_dashboard_repository.dart';
import 'package:eliud_core_main/model/member_model.dart';
import 'package:eliud_core_main/apis/style/frontend/has_button.dart';
import 'package:eliud_core_main/apis/style/frontend/has_dialog.dart';
import 'package:eliud_core_main/apis/style/frontend/has_divider.dart';
import 'package:eliud_core_main/apis/style/frontend/has_progress_indicator.dart';
import 'package:eliud_core_main/apis/style/frontend/has_table.dart';
import 'package:eliud_core_main/apis/style/frontend/has_text.dart';
import 'package:eliud_core/tools/gdpr/gdpr_functions.dart';
import 'package:eliud_core_main/tools/etc/member_collection_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../access/access_event.dart';
import '../core/widgets/member_widgets/login_widget.dart';
import 'bloc/member_bloc.dart';
import 'open_dialog_post_login.dart';

class MemberDashboardComponentConstructorDefault
    implements ComponentConstructor {
  @override
  Widget createNew(
      {Key? key,
      required AppModel app,
      required String id,
      Map<String, dynamic>? parameters}) {
    return MemberDashboard(
      key: key,
      app: app,
      id: id,
      parameters: parameters,
    );
  }

  @override
  Future<dynamic> getModel({required AppModel app, required String id}) async =>
      await memberDashboardRepository(appId: app.documentID)!.get(id);
}

class MemberDashboard extends AbstractMemberDashboardComponent {
  final Map<String, dynamic>? parameters;

  MemberDashboard(
      {super.key, required super.app, required String id, this.parameters})
      : super(memberDashboardId: id);

  Widget alertWidget({title = String, content = String}) {
    return AlertWidget(app: app, title: title, content: content);
  }

  static EliudQuery getSubscribedMembers(String appId) {
    return EliudQuery(theConditions: [
      EliudQueryCondition('subscriptionsAsStrArr', arrayContains: appId),
    ]);
  }

  TableRow getRow(BuildContext context, AppModel app, String label,
      String description, VoidCallback action) {
    return TableRow(children: [
      button(
        app,
        context,
        label: label,
        onPressed: action,
      ),
      TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: text(app, context, description, textAlign: TextAlign.center)),
    ]);
  }

  @override
  Widget yourWidget(BuildContext context, MemberDashboardModel? value) {
    return BlocBuilder<AccessBloc, AccessState>(
        builder: (context, accessState) {
      if (accessState is AccessDetermined) {
        var member = accessState.getMember();
        if (member != null) {
          var welcomeText =
              'Welcome ${member.name ?? '?'}. Use the below links to maintain your account with us.';
          var userPhotoUrl = member.photoURL;
          Widget profilePhoto;
          if (userPhotoUrl != null) {
            profilePhoto = Align(
                alignment: Alignment.topRight,
                child: Container(
                    width: 30,
                    height: 30,
                    child: Image.network(member.photoURL!)));
          } else {
            profilePhoto = Container();
          }
          var currentApp = app;
          return ListView(
            physics: ScrollPhysics(),
            shrinkWrap: true,
            children: [
              Row(children: [
                Spacer(),
                text(app, context, welcomeText, textAlign: TextAlign.center),
                Spacer(),
                profilePhoto,
              ]),
              Container(height: 20),
              divider(app, context),
              Container(height: 20),
              table(
                app,
                context,
                children: [
                  //            TableRow(children: [Text('Hi ' + member.name), profilePhoto]),
                  getRow(
                      context,
                      currentApp,
                      'Update profile',
                      value!.updateProfileText!,
                      () => _updateProfile(context, currentApp, member)),
                  getRow(
                      context,
                      currentApp,
                      'Retrieve data',
                      value.retrieveDataText!,
                      () => _retrieveData(context, value, currentApp, member)),
                  getRow(
                      context,
                      currentApp,
                      'Delete account',
                      value.deleteDataText!,
                      () => _deleteAccount(context, value, currentApp, member)),
                ],
              )
            ],
          );
        } else {
          OpenDialogPostLogin? theAction;
          if (parameters != null) {
            var openDialogParam = parameters!['open-dialog'];
            if (openDialogParam != null) {
              theAction =
                  OpenDialogPostLogin(dialogID: openDialogParam, app: app);
            }
          }
          return ListView(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              children: [
                Text(
                    'This member dashboard allows to manage your account, update your detail, retrieve your data or even destroy it with a few clicks. To access it, please login to your account'),
                LoginWidget(app: app, excludeHeader: true, actions: theAction)
              ]);
        }
      } else {
        return progressIndicator(app, context);
      }
    });
  }

  void _updateProfile(
      BuildContext context, AppModel app, MemberModel member) async {
    openFlexibleDialog(app, context, '${app.documentID}/_member',
        includeHeading: false,
        widthFraction: .8,
        child: BlocProvider<MemberBloc>(
            create: (context) => MemberBloc(
                  app.documentID,
                )..add(ExtEditorBaseInitialise<MemberModel>(member)),
            child: MemberModelWidget.getIt(
              context,
              app,
              false,
              fullScreenWidth(context) * .8,
              fullScreenHeight(context) - 100,
              member,
              (newMember) => {
                // Don't do anything, we should be listening to member
              },
            )));

/*
    await Navigator.of(context).push(pageRouteBuilderWithAppId(AccessBloc.getBloc(context).state, app.documentID,
        page: MultiBlocProvider(
            providers: [
              BlocProvider<MemberListBloc>(
                create: (context) => MemberListBloc(
                  memberRepository: memberRepository()!,
                )..add(LoadMemberList()),
              )
            ],
            child: MemberForm(app: app,
                value: member, formAction: FormAction.UpdateAction))));
*/
  }

  void _retrieveData(BuildContext context, MemberDashboardModel? dashboardModel,
      AppModel app, MemberModel member) {
    openAckNackDialog(app, context, '${app.documentID}/_retrievedata',
        title: 'Confirm',
        message:
            'You are about to send a request to gather all your data and send this as an email to your registered email address: ${member.email!}. Please confirm',
        onSelection: (value) async {
      if (value == 0) {
        await GDPR.dumpMemberData(
            member,
            app.documentID,
            dashboardModel!.retrieveDataEmailSubject,
            AccessBloc.getState(context).getMemberCollectionInfo()!);
        openComplexDialog(app, context, '${app.documentID}/_retrievedata',
            title: 'Retrieve data',
            child: text(app, context,
                'You will receive an email at your registered email address ${member.email!} with the data you have with us.'));
      }
    });
  }

  void _deleteAccount(BuildContext context,
      MemberDashboardModel? dashboardModel, AppModel app, MemberModel member) {
    openAckNackDialog(app, context, '${app.documentID}/_deleteaccount',
        title: 'Confirm. Last but 2 warnings',
        message:
            'You are about to send a request to destroy your account with all data. You will get 2 more requests to confirm. Please confirm',
        onSelection: (value) async {
      if (value == 0) {
        _confirmDeleteAccount(context, dashboardModel, app, member,
            AccessBloc.getState(context).getMemberCollectionInfo());
      }
    });
  }

  void _confirmDeleteAccount(
      BuildContext context,
      MemberDashboardModel? dashboardModel,
      AppModel app,
      MemberModel member,
      List<MemberCollectionInfo>? memberCollectionInfo) {
    openAckNackDialog(app, context, '${app.documentID}/_confirmdeleteaccount',
        title: 'Confirm. Last but 1 warning',
        message:
            'You are about to send a request to destroy your account with all data. You will get 1 more requests to confirm. Please confirm',
        onSelection: (value) async {
      if (value == 0) {
        _reConfirmDeleteAccount(
            context, dashboardModel, app, member, memberCollectionInfo);
      }
    });
  }

  void _reConfirmDeleteAccount(
      BuildContext context,
      MemberDashboardModel? dashboardModel,
      AppModel app,
      MemberModel member,
      List<MemberCollectionInfo>? memberCollectionInfo) {
    openAckNackDialog(app, context, '${app.documentID}/_deleteaccount',
        title: 'Confirm. Last warning',
        message:
            'You are about to send a request to destroy your account with all data. THIS WILL BE FINAL. You will loose all your data. Be careful. Please confirm',
        onSelection: (value) async {
      if (value == 0) {
        await GDPR.deleteMemberData(
            member,
            app.documentID,
            dashboardModel!.deleteDataEmailSubject,
            app.email,
            dashboardModel.deleteDataEmailMessage,
            memberCollectionInfo!);
        BlocProvider.of<AccessBloc>(context).add(LogoutEvent(app: app));
      }
    });
  }

  MemberDashboardRepository getMemberDashboardRepository(BuildContext context) {
    return memberDashboardRepository(appId: app.documentID)!;
  }
}
