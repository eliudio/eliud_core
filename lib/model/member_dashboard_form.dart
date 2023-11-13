/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_dashboard_form.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/core/blocs/access/state/access_state.dart';
import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core/core/navigate/router.dart' as eliudrouter;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/style/style_registry.dart';

import 'package:eliud_core/tools/enums.dart';

import 'package:eliud_core/model/model_export.dart';

import 'package:eliud_core/model/member_dashboard_list_bloc.dart';
import 'package:eliud_core/model/member_dashboard_list_event.dart';
import 'package:eliud_core/model/member_dashboard_form_bloc.dart';
import 'package:eliud_core/model/member_dashboard_form_event.dart';
import 'package:eliud_core/model/member_dashboard_form_state.dart';

class MemberDashboardForm extends StatelessWidget {
  final AppModel app;
  final FormAction formAction;
  final MemberDashboardModel? value;
  final ActionModel? submitAction;

  MemberDashboardForm(
      {super.key,
      required this.app,
      required this.formAction,
      required this.value,
      this.submitAction});

  /// Build the MemberDashboardForm
  @override
  Widget build(BuildContext context) {
    //var accessState = AccessBloc.getState(context);
    var appId = app.documentID;
    if (formAction == FormAction.showData) {
      return BlocProvider<MemberDashboardFormBloc>(
        create: (context) => MemberDashboardFormBloc(
          appId,
          formAction: formAction,
        )..add(InitialiseMemberDashboardFormEvent(value: value)),
        child: _MyMemberDashboardForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    }
    if (formAction == FormAction.showPreloadedData) {
      return BlocProvider<MemberDashboardFormBloc>(
        create: (context) => MemberDashboardFormBloc(
          appId,
          formAction: formAction,
        )..add(InitialiseMemberDashboardFormNoLoadEvent(value: value)),
        child: _MyMemberDashboardForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    } else {
      return Scaffold(
          appBar: StyleRegistry.registry()
              .styleWithApp(app)
              .adminFormStyle()
              .appBarWithString(app, context,
                  title: formAction == FormAction.updateAction
                      ? 'Update MemberDashboard'
                      : 'Add MemberDashboard'),
          body: BlocProvider<MemberDashboardFormBloc>(
            create: (context) => MemberDashboardFormBloc(
              appId,
              formAction: formAction,
            )..add((formAction == FormAction.updateAction
                ? InitialiseMemberDashboardFormEvent(value: value)
                : InitialiseNewMemberDashboardFormEvent())),
            child: _MyMemberDashboardForm(
                app: app, submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}

class _MyMemberDashboardForm extends StatefulWidget {
  final AppModel app;
  final FormAction? formAction;
  final ActionModel? submitAction;

  _MyMemberDashboardForm(
      {required this.app, this.formAction, this.submitAction});

  @override
  State<_MyMemberDashboardForm> createState() =>
      _MyMemberDashboardFormState(formAction);
}

class _MyMemberDashboardFormState extends State<_MyMemberDashboardForm> {
  final FormAction? formAction;
  late MemberDashboardFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  final TextEditingController _appIdController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _updateProfileTextController =
      TextEditingController();
  final TextEditingController _retrieveDataTextController =
      TextEditingController();
  final TextEditingController _deleteDataTextController =
      TextEditingController();
  final TextEditingController _retrieveDataEmailSubjectController =
      TextEditingController();
  final TextEditingController _deleteDataEmailSubjectController =
      TextEditingController();
  final TextEditingController _deleteDataEmailMessageController =
      TextEditingController();

  _MyMemberDashboardFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<MemberDashboardFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
    _appIdController.addListener(_onAppIdChanged);
    _descriptionController.addListener(_onDescriptionChanged);
    _updateProfileTextController.addListener(_onUpdateProfileTextChanged);
    _retrieveDataTextController.addListener(_onRetrieveDataTextChanged);
    _deleteDataTextController.addListener(_onDeleteDataTextChanged);
    _retrieveDataEmailSubjectController
        .addListener(_onRetrieveDataEmailSubjectChanged);
    _deleteDataEmailSubjectController
        .addListener(_onDeleteDataEmailSubjectChanged);
    _deleteDataEmailMessageController
        .addListener(_onDeleteDataEmailMessageChanged);
  }

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<MemberDashboardFormBloc, MemberDashboardFormState>(
        builder: (context, state) {
      if (state is MemberDashboardFormUninitialized) {
        return Center(
          child: StyleRegistry.registry()
              .styleWithApp(widget.app)
              .adminListStyle()
              .progressIndicator(widget.app, context),
        );
      }

      if (state is MemberDashboardFormLoaded) {
        _documentIDController.text = state.value!.documentID.toString();
        _appIdController.text = state.value!.appId.toString();
        _descriptionController.text = state.value!.description.toString();
        _updateProfileTextController.text =
            state.value!.updateProfileText.toString();
        _retrieveDataTextController.text =
            state.value!.retrieveDataText.toString();
        _deleteDataTextController.text = state.value!.deleteDataText.toString();
        _retrieveDataEmailSubjectController.text =
            state.value!.retrieveDataEmailSubject.toString();
        _deleteDataEmailSubjectController.text =
            state.value!.deleteDataEmailSubject.toString();
        _deleteDataEmailMessageController.text =
            state.value!.deleteDataEmailMessage.toString();
      }
      if (state is MemberDashboardFormInitialized) {
        List<Widget> children = [];
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
                validator: (_) => state is DocumentIDMemberDashboardFormError
                    ? state.message
                    : null,
                hintText: null));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'App Identifier',
                icon: Icons.text_format,
                readOnly: _readOnly(accessState, state),
                textEditingController: _appIdController,
                keyboardType: TextInputType.text,
                validator: (_) => state is AppIdMemberDashboardFormError
                    ? state.message
                    : null,
                hintText: 'field.remark'));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Description',
                icon: Icons.text_format,
                readOnly: _readOnly(accessState, state),
                textEditingController: _descriptionController,
                keyboardType: TextInputType.text,
                validator: (_) => state is DescriptionMemberDashboardFormError
                    ? state.message
                    : null,
                hintText: null));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Update Profile Text',
                icon: Icons.text_format,
                readOnly: _readOnly(accessState, state),
                textEditingController: _updateProfileTextController,
                keyboardType: TextInputType.text,
                validator: (_) =>
                    state is UpdateProfileTextMemberDashboardFormError
                        ? state.message
                        : null,
                hintText: 'field.remark'));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Retrieve Data Text',
                icon: Icons.text_format,
                readOnly: _readOnly(accessState, state),
                textEditingController: _retrieveDataTextController,
                keyboardType: TextInputType.text,
                validator: (_) =>
                    state is RetrieveDataTextMemberDashboardFormError
                        ? state.message
                        : null,
                hintText: 'field.remark'));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Delete Data Text',
                icon: Icons.text_format,
                readOnly: _readOnly(accessState, state),
                textEditingController: _deleteDataTextController,
                keyboardType: TextInputType.text,
                validator: (_) =>
                    state is DeleteDataTextMemberDashboardFormError
                        ? state.message
                        : null,
                hintText: 'field.remark'));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Retrieve Data Email Subject',
                icon: Icons.text_format,
                readOnly: _readOnly(accessState, state),
                textEditingController: _retrieveDataEmailSubjectController,
                keyboardType: TextInputType.text,
                validator: (_) =>
                    state is RetrieveDataEmailSubjectMemberDashboardFormError
                        ? state.message
                        : null,
                hintText: 'field.remark'));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Delete Data Email Subject',
                icon: Icons.text_format,
                readOnly: _readOnly(accessState, state),
                textEditingController: _deleteDataEmailSubjectController,
                keyboardType: TextInputType.text,
                validator: (_) =>
                    state is DeleteDataEmailSubjectMemberDashboardFormError
                        ? state.message
                        : null,
                hintText: 'field.remark'));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Delete Data Email Message',
                icon: Icons.text_format,
                readOnly: _readOnly(accessState, state),
                textEditingController: _deleteDataEmailMessageController,
                keyboardType: TextInputType.text,
                validator: (_) =>
                    state is DeleteDataEmailMessageMemberDashboardFormError
                        ? state.message
                        : null,
                hintText: 'field.remark'));

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
                .groupTitle(widget.app, context, 'Conditions')));

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
                        if (state is MemberDashboardFormError) {
                          return;
                        } else {
                          if (formAction == FormAction.updateAction) {
                            BlocProvider.of<MemberDashboardListBloc>(context)
                                .add(UpdateMemberDashboardList(
                                    value: state.value!.copyWith(
                              documentID: state.value!.documentID,
                              appId: state.value!.appId,
                              description: state.value!.description,
                              updateProfileText: state.value!.updateProfileText,
                              retrieveDataText: state.value!.retrieveDataText,
                              deleteDataText: state.value!.deleteDataText,
                              retrieveDataEmailSubject:
                                  state.value!.retrieveDataEmailSubject,
                              deleteDataEmailSubject:
                                  state.value!.deleteDataEmailSubject,
                              deleteDataEmailMessage:
                                  state.value!.deleteDataEmailMessage,
                              conditions: state.value!.conditions,
                            )));
                          } else {
                            BlocProvider.of<MemberDashboardListBloc>(context)
                                .add(AddMemberDashboardList(
                                    value: MemberDashboardModel(
                              documentID: state.value!.documentID,
                              appId: state.value!.appId,
                              description: state.value!.description,
                              updateProfileText: state.value!.updateProfileText,
                              retrieveDataText: state.value!.retrieveDataText,
                              deleteDataText: state.value!.deleteDataText,
                              retrieveDataEmailSubject:
                                  state.value!.retrieveDataEmailSubject,
                              deleteDataEmailSubject:
                                  state.value!.deleteDataEmailSubject,
                              deleteDataEmailMessage:
                                  state.value!.deleteDataEmailMessage,
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
    _myFormBloc.add(
        ChangedMemberDashboardDocumentID(value: _documentIDController.text));
  }

  void _onAppIdChanged() {
    _myFormBloc.add(ChangedMemberDashboardAppId(value: _appIdController.text));
  }

  void _onDescriptionChanged() {
    _myFormBloc.add(
        ChangedMemberDashboardDescription(value: _descriptionController.text));
  }

  void _onUpdateProfileTextChanged() {
    _myFormBloc.add(ChangedMemberDashboardUpdateProfileText(
        value: _updateProfileTextController.text));
  }

  void _onRetrieveDataTextChanged() {
    _myFormBloc.add(ChangedMemberDashboardRetrieveDataText(
        value: _retrieveDataTextController.text));
  }

  void _onDeleteDataTextChanged() {
    _myFormBloc.add(ChangedMemberDashboardDeleteDataText(
        value: _deleteDataTextController.text));
  }

  void _onRetrieveDataEmailSubjectChanged() {
    _myFormBloc.add(ChangedMemberDashboardRetrieveDataEmailSubject(
        value: _retrieveDataEmailSubjectController.text));
  }

  void _onDeleteDataEmailSubjectChanged() {
    _myFormBloc.add(ChangedMemberDashboardDeleteDataEmailSubject(
        value: _deleteDataEmailSubjectController.text));
  }

  void _onDeleteDataEmailMessageChanged() {
    _myFormBloc.add(ChangedMemberDashboardDeleteDataEmailMessage(
        value: _deleteDataEmailMessageController.text));
  }

  @override
  void dispose() {
    _documentIDController.dispose();
    _appIdController.dispose();
    _descriptionController.dispose();
    _updateProfileTextController.dispose();
    _retrieveDataTextController.dispose();
    _deleteDataTextController.dispose();
    _retrieveDataEmailSubjectController.dispose();
    _deleteDataEmailSubjectController.dispose();
    _deleteDataEmailMessageController.dispose();
    super.dispose();
  }

  /// Is the form read-only?
  bool _readOnly(
      AccessState accessState, MemberDashboardFormInitialized state) {
    return (formAction == FormAction.showData) ||
        (formAction == FormAction.showPreloadedData) ||
        (!accessState.memberIsOwner(widget.app.documentID));
  }
}
