/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 blocking_form.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/core/blocs/access/state/access_state.dart';
import 'package:eliud_core/core/blocs/access/state/logged_in.dart';
import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core/core/navigate/router.dart' as eliudrouter;
import 'package:eliud_core/tools/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'package:eliud_core/style/admin/admin_form_style.dart';

import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

import 'package:intl/intl.dart';

import 'package:eliud_core/eliud.dart';

import 'package:eliud_core/model/internal_component.dart';
import 'package:eliud_core/model/embedded_component.dart';
import 'package:eliud_core/tools/bespoke_formfields.dart';
import 'package:eliud_core/tools/bespoke_formfields.dart';

import 'package:eliud_core/tools/enums.dart';
import 'package:eliud_core/tools/etc.dart';

import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/embedded_component.dart';
import 'package:eliud_core/model/embedded_component.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_core/model/entity_export.dart';

import 'package:eliud_core/model/blocking_list_bloc.dart';
import 'package:eliud_core/model/blocking_list_event.dart';
import 'package:eliud_core/model/blocking_model.dart';
import 'package:eliud_core/model/blocking_form_bloc.dart';
import 'package:eliud_core/model/blocking_form_event.dart';
import 'package:eliud_core/model/blocking_form_state.dart';


class BlockingForm extends StatelessWidget {
  final AppModel app;
  FormAction formAction;
  BlockingModel? value;
  ActionModel? submitAction;

