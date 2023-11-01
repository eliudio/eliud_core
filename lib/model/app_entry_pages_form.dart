/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 app_entry_pages_form.dart
                       
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

import 'package:eliud_core/model/app_entry_pages_list_bloc.dart';
import 'package:eliud_core/model/app_entry_pages_list_event.dart';
import 'package:eliud_core/model/app_entry_pages_form_bloc.dart';
import 'package:eliud_core/model/app_entry_pages_form_event.dart';
import 'package:eliud_core/model/app_entry_pages_form_state.dart';


class AppEntryPagesForm extends StatelessWidget {
  final AppModel app;
  FormAction formAction;
  AppEntryPagesModel? value;
  ActionModel? submitAction;

  AppEntryPagesForm({Key? key, required this.app, required this.formAction, required this.value, this.submitAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    var appId = app.documentID;
    if (formAction == FormAction.ShowData) {
      return BlocProvider<AppEntryPagesFormBloc >(
            create: (context) => AppEntryPagesFormBloc(appId,
                                       
                                                )..add(InitialiseAppEntryPagesFormEvent(value: value)),
  
        child: MyAppEntryPagesForm(app:app, submitAction: submitAction, formAction: formAction),
          );
    } if (formAction == FormAction.ShowPreloadedData) {
      return BlocProvider<AppEntryPagesFormBloc >(
            create: (context) => AppEntryPagesFormBloc(appId,
                                       
                                                )..add(InitialiseAppEntryPagesFormNoLoadEvent(value: value)),
  
        child: MyAppEntryPagesForm(app:app, submitAction: submitAction, formAction: formAction),
          );
    } else {
      return Scaffold(
        appBar: StyleRegistry.registry().styleWithApp(app).adminFormStyle().appBarWithString(app, context, title: formAction == FormAction.UpdateAction ? 'Update AppEntryPages' : 'Add AppEntryPages'),
        body: BlocProvider<AppEntryPagesFormBloc >(
            create: (context) => AppEntryPagesFormBloc(appId,
                                       
                                                )..add((formAction == FormAction.UpdateAction ? InitialiseAppEntryPagesFormEvent(value: value) : InitialiseNewAppEntryPagesFormEvent())),
  
        child: MyAppEntryPagesForm(app: app, submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}


class MyAppEntryPagesForm extends StatefulWidget {
  final AppModel app;
  final FormAction? formAction;
  final ActionModel? submitAction;

  MyAppEntryPagesForm({required this.app, this.formAction, this.submitAction});

  _MyAppEntryPagesFormState createState() => _MyAppEntryPagesFormState(this.formAction);
}


class _MyAppEntryPagesFormState extends State<MyAppEntryPagesForm> {
  final FormAction? formAction;
  late AppEntryPagesFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  String? _entryPage;
  final TextEditingController _minPrivilegeController = TextEditingController();


  _MyAppEntryPagesFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<AppEntryPagesFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
    _minPrivilegeController.addListener(_onMinPrivilegeChanged);
  }

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<AppEntryPagesFormBloc, AppEntryPagesFormState>(builder: (context, state) {
      if (state is AppEntryPagesFormUninitialized) return Center(
        child: StyleRegistry.registry().styleWithApp(widget.app).adminListStyle().progressIndicator(widget.app, context),
      );

      if (state is AppEntryPagesFormLoaded) {
        if (state.value!.documentID != null)
          _documentIDController.text = state.value!.documentID.toString();
        else
          _documentIDController.text = "";
        if (state.value!.entryPage != null)
          _entryPage= state.value!.entryPage!.documentID;
        else
          _entryPage= "";
        if (state.value!.minPrivilege != null)
          _minPrivilegeController.text = state.value!.minPrivilege.toString();
        else
          _minPrivilegeController.text = "";
      }
      if (state is AppEntryPagesFormInitialized) {
        List<Widget> children = [];
         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'General')
                ));

        children.add(

                DropdownButtonComponentFactory().createNew(app: widget.app, id: "pages", value: _entryPage, trigger: (value, privilegeLevel) => _onEntryPageSelected(value), optional: false),
          );

        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().textFormField(widget.app, context, labelText: 'minPrivilege', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _minPrivilegeController, keyboardType: TextInputType.number, validator: (_) => state is MinPrivilegeAppEntryPagesFormError ? state.message : null, hintText: 'field.remark')
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'Component')
                ));


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'Component spec')
                ));


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


        if ((formAction != FormAction.ShowData) && (formAction != FormAction.ShowPreloadedData))
          children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().button(widget.app, context, label: 'Submit',
                  onPressed: _readOnly(accessState, state) ? null : () {
                    if (state is AppEntryPagesFormError) {
                      return null;
                    } else {
                      if (formAction == FormAction.UpdateAction) {
                        BlocProvider.of<AppEntryPagesListBloc>(context).add(
                          UpdateAppEntryPagesList(value: state.value!.copyWith(
                              documentID: state.value!.documentID, 
                              entryPage: state.value!.entryPage, 
                              minPrivilege: state.value!.minPrivilege, 
                        )));
                      } else {
                        BlocProvider.of<AppEntryPagesListBloc>(context).add(
                          AddAppEntryPagesList(value: AppEntryPagesModel(
                              documentID: state.value!.documentID, 
                              entryPage: state.value!.entryPage, 
                              minPrivilege: state.value!.minPrivilege, 
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
              children: children
            ),
          ), formAction!
        );
      } else {
        return StyleRegistry.registry().styleWithApp(widget.app).adminListStyle().progressIndicator(widget.app, context);
      }
    });
  }

  void _onDocumentIDChanged() {
    _myFormBloc.add(ChangedAppEntryPagesDocumentID(value: _documentIDController.text));
  }


  void _onEntryPageSelected(String? val) {
    setState(() {
      _entryPage = val;
    });
    _myFormBloc.add(ChangedAppEntryPagesEntryPage(value: val));
  }


  void _onMinPrivilegeChanged() {
    _myFormBloc.add(ChangedAppEntryPagesMinPrivilege(value: _minPrivilegeController.text));
  }



  @override
  void dispose() {
    _documentIDController.dispose();
    _minPrivilegeController.dispose();
    super.dispose();
  }

  bool _readOnly(AccessState accessState, AppEntryPagesFormInitialized state) {
    return (formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData) || (!accessState.memberIsOwner(widget.app.documentID));
  }
  

}



