/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 eliud_style_attributes_form.dart
                       
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

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/embedded_component.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_core/model/entity_export.dart';

import 'package:eliud_core/model/eliud_style_attributes_list_bloc.dart';
import 'package:eliud_core/model/eliud_style_attributes_list_event.dart';
import 'package:eliud_core/model/eliud_style_attributes_model.dart';
import 'package:eliud_core/model/eliud_style_attributes_form_bloc.dart';
import 'package:eliud_core/model/eliud_style_attributes_form_event.dart';
import 'package:eliud_core/model/eliud_style_attributes_form_state.dart';


class EliudStyleAttributesForm extends StatelessWidget {
  FormAction formAction;
  EliudStyleAttributesModel? value;
  ActionModel? submitAction;

  EliudStyleAttributesForm({Key? key, required this.formAction, required this.value, this.submitAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    var app = AccessBloc.app(context);
    if (app == null) return Text("No app available");
    if (formAction == FormAction.ShowData) {
      return BlocProvider<EliudStyleAttributesFormBloc >(
            create: (context) => EliudStyleAttributesFormBloc(AccessBloc.appId(context),
                                       formAction: formAction,

                                                )..add(InitialiseEliudStyleAttributesFormEvent(value: value)),
  
        child: MyEliudStyleAttributesForm(submitAction: submitAction, formAction: formAction),
          );
    } if (formAction == FormAction.ShowPreloadedData) {
      return BlocProvider<EliudStyleAttributesFormBloc >(
            create: (context) => EliudStyleAttributesFormBloc(AccessBloc.appId(context),
                                       formAction: formAction,

                                                )..add(InitialiseEliudStyleAttributesFormNoLoadEvent(value: value)),
  
        child: MyEliudStyleAttributesForm(submitAction: submitAction, formAction: formAction),
          );
    } else {
      return Scaffold(
        appBar: StyleRegistry.registry().styleWithContext(context).adminFormStyle().constructAppBar(context, formAction == FormAction.UpdateAction ? 'Update EliudStyleAttributes' : 'Add EliudStyleAttributes'),
        body: BlocProvider<EliudStyleAttributesFormBloc >(
            create: (context) => EliudStyleAttributesFormBloc(AccessBloc.appId(context),
                                       formAction: formAction,

                                                )..add((formAction == FormAction.UpdateAction ? InitialiseEliudStyleAttributesFormEvent(value: value) : InitialiseNewEliudStyleAttributesFormEvent())),
  
        child: MyEliudStyleAttributesForm(submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}


class MyEliudStyleAttributesForm extends StatefulWidget {
  final FormAction? formAction;
  final ActionModel? submitAction;

  MyEliudStyleAttributesForm({this.formAction, this.submitAction});

  _MyEliudStyleAttributesFormState createState() => _MyEliudStyleAttributesFormState(this.formAction);
}


class _MyEliudStyleAttributesFormState extends State<MyEliudStyleAttributesForm> {
  final FormAction? formAction;
  late EliudStyleAttributesFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  String? _formBackground;
  String? _formAppBarBackground;
  String? _listBackground;
  String? _h1;
  String? _h2;
  String? _h3;
  String? _h4;
  String? _h5;
  String? _fontText;
  String? _fontHighlight1;
  String? _fontHighlight2;
  String? _fontLink;


  _MyEliudStyleAttributesFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<EliudStyleAttributesFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
    _descriptionController.addListener(_onDescriptionChanged);
  }

  @override
  Widget build(BuildContext context) {
    var app = AccessBloc.app(context);
    if (app == null) return Text('No app available');
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<EliudStyleAttributesFormBloc, EliudStyleAttributesFormState>(builder: (context, state) {
      if (state is EliudStyleAttributesFormUninitialized) return Center(
        child: DelayedCircularProgressIndicator(),
      );

      if (state is EliudStyleAttributesFormLoaded) {
        if (state.value!.documentID != null)
          _documentIDController.text = state.value!.documentID.toString();
        else
          _documentIDController.text = "";
        if (state.value!.description != null)
          _descriptionController.text = state.value!.description.toString();
        else
          _descriptionController.text = "";
        if (state.value!.formBackground != null)
          _formBackground= state.value!.formBackground!.documentID;
        else
          _formBackground= "";
        if (state.value!.formAppBarBackground != null)
          _formAppBarBackground= state.value!.formAppBarBackground!.documentID;
        else
          _formAppBarBackground= "";
        if (state.value!.listBackground != null)
          _listBackground= state.value!.listBackground!.documentID;
        else
          _listBackground= "";
        if (state.value!.h1 != null)
          _h1= state.value!.h1!.documentID;
        else
          _h1= "";
        if (state.value!.h2 != null)
          _h2= state.value!.h2!.documentID;
        else
          _h2= "";
        if (state.value!.h3 != null)
          _h3= state.value!.h3!.documentID;
        else
          _h3= "";
        if (state.value!.h4 != null)
          _h4= state.value!.h4!.documentID;
        else
          _h4= "";
        if (state.value!.h5 != null)
          _h5= state.value!.h5!.documentID;
        else
          _h5= "";
        if (state.value!.fontText != null)
          _fontText= state.value!.fontText!.documentID;
        else
          _fontText= "";
        if (state.value!.fontHighlight1 != null)
          _fontHighlight1= state.value!.fontHighlight1!.documentID;
        else
          _fontHighlight1= "";
        if (state.value!.fontHighlight2 != null)
          _fontHighlight2= state.value!.fontHighlight2!.documentID;
        else
          _fontHighlight2= "";
        if (state.value!.fontLink != null)
          _fontLink= state.value!.fontLink!.documentID;
        else
          _fontLink= "";
      }
      if (state is EliudStyleAttributesFormInitialized) {
        List<Widget> children = [];
         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'General')
                ));

        children.add(

                DropdownButtonComponentFactory().createNew(id: "fonts", value: _fontLink, trigger: _onFontLinkSelected, optional: true),
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'General')
                ));

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, 'Document ID', Icons.vpn_key, (formAction == FormAction.UpdateAction), _documentIDController, FieldType.String, validator: (_) => state is DocumentIDEliudStyleAttributesFormError ? state.message : null, hintText: 'null')
          );

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, 'Description', Icons.text_format, _readOnly(accessState, state), _descriptionController, FieldType.String, validator: (_) => state is DescriptionEliudStyleAttributesFormError ? state.message : null, hintText: 'null')
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Form Colors')
                ));

        children.add(

                RgbField("Form Submit Button Color", state.value!.formSubmitButtonColor, _onFormSubmitButtonColorChanged)
          );

        children.add(

                RgbField("Form Submit Button Text Color", state.value!.formSubmitButtonTextColor, _onFormSubmitButtonTextColorChanged)
          );

        children.add(

                RgbField("Form Group Title Color", state.value!.formGroupTitleColor, _onFormGroupTitleColorChanged)
          );

        children.add(

                RgbField("Form Field Text Color", state.value!.formFieldTextColor, _onFormFieldTextColorChanged)
          );

        children.add(

                RgbField("Form Field Focus Color", state.value!.formFieldFocusColor, _onFormFieldFocusColorChanged)
          );

        children.add(

                RgbField("Form App Bar Text color", state.value!.formAppBarTextColor, _onFormAppBarTextColorChanged)
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'List Items Colors')
                ));

        children.add(

                RgbField("List Item Text Color", state.value!.listTextItemColor, _onListTextItemColorChanged)
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Floating Button Colors')
                ));

        children.add(

                RgbField("List Item Text Color", state.value!.floatingButtonForegroundColor, _onFloatingButtonForegroundColorChanged)
          );

        children.add(

                RgbField("List Item Text Color", state.value!.floatingButtonBackgroundColor, _onFloatingButtonBackgroundColorChanged)
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Other Colors')
                ));

        children.add(

                RgbField("Form Field Header Color", state.value!.formFieldHeaderColor, _onFormFieldHeaderColorChanged)
          );

        children.add(

                RgbField("Divider Color", state.value!.dividerColor, _onDividerColorChanged)
          );

        children.add(

                RgbField("Divider Color", state.value!.dividerColor, _onDividerColorChanged)
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Background forms')
                ));

        children.add(

                DropdownButtonComponentFactory().createNew(id: "backgrounds", value: _formBackground, trigger: _onFormBackgroundSelected, optional: true),
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Form AppBar Background')
                ));

        children.add(

                DropdownButtonComponentFactory().createNew(id: "backgrounds", value: _formAppBarBackground, trigger: _onFormAppBarBackgroundSelected, optional: true),
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'List Background')
                ));

        children.add(

                DropdownButtonComponentFactory().createNew(id: "backgrounds", value: _listBackground, trigger: _onListBackgroundSelected, optional: true),
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Font header 1')
                ));

        children.add(

                DropdownButtonComponentFactory().createNew(id: "fonts", value: _h1, trigger: _onH1Selected, optional: true),
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Font header 2')
                ));

        children.add(

                DropdownButtonComponentFactory().createNew(id: "fonts", value: _h2, trigger: _onH2Selected, optional: true),
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Font header 3')
                ));

        children.add(

                DropdownButtonComponentFactory().createNew(id: "fonts", value: _h3, trigger: _onH3Selected, optional: true),
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Font header 4')
                ));

        children.add(

                DropdownButtonComponentFactory().createNew(id: "fonts", value: _h4, trigger: _onH4Selected, optional: true),
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Font header 5')
                ));

        children.add(

                DropdownButtonComponentFactory().createNew(id: "fonts", value: _h5, trigger: _onH5Selected, optional: true),
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Font header 5')
                ));

        children.add(

                DropdownButtonComponentFactory().createNew(id: "fonts", value: _fontText, trigger: _onFontTextSelected, optional: true),
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Font highlight 1')
                ));

        children.add(

                DropdownButtonComponentFactory().createNew(id: "fonts", value: _fontHighlight1, trigger: _onFontHighlight1Selected, optional: true),
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Font hightlight 2')
                ));

        children.add(

                DropdownButtonComponentFactory().createNew(id: "fonts", value: _fontHighlight2, trigger: _onFontHighlight2Selected, optional: true),
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Font Link')
                ));


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


        if ((formAction != FormAction.ShowData) && (formAction != FormAction.ShowPreloadedData))
          children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().submitButton(context, 'Submit',
                  onPressed: _readOnly(accessState, state) ? null : () {
                    if (state is EliudStyleAttributesFormError) {
                      return null;
                    } else {
                      if (formAction == FormAction.UpdateAction) {
                        BlocProvider.of<EliudStyleAttributesListBloc>(context).add(
                          UpdateEliudStyleAttributesList(value: state.value!.copyWith(
                              documentID: state.value!.documentID, 
                              description: state.value!.description, 
                              formSubmitButtonColor: state.value!.formSubmitButtonColor, 
                              formBackground: state.value!.formBackground, 
                              formSubmitButtonTextColor: state.value!.formSubmitButtonTextColor, 
                              formGroupTitleColor: state.value!.formGroupTitleColor, 
                              formFieldTextColor: state.value!.formFieldTextColor, 
                              formFieldHeaderColor: state.value!.formFieldHeaderColor, 
                              formFieldFocusColor: state.value!.formFieldFocusColor, 
                              formAppBarBackground: state.value!.formAppBarBackground, 
                              formAppBarTextColor: state.value!.formAppBarTextColor, 
                              listBackground: state.value!.listBackground, 
                              listTextItemColor: state.value!.listTextItemColor, 
                              floatingButtonForegroundColor: state.value!.floatingButtonForegroundColor, 
                              floatingButtonBackgroundColor: state.value!.floatingButtonBackgroundColor, 
                              dividerColor: state.value!.dividerColor, 
                              iconColor: state.value!.iconColor, 
                              h1: state.value!.h1, 
                              h2: state.value!.h2, 
                              h3: state.value!.h3, 
                              h4: state.value!.h4, 
                              h5: state.value!.h5, 
                              fontText: state.value!.fontText, 
                              fontHighlight1: state.value!.fontHighlight1, 
                              fontHighlight2: state.value!.fontHighlight2, 
                              fontLink: state.value!.fontLink, 
                        )));
                      } else {
                        BlocProvider.of<EliudStyleAttributesListBloc>(context).add(
                          AddEliudStyleAttributesList(value: EliudStyleAttributesModel(
                              documentID: state.value!.documentID, 
                              description: state.value!.description, 
                              formSubmitButtonColor: state.value!.formSubmitButtonColor, 
                              formBackground: state.value!.formBackground, 
                              formSubmitButtonTextColor: state.value!.formSubmitButtonTextColor, 
                              formGroupTitleColor: state.value!.formGroupTitleColor, 
                              formFieldTextColor: state.value!.formFieldTextColor, 
                              formFieldHeaderColor: state.value!.formFieldHeaderColor, 
                              formFieldFocusColor: state.value!.formFieldFocusColor, 
                              formAppBarBackground: state.value!.formAppBarBackground, 
                              formAppBarTextColor: state.value!.formAppBarTextColor, 
                              listBackground: state.value!.listBackground, 
                              listTextItemColor: state.value!.listTextItemColor, 
                              floatingButtonForegroundColor: state.value!.floatingButtonForegroundColor, 
                              floatingButtonBackgroundColor: state.value!.floatingButtonBackgroundColor, 
                              dividerColor: state.value!.dividerColor, 
                              iconColor: state.value!.iconColor, 
                              h1: state.value!.h1, 
                              h2: state.value!.h2, 
                              h3: state.value!.h3, 
                              h4: state.value!.h4, 
                              h5: state.value!.h5, 
                              fontText: state.value!.fontText, 
                              fontHighlight1: state.value!.fontHighlight1, 
                              fontHighlight2: state.value!.fontHighlight2, 
                              fontLink: state.value!.fontLink, 
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
    _myFormBloc.add(ChangedEliudStyleAttributesDocumentID(value: _documentIDController.text));
  }


  void _onDescriptionChanged() {
    _myFormBloc.add(ChangedEliudStyleAttributesDescription(value: _descriptionController.text));
  }


  void _onFormSubmitButtonColorChanged(value) {
    _myFormBloc.add(ChangedEliudStyleAttributesFormSubmitButtonColor(value: value));
    
  }


  void _onFormBackgroundSelected(String? val) {
    setState(() {
      _formBackground = val;
    });
    _myFormBloc.add(ChangedEliudStyleAttributesFormBackground(value: val));
  }


  void _onFormSubmitButtonTextColorChanged(value) {
    _myFormBloc.add(ChangedEliudStyleAttributesFormSubmitButtonTextColor(value: value));
    
  }


  void _onFormGroupTitleColorChanged(value) {
    _myFormBloc.add(ChangedEliudStyleAttributesFormGroupTitleColor(value: value));
    
  }


  void _onFormFieldTextColorChanged(value) {
    _myFormBloc.add(ChangedEliudStyleAttributesFormFieldTextColor(value: value));
    
  }


  void _onFormFieldHeaderColorChanged(value) {
    _myFormBloc.add(ChangedEliudStyleAttributesFormFieldHeaderColor(value: value));
    
  }


  void _onFormFieldFocusColorChanged(value) {
    _myFormBloc.add(ChangedEliudStyleAttributesFormFieldFocusColor(value: value));
    
  }


  void _onFormAppBarBackgroundSelected(String? val) {
    setState(() {
      _formAppBarBackground = val;
    });
    _myFormBloc.add(ChangedEliudStyleAttributesFormAppBarBackground(value: val));
  }


  void _onFormAppBarTextColorChanged(value) {
    _myFormBloc.add(ChangedEliudStyleAttributesFormAppBarTextColor(value: value));
    
  }


  void _onListBackgroundSelected(String? val) {
    setState(() {
      _listBackground = val;
    });
    _myFormBloc.add(ChangedEliudStyleAttributesListBackground(value: val));
  }


  void _onListTextItemColorChanged(value) {
    _myFormBloc.add(ChangedEliudStyleAttributesListTextItemColor(value: value));
    
  }


  void _onFloatingButtonForegroundColorChanged(value) {
    _myFormBloc.add(ChangedEliudStyleAttributesFloatingButtonForegroundColor(value: value));
    
  }


  void _onFloatingButtonBackgroundColorChanged(value) {
    _myFormBloc.add(ChangedEliudStyleAttributesFloatingButtonBackgroundColor(value: value));
    
  }


  void _onDividerColorChanged(value) {
    _myFormBloc.add(ChangedEliudStyleAttributesDividerColor(value: value));
    
  }


  void _onIconColorChanged(value) {
    _myFormBloc.add(ChangedEliudStyleAttributesIconColor(value: value));
    
  }


  void _onH1Selected(String? val) {
    setState(() {
      _h1 = val;
    });
    _myFormBloc.add(ChangedEliudStyleAttributesH1(value: val));
  }


  void _onH2Selected(String? val) {
    setState(() {
      _h2 = val;
    });
    _myFormBloc.add(ChangedEliudStyleAttributesH2(value: val));
  }


  void _onH3Selected(String? val) {
    setState(() {
      _h3 = val;
    });
    _myFormBloc.add(ChangedEliudStyleAttributesH3(value: val));
  }


  void _onH4Selected(String? val) {
    setState(() {
      _h4 = val;
    });
    _myFormBloc.add(ChangedEliudStyleAttributesH4(value: val));
  }


  void _onH5Selected(String? val) {
    setState(() {
      _h5 = val;
    });
    _myFormBloc.add(ChangedEliudStyleAttributesH5(value: val));
  }


  void _onFontTextSelected(String? val) {
    setState(() {
      _fontText = val;
    });
    _myFormBloc.add(ChangedEliudStyleAttributesFontText(value: val));
  }


  void _onFontHighlight1Selected(String? val) {
    setState(() {
      _fontHighlight1 = val;
    });
    _myFormBloc.add(ChangedEliudStyleAttributesFontHighlight1(value: val));
  }


  void _onFontHighlight2Selected(String? val) {
    setState(() {
      _fontHighlight2 = val;
    });
    _myFormBloc.add(ChangedEliudStyleAttributesFontHighlight2(value: val));
  }


  void _onFontLinkSelected(String? val) {
    setState(() {
      _fontLink = val;
    });
    _myFormBloc.add(ChangedEliudStyleAttributesFontLink(value: val));
  }



  @override
  void dispose() {
    _documentIDController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  bool _readOnly(AccessState accessState, EliudStyleAttributesFormInitialized state) {
    return (formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData) || (!accessState.memberIsOwner());
  }
  

}



