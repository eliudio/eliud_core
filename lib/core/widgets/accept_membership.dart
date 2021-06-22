import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_event.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/member_medium_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'member_medium_dialog.dart';

class AcceptMembershipWidget extends StatefulWidget {
  static double width(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.8;
  static double height(BuildContext context) =>
      MediaQuery.of(context).size.height * 0.6;

  final AppModel app;
  final MemberModel member;
  final User usr;

  const AcceptMembershipWidget(
    this.app,
    this.member,
    this.usr, {
    Key? key,
  }) : super(key: key);

  @override
  _AcceptMembershipWidgetState createState() => _AcceptMembershipWidgetState();
}

class CheckboxHandler {
  final MemberMediumModel? item;
  bool? value;

  CheckboxHandler(this.value, this.item);

  void handle(newValue) {
    value = newValue;
  }
}

class _AcceptMembershipWidgetState extends State<AcceptMembershipWidget>
    with SingleTickerProviderStateMixin {
  late List<CheckboxHandler> checked;

  @override
  void initState() {
    super.initState();
    var app = AccessBloc.app(context)!;
    checked = app.policies!.policies!
        .map((element) => CheckboxHandler(false, element.policy))
        .toList();
  }

  @override
  void dispose() {
    super.dispose();
  }

  bool _allEnabled(AppModel app) {
    for (var i = 0; i < app.policies!.policies!.length; i++) {
      if (!checked[i].value!) return false;
    }
    return true;
  }

  void _openPolicy(String? title, MemberMediumModel item) {
    StyleRegistry.registry()
        .styleWithContext(context)
        .frontEndStyle().dialogStyle()
        .openWidgetDialog(
          context,
          child: MemberMediumDialog(
            width: 100,
            title: title,
            memberMediumModel: item,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    var app = AccessBloc.app(context)!;
    var accessState = AccessBloc.getState(context);
    var contents = <Widget>[];

    var i = 0;
    app.policies!.policies!.forEach((policy) {
      var handler = checked[i];
      contents.add(Row(children: [
        Container(
            height: 40,
            child: Center(
                child: Checkbox(
              value: handler.value,
              onChanged: (newValue) {
                setState(() {
                  handler.value = newValue;
                });
              },
            ))),
        Spacer(),
/*
            Container(
                height: 30, width: 200, child: Center(child: Text(policy.name))),
*/
        Text(policy.name!),
        Spacer(),StyleRegistry.registry().styleWithContext(context).frontEndStyle().buttonStyle().button(context, label: 'Read',
                    onPressed: () async {
                      _openPolicy(policy.name, handler.item!);
                    }),
      ]));
      i++;
    });

    return StyleRegistry.registry()
        .styleWithContext(context)
        .frontEndStyle().containerStyle()
        .actionContainer(context,
            child: Center(
                child: Container(
              width: AcceptMembershipWidget.width(context),
              height: AcceptMembershipWidget.height(context),
              child: addStuff(contents, app),
              //padding: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    )
                  ]),
            )));
  }

  Widget addStuff(List<Widget> content, AppModel app) {
    var widgets = <Widget>[
      Center(
          child: Text('Read and accept policies',
              style: TextStyle(
                  color: Colors.grey[800],
                  fontWeight: FontWeight.bold,
                  fontSize: 20))),
      Divider(
        height: 10,
        color: Colors.red,
      ),
      Text(
          "Welcome! Please read the below policies. After reading, check the checkbox and finalise with the Accept button."),
      Divider(
        height: 10,
        color: Colors.red,
      ),
      Container(
          width: AcceptMembershipWidget.width(context),
          height: AcceptMembershipWidget.height(context) - 150,
          child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              children: content)),
      Divider(
        height: 10,
        color: Colors.red,
      ),
    ];
    widgets.add(Row(children: <Widget>[
      Spacer(flex: 7),
      StyleRegistry.registry().styleWithContext(context).frontEndStyle().buttonStyle().button(
            context,
            label: 'Accept',
            onPressed: _allEnabled(app)
                ? () async {
                    BlocProvider.of<AccessBloc>(context)
                        .add(AcceptedMembership(widget.member, widget.usr));
                  }
                : null,
          ),
      Spacer(),
      StyleRegistry.registry().styleWithContext(context).frontEndStyle().buttonStyle().button(
        context,
        label: 'Cancel',
        onPressed: () async {
          BlocProvider.of<AccessBloc>(context).add(LogoutEvent());
        },
      )
    ]));

    return ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        shrinkWrap: true,
        physics: ScrollPhysics(),
        children: widgets);
  }
}
