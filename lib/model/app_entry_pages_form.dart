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
import 'package:eliud_core/core/blocs/access/state/logged_in.dart';
import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:eliud_core/core/blocs/app/app_bloc.dart';
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

import 'package:eliud_core/model/app_entry_pages_list_bloc.dart';
import 'package:eliud_core/model/app_entry_pages_list_event.dart';
import 'package:eliud_core/model/app_entry_pages_model.dart';
import 'package:eliud_core/model/app_entry_pages_form_bloc.dart';
import 'package:eliud_core/model/app_entry_pages_form_event.dart';
import 'package:eliud_core/model/app_entry_pages_form_state.dart';


class AppEntryPagesForm extends StatelessWidget {
  FormAction formAction;
  AppEntryPagesModel? value;
  ActionModel? submitAction;

  AppEntryPagesForm({Key? key, required this.formAction, required this.value, this.submitAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    var app = AppBloc.currentApp(context);
    if (app == null) return Text("No app available");
    if (formAction == FormAction.ShowData) {
      return BlocProvider<AppEntryPagesFormBloc >(
            create: (context) => AppEntryPagesFormBloc(AppBloc.currentAppId(context),
                                       
                                                )..add(InitialiseAppEntryPagesFormEvent(value: value)),
  
        child: MyAppEntryPagesForm(submitAction: submitAction, formAction: formAction),
          );
    } if (formAction == FormAction.ShowPreloadedData) {
      return BlocProvider<AppEntryPagesFormBloc >(
            create: (context) => AppEntryPagesFormBloc(AppBloc.currentAppId(context),
                                       
                                                )..add(InitialiseAppEntryPagesFormNoLoadEvent(value: value)),
  
        child: MyAppEntryPagesForm(submitAction: submitAction, formAction: formAction),
          );
    } else {
      return Scaffold(
        appBar: StyleRegistry.registry().styleWithContext(context).adminFormStyle().appBarWithString(context, title: formAction == FormAction.UpdateAction ? 'Update AppEntryPages' : 'Add AppEntryPages'),
        body: BlocProvider<AppEntryPagesFormBloc >(
            create: (context) => AppEntryPagesFormBloc(AppBloc.currentAppId(context),
                                       
                                                )..add((formAction == FormAction.UpdateAction ? InitialiseAppEntryPagesFormEvent(value: value) : InitialiseNewAppEntryPagesFormEvent())),
  
        child: MyAppEntryPagesForm(submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}


class MyAppEntryPagesForm extends StatefulWidget {
  final FormAction? formAction;
  final ActionModel? submitAction;

  MyAppEntryPagesForm({this.formAction, this.submitAction});

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
    var app = AppBloc.currentApp(context);
    if (app == null) return Text('No app available');
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<AppEntryPagesFormBloc, AppEntryPagesFormState>(builder: (context, state) {
      if (state is AppEntryPagesFormUninitialized) return Center(
        child: StyleRegistry.registry().styleWithContext(context).adminListStyle().progressIndicator(context),
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
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'General')
                ));

        children.add(

                DropdownButtonComponentFactory().createNew(id: "pages", value: _entryPage, trigger: _onEntryPageSelected, optional: false),
          );

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'minPrivilege', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _minPrivilegeController, keyboardType: TextInputType.number, validator: (_) => state is MinPrivilegeAppEntryPagesFormError ? state.message : null, hintText: 'field.remark')
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Component')
                ));


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Component spec')
                ));


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


        if ((formAction != FormAction.ShowData) && (formAction != FormAction.ShowPreloadedData))
          children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().button(context, label: 'Submit',
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
        return StyleRegistry.registry().styleWithContext(context).adminListStyle().progressIndicator(context);
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
    return (formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData) || (!accessState.memberIsOwner(AppBloc.currentAppId(context)));
  }
  

}



