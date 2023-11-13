/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_subscription_form.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/core/blocs/access/state/access_state.dart';
import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core/core/navigate/router.dart' as eliudrouter;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/style/style_registry.dart';

import 'package:eliud_core/model/internal_component.dart';

import 'package:eliud_core/tools/enums.dart';

import 'package:eliud_core/model/model_export.dart';

import 'package:eliud_core/model/member_subscription_list_bloc.dart';
import 'package:eliud_core/model/member_subscription_list_event.dart';
import 'package:eliud_core/model/member_subscription_form_bloc.dart';
import 'package:eliud_core/model/member_subscription_form_event.dart';
import 'package:eliud_core/model/member_subscription_form_state.dart';

class MemberSubscriptionForm extends StatelessWidget {
  final AppModel app;
  final FormAction formAction;
  final MemberSubscriptionModel? value;
  final ActionModel? submitAction;

  MemberSubscriptionForm(
      {super.key,
      required this.app,
      required this.formAction,
      required this.value,
      this.submitAction});

  /// Build the MemberSubscriptionForm
  @override
  Widget build(BuildContext context) {
    //var accessState = AccessBloc.getState(context);
    var appId = app.documentID;
    if (formAction == FormAction.showData) {
      return BlocProvider<MemberSubscriptionFormBloc>(
        create: (context) => MemberSubscriptionFormBloc(
          appId,
        )..add(InitialiseMemberSubscriptionFormEvent(value: value)),
        child: _MyMemberSubscriptionForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    }
    if (formAction == FormAction.showPreloadedData) {
      return BlocProvider<MemberSubscriptionFormBloc>(
        create: (context) => MemberSubscriptionFormBloc(
          appId,
        )..add(InitialiseMemberSubscriptionFormNoLoadEvent(value: value)),
        child: _MyMemberSubscriptionForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    } else {
      return Scaffold(
          appBar: StyleRegistry.registry()
              .styleWithApp(app)
              .adminFormStyle()
              .appBarWithString(app, context,
                  title: formAction == FormAction.updateAction
                      ? 'Update MemberSubscription'
                      : 'Add MemberSubscription'),
          body: BlocProvider<MemberSubscriptionFormBloc>(
            create: (context) => MemberSubscriptionFormBloc(
              appId,
            )..add((formAction == FormAction.updateAction
                ? InitialiseMemberSubscriptionFormEvent(value: value)
                : InitialiseNewMemberSubscriptionFormEvent())),
            child: _MyMemberSubscriptionForm(
                app: app, submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}

class _MyMemberSubscriptionForm extends StatefulWidget {
  final AppModel app;
  final FormAction? formAction;
  final ActionModel? submitAction;

  _MyMemberSubscriptionForm(
      {required this.app, this.formAction, this.submitAction});

  @override
  State<_MyMemberSubscriptionForm> createState() =>
      _MyMemberSubscriptionFormState(formAction);
}

class _MyMemberSubscriptionFormState extends State<_MyMemberSubscriptionForm> {
  final FormAction? formAction;
  late MemberSubscriptionFormBloc _myFormBloc;

  String? _app;

  _MyMemberSubscriptionFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<MemberSubscriptionFormBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<MemberSubscriptionFormBloc, MemberSubscriptionFormState>(
        builder: (context, state) {
      if (state is MemberSubscriptionFormUninitialized) {
        return Center(
          child: StyleRegistry.registry()
              .styleWithApp(widget.app)
              .adminListStyle()
              .progressIndicator(widget.app, context),
        );
      }

      if (state is MemberSubscriptionFormLoaded) {
        if (state.value!.app != null) {
          _app = state.value!.app!.documentID;
        } else {
          _app = "";
        }
      }
      if (state is MemberSubscriptionFormInitialized) {
        List<Widget> children = [];
        children.add(Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: StyleRegistry.registry()
                .styleWithApp(widget.app)
                .adminFormStyle()
                .groupTitle(widget.app, context, 'General')));

        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .divider(widget.app, context));

        children.add(Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: StyleRegistry.registry()
                .styleWithApp(widget.app)
                .adminFormStyle()
                .groupTitle(widget.app, context, 'App')));

        children.add(
          DropdownButtonComponentFactory().createNew(
              app: widget.app,
              id: "apps",
              value: _app,
              trigger: (value, privilegeLevel) => _onAppSelected(value),
              optional: false),
        );

        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .divider(widget.app, context));

        if ((formAction != FormAction.showData) &&
            (formAction != FormAction.showPreloadedData)) {
          children.add(StyleRegistry.registry()
              .styleWithApp(widget.app)
              .adminFormStyle()
              .button(
                widget.app,
                context,
                label: 'Submit',
                onPressed: _readOnly(accessState, state)
                    ? null
                    : () {
                        if (state is MemberSubscriptionFormError) {
                          return;
                        } else {
                          if (formAction == FormAction.updateAction) {
                            BlocProvider.of<MemberSubscriptionListBloc>(context)
                                .add(UpdateMemberSubscriptionList(
                                    value: state.value!.copyWith(
                              documentID: state.value!.documentID,
                              app: state.value!.app,
                            )));
                          } else {
                            BlocProvider.of<MemberSubscriptionListBloc>(context)
                                .add(AddMemberSubscriptionList(
                                    value: MemberSubscriptionModel(
                              documentID: state.value!.documentID,
                              app: state.value!.app,
                            )));
                          }
                          if (widget.submitAction != null) {
                            eliudrouter.Router.navigateTo(
                                context, widget.submitAction!);
                          } else {
                            Navigator.pop(context);
                          }
                        }
                      },
              ));
        }

        return StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .container(
                widget.app,
                context,
                Form(
                  child: ListView(
                      padding: const EdgeInsets.all(8),
                      physics: ((formAction == FormAction.showData) ||
                              (formAction == FormAction.showPreloadedData))
                          ? NeverScrollableScrollPhysics()
                          : null,
                      shrinkWrap: ((formAction == FormAction.showData) ||
                          (formAction == FormAction.showPreloadedData)),
                      children: children),
                ),
                formAction!);
      } else {
        return StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminListStyle()
            .progressIndicator(widget.app, context);
      }
    });
  }

  void _onAppSelected(String? val) {
    setState(() {
      _app = val;
    });
    _myFormBloc.add(ChangedMemberSubscriptionApp(value: val));
  }

  @override
  void dispose() {
    super.dispose();
  }

  /// Is the form read-only?
  bool _readOnly(
      AccessState accessState, MemberSubscriptionFormInitialized state) {
    return (formAction == FormAction.showData) ||
        (formAction == FormAction.showPreloadedData) ||
        (!accessState.memberIsOwner(widget.app.documentID));
  }
}
