/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 country_form.dart
                       
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

import 'package:eliud_core/model/country_list_bloc.dart';
import 'package:eliud_core/model/country_list_event.dart';
import 'package:eliud_core/model/country_model.dart';
import 'package:eliud_core/model/country_form_bloc.dart';
import 'package:eliud_core/model/country_form_event.dart';
import 'package:eliud_core/model/country_form_state.dart';


class CountryForm extends StatelessWidget {
  final AppModel app;
  FormAction formAction;
  CountryModel? value;
  ActionModel? submitAction;

  CountryForm({Key? key, required this.app, required this.formAction, required this.value, this.submitAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    var appId = app.documentID!;
    if (formAction == FormAction.ShowData) {
      return BlocProvider<CountryFormBloc >(
            create: (context) => CountryFormBloc(appId,
                                       formAction: formAction,

                                                )..add(InitialiseCountryFormEvent(value: value)),
  
        child: MyCountryForm(app:app, submitAction: submitAction, formAction: formAction),
          );
    } if (formAction == FormAction.ShowPreloadedData) {
      return BlocProvider<CountryFormBloc >(
            create: (context) => CountryFormBloc(appId,
                                       formAction: formAction,

                                                )..add(InitialiseCountryFormNoLoadEvent(value: value)),
  
        child: MyCountryForm(app:app, submitAction: submitAction, formAction: formAction),
          );
    } else {
      return Scaffold(
        appBar: StyleRegistry.registry().styleWithApp(app).adminFormStyle().appBarWithString(app, context, title: formAction == FormAction.UpdateAction ? 'Update Country' : 'Add Country'),
        body: BlocProvider<CountryFormBloc >(
            create: (context) => CountryFormBloc(appId,
                                       formAction: formAction,

                                                )..add((formAction == FormAction.UpdateAction ? InitialiseCountryFormEvent(value: value) : InitialiseNewCountryFormEvent())),
  
        child: MyCountryForm(app: app, submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}


class MyCountryForm extends StatefulWidget {
  final AppModel app;
  final FormAction? formAction;
  final ActionModel? submitAction;

  MyCountryForm({required this.app, this.formAction, this.submitAction});

  _MyCountryFormState createState() => _MyCountryFormState(this.formAction);
}


class _MyCountryFormState extends State<MyCountryForm> {
  final FormAction? formAction;
  late CountryFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  final TextEditingController _countryCodeController = TextEditingController();
  final TextEditingController _countryNameController = TextEditingController();


  _MyCountryFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<CountryFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
    _countryCodeController.addListener(_onCountryCodeChanged);
    _countryNameController.addListener(_onCountryNameChanged);
  }

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<CountryFormBloc, CountryFormState>(builder: (context, state) {
      if (state is CountryFormUninitialized) return Center(
        child: StyleRegistry.registry().styleWithApp(widget.app).adminListStyle().progressIndicator(widget.app, context),
      );

      if (state is CountryFormLoaded) {
        if (state.value!.documentID != null)
          _documentIDController.text = state.value!.documentID.toString();
        else
          _documentIDController.text = "";
        if (state.value!.countryCode != null)
          _countryCodeController.text = state.value!.countryCode.toString();
        else
          _countryCodeController.text = "";
        if (state.value!.countryName != null)
          _countryNameController.text = state.value!.countryName.toString();
        else
          _countryNameController.text = "";
      }
      if (state is CountryFormInitialized) {
        List<Widget> children = [];
         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'General')
                ));

        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().textFormField(widget.app, context, labelText: 'Document ID', icon: Icons.vpn_key, readOnly: (formAction == FormAction.UpdateAction), textEditingController: _documentIDController, keyboardType: TextInputType.text, validator: (_) => state is DocumentIDCountryFormError ? state.message : null, hintText: null)
          );

        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().textFormField(widget.app, context, labelText: 'Country Code', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _countryCodeController, keyboardType: TextInputType.text, validator: (_) => state is CountryCodeCountryFormError ? state.message : null, hintText: null)
          );

        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().textFormField(widget.app, context, labelText: 'Country Name', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _countryNameController, keyboardType: TextInputType.text, validator: (_) => state is CountryNameCountryFormError ? state.message : null, hintText: null)
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


        if ((formAction != FormAction.ShowData) && (formAction != FormAction.ShowPreloadedData))
          children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().button(widget.app, context, label: 'Submit',
                  onPressed: _readOnly(accessState, state) ? null : () {
                    if (state is CountryFormError) {
                      return null;
                    } else {
                      if (formAction == FormAction.UpdateAction) {
                        BlocProvider.of<CountryListBloc>(context).add(
                          UpdateCountryList(value: state.value!.copyWith(
                              documentID: state.value!.documentID, 
                              countryCode: state.value!.countryCode, 
                              countryName: state.value!.countryName, 
                        )));
                      } else {
                        BlocProvider.of<CountryListBloc>(context).add(
                          AddCountryList(value: CountryModel(
                              documentID: state.value!.documentID, 
                              countryCode: state.value!.countryCode, 
                              countryName: state.value!.countryName, 
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
    _myFormBloc.add(ChangedCountryDocumentID(value: _documentIDController.text));
  }


  void _onCountryCodeChanged() {
    _myFormBloc.add(ChangedCountryCountryCode(value: _countryCodeController.text));
  }


  void _onCountryNameChanged() {
    _myFormBloc.add(ChangedCountryCountryName(value: _countryNameController.text));
  }



  @override
  void dispose() {
    _documentIDController.dispose();
    _countryCodeController.dispose();
    _countryNameController.dispose();
    super.dispose();
  }

  bool _readOnly(AccessState accessState, CountryFormInitialized state) {
    return (formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData) || (!accessState.memberIsOwner(widget.app.documentID!));
  }
  

}



