import 'dart:math';

import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:eliud_core/core/blocs/access/access_event.dart';
import 'package:eliud_core/core/widgets/public_medium_dialog.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/model/public_medium_model.dart';
import 'package:eliud_core/style/frontend/has_button.dart';
import 'package:eliud_core/style/frontend/has_container.dart';
import 'package:eliud_core/style/frontend/has_dialog.dart';
import 'package:eliud_core/style/frontend/has_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/abstract_repository_singleton.dart';
import '../../model/app_policy_model.dart';
import '../../style/frontend/has_progress_indicator.dart';
import '../../tools/widgets/header_widget.dart';

class AcceptMembershipWidget extends StatefulWidget {
  static double width(BuildContext context) =>
      MediaQuery.of(context).size.width;
  static double height(BuildContext context) =>
      MediaQuery.of(context).size.height * .8;

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
  final AppPolicyModel item;
  bool? value;

  CheckboxHandler(this.value, this.item);

  void handle(newValue) {
    value = newValue;
  }
}

class _AcceptMembershipWidgetState extends State<AcceptMembershipWidget>
    with SingleTickerProviderStateMixin {
  late List<CheckboxHandler> checked;
  late List<AppPolicyModel> policies;

  bool _allEnabled(AppModel app) {
    for (var i = 0; i < policies.length; i++) {
      if (!checked[i].value!) return false;
    }
    return true;
  }

  Future<List<AppPolicyModel>> getPolicies() async {
    var appPolicies = await appPolicyRepository(appId: widget.app.documentID)!.valuesList();
    var newAppPolicies = <AppPolicyModel>[];
    for (var appPolicy in appPolicies) {
      if (appPolicy != null) {
        newAppPolicies.add(appPolicy);
        checked.add(CheckboxHandler(false, appPolicy));
      }
    }
    policies = newAppPolicies;

    return newAppPolicies;
  }

  @override
  Widget build(BuildContext context) {
    return actionContainer(widget.app, context,
        child: Center(
            child: Container(
              width: AcceptMembershipWidget.width(context),
              height: AcceptMembershipWidget.height(context),
              child: addStuff(widget.app),
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

  Widget addStuff(AppModel app) {
    var height = AcceptMembershipWidget.height(context);
    var widgets = <Widget>[
      HeaderWidget(
        app: widget.app,
        title: 'Read and Accept Policies',
        okAction: _allEnabled(app) ? () async {
          BlocProvider.of<AccessBloc>(context).add(
              AcceptedMembershipEvent(
                  widget.app, widget.member, widget.usr));
          return false;
        } : null,
        cancelAction: () async {
          BlocProvider.of<AccessBloc>(context).add(LogoutEvent(app: widget.app));
          return false;
        },
      ),
      Container(
          width: AcceptMembershipWidget.width(context),
          height: max(height - 100, 0),
          child: FutureBuilder<List<AppPolicyModel>>(
              future: getPolicies(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return AcceptPoliciesWidget(app: widget.app, policies: policies, checked: checked);
                } else {
                  return progressIndicator(widget.app, context);
                }
              })
      ),
    ];

    return ListView(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        children: widgets);
  }
}

class AcceptPoliciesWidget extends StatefulWidget {
  final List<AppPolicyModel> policies;
  final List<CheckboxHandler> checked;
  final AppModel app;

  const AcceptPoliciesWidget({
        required this.app,
        required this.policies,
        required this.checked,
        Key? key,
      }) : super(key: key);

  @override
  _AcceptPoliciesWidgetState createState() => _AcceptPoliciesWidgetState();
}

class _AcceptPoliciesWidgetState extends State<AcceptPoliciesWidget>
    with SingleTickerProviderStateMixin {


  void _openPolicy(String? title, AppPolicyModel policy) {
    if (policy.policy != null) {
      var item = policy.policy!;
      openWidgetDialog(
        widget.app,
        context,
        (widget.app.documentID + '/_policy'),
        child: PublicMediumDialog(
          app: widget.app,
          width: 100,
          title: title,
          publicMediumModel: item,
        ),
      );
    } else {
        openErrorDialog(widget.app, context, widget.app.documentID + '/_error', title: 'Problem', errorMessage: 'Policy has no pages');
    }
  }

  @override
  Widget build(BuildContext context) {
    var contents = <Widget>[];

    var i = 0;
    if (widget.policies != null) {
      widget.policies.forEach((policy) {
        var handler = widget.checked[i];
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
          text(widget.app, context, policy.name!),
          Spacer(),
          button(widget.app, context, label: 'Read', onPressed: () async {
            _openPolicy(policy.name, handler.item);
          }),
        ]));
        i++;
      });
    } else {
      contents.add(text(widget.app, context, 'No policies to approve'));
    }
    return ListView(
        children: contents);
  }
}
