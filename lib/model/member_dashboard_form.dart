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

import 'package:eliud_core/core/widgets/progress_indicator.dart';
import 'package:eliud_core/core/global_data.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';
import 'package:eliud_core/core/access/bloc/access_bloc.dart';
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

import 'package:eliud_core/model/member_dashboard_list_bloc.dart';
import 'package:eliud_core/model/member_dashboard_list_event.dart';
import 'package:eliud_core/model/member_dashboard_model.dart';
import 'package:eliud_core/model/member_dashboard_form_bloc.dart';
import 'package:eliud_core/model/member_dashboard_form_event.dart';
import 'package:eliud_core/model/member_dashboard_form_state.dart';


class MemberDashboardForm extends StatelessWidget {
  FormAction formAction;
  MemberDashboardModel? value;
  ActionModel? submitAction;

  MemberDashboardForm({Key? key, required this.formAction, required this.value, this.submitAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    var app = AccessBloc.app(context);
    if (app == null) return Text("No app available");
    if (formAction == FormAction.ShowData) {
      return BlocProvider<MemberDashboardFormBloc >(
            create: (context) => MemberDashboardFormBloc(AccessBloc.appId(context),
                                       formAction: formAction,

                                                )..add(InitialiseMemberDashboardFormEvent(value: value)),
  
        child: MyMemberDashboardForm(submitAction: submitAction, formAction: formAction),
          );
    } if (formAction == FormAction.ShowPreloadedData) {
      return BlocProvider<MemberDashboardFormBloc >(
            create: (context) => MemberDashboardFormBloc(AccessBloc.appId(context),
                                       formAction: formAction,

                                                )..add(InitialiseMemberDashboardFormNoLoadEvent(value: value)),
  
        child: MyMemberDashboardForm(submitAction: submitAction, formAction: formAction),
          );
    } else {
      return Scaffold(
        appBar: StyleRegistry.registry().styleWithContext(context).adminFormStyle().constructAppBar(context, formAction == FormAction.UpdateAction ? 'Update MemberDashboard' : 'Add MemberDashboard'),
        body: BlocProvider<MemberDashboardFormBloc >(
            create: (context) => MemberDashboardFormBloc(AccessBloc.appId(context),
                                       formAction: formAction,

                                                )..add((formAction == FormAction.UpdateAction ? InitialiseMemberDashboardFormEvent(value: value) : InitialiseNewMemberDashboardFormEvent())),
  
        child: MyMemberDashboardForm(submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}


class MyMemberDashboardForm extends StatefulWidget {
  final FormAction? formAction;
  final ActionModel? submitAction;

  MyMemberDashboardForm({this.formAction, this.submitAction});

  _MyMemberDashboardFormState createState() => _MyMemberDashboardFormState(this.formAction);
}


class _MyMemberDashboardFormState extends State<MyMemberDashboardForm> {
  final FormAction? formAction;
  late MemberDashboardFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  final TextEditingController _appIdController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _updateProfileTextController = TextEditingController();
  final TextEditingController _retrieveDataTextController = TextEditingController();
  final TextEditingController _deleteDataTextController = TextEditingController();
  final TextEditingController _retrieveDataEmailSubjectController = TextEditingController();
  final TextEditingController _deleteDataEmailSubjectController = TextEditingController();
  final TextEditingController _deleteDataEmailMessageController = TextEditingController();


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
    _retrieveDataEmailSubjectController.addListener(_onRetrieveDataEmailSubjectChanged);
    _deleteDataEmailSubjectController.addListener(_onDeleteDataEmailSubjectChanged);
    _deleteDataEmailMessageController.addListener(_onDeleteDataEmailMessageChanged);
  }

  @override
  Widget build(BuildContext context) {
    var app = AccessBloc.app(context);
    if (app == null) return Text('No app available');
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<MemberDashboardFormBloc, MemberDashboardFormState>(builder: (context, state) {
      if (state is MemberDashboardFormUninitialized) return Center(
        child: DelayedCircularProgressIndicator(),
      );

      if (state is MemberDashboardFormLoaded) {
        if (state.value!.documentID != null)
          _documentIDController.text = state.value!.documentID.toString();
        else
          _documentIDController.text = "";
        if (state.value!.appId != null)
          _appIdController.text = state.value!.appId.toString();
        else
          _appIdController.text = "";
        if (state.value!.description != null)
          _descriptionController.text = state.value!.description.toString();
        else
          _descriptionController.text = "";
        if (state.value!.updateProfileText != null)
          _updateProfileTextController.text = state.value!.updateProfileText.toString();
        else
          _updateProfileTextController.text = "";
        if (state.value!.retrieveDataText != null)
          _retrieveDataTextController.text = state.value!.retrieveDataText.toString();
        else
          _retrieveDataTextController.text = "";
        if (state.value!.deleteDataText != null)
          _deleteDataTextController.text = state.value!.deleteDataText.toString();
        else
          _deleteDataTextController.text = "";
        if (state.value!.retrieveDataEmailSubject != null)
          _retrieveDataEmailSubjectController.text = state.value!.retrieveDataEmailSubject.toString();
        else
          _retrieveDataEmailSubjectController.text = "";
        if (state.value!.deleteDataEmailSubject != null)
          _deleteDataEmailSubjectController.text = state.value!.deleteDataEmailSubject.toString();
        else
          _deleteDataEmailSubjectController.text = "";
        if (state.value!.deleteDataEmailMessage != null)
          _deleteDataEmailMessageController.text = state.value!.deleteDataEmailMessage.toString();
        else
          _deleteDataEmailMessageController.text = "";
      }
      if (state is MemberDashboardFormInitialized) {
        List<Widget> children = [];
         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'General')
                ));

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, 'Document ID', Icons.vpn_key, (formAction == FormAction.UpdateAction), _documentIDController, FieldType.String, validator: (_) => state is DocumentIDMemberDashboardFormError ? state.message : null, hintText: 'null')
          );

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, 'App Identifier', Icons.text_format, _readOnly(accessState, state), _appIdController, FieldType.String, validator: (_) => state is AppIdMemberDashboardFormError ? state.message : null, hintText: 'This is the identifier of the app to which this belongs')
          );

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, 'Description', Icons.text_format, _readOnly(accessState, state), _descriptionController, FieldType.String, validator: (_) => state is DescriptionMemberDashboardFormError ? state.message : null, hintText: 'null')
          );

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, 'Update Profile Text', Icons.text_format, _readOnly(accessState, state), _updateProfileTextController, FieldType.String, validator: (_) => state is UpdateProfileTextMemberDashboardFormError ? state.message : null, hintText: 'This is the text on the member dashboard screen providing more information about what it means to update the member profile')
          );

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, 'Retrieve Data Text', Icons.text_format, _readOnly(accessState, state), _retrieveDataTextController, FieldType.String, validator: (_) => state is RetrieveDataTextMemberDashboardFormError ? state.message : null, hintText: 'This is the text on the member dashboard screen providing more information about what it means to retrieve all data')
          );

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, 'Delete Data Text', Icons.text_format, _readOnly(accessState, state), _deleteDataTextController, FieldType.String, validator: (_) => state is DeleteDataTextMemberDashboardFormError ? state.message : null, hintText: 'This is the text on the member dashboard screen providing more information about what it means to destroy the account, i.e. the member will loose all data')
          );

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, 'Retrieve Data Email Subject', Icons.text_format, _readOnly(accessState, state), _retrieveDataEmailSubjectController, FieldType.String, validator: (_) => state is RetrieveDataEmailSubjectMemberDashboardFormError ? state.message : null, hintText: 'This is the subject of the email providing the member his data stored in the app (after requesting it)')
          );

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, 'Delete Data Email Subject', Icons.text_format, _readOnly(accessState, state), _deleteDataEmailSubjectController, FieldType.String, validator: (_) => state is DeleteDataEmailSubjectMemberDashboardFormError ? state.message : null, hintText: 'This is the subject of the email informing the member that his account and all of his data has been destroyed (after requesting it)')
          );

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, 'Delete Data Email Message', Icons.text_format, _readOnly(accessState, state), _deleteDataEmailMessageController, FieldType.String, validator: (_) => state is DeleteDataEmailMessageMemberDashboardFormError ? state.message : null, hintText: 'This is the message of the email informing the member that his account and all of his data has been destroyed (after requesting it)')
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Conditions')
                ));



        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


        if ((formAction != FormAction.ShowData) && (formAction != FormAction.ShowPreloadedData))
          children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().submitButton(context, 'Submit',
                  onPressed: _readOnly(accessState, state) ? null : () {
                    if (state is MemberDashboardFormError) {
                      return null;
                    } else {
                      if (formAction == FormAction.UpdateAction) {
                        BlocProvider.of<MemberDashboardListBloc>(context).add(
                          UpdateMemberDashboardList(value: state.value!.copyWith(
                              documentID: state.value!.documentID, 
                              appId: state.value!.appId, 
                              description: state.value!.description, 
                              updateProfileText: state.value!.updateProfileText, 
                              retrieveDataText: state.value!.retrieveDataText, 
                              deleteDataText: state.value!.deleteDataText, 
                              retrieveDataEmailSubject: state.value!.retrieveDataEmailSubject, 
                              deleteDataEmailSubject: state.value!.deleteDataEmailSubject, 
                              deleteDataEmailMessage: state.value!.deleteDataEmailMessage, 
                              conditions: state.value!.conditions, 
                        )));
                      } else {
                        BlocProvider.of<MemberDashboardListBloc>(context).add(
                          AddMemberDashboardList(value: MemberDashboardModel(
                              documentID: state.value!.documentID, 
                              appId: state.value!.appId, 
                              description: state.value!.description, 
                              updateProfileText: state.value!.updateProfileText, 
                              retrieveDataText: state.value!.retrieveDataText, 
                              deleteDataText: state.value!.deleteDataText, 
                              retrieveDataEmailSubject: state.value!.retrieveDataEmailSubject, 
                              deleteDataEmailSubject: state.value!.deleteDataEmailSubject, 
                              deleteDataEmailMessage: state.value!.deleteDataEmailMessage, 
                              conditions: state.value!.conditions, 
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

        return StyleRegistry.registry().styleWithContext(context).adminFormStyle().container(context, Form(
            child: ListView(
              padding: const EdgeInsets.all(8),
              physics: ((formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData)) ? NeverScrollableScrollPhysics() : null,
              shrinkWrap: ((formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData)),
              children: children as List<Widget>
            ),
          ), formAction!
        );
      } else {
        return DelayedCircularProgressIndicator();
      }
    });
  }

  void _onDocumentIDChanged() {
    _myFormBloc.add(ChangedMemberDashboardDocumentID(value: _documentIDController.text));
  }


  void _onAppIdChanged() {
    _myFormBloc.add(ChangedMemberDashboardAppId(value: _appIdController.text));
  }


  void _onDescriptionChanged() {
    _myFormBloc.add(ChangedMemberDashboardDescription(value: _descriptionController.text));
  }


  void _onUpdateProfileTextChanged() {
    _myFormBloc.add(ChangedMemberDashboardUpdateProfileText(value: _updateProfileTextController.text));
  }


  void _onRetrieveDataTextChanged() {
    _myFormBloc.add(ChangedMemberDashboardRetrieveDataText(value: _retrieveDataTextController.text));
  }


  void _onDeleteDataTextChanged() {
    _myFormBloc.add(ChangedMemberDashboardDeleteDataText(value: _deleteDataTextController.text));
  }


  void _onRetrieveDataEmailSubjectChanged() {
    _myFormBloc.add(ChangedMemberDashboardRetrieveDataEmailSubject(value: _retrieveDataEmailSubjectController.text));
  }


  void _onDeleteDataEmailSubjectChanged() {
    _myFormBloc.add(ChangedMemberDashboardDeleteDataEmailSubject(value: _deleteDataEmailSubjectController.text));
  }


  void _onDeleteDataEmailMessageChanged() {
    _myFormBloc.add(ChangedMemberDashboardDeleteDataEmailMessage(value: _deleteDataEmailMessageController.text));
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

  bool _readOnly(AccessState accessState, MemberDashboardFormInitialized state) {
    return (formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData) || (!accessState.memberIsOwner());
  }
  

}



