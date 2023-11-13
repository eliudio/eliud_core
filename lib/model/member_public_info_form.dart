/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_public_info_form.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/core/blocs/access/state/access_state.dart';
import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core/core/navigate/router.dart' as eliudrouter;
import 'package:eliud_core/tools/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/style/style_registry.dart';

import 'package:eliud_core/model/embedded_component.dart';

import 'package:eliud_core/tools/enums.dart';

import 'package:eliud_core/model/model_export.dart';

import 'package:eliud_core/model/member_public_info_list_bloc.dart';
import 'package:eliud_core/model/member_public_info_list_event.dart';
import 'package:eliud_core/model/member_public_info_form_bloc.dart';
import 'package:eliud_core/model/member_public_info_form_event.dart';
import 'package:eliud_core/model/member_public_info_form_state.dart';

class MemberPublicInfoForm extends StatelessWidget {
  final AppModel app;
  final FormAction formAction;
  final MemberPublicInfoModel? value;
  final ActionModel? submitAction;

  MemberPublicInfoForm(
      {super.key,
      required this.app,
      required this.formAction,
      required this.value,
      this.submitAction});

  /// Build the MemberPublicInfoForm
  @override
  Widget build(BuildContext context) {
    //var accessState = AccessBloc.getState(context);
    var appId = app.documentID;
    if (formAction == FormAction.showData) {
      return BlocProvider<MemberPublicInfoFormBloc>(
        create: (context) => MemberPublicInfoFormBloc(
          appId,
          formAction: formAction,
        )..add(InitialiseMemberPublicInfoFormEvent(value: value)),
        child: _MyMemberPublicInfoForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    }
    if (formAction == FormAction.showPreloadedData) {
      return BlocProvider<MemberPublicInfoFormBloc>(
        create: (context) => MemberPublicInfoFormBloc(
          appId,
          formAction: formAction,
        )..add(InitialiseMemberPublicInfoFormNoLoadEvent(value: value)),
        child: _MyMemberPublicInfoForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    } else {
      return Scaffold(
          appBar: StyleRegistry.registry()
              .styleWithApp(app)
              .adminFormStyle()
              .appBarWithString(app, context,
                  title: formAction == FormAction.updateAction
                      ? 'Update MemberPublicInfo'
                      : 'Add MemberPublicInfo'),
          body: BlocProvider<MemberPublicInfoFormBloc>(
            create: (context) => MemberPublicInfoFormBloc(
              appId,
              formAction: formAction,
            )..add((formAction == FormAction.updateAction
                ? InitialiseMemberPublicInfoFormEvent(value: value)
                : InitialiseNewMemberPublicInfoFormEvent())),
            child: _MyMemberPublicInfoForm(
                app: app, submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}

class _MyMemberPublicInfoForm extends StatefulWidget {
  final AppModel app;
  final FormAction? formAction;
  final ActionModel? submitAction;

  _MyMemberPublicInfoForm(
      {required this.app, this.formAction, this.submitAction});

  @override
  State<_MyMemberPublicInfoForm> createState() =>
      _MyMemberPublicInfoFormState(formAction);
}

class _MyMemberPublicInfoFormState extends State<_MyMemberPublicInfoForm> {
  final FormAction? formAction;
  late MemberPublicInfoFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  _MyMemberPublicInfoFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<MemberPublicInfoFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
    _nameController.addListener(_onNameChanged);
  }

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<MemberPublicInfoFormBloc, MemberPublicInfoFormState>(
        builder: (context, state) {
      if (state is MemberPublicInfoFormUninitialized) {
        return Center(
          child: StyleRegistry.registry()
              .styleWithApp(widget.app)
              .adminListStyle()
              .progressIndicator(widget.app, context),
        );
      }

      if (state is MemberPublicInfoFormLoaded) {
        _documentIDController.text = state.value!.documentID.toString();
        _nameController.text = state.value!.name.toString();
      }
      if (state is MemberPublicInfoFormInitialized) {
        List<Widget> children = [];
        children.add(Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: StyleRegistry.registry()
                .styleWithApp(widget.app)
                .adminFormStyle()
                .groupTitle(widget.app, context, 'General')));

        children.add(Container(
            height: (fullScreenHeight(context) / 2.5),
            child: memberSubscriptionsList(widget.app, context,
                state.value!.subscriptions, _onSubscriptionsChanged)));

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
                labelText: 'User UUID',
                icon: Icons.vpn_key,
                readOnly: (formAction == FormAction.updateAction),
                textEditingController: _documentIDController,
                keyboardType: TextInputType.text,
                validator: (_) => state is DocumentIDMemberPublicInfoFormError
                    ? state.message
                    : null,
                hintText: 'field.remark'));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Name',
                icon: Icons.text_format,
                readOnly: _readOnly(accessState, state),
                textEditingController: _nameController,
                keyboardType: TextInputType.text,
                validator: (_) => state is NameMemberPublicInfoFormError
                    ? state.message
                    : null,
                hintText: null));

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
                        if (state is MemberPublicInfoFormError) {
                          return;
                        } else {
                          if (formAction == FormAction.updateAction) {
                            BlocProvider.of<MemberPublicInfoListBloc>(context)
                                .add(UpdateMemberPublicInfoList(
                                    value: state.value!.copyWith(
                              documentID: state.value!.documentID,
                              name: state.value!.name,
                              photoURL: state.value!.photoURL,
                              subscriptions: state.value!.subscriptions,
                            )));
                          } else {
                            BlocProvider.of<MemberPublicInfoListBloc>(context)
                                .add(AddMemberPublicInfoList(
                                    value: MemberPublicInfoModel(
                              documentID: state.value!.documentID,
                              name: state.value!.name,
                              photoURL: state.value!.photoURL,
                              subscriptions: state.value!.subscriptions,
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
        ChangedMemberPublicInfoDocumentID(value: _documentIDController.text));
  }

  void _onNameChanged() {
    _myFormBloc.add(ChangedMemberPublicInfoName(value: _nameController.text));
  }

  void _onSubscriptionsChanged(value) {
    _myFormBloc.add(ChangedMemberPublicInfoSubscriptions(value: value));
    setState(() {});
  }

  @override
  void dispose() {
    _documentIDController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  /// Is the form read-only?
  bool _readOnly(
      AccessState accessState, MemberPublicInfoFormInitialized state) {
    return (formAction == FormAction.showData) ||
        (formAction == FormAction.showPreloadedData) ||
        (!accessState.memberIsOwner(widget.app.documentID));
  }
}