  BlockingForm({Key? key, required this.app, required this.formAction, required this.value, this.submitAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    var appId = app.documentID;
    if (formAction == FormAction.ShowData) {
      return BlocProvider<BlockingFormBloc >(
            create: (context) => BlockingFormBloc(appId,
                                       formAction: formAction,

                                                )..add(InitialiseBlockingFormEvent(value: value)),
  
        child: MyBlockingForm(app:app, submitAction: submitAction, formAction: formAction),
          );
    } if (formAction == FormAction.ShowPreloadedData) {
      return BlocProvider<BlockingFormBloc >(
            create: (context) => BlockingFormBloc(appId,
                                       formAction: formAction,

                                                )..add(InitialiseBlockingFormNoLoadEvent(value: value)),
  
        child: MyBlockingForm(app:app, submitAction: submitAction, formAction: formAction),
          );
    } else {
      return Scaffold(
        appBar: StyleRegistry.registry().styleWithApp(app).adminFormStyle().appBarWithString(app, context, title: formAction == FormAction.UpdateAction ? 'Update Blocking' : 'Add Blocking'),
        body: BlocProvider<BlockingFormBloc >(
            create: (context) => BlockingFormBloc(appId,
                                       formAction: formAction,

                                                )..add((formAction == FormAction.UpdateAction ? InitialiseBlockingFormEvent(value: value) : InitialiseNewBlockingFormEvent())),
  
        child: MyBlockingForm(app: app, submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}


class MyBlockingForm extends StatefulWidget {
  final AppModel app;
  final FormAction? formAction;
  final ActionModel? submitAction;

  MyBlockingForm({required this.app, this.formAction, this.submitAction});

  _MyBlockingFormState createState() => _MyBlockingFormState(this.formAction);
}


class _MyBlockingFormState extends State<MyBlockingForm> {
  final FormAction? formAction;
  late BlockingFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  final TextEditingController _memberBlockingController = TextEditingController();
  final TextEditingController _memberBeingBlockedController = TextEditingController();


  _MyBlockingFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<BlockingFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
    _memberBlockingController.addListener(_onMemberBlockingChanged);
    _memberBeingBlockedController.addListener(_onMemberBeingBlockedChanged);
  }

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<BlockingFormBloc, BlockingFormState>(builder: (context, state) {
      if (state is BlockingFormUninitialized) return Center(
        child: StyleRegistry.registry().styleWithApp(widget.app).adminListStyle().progressIndicator(widget.app, context),
      );

      if (state is BlockingFormLoaded) {
        if (state.value!.documentID != null)
          _documentIDController.text = state.value!.documentID.toString();
        else
          _documentIDController.text = "";
        if (state.value!.memberBlocking != null)
          _memberBlockingController.text = state.value!.memberBlocking.toString();
        else
          _memberBlockingController.text = "";
        if (state.value!.memberBeingBlocked != null)
          _memberBeingBlockedController.text = state.value!.memberBeingBlocked.toString();
        else
          _memberBeingBlockedController.text = "";
      }
      if (state is BlockingFormInitialized) {
        List<Widget> children = [];
         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'General')
                ));

        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().textFormField(widget.app, context, labelText: 'Document ID', icon: Icons.vpn_key, readOnly: (formAction == FormAction.UpdateAction), textEditingController: _documentIDController, keyboardType: TextInputType.text, validator: (_) => state is DocumentIDBlockingFormError ? state.message : null, hintText: 'field.remark')
          );

        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().textFormField(widget.app, context, labelText: 'The member that is blocking another member', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _memberBlockingController, keyboardType: TextInputType.text, validator: (_) => state is MemberBlockingBlockingFormError ? state.message : null, hintText: null)
          );

        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().textFormField(widget.app, context, labelText: 'The member being blocked by another member', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _memberBeingBlockedController, keyboardType: TextInputType.text, validator: (_) => state is MemberBeingBlockedBlockingFormError ? state.message : null, hintText: null)
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


        if ((formAction != FormAction.ShowData) && (formAction != FormAction.ShowPreloadedData))
          children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().button(widget.app, context, label: 'Submit',
                  onPressed: _readOnly(accessState, state) ? null : () {
                    if (state is BlockingFormError) {
                      return null;
                    } else {
                      if (formAction == FormAction.UpdateAction) {
                        BlocProvider.of<BlockingListBloc>(context).add(
                          UpdateBlockingList(value: state.value!.copyWith(
                              documentID: state.value!.documentID, 
                              memberBlocking: state.value!.memberBlocking, 
                              memberBeingBlocked: state.value!.memberBeingBlocked, 
                        )));
                      } else {
                        BlocProvider.of<BlockingListBloc>(context).add(
                          AddBlockingList(value: BlockingModel(
                              documentID: state.value!.documentID, 
                              memberBlocking: state.value!.memberBlocking, 
                              memberBeingBlocked: state.value!.memberBeingBlocked, 
                          )));
                      }
                      if (widget.submitAction != null) {
                        eliudrouter.Router.navigateTo(context, widget.submitAction!);
                      } else {
                        Navigator.pop(context);
                      }
                    }
                  },
                ));

        return StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().container(widget.app, context, Form(
            child: ListView(
              padding: const EdgeInsets.all(8),
              physics: ((formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData)) ? NeverScrollableScrollPhysics() : null,
              shrinkWrap: ((formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData)),
              children: children as List<Widget>
            ),
          ), formAction!
        );
      } else {
        return StyleRegistry.registry().styleWithApp(widget.app).adminListStyle().progressIndicator(widget.app, context);
      }
    });
  }

  void _onDocumentIDChanged() {
    _myFormBloc.add(ChangedBlockingDocumentID(value: _documentIDController.text));
  }


  void _onMemberBlockingChanged() {
    _myFormBloc.add(ChangedBlockingMemberBlocking(value: _memberBlockingController.text));
  }


  void _onMemberBeingBlockedChanged() {
    _myFormBloc.add(ChangedBlockingMemberBeingBlocked(value: _memberBeingBlockedController.text));
  }



  @override
  void dispose() {
    _documentIDController.dispose();
    _memberBlockingController.dispose();
    _memberBeingBlockedController.dispose();
    super.dispose();
  }

  bool _readOnly(AccessState accessState, BlockingFormInitialized state) {
    return (formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData) || (!accessState.memberIsOwner(widget.app.documentID));
  }
  

}



