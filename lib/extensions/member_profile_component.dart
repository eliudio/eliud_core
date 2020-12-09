import 'package:eliud_core/core/access/bloc/access_state.dart';
import 'package:eliud_core/tools/component_constructor.dart';
import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_event.dart';
import 'package:eliud_core/model/member_form.dart';
import 'package:eliud_core/model/member_list_bloc.dart';
import 'package:eliud_core/model/member_list_event.dart';
import 'package:eliud_core/tools/enums.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/tools/router_builders.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:flutter/material.dart';

class MemberProfileConstructorDefault implements ComponentConstructor {
  static String MEMBER_PROFILE_COMPONENT_IDENTIFIER = 'memberProfile';

  @override
  Widget createNew({String id, Map<String, Object> parameters}) {
      return MemberProfileComponent();
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
    var accessBloc = AccessBloc.getBloc(context);
    var accessState = AccessBloc.getState(context);
    if (accessState is LoggedIn) {
      var app = accessState.app;
      var widgets = <Widget>[];
      var style = TextStyle(
          color: RgbHelper.color(rgbo: app.formFieldTextColor), fontSize: 15);
      widgets.add(Text('Hello ' + accessState
          .member
          .name + '!', style: style));
      widgets.add(Text(''));
      widgets.add(
          Text('On this page you can update your profile', style: style));
      widgets.add(Text(
          'In line with GDPR, we allow you to delete your account with us. Deleting your account means all your information stored in our databases will be DESTROYED. There will be no possibility to recover this data.',
          style: style));
      widgets.add(Text(''));
      widgets.add(Row(children: <Widget>[
        RaisedButton(
          color: RgbHelper.color(rgbo: app.formSubmitButtonColor),
          onPressed: () async {
            await Navigator.of(context).push(pageRouteBuilder(app,
                page: MultiBlocProvider(
                    providers: [
                      BlocProvider<MemberListBloc>(
                        create: (context) =>
                        MemberListBloc(accessBloc,
                          memberRepository: memberRepository(),
                        )
                          ..add(LoadMemberList()),
                      )
                    ],
                    child: MemberForm(
                        value: accessState.member,
                        formAction: FormAction.UpdateAction))));
          },
          child: Text('Update my profile',
              style: TextStyle(
                  color: RgbHelper.color(
                      rgbo: app.formSubmitButtonTextColor))),
        ),
        Container(width: 10),
        RaisedButton(
          color: RgbHelper.color(rgbo: app.formSubmitButtonColor),
          onPressed: () async {
            showAlert(context, accessState);
          },
          child: Text('Forget me!',
              style: TextStyle(
                  color: RgbHelper.color(
                      rgbo: app.formSubmitButtonTextColor))),
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
    } else {
        return AlertWidget(
            title: 'Error',
            content: "You're not logged on, so you're not supposed to be here");
    }
  }

  void showAlert(BuildContext context, LoggedIn state) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete yourself'),
          content: Text('Are you sure you want to proceed? All data will be destroyed. This action cannot be reverted.'),
          actions: <Widget>[
            FlatButton(
              child: Text('YES'),
              onPressed: () {
                memberRepository().delete(state.member);
                BlocProvider.of<AccessBloc>(context).add(LogoutEvent());
              },
            ),

            FlatButton(
              child: Text('NO'),
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

