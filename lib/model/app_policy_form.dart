/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 app_policy_form.dart
                       
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

import 'package:eliud_core/model/app_policy_list_bloc.dart';
import 'package:eliud_core/model/app_policy_list_event.dart';
import 'package:eliud_core/model/app_policy_form_bloc.dart';
import 'package:eliud_core/model/app_policy_form_event.dart';
import 'package:eliud_core/model/app_policy_form_state.dart';

class AppPolicyForm extends StatelessWidget {
  final AppModel app;
  final FormAction formAction;
  final AppPolicyModel? value;
  final ActionModel? submitAction;

  AppPolicyForm(
      {super.key,
      required this.app,
      required this.formAction,
      required this.value,
      this.submitAction});

  /// Build the AppPolicyForm
  @override
  Widget build(BuildContext context) {
    //var accessState = AccessBloc.getState(context);
    var appId = app.documentID;
    if (formAction == FormAction.showData) {
      return BlocProvider<AppPolicyFormBloc>(
        create: (context) => AppPolicyFormBloc(
          appId,
          formAction: formAction,
        )..add(InitialiseAppPolicyFormEvent(value: value)),
        child: _MyAppPolicyForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    }
    if (formAction == FormAction.showPreloadedData) {
      return BlocProvider<AppPolicyFormBloc>(
        create: (context) => AppPolicyFormBloc(
          appId,
          formAction: formAction,
        )..add(InitialiseAppPolicyFormNoLoadEvent(value: value)),
        child: _MyAppPolicyForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    } else {
      return Scaffold(
          appBar: StyleRegistry.registry()
              .styleWithApp(app)
              .adminFormStyle()
              .appBarWithString(app, context,
                  title: formAction == FormAction.updateAction
                      ? 'Update AppPolicy'
                      : 'Add AppPolicy'),
          body: BlocProvider<AppPolicyFormBloc>(
            create: (context) => AppPolicyFormBloc(
              appId,
              formAction: formAction,
            )..add((formAction == FormAction.updateAction
                ? InitialiseAppPolicyFormEvent(value: value)
                : InitialiseNewAppPolicyFormEvent())),
            child: _MyAppPolicyForm(
                app: app, submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}

class _MyAppPolicyForm extends StatefulWidget {
  final AppModel app;
  final FormAction? formAction;
  final ActionModel? submitAction;

  _MyAppPolicyForm({required this.app, this.formAction, this.submitAction});

  @override
  State<_MyAppPolicyForm> createState() => _MyAppPolicyFormState(formAction);
}

class _MyAppPolicyFormState extends State<_MyAppPolicyForm> {
  final FormAction? formAction;
  late AppPolicyFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  String? _policy;

  _MyAppPolicyFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<AppPolicyFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
    _nameController.addListener(_onNameChanged);
  }

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<AppPolicyFormBloc, AppPolicyFormState>(
        builder: (context, state) {
      if (state is AppPolicyFormUninitialized) {
        return Center(
          child: StyleRegistry.registry()
              .styleWithApp(widget.app)
              .adminListStyle()
              .progressIndicator(widget.app, context),
        );
      }

      if (state is AppPolicyFormLoaded) {
        _documentIDController.text = state.value!.documentID.toString();
        _nameController.text = state.value!.name.toString();
        if (state.value!.policy != null) {
          _policy = state.value!.policy!.documentID;
        } else {
          _policy = "";
        }
      }
      if (state is AppPolicyFormInitialized) {
        List<Widget> children = [];
        children.add(Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: StyleRegistry.registry()
                .styleWithApp(widget.app)
                .adminFormStyle()
                .groupTitle(widget.app, context, 'General')));

        children.add(
          DropdownButtonComponentFactory().createNew(
              app: widget.app,
              id: "platformMediums",
              value: _policy,
              trigger: (value, privilegeLevel) => _onPolicySelected(value),
              optional: false),
        );

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
                .groupTitle(widget.app, context, 'General')));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Document ID',
                icon: Icons.vpn_key,
                readOnly: (formAction == FormAction.updateAction),
                textEditingController: _documentIDController,
                keyboardType: TextInputType.text,
                validator: (_) => state is DocumentIDAppPolicyFormError
                    ? state.message
                    : null,
                hintText: null));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Name',
                icon: Icons.text_format,
                readOnly: _readOnly(accessState, state),
                textEditingController: _nameController,
                keyboardType: TextInputType.text,
                validator: (_) =>
                    state is NameAppPolicyFormError ? state.message : null,
                hintText: null));

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
                .groupTitle(widget.app, context, 'Policies')));

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
                        if (state is AppPolicyFormError) {
                          return;
                        } else {
                          if (formAction == FormAction.updateAction) {
                            BlocProvider.of<AppPolicyListBloc>(context)
                                .add(UpdateAppPolicyList(
                                    value: state.value!.copyWith(
                              documentID: state.value!.documentID,
                              appId: state.value!.appId,
                              name: state.value!.name,
                              policy: state.value!.policy,
                              conditions: state.value!.conditions,
                            )));
                          } else {
                            BlocProvider.of<AppPolicyListBloc>(context)
                                .add(AddAppPolicyList(
                                    value: AppPolicyModel(
                              documentID: state.value!.documentID,
                              appId: state.value!.appId,
                              name: state.value!.name,
                              policy: state.value!.policy,
                              conditions: state.value!.conditions,
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

  void _onDocumentIDChanged() {
    _myFormBloc
        .add(ChangedAppPolicyDocumentID(value: _documentIDController.text));
  }

  void _onNameChanged() {
    _myFormBloc.add(ChangedAppPolicyName(value: _nameController.text));
  }

  void _onPolicySelected(String? val) {
    setState(() {
      _policy = val;
    });
    _myFormBloc.add(ChangedAppPolicyPolicy(value: val));
  }

  @override
  void dispose() {
    _documentIDController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  /// Is the form read-only?
  bool _readOnly(AccessState accessState, AppPolicyFormInitialized state) {
    return (formAction == FormAction.showData) ||
        (formAction == FormAction.showPreloadedData) ||
        (!accessState.memberIsOwner(widget.app.documentID));
  }
}
