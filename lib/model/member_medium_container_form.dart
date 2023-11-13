/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_medium_container_form.dart
                       
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

import 'package:eliud_core/model/member_medium_container_list_bloc.dart';
import 'package:eliud_core/model/member_medium_container_list_event.dart';
import 'package:eliud_core/model/member_medium_container_form_bloc.dart';
import 'package:eliud_core/model/member_medium_container_form_event.dart';
import 'package:eliud_core/model/member_medium_container_form_state.dart';

class MemberMediumContainerForm extends StatelessWidget {
  final AppModel app;
  final FormAction formAction;
  final MemberMediumContainerModel? value;
  final ActionModel? submitAction;

  MemberMediumContainerForm(
      {super.key,
      required this.app,
      required this.formAction,
      required this.value,
      this.submitAction});

  /// Build the MemberMediumContainerForm
  @override
  Widget build(BuildContext context) {
    //var accessState = AccessBloc.getState(context);
    var appId = app.documentID;
    if (formAction == FormAction.showData) {
      return BlocProvider<MemberMediumContainerFormBloc>(
        create: (context) => MemberMediumContainerFormBloc(
          appId,
        )..add(InitialiseMemberMediumContainerFormEvent(value: value)),
        child: _MyMemberMediumContainerForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    }
    if (formAction == FormAction.showPreloadedData) {
      return BlocProvider<MemberMediumContainerFormBloc>(
        create: (context) => MemberMediumContainerFormBloc(
          appId,
        )..add(InitialiseMemberMediumContainerFormNoLoadEvent(value: value)),
        child: _MyMemberMediumContainerForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    } else {
      return Scaffold(
          appBar: StyleRegistry.registry()
              .styleWithApp(app)
              .adminFormStyle()
              .appBarWithString(app, context,
                  title: formAction == FormAction.updateAction
                      ? 'Update MemberMediumContainer'
                      : 'Add MemberMediumContainer'),
          body: BlocProvider<MemberMediumContainerFormBloc>(
            create: (context) => MemberMediumContainerFormBloc(
              appId,
            )..add((formAction == FormAction.updateAction
                ? InitialiseMemberMediumContainerFormEvent(value: value)
                : InitialiseNewMemberMediumContainerFormEvent())),
            child: _MyMemberMediumContainerForm(
                app: app, submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}

class _MyMemberMediumContainerForm extends StatefulWidget {
  final AppModel app;
  final FormAction? formAction;
  final ActionModel? submitAction;

  _MyMemberMediumContainerForm(
      {required this.app, this.formAction, this.submitAction});

  @override
  State<_MyMemberMediumContainerForm> createState() =>
      _MyMemberMediumContainerFormState(formAction);
}

class _MyMemberMediumContainerFormState
    extends State<_MyMemberMediumContainerForm> {
  final FormAction? formAction;
  late MemberMediumContainerFormBloc _myFormBloc;

  String? _memberMedium;

  _MyMemberMediumContainerFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<MemberMediumContainerFormBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<MemberMediumContainerFormBloc,
        MemberMediumContainerFormState>(builder: (context, state) {
      if (state is MemberMediumContainerFormUninitialized) {
        return Center(
          child: StyleRegistry.registry()
              .styleWithApp(widget.app)
              .adminListStyle()
              .progressIndicator(widget.app, context),
        );
      }

      if (state is MemberMediumContainerFormLoaded) {
        if (state.value!.memberMedium != null) {
          _memberMedium = state.value!.memberMedium!.documentID;
        } else {
          _memberMedium = "";
        }
      }
      if (state is MemberMediumContainerFormInitialized) {
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
                .groupTitle(widget.app, context, 'Image')));

        children.add(
          DropdownButtonComponentFactory().createNew(
              app: widget.app,
              id: "memberMediums",
              value: _memberMedium,
              trigger: (value, privilegeLevel) =>
                  _onMemberMediumSelected(value),
              optional: true),
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
                        if (state is MemberMediumContainerFormError) {
                          return;
                        } else {
                          if (formAction == FormAction.updateAction) {
                            BlocProvider.of<MemberMediumContainerListBloc>(
                                    context)
                                .add(UpdateMemberMediumContainerList(
                                    value: state.value!.copyWith(
                              documentID: state.value!.documentID,
                              htmlReference: state.value!.htmlReference,
                              memberMedium: state.value!.memberMedium,
                            )));
                          } else {
                            BlocProvider.of<MemberMediumContainerListBloc>(
                                    context)
                                .add(AddMemberMediumContainerList(
                                    value: MemberMediumContainerModel(
                              documentID: state.value!.documentID,
                              htmlReference: state.value!.htmlReference,
                              memberMedium: state.value!.memberMedium,
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

  void _onMemberMediumSelected(String? val) {
    setState(() {
      _memberMedium = val;
    });
    _myFormBloc.add(ChangedMemberMediumContainerMemberMedium(value: val));
  }

  @override
  void dispose() {
    super.dispose();
  }

  /// Is the form read-only?
  bool _readOnly(
      AccessState accessState, MemberMediumContainerFormInitialized state) {
    return (formAction == FormAction.showData) ||
        (formAction == FormAction.showPreloadedData) ||
        (!accessState.memberIsOwner(widget.app.documentID));
  }
}
