import 'package:eliud_core/tools/component_constructor.dart';
import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_event.dart';
import 'package:eliud_core/core/global_data.dart';
import 'package:eliud_core/model/member_form.dart';
import 'package:eliud_core/model/member_list_bloc.dart';
import 'package:eliud_core/model/member_list_event.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/component_constructor.dart';
import 'package:eliud_core/tools/enums.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:eliud_core/tools/router_builders.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:flutter/material.dart';

class MemberProfileConstructorDefault implements ComponentConstructor {
  static String MEMBER_PROFILE_COMPONENT_IDENTIFIER = "memberProfile";

  Widget createNew({String id, Map<String, String> parameters}) {
    if (!GlobalData.isLoggedOn()) {
      return AlertWidget(
          title: "Error",
          content: "You're not logged on, so you're not supposed to be here");
    } else {
      return MemberProfileComponent();
    }
  }
}

class MemberProfileComponent extends StatefulWidget {
  MemberProfileComponent();

  @override
  State<StatefulWidget> createState() {
    return MemberProfileState();
  }
}

class MemberProfileState extends State<MemberProfileComponent> {
  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = List();
    TextStyle style = TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor), fontSize: 15);
    widgets.add(Text("Hello " + GlobalData.member().name + "!", style: style));
    widgets.add(Text(""));
    widgets.add(Text("On this page you can update your profile", style: style));
    widgets.add(Text("In line with GDPR, we allow you to delete your account with us. Deleting your account means all your information stored in our databases will be DESTROYED. There will be no possibility to recover this data.", style: style));
    widgets.add(Text(""));
    widgets.add(Row(children: <Widget>[
      RaisedButton(
        color: RgbHelper.color(rgbo: GlobalData.app().formSubmitButtonColor),
        onPressed: () async {
          await Navigator.of(context).push(pageRouteBuilder(
              page: MultiBlocProvider(
                  providers: [
                BlocProvider<MemberListBloc>(
                  create: (context) => MemberListBloc(
                    memberRepository: AbstractRepositorySingleton.singleton
                        .memberRepository(),
                  )..add(LoadMemberList()),
                )
              ],
                  child: MemberForm(
                      value: GlobalData.member(),
                      formAction: FormAction.UpdateAction))));
        },
        child: Text('Update my profile',
            style: TextStyle(
                color: RgbHelper.color(
                    rgbo: GlobalData.app().formSubmitButtonTextColor))),
      ),
      Container(width: 10),
      RaisedButton(
        color: RgbHelper.color(rgbo: GlobalData.app().formSubmitButtonColor),
        onPressed: () async {
          showAlert(context);
        },
        child: Text('Forget me!',
            style: TextStyle(
                color: RgbHelper.color(
                    rgbo: GlobalData.app().formSubmitButtonTextColor))),
      ),
    ]));

    return Container(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: widgets.length,
          itemBuilder: (BuildContext context, int index) {
            return widgets[index];
          },
        ));
  }

  showAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete yourself'),
          content: Text("Are you sure you want to proceed? All data will be destroyed. This action cannot be reverted."),
          actions: <Widget>[
            FlatButton(
              child: Text("YES"),
              onPressed: () {
                AbstractRepositorySingleton.singleton.memberRepository().delete(GlobalData.member());
                BlocProvider.of<AccessBloc>(context).add(LogoutEvent());
              },
            ),

            FlatButton(
              child: Text("NO"),
              onPressed: () {
                //Put your code here which you want to execute on No button click.
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

