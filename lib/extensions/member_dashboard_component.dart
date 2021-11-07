import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:eliud_core/core/blocs/access/access_event.dart';
import 'package:eliud_core/core/blocs/access/state/access_state.dart';
import 'package:eliud_core/core/blocs/app/app_bloc.dart';
import 'package:eliud_core/core/blocs/app/app_state.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/member_dashboard_component.dart';
import 'package:eliud_core/model/member_dashboard_model.dart';
import 'package:eliud_core/model/member_dashboard_repository.dart';
import 'package:eliud_core/model/member_form.dart';
import 'package:eliud_core/model/member_list_bloc.dart';
import 'package:eliud_core/model/member_list_event.dart';
import 'package:eliud_core/model/member_model.dart';
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

class MemberDashboardComponentConstructorDefault
    implements ComponentConstructor {
  @override
  Widget createNew(
      {Key? key, required String id, Map<String, dynamic>? parameters}) {
    return MemberDashboard(key: key, id: id);
  }

  @override
  Future<dynamic> getModel({required String appId, required String id}) async =>
      await memberDashboardRepository(appId: appId)!.get(id);
}

class MemberDashboard extends AbstractMemberDashboardComponent {
  MemberDashboard({Key? key, required String id})
      : super(key: key, memberDashboardID: id);

  @override
  Widget alertWidget({title = String, content = String}) {
    return AlertWidget(title: title, content: content);
  }

  static EliudQuery getSubscribedMembers(String appId) {
    return EliudQuery(theConditions: [
      EliudQueryCondition('subscriptionsAsString', arrayContains: appId),
    ]);
  }

  TableRow getRow(BuildContext context, AppModel app, String label,
      String description, VoidCallback action) {
    return TableRow(children: [
      button(
        context,
        label: label,
        onPressed: action,
      ),
      TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: text(context, description, textAlign: TextAlign.center)),
    ]);
  }

  @override
  Widget yourWidget(
      BuildContext context, MemberDashboardModel? dashboardModel) {
    return BlocBuilder<AccessBloc, AccessState>(builder: (context, state) {
      var member = state.getMember();
      if (member != null) {
        return BlocBuilder<AppBloc, AppState>(builder: (context, appState) {
          if (appState is AppLoaded) {
            var welcomeText = 'Welcome ' +
                member.name! +
                '. Use the below links to maintain your account with us.';
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
            return ListView(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              children: [
                Row(children: [
                  Spacer(),
                  text(context, welcomeText, textAlign: TextAlign.center),
                  Spacer(),
                  profilePhoto,
                ]),
                Container(height: 20),
                divider(context),
                Container(height: 20),
                table(
                  context,
                  children: [
                    //            TableRow(children: [Text('Hi ' + member.name), profilePhoto]),
                    getRow(
                        context,
                        appState.app,
                        'Update profile',
                        dashboardModel!.updateProfileText!,
                        () => _updateProfile(context, appState.app, member)),
                    getRow(
                        context,
                        appState.app,
                        'Retrieve data',
                        dashboardModel.retrieveDataText!,
                        () => _retrieveData(
                            context, dashboardModel, appState.app, member)),
                    getRow(
                        context,
                        appState.app,
                        'Delete account',
                        dashboardModel.deleteDataText!,
                        () => _deleteAccount(
                            context, dashboardModel, appState.app, member)),
                  ],
                )
              ],
            );
          } else {
            return progressIndicator(context);
          }
        });
      } else {
        return Text("You need to login to access your account");
      }
    });
  }

  void _updateProfile(
      BuildContext context, AppModel? app, MemberModel member) async {
    await Navigator.of(context).push(pageRouteBuilderWithAppId(app!.documentID!,
        page: MultiBlocProvider(
            providers: [
              BlocProvider<MemberListBloc>(
                create: (context) => MemberListBloc(
                  memberRepository: memberRepository()!,
                )..add(LoadMemberList()),
              )
            ],
            child: MemberForm(
                value: member, formAction: FormAction.UpdateAction))));
  }

  void _retrieveData(BuildContext context, MemberDashboardModel? dashboardModel,
      AppModel? app, MemberModel member) {
    openAckNackDialog(context,
        title: 'Confirm',
        message:
            'You are about to send a request to gather all your data and send this as an email to your registered email address: ' +
                member.email! +
                '. Please confirm', onSelection: (value) async {
      if (value == 0) {
        await GDPR.dumpMemberData(
            app!.documentID,
            dashboardModel!.retrieveDataEmailSubject,
            app.email,
            AccessBloc.getState(context).getMemberCollectionInfo()!);
        openComplexDialog(context,
            title: 'Retrieve data',
            child: Text(
                'You will receive an email at your registered email address ' +
                    member.email! +
                    ' with the data you have with us.'));
      }
    });
  }

  void _deleteAccount(BuildContext context,
      MemberDashboardModel? dashboardModel, AppModel? app, MemberModel member) {
    openAckNackDialog(context,
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
      AppModel? app,
      MemberModel member,
      List<MemberCollectionInfo>? memberCollectionInfo) {
    openAckNackDialog(context,
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
      AppModel? app,
      MemberModel member,
      List<MemberCollectionInfo>? memberCollectionInfo) {
    openAckNackDialog(context,
        title: 'Confirm. Last warning',
        message:
            'You are about to send a request to destroy your account with all data. THIS WILL BE FINAL. You will loose all your data. Be careful. Please confirm',
        onSelection: (value) async {
      if (value == 0) {
        await GDPR.deleteMemberData(
            member,
            app!.documentID,
            dashboardModel!.deleteDataEmailSubject,
            app.email,
            dashboardModel.deleteDataEmailMessage,
            memberCollectionInfo!);
        BlocProvider.of<AccessBloc>(context).add(LogoutEvent());
      }
    });
  }

  @override
  MemberDashboardRepository getMemberDashboardRepository(BuildContext context) {
    return memberDashboardRepository(appId: AppBloc.currentAppId(context))!;
  }
}
