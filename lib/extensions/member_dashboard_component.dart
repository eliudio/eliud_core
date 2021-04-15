import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_event.dart';
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
import 'package:eliud_core/tools/component_constructor.dart';
import 'package:eliud_core/tools/enums.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:eliud_core/tools/gdpr/gdpr_functions.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/tools/router_builders.dart';
import 'package:eliud_core/tools/widgets/dialog_helper.dart';
import 'package:eliud_core/tools/widgets/widget_dialog.dart';
import 'package:eliud_core/tools/widgets/yes_no_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MemberDashboardComponentConstructorDefault
    implements ComponentConstructor {
  Widget createNew({String? id, Map<String, dynamic>? parameters}) {
    return MemberDashboard(id: id);
  }
}

class MemberDashboard extends AbstractMemberDashboardComponent {
  MemberDashboard({String? id}) : super(memberDashboardID: id);

  @override
  Widget alertWidget({title = String, content = String}) {
    return AlertWidget(title: title, content: content);
  }

  static EliudQuery getSubscribedMembers(String appId) {
    return EliudQuery(theConditions: [
      EliudQueryCondition('subscriptionsAsString', arrayContains: appId),
    ]);
  }

  TableRow getRow(AppModel app, String textButton, String description,
      VoidCallback action) {
    return TableRow(children: [
      TextButton(onPressed: () => action(), child: Text(textButton)),
      TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: Text(description,
              textAlign: TextAlign.center,
              style: FontTools.textStyle(app.fontText))),
    ]);
  }

  @override
  Widget yourWidget(BuildContext context, MemberDashboardModel? dashboardModel) {
    var app = AccessBloc.app(context);
    var state = AccessBloc.getState(context);
    var member = AccessBloc.memberFor(state);
    if (member != null) {
      var welcomeText = 'Welcome ' +
          member.name! +
          '. Use the below links to maintain your account with us.';
      var userPhotoUrl = member.photoURL;
      Widget profilePhoto;
      if (userPhotoUrl != null) {
        profilePhoto = Align(alignment: Alignment.topRight, child: Container(
            width: 30, height: 30, child: Image.network(member.photoURL!)));
      } else {
        profilePhoto = Container();
      }
      return ListView(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        children: [
          Row(children: [
            Spacer(),
            Text(welcomeText,
                textAlign: TextAlign.center,
                style: FontTools.textStyle(app!.fontText)),
            Spacer(),
            profilePhoto,
          ]),
          Container(height:20),
          Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: app.dividerColor)),
          Container(height:20),
          Table(
            defaultColumnWidth: IntrinsicColumnWidth(),
            border: TableBorder.symmetric(inside: BorderSide(color: RgbHelper.color(rgbo: app.dividerColor))),
            children: [
//            TableRow(children: [Text('Hi ' + member.name), profilePhoto]),
              getRow(app, 'Update profile', dashboardModel!.updateProfileText!, () => _updateProfile(context, app, member)),
              getRow(app, 'Retrieve data', dashboardModel.retrieveDataText!, () => _retrieveData(context, dashboardModel, app, member)),
              getRow(app, 'Delete account', dashboardModel.deleteDataText!, () => _deleteAccount(context, dashboardModel, app, member)),
            ],
          )
        ],
      );
    } else {
      return Text("You need to login to access your account");
    }
  }

  void _updateProfile(BuildContext context, AppModel? app, MemberModel member) async {
    await Navigator.of(context).push(pageRouteBuilder(app,
        page: MultiBlocProvider(
            providers: [
              BlocProvider<MemberListBloc>(
                create: (context) =>
                MemberListBloc(memberRepository: memberRepository()!,
                )
                  ..add(LoadMemberList()),
              )
            ],
            child: MemberForm(
                value: member,
                formAction: FormAction.UpdateAction))));
  }

  void _retrieveData(BuildContext context, MemberDashboardModel? dashboardModel, AppModel? app, MemberModel member) {
    DialogStatefulWidgetHelper.openIt(
        context,
        YesNoDialog.confirmDialog(
          message: 'You are about to send a request to gather all your data and send this as an email to your registered email address: ' + member.email! + '. Please confirm',
          yesFunction: () async {
            Navigator.pop(context);
            await GDPR.dumpMemberData(app!.documentID, dashboardModel!.retrieveDataEmailSubject, app.email, AccessBloc.getState(context).getMemberCollectionInfo()!);
            DialogStatefulWidgetHelper.openIt(
                context,
                WidgetDialog(
                    title: 'Photo',
                    widget: Text('You will receive an email at your registered email address ' + member.email! + ' with the data you have with us.'),
                    yesFunction: () => Navigator.of(context).pop()));
          },
          noFunction: () => Navigator.pop(context),
        ));
  }

  void _deleteAccount(BuildContext context, MemberDashboardModel? dashboardModel, AppModel? app, MemberModel member) {
    DialogStatefulWidgetHelper.openIt(
        context,
        YesNoDialog.confirmDialog(
          title: 'Confirm. Last but 2 warnings',
          message: 'You are about to send a request to destroy your account with all data. You will get 2 more requests to confirm. Please confirm',
          yesFunction: () async {
            Navigator.pop(context);
            _confirmDeleteAccount(context, dashboardModel, app, member, AccessBloc.getState(context).getMemberCollectionInfo());
          },
          noFunction: () => Navigator.pop(context),
        ));
  }

  void _confirmDeleteAccount(BuildContext context, MemberDashboardModel? dashboardModel, AppModel? app, MemberModel member, List<MemberCollectionInfo>? memberCollectionInfo) {
    DialogStatefulWidgetHelper.openIt(
        context,
        YesNoDialog.confirmDialog(
          title: 'Confirm. Last but 1 warning',
          message: 'You are about to send a request to destroy your account with all data. You will get 1 more requests to confirm. Please confirm',
          yesFunction: () async {
            Navigator.pop(context);
            _reConfirmDeleteAccount(context, dashboardModel, app, member, memberCollectionInfo);
          },
          noFunction: () => Navigator.pop(context),
        ));
  }

  void _reConfirmDeleteAccount(BuildContext context, MemberDashboardModel? dashboardModel, AppModel? app, MemberModel member, List<MemberCollectionInfo>? memberCollectionInfo) {
    DialogStatefulWidgetHelper.openIt(
        context,
        YesNoDialog.confirmDialog(
          title: 'Confirm. Last warning',
          message: 'You are about to send a request to destroy your account with all data. THIS WILL BE FINAL. You will loose all your data. Be careful. Please confirm',
          yesFunction: () async {
            Navigator.pop(context);
            await GDPR.deleteMemberData(member, app!.documentID, dashboardModel!.deleteDataEmailSubject, app.email, dashboardModel.deleteDataEmailMessage, memberCollectionInfo!);
            BlocProvider.of<AccessBloc>(context).add(LogoutEvent());
          },
          noFunction: () => Navigator.pop(context),
        ));
  }

  @override
  MemberDashboardRepository getMemberDashboardRepository(BuildContext context) {
    return memberDashboardRepository(appId: AccessBloc.appId(context))!;
  }
}
