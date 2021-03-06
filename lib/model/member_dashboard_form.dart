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
  MemberDashboardModel value;
  ActionModel submitAction;

  MemberDashboardForm({Key key, @required this.formAction, @required this.value, this.submitAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    var app = AccessBloc.app(context);
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
        appBar: formAction == FormAction.UpdateAction ?
                AppBar(
                    title: Text("Update MemberDashboard", style: TextStyle(color: RgbHelper.color(rgbo: app.formAppBarTextColor))),
                    flexibleSpace: Container(
                        decoration: BoxDecorationHelper.boxDecoration(accessState, app.formAppBarBackground)),
                  ) :
                AppBar(
                    title: Text("Add MemberDashboard", style: TextStyle(color: RgbHelper.color(rgbo: app.formAppBarTextColor))),
                    flexibleSpace: Container(
                        decoration: BoxDecorationHelper.boxDecoration(accessState, app.formAppBarBackground)),
                ),
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
  final FormAction formAction;
  final ActionModel submitAction;

  MyMemberDashboardForm({this.formAction, this.submitAction});

  _MyMemberDashboardFormState createState() => _MyMemberDashboardFormState(this.formAction);
}


class _MyMemberDashboardFormState extends State<MyMemberDashboardForm> {
  final FormAction formAction;
  MemberDashboardFormBloc _myFormBloc;

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
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<MemberDashboardFormBloc, MemberDashboardFormState>(builder: (context, state) {
      if (state is MemberDashboardFormUninitialized) return Center(
        child: DelayedCircularProgressIndicator(),
      );

      if (state is MemberDashboardFormLoaded) {
        if (state.value.documentID != null)
          _documentIDController.text = state.value.documentID.toString();
        else
          _documentIDController.text = "";
        if (state.value.appId != null)
          _appIdController.text = state.value.appId.toString();
        else
          _appIdController.text = "";
        if (state.value.description != null)
          _descriptionController.text = state.value.description.toString();
        else
          _descriptionController.text = "";
        if (state.value.updateProfileText != null)
          _updateProfileTextController.text = state.value.updateProfileText.toString();
        else
          _updateProfileTextController.text = "";
        if (state.value.retrieveDataText != null)
          _retrieveDataTextController.text = state.value.retrieveDataText.toString();
        else
          _retrieveDataTextController.text = "";
        if (state.value.deleteDataText != null)
          _deleteDataTextController.text = state.value.deleteDataText.toString();
        else
          _deleteDataTextController.text = "";
        if (state.value.retrieveDataEmailSubject != null)
          _retrieveDataEmailSubjectController.text = state.value.retrieveDataEmailSubject.toString();
        else
          _retrieveDataEmailSubjectController.text = "";
        if (state.value.deleteDataEmailSubject != null)
          _deleteDataEmailSubjectController.text = state.value.deleteDataEmailSubject.toString();
        else
          _deleteDataEmailSubjectController.text = "";
        if (state.value.deleteDataEmailMessage != null)
          _deleteDataEmailMessageController.text = state.value.deleteDataEmailMessage.toString();
        else
          _deleteDataEmailMessageController.text = "";
      }
      if (state is MemberDashboardFormInitialized) {
        List<Widget> children = List();
         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('General',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: app.formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor)),
                  readOnly: (formAction == FormAction.UpdateAction),
                  controller: _documentIDController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldFocusColor))),                    icon: Icon(Icons.vpn_key, color: RgbHelper.color(rgbo: app.formFieldHeaderColor)),
                    labelText: 'Document ID',
                  ),
                  keyboardType: TextInputType.text,
                  autovalidate: true,
                  validator: (_) {
                    return state is DocumentIDMemberDashboardFormError ? state.message : null;
                  },
                ),
          );

        children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor)),
                  readOnly: _readOnly(accessState, state),
                  controller: _appIdController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldFocusColor))),                    icon: Icon(Icons.text_format, color: RgbHelper.color(rgbo: app.formFieldHeaderColor)),
                    labelText: 'App Identifier',
                    hintText: "This is the identifier of the app to which this belongs",
                  ),
                  keyboardType: TextInputType.text,
                  autovalidate: true,
                  validator: (_) {
                    return state is AppIdMemberDashboardFormError ? state.message : null;
                  },
                ),
          );

        children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor)),
                  readOnly: _readOnly(accessState, state),
                  controller: _descriptionController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldFocusColor))),                    icon: Icon(Icons.text_format, color: RgbHelper.color(rgbo: app.formFieldHeaderColor)),
                    labelText: 'Description',
                  ),
                  keyboardType: TextInputType.text,
                  autovalidate: true,
                  validator: (_) {
                    return state is DescriptionMemberDashboardFormError ? state.message : null;
                  },
                ),
          );

        children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor)),
                  readOnly: _readOnly(accessState, state),
                  controller: _updateProfileTextController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldFocusColor))),                    icon: Icon(Icons.text_format, color: RgbHelper.color(rgbo: app.formFieldHeaderColor)),
                    labelText: 'Update Profile Text',
                    hintText: "This is the text on the member dashboard screen providing more information about what it means to update the member profile",
                  ),
                  keyboardType: TextInputType.text,
                  autovalidate: true,
                  validator: (_) {
                    return state is UpdateProfileTextMemberDashboardFormError ? state.message : null;
                  },
                ),
          );

        children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor)),
                  readOnly: _readOnly(accessState, state),
                  controller: _retrieveDataTextController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldFocusColor))),                    icon: Icon(Icons.text_format, color: RgbHelper.color(rgbo: app.formFieldHeaderColor)),
                    labelText: 'Retrieve Data Text',
                    hintText: "This is the text on the member dashboard screen providing more information about what it means to retrieve all data",
                  ),
                  keyboardType: TextInputType.text,
                  autovalidate: true,
                  validator: (_) {
                    return state is RetrieveDataTextMemberDashboardFormError ? state.message : null;
                  },
                ),
          );

        children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor)),
                  readOnly: _readOnly(accessState, state),
                  controller: _deleteDataTextController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldFocusColor))),                    icon: Icon(Icons.text_format, color: RgbHelper.color(rgbo: app.formFieldHeaderColor)),
                    labelText: 'Delete Data Text',
                    hintText: "This is the text on the member dashboard screen providing more information about what it means to destroy the account, i.e. the member will loose all data",
                  ),
                  keyboardType: TextInputType.text,
                  autovalidate: true,
                  validator: (_) {
                    return state is DeleteDataTextMemberDashboardFormError ? state.message : null;
                  },
                ),
          );

        children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor)),
                  readOnly: _readOnly(accessState, state),
                  controller: _retrieveDataEmailSubjectController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldFocusColor))),                    icon: Icon(Icons.text_format, color: RgbHelper.color(rgbo: app.formFieldHeaderColor)),
                    labelText: 'Retrieve Data Email Subject',
                    hintText: "This is the subject of the email providing the member his data stored in the app (after requesting it)",
                  ),
                  keyboardType: TextInputType.text,
                  autovalidate: true,
                  validator: (_) {
                    return state is RetrieveDataEmailSubjectMemberDashboardFormError ? state.message : null;
                  },
                ),
          );

        children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor)),
                  readOnly: _readOnly(accessState, state),
                  controller: _deleteDataEmailSubjectController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldFocusColor))),                    icon: Icon(Icons.text_format, color: RgbHelper.color(rgbo: app.formFieldHeaderColor)),
                    labelText: 'Delete Data Email Subject',
                    hintText: "This is the subject of the email informing the member that his account and all of his data has been destroyed (after requesting it)",
                  ),
                  keyboardType: TextInputType.text,
                  autovalidate: true,
                  validator: (_) {
                    return state is DeleteDataEmailSubjectMemberDashboardFormError ? state.message : null;
                  },
                ),
          );

        children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor)),
                  readOnly: _readOnly(accessState, state),
                  controller: _deleteDataEmailMessageController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldFocusColor))),                    icon: Icon(Icons.text_format, color: RgbHelper.color(rgbo: app.formFieldHeaderColor)),
                    labelText: 'Delete Data Email Message',
                    hintText: "This is the message of the email informing the member that his account and all of his data has been destroyed (after requesting it)",
                  ),
                  keyboardType: TextInputType.text,
                  autovalidate: true,
                  validator: (_) {
                    return state is DeleteDataEmailMessageMemberDashboardFormError ? state.message : null;
                  },
                ),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: app.dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Conditions',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: app.formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));



        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: app.dividerColor)));


        if ((formAction != FormAction.ShowData) && (formAction != FormAction.ShowPreloadedData))
          children.add(RaisedButton(
                  color: RgbHelper.color(rgbo: app.formSubmitButtonColor),
                  onPressed: _readOnly(accessState, state) ? null : () {
                    if (state is MemberDashboardFormError) {
                      return null;
                    } else {
                      if (formAction == FormAction.UpdateAction) {
                        BlocProvider.of<MemberDashboardListBloc>(context).add(
                          UpdateMemberDashboardList(value: state.value.copyWith(
                              documentID: state.value.documentID, 
                              appId: state.value.appId, 
                              description: state.value.description, 
                              updateProfileText: state.value.updateProfileText, 
                              retrieveDataText: state.value.retrieveDataText, 
                              deleteDataText: state.value.deleteDataText, 
                              retrieveDataEmailSubject: state.value.retrieveDataEmailSubject, 
                              deleteDataEmailSubject: state.value.deleteDataEmailSubject, 
                              deleteDataEmailMessage: state.value.deleteDataEmailMessage, 
                              conditions: state.value.conditions, 
                        )));
                      } else {
                        BlocProvider.of<MemberDashboardListBloc>(context).add(
                          AddMemberDashboardList(value: MemberDashboardModel(
                              documentID: state.value.documentID, 
                              appId: state.value.appId, 
                              description: state.value.description, 
                              updateProfileText: state.value.updateProfileText, 
                              retrieveDataText: state.value.retrieveDataText, 
                              deleteDataText: state.value.deleteDataText, 
                              retrieveDataEmailSubject: state.value.retrieveDataEmailSubject, 
                              deleteDataEmailSubject: state.value.deleteDataEmailSubject, 
                              deleteDataEmailMessage: state.value.deleteDataEmailMessage, 
                              conditions: state.value.conditions, 
                          )));
                      }
                      if (widget.submitAction != null) {
                        eliudrouter.Router.navigateTo(context, widget.submitAction);
                      } else {
                        Navigator.pop(context);
                      }
                      return true;
                    }
                  },
                  child: Text('Submit', style: TextStyle(color: RgbHelper.color(rgbo: app.formSubmitButtonTextColor))),
                ));

        return Container(
          color: ((formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData)) ? Colors.transparent : null,
          decoration: ((formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData)) ? null : BoxDecorationHelper.boxDecoration(accessState, app.formBackground),
          padding:
          const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
            child: Form(
            child: ListView(
              padding: const EdgeInsets.all(8),
              physics: ((formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData)) ? NeverScrollableScrollPhysics() : null,
              shrinkWrap: ((formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData)),
              children: children
            ),
          )
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



