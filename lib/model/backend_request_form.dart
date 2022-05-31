/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 backend_request_form.dart
                       
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

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/embedded_component.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_core/model/entity_export.dart';

import 'package:eliud_core/model/backend_request_list_bloc.dart';
import 'package:eliud_core/model/backend_request_list_event.dart';
import 'package:eliud_core/model/backend_request_model.dart';
import 'package:eliud_core/model/backend_request_form_bloc.dart';
import 'package:eliud_core/model/backend_request_form_event.dart';
import 'package:eliud_core/model/backend_request_form_state.dart';


class BackendRequestForm extends StatelessWidget {
  final AppModel app;
  FormAction formAction;
  BackendRequestModel? value;
  ActionModel? submitAction;

  BackendRequestForm({Key? key, required this.app, required this.formAction, required this.value, this.submitAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    var appId = app.documentID;
    if (formAction == FormAction.ShowData) {
      return BlocProvider<BackendRequestFormBloc >(
            create: (context) => BackendRequestFormBloc(appId,
                                       formAction: formAction,

                                                )..add(InitialiseBackendRequestFormEvent(value: value)),
  
        child: MyBackendRequestForm(app:app, submitAction: submitAction, formAction: formAction),
          );
    } if (formAction == FormAction.ShowPreloadedData) {
      return BlocProvider<BackendRequestFormBloc >(
            create: (context) => BackendRequestFormBloc(appId,
                                       formAction: formAction,

                                                )..add(InitialiseBackendRequestFormNoLoadEvent(value: value)),
  
        child: MyBackendRequestForm(app:app, submitAction: submitAction, formAction: formAction),
          );
    } else {
      return Scaffold(
        appBar: StyleRegistry.registry().styleWithApp(app).adminFormStyle().appBarWithString(app, context, title: formAction == FormAction.UpdateAction ? 'Update BackendRequest' : 'Add BackendRequest'),
        body: BlocProvider<BackendRequestFormBloc >(
            create: (context) => BackendRequestFormBloc(appId,
                                       formAction: formAction,

                                                )..add((formAction == FormAction.UpdateAction ? InitialiseBackendRequestFormEvent(value: value) : InitialiseNewBackendRequestFormEvent())),
  
        child: MyBackendRequestForm(app: app, submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}


class MyBackendRequestForm extends StatefulWidget {
  final AppModel app;
  final FormAction? formAction;
  final ActionModel? submitAction;

  MyBackendRequestForm({required this.app, this.formAction, this.submitAction});

  _MyBackendRequestFormState createState() => _MyBackendRequestFormState(this.formAction);
}


class _MyBackendRequestFormState extends State<MyBackendRequestForm> {
  final FormAction? formAction;
  late BackendRequestFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _appIdController = TextEditingController();
  final TextEditingController _authorIdController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _sendToController = TextEditingController();
  bool? _processedSelection;
  int? _requestTypeSelectedRadioTile;


  _MyBackendRequestFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<BackendRequestFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
    _descriptionController.addListener(_onDescriptionChanged);
    _appIdController.addListener(_onAppIdChanged);
    _authorIdController.addListener(_onAuthorIdChanged);
    _nameController.addListener(_onNameChanged);
    _sendToController.addListener(_onSendToChanged);
    _processedSelection = false;
    _requestTypeSelectedRadioTile = 0;
  }

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<BackendRequestFormBloc, BackendRequestFormState>(builder: (context, state) {
      if (state is BackendRequestFormUninitialized) return Center(
        child: StyleRegistry.registry().styleWithApp(widget.app).adminListStyle().progressIndicator(widget.app, context),
      );

      if (state is BackendRequestFormLoaded) {
        if (state.value!.documentID != null)
          _documentIDController.text = state.value!.documentID.toString();
        else
          _documentIDController.text = "";
        if (state.value!.description != null)
          _descriptionController.text = state.value!.description.toString();
        else
          _descriptionController.text = "";
        if (state.value!.appId != null)
          _appIdController.text = state.value!.appId.toString();
        else
          _appIdController.text = "";
        if (state.value!.authorId != null)
          _authorIdController.text = state.value!.authorId.toString();
        else
          _authorIdController.text = "";
        if (state.value!.name != null)
          _nameController.text = state.value!.name.toString();
        else
          _nameController.text = "";
        if (state.value!.sendTo != null)
          _sendToController.text = state.value!.sendTo.toString();
        else
          _sendToController.text = "";
        if (state.value!.processed != null)
        _processedSelection = state.value!.processed;
        else
        _processedSelection = false;
        if (state.value!.requestType != null)
          _requestTypeSelectedRadioTile = state.value!.requestType!.index;
        else
          _requestTypeSelectedRadioTile = 0;
      }
      if (state is BackendRequestFormInitialized) {
        List<Widget> children = [];
         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'General')
                ));

        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().textFormField(widget.app, context, labelText: 'Author ID', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _authorIdController, keyboardType: TextInputType.text, validator: (_) => state is AuthorIdBackendRequestFormError ? state.message : null, hintText: null)
          );

        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().textFormField(widget.app, context, labelText: 'Author ID', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _nameController, keyboardType: TextInputType.text, validator: (_) => state is NameBackendRequestFormError ? state.message : null, hintText: null)
          );

        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().textFormField(widget.app, context, labelText: 'sendTo email address', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _sendToController, keyboardType: TextInputType.text, validator: (_) => state is SendToBackendRequestFormError ? state.message : null, hintText: null)
          );


        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().radioListTile(widget.app, context, 0, _requestTypeSelectedRadioTile, 'RequestEmailData', 'RequestEmailData', !accessState.memberIsOwner(widget.app.documentID) ? null : (dynamic val) => setSelectionRequestType(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().radioListTile(widget.app, context, 0, _requestTypeSelectedRadioTile, 'DestroyAccount', 'DestroyAccount', !accessState.memberIsOwner(widget.app.documentID) ? null : (dynamic val) => setSelectionRequestType(val))
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'General')
                ));

        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().textFormField(widget.app, context, labelText: 'Document ID', icon: Icons.vpn_key, readOnly: (formAction == FormAction.UpdateAction), textEditingController: _documentIDController, keyboardType: TextInputType.text, validator: (_) => state is DocumentIDBackendRequestFormError ? state.message : null, hintText: null)
          );

        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().textFormField(widget.app, context, labelText: 'Description', icon: Icons.vpn_key, readOnly: _readOnly(accessState, state), textEditingController: _descriptionController, keyboardType: TextInputType.text, validator: (_) => state is DescriptionBackendRequestFormError ? state.message : null, hintText: null)
          );

        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().checkboxListTile(widget.app, context, 'Processed', _processedSelection, _readOnly(accessState, state) ? null : (dynamic val) => setSelectionProcessed(val))
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'Source')
                ));


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'Photo')
                ));


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


        if ((formAction != FormAction.ShowData) && (formAction != FormAction.ShowPreloadedData))
          children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().button(widget.app, context, label: 'Submit',
                  onPressed: _readOnly(accessState, state) ? null : () {
                    if (state is BackendRequestFormError) {
                      return null;
                    } else {
                      if (formAction == FormAction.UpdateAction) {
                        BlocProvider.of<BackendRequestListBloc>(context).add(
                          UpdateBackendRequestList(value: state.value!.copyWith(
                              documentID: state.value!.documentID, 
                              description: state.value!.description, 
                              appId: state.value!.appId, 
                              authorId: state.value!.authorId, 
                              name: state.value!.name, 
                              sendTo: state.value!.sendTo, 
                              collections: state.value!.collections, 
                              processed: state.value!.processed, 
                              requestType: state.value!.requestType, 
                        )));
                      } else {
                        BlocProvider.of<BackendRequestListBloc>(context).add(
                          AddBackendRequestList(value: BackendRequestModel(
                              documentID: state.value!.documentID, 
                              description: state.value!.description, 
                              appId: state.value!.appId, 
                              authorId: state.value!.authorId, 
                              name: state.value!.name, 
                              sendTo: state.value!.sendTo, 
                              collections: state.value!.collections, 
                              processed: state.value!.processed, 
                              requestType: state.value!.requestType, 
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
    _myFormBloc.add(ChangedBackendRequestDocumentID(value: _documentIDController.text));
  }


  void _onDescriptionChanged() {
    _myFormBloc.add(ChangedBackendRequestDescription(value: _descriptionController.text));
  }


  void _onAppIdChanged() {
    _myFormBloc.add(ChangedBackendRequestAppId(value: _appIdController.text));
  }


  void _onAuthorIdChanged() {
    _myFormBloc.add(ChangedBackendRequestAuthorId(value: _authorIdController.text));
  }


  void _onNameChanged() {
    _myFormBloc.add(ChangedBackendRequestName(value: _nameController.text));
  }


  void _onSendToChanged() {
    _myFormBloc.add(ChangedBackendRequestSendTo(value: _sendToController.text));
  }


  void setSelectionProcessed(bool? val) {
    setState(() {
      _processedSelection = val;
    });
    _myFormBloc.add(ChangedBackendRequestProcessed(value: val));
  }

  void setSelectionRequestType(int? val) {
    setState(() {
      _requestTypeSelectedRadioTile = val;
    });
    _myFormBloc.add(ChangedBackendRequestRequestType(value: toRequestType(val)));
  }



  @override
  void dispose() {
    _documentIDController.dispose();
    _descriptionController.dispose();
    _appIdController.dispose();
    _authorIdController.dispose();
    _nameController.dispose();
    _sendToController.dispose();
    super.dispose();
  }

  bool _readOnly(AccessState accessState, BackendRequestFormInitialized state) {
    return (formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData) || (!accessState.memberIsOwner(widget.app.documentID));
  }
  

}



