import 'dart:math';
import 'package:eliud_core/access/access_bloc.dart';
import 'package:eliud_core/core/widgets/member_widgets/platform_medium_dialog.dart';
import 'package:eliud_core_model/model/abstract_repository_singleton.dart';
import 'package:eliud_core_main/model/app_model.dart';
import 'package:eliud_core_model/model/app_policy_model.dart';
import 'package:eliud_core_main/model/member_model.dart';
import 'package:eliud_core_main/apis/style/frontend/has_button.dart';
import 'package:eliud_core_main/apis/style/frontend/has_container.dart';
import 'package:eliud_core_main/apis/style/frontend/has_dialog.dart';
import 'package:eliud_core_main/apis/style/frontend/has_progress_indicator.dart';
import 'package:eliud_core_main/apis/style/frontend/has_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../access/access_event.dart';
import '../helper_widgets/header_widget.dart';

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
    super.key,
  });

  @override
  State<AcceptMembershipWidget> createState() => _AcceptMembershipWidgetState();
}

class CheckboxHandler {
  final AppPolicyModel item;
  bool? value;

  CheckboxHandler(this.value, this.item);

  void handle(newValue) {
    value = newValue;
  }
}

typedef CheckboxFeedBack = void Function(CheckboxHandler newValue);

class _AcceptMembershipWidgetState extends State<AcceptMembershipWidget>
    with SingleTickerProviderStateMixin {
  List<CheckboxHandler>? checked;
  List<AppPolicyModel>? policies;

  bool _allEnabled(AppModel app) {
    if (policies == null) return true;
    if (checked == null) return false;
    for (var i = 0; i < checked!.length; i++) {
      if (!checked![i].value!) return false;
    }
    return true;
  }

  Future<List<AppPolicyModel>> getPolicies() async {
    if (policies == null) {
      var appPolicies = await appPolicyRepository(appId: widget.app.documentID)!
          .valuesListWithDetails();
      policies = <AppPolicyModel>[];
      checked = <CheckboxHandler>[];
      for (var appPolicy in appPolicies) {
        if (appPolicy != null) {
          policies!.add(appPolicy);
          var cbh = CheckboxHandler(false, appPolicy);
          checked!.add(cbh);
        }
      }
    }
    return policies!;
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
        okAction: _allEnabled(app)
            ? () async {
                BlocProvider.of<AccessBloc>(context).add(
                    AcceptedMembershipEvent(
                        widget.app, widget.member, widget.usr));
                return false;
              }
            : null,
        cancelAction: () async {
          BlocProvider.of<AccessBloc>(context)
              .add(LogoutEvent(app: widget.app));
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
                  return AcceptPoliciesWidget(
                    app: widget.app,
                    policies: policies!,
                    checked: checked!,
                    feedback: (_) {
                      setState(() {});
                    },
                  );
                } else {
                  return progressIndicator(widget.app, context);
                }
              })),
    ];

    return ListView(
        shrinkWrap: true, physics: ScrollPhysics(), children: widgets);
  }
}

class AcceptPoliciesWidget extends StatefulWidget {
  final List<AppPolicyModel> policies;
  final List<CheckboxHandler> checked;
  final AppModel app;
  final CheckboxFeedBack feedback;

  const AcceptPoliciesWidget({
    required this.app,
    required this.policies,
    required this.checked,
    required this.feedback,
    super.key,
  });

  @override
  State<AcceptPoliciesWidget> createState() => _AcceptPoliciesWidgetState();
}

class _AcceptPoliciesWidgetState extends State<AcceptPoliciesWidget>
    with SingleTickerProviderStateMixin {
  void _openPolicy(String? title, AppPolicyModel policy) {
    if (policy.policy != null) {
      var item = policy.policy!;
      openWidgetDialog(
        widget.app,
        context,
        ('${widget.app.documentID}/_policy'),
        child: PlatformMediumDialog(
          app: widget.app,
          width: 100,
          title: title,
          platformMediumModel: item,
        ),
      );
    } else {
      openErrorDialog(widget.app, context, '${widget.app.documentID}/_error',
          title: 'Problem', errorMessage: 'Policy has no pages');
    }
  }

  @override
  Widget build(BuildContext context) {
    var contents = <Widget>[];

    var i = 0;
//    if (widget.policies != null) {
    for (var policy in widget.policies) {
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
                  widget.feedback(handler);
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
    }
/*
    } else {
      contents.add(text(widget.app, context, 'No policies to approve'));
    }
*/
    return ListView(children: contents);
  }
}
