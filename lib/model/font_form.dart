/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 font_form.dart
                       
 This code is generated. This is read only. Don't touch!

*/

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

import 'package:eliud_core/model/font_list_bloc.dart';
import 'package:eliud_core/model/font_list_event.dart';
import 'package:eliud_core/model/font_model.dart';
import 'package:eliud_core/model/font_form_bloc.dart';
import 'package:eliud_core/model/font_form_event.dart';
import 'package:eliud_core/model/font_form_state.dart';


class FontForm extends StatelessWidget {
  FormAction formAction;
  FontModel? value;
  ActionModel? submitAction;

  FontForm({Key? key, required this.formAction, required this.value, this.submitAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    var app = AccessBloc.app(context);
    if (app == null) return Text("No app available");
    if (formAction == FormAction.ShowData) {
      return BlocProvider<FontFormBloc >(
            create: (context) => FontFormBloc(AccessBloc.appId(context),
                                       formAction: formAction,

                                                )..add(InitialiseFontFormEvent(value: value)),
  
        child: MyFontForm(submitAction: submitAction, formAction: formAction),
          );
    } if (formAction == FormAction.ShowPreloadedData) {
      return BlocProvider<FontFormBloc >(
            create: (context) => FontFormBloc(AccessBloc.appId(context),
                                       formAction: formAction,

                                                )..add(InitialiseFontFormNoLoadEvent(value: value)),
  
        child: MyFontForm(submitAction: submitAction, formAction: formAction),
          );
    } else {
      return Scaffold(
        appBar: StyleRegistry.registry().styleWithContext(context).adminFormStyle().appBarWithString(context, title: formAction == FormAction.UpdateAction ? 'Update Font' : 'Add Font'),
        body: BlocProvider<FontFormBloc >(
            create: (context) => FontFormBloc(AccessBloc.appId(context),
                                       formAction: formAction,

                                                )..add((formAction == FormAction.UpdateAction ? InitialiseFontFormEvent(value: value) : InitialiseNewFontFormEvent())),
  
        child: MyFontForm(submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}


class MyFontForm extends StatefulWidget {
  final FormAction? formAction;
  final ActionModel? submitAction;

  MyFontForm({this.formAction, this.submitAction});

  _MyFontFormState createState() => _MyFontFormState(this.formAction);
}


class _MyFontFormState extends State<MyFontForm> {
  final FormAction? formAction;
  late FontFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  final TextEditingController _fontNameController = TextEditingController();
  final TextEditingController _sizeController = TextEditingController();
  int? _weightSelectedRadioTile;
  int? _styleSelectedRadioTile;
  int? _decorationSelectedRadioTile;


  _MyFontFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<FontFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
    _fontNameController.addListener(_onFontNameChanged);
    _sizeController.addListener(_onSizeChanged);
    _weightSelectedRadioTile = 0;
    _styleSelectedRadioTile = 0;
    _decorationSelectedRadioTile = 0;
  }

  @override
  Widget build(BuildContext context) {
    var app = AccessBloc.app(context);
    if (app == null) return Text('No app available');
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<FontFormBloc, FontFormState>(builder: (context, state) {
      if (state is FontFormUninitialized) return Center(
        child: StyleRegistry.registry().styleWithContext(context).frontEndStyle().progressIndicator(context),
      );

      if (state is FontFormLoaded) {
        if (state.value!.documentID != null)
          _documentIDController.text = state.value!.documentID.toString();
        else
          _documentIDController.text = "";
        if (state.value!.fontName != null)
          _fontNameController.text = state.value!.fontName.toString();
        else
          _fontNameController.text = "";
        if (state.value!.size != null)
          _sizeController.text = state.value!.size.toString();
        else
          _sizeController.text = "";
        if (state.value!.weight != null)
          _weightSelectedRadioTile = state.value!.weight!.index;
        else
          _weightSelectedRadioTile = 0;
        if (state.value!.style != null)
          _styleSelectedRadioTile = state.value!.style!.index;
        else
          _styleSelectedRadioTile = 0;
        if (state.value!.decoration != null)
          _decorationSelectedRadioTile = state.value!.decoration!.index;
        else
          _decorationSelectedRadioTile = 0;
      }
      if (state is FontFormInitialized) {
        List<Widget> children = [];
         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'General')
                ));

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'Document ID', icon: Icons.vpn_key, readOnly: (formAction == FormAction.UpdateAction), textEditingController: _documentIDController, keyboardType: TextInputType.text, validator: (_) => state is DocumentIDFontFormError ? state.message : null, hintText: null)
          );

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'Font Family Name (currently supported family is Google Fonts)', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _fontNameController, keyboardType: TextInputType.text, validator: (_) => state is FontNameFontFormError ? state.message : null, hintText: 'field.remark')
          );

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'Size', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _sizeController, keyboardType: TextInputType.number, validator: (_) => state is SizeFontFormError ? state.message : null, hintText: null)
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Weight')
                ));

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _weightSelectedRadioTile, 'Thin', 'Thin', !accessState.memberIsOwner() ? null : (dynamic val) => setSelectionWeight(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _weightSelectedRadioTile, 'ExtraLight', 'ExtraLight', !accessState.memberIsOwner() ? null : (dynamic val) => setSelectionWeight(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _weightSelectedRadioTile, 'Light', 'Light', !accessState.memberIsOwner() ? null : (dynamic val) => setSelectionWeight(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _weightSelectedRadioTile, 'Normal', 'Normal', !accessState.memberIsOwner() ? null : (dynamic val) => setSelectionWeight(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _weightSelectedRadioTile, 'Medium', 'Medium', !accessState.memberIsOwner() ? null : (dynamic val) => setSelectionWeight(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _weightSelectedRadioTile, 'SemiBold', 'SemiBold', !accessState.memberIsOwner() ? null : (dynamic val) => setSelectionWeight(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _weightSelectedRadioTile, 'Bold', 'Bold', !accessState.memberIsOwner() ? null : (dynamic val) => setSelectionWeight(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _weightSelectedRadioTile, 'ExtraBold', 'ExtraBold', !accessState.memberIsOwner() ? null : (dynamic val) => setSelectionWeight(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _weightSelectedRadioTile, 'MostThick', 'MostThick', !accessState.memberIsOwner() ? null : (dynamic val) => setSelectionWeight(val))
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Style')
                ));

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _styleSelectedRadioTile, 'Italic', 'Italic', !accessState.memberIsOwner() ? null : (dynamic val) => setSelectionStyle(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _styleSelectedRadioTile, 'Normal', 'Normal', !accessState.memberIsOwner() ? null : (dynamic val) => setSelectionStyle(val))
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Decoration')
                ));

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _decorationSelectedRadioTile, 'None', 'None', !accessState.memberIsOwner() ? null : (dynamic val) => setSelectionDecoration(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _decorationSelectedRadioTile, 'Underline', 'Underline', !accessState.memberIsOwner() ? null : (dynamic val) => setSelectionDecoration(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _decorationSelectedRadioTile, 'Overline', 'Overline', !accessState.memberIsOwner() ? null : (dynamic val) => setSelectionDecoration(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _decorationSelectedRadioTile, 'LineThrough', 'LineThrough', !accessState.memberIsOwner() ? null : (dynamic val) => setSelectionDecoration(val))
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Font Color')
                ));

        children.add(

                RgbField("Font Color", state.value!.color, _onColorChanged)
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


        if ((formAction != FormAction.ShowData) && (formAction != FormAction.ShowPreloadedData))
          children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().button(context, label: 'Submit',
                  onPressed: _readOnly(accessState, state) ? null : () {
                    if (state is FontFormError) {
                      return null;
                    } else {
                      if (formAction == FormAction.UpdateAction) {
                        BlocProvider.of<FontListBloc>(context).add(
                          UpdateFontList(value: state.value!.copyWith(
                              documentID: state.value!.documentID, 
                              fontName: state.value!.fontName, 
                              size: state.value!.size, 
                              weight: state.value!.weight, 
                              style: state.value!.style, 
                              decoration: state.value!.decoration, 
                              color: state.value!.color, 
                        )));
                      } else {
                        BlocProvider.of<FontListBloc>(context).add(
                          AddFontList(value: FontModel(
                              documentID: state.value!.documentID, 
                              fontName: state.value!.fontName, 
                              size: state.value!.size, 
                              weight: state.value!.weight, 
                              style: state.value!.style, 
                              decoration: state.value!.decoration, 
                              color: state.value!.color, 
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
        return StyleRegistry.registry().styleWithContext(context).frontEndStyle().progressIndicator(context);
      }
    });
  }

  void _onDocumentIDChanged() {
    _myFormBloc.add(ChangedFontDocumentID(value: _documentIDController.text));
  }


  void _onFontNameChanged() {
    _myFormBloc.add(ChangedFontFontName(value: _fontNameController.text));
  }


  void _onSizeChanged() {
    _myFormBloc.add(ChangedFontSize(value: _sizeController.text));
  }


  void setSelectionWeight(int? val) {
    setState(() {
      _weightSelectedRadioTile = val;
    });
    _myFormBloc.add(ChangedFontWeight(value: toEliudFontWeight(val)));
  }


  void setSelectionStyle(int? val) {
    setState(() {
      _styleSelectedRadioTile = val;
    });
    _myFormBloc.add(ChangedFontStyle(value: toEliudFontStyle(val)));
  }


  void setSelectionDecoration(int? val) {
    setState(() {
      _decorationSelectedRadioTile = val;
    });
    _myFormBloc.add(ChangedFontDecoration(value: toEliudFontDecoration(val)));
  }


  void _onColorChanged(value) {
    _myFormBloc.add(ChangedFontColor(value: value));
    
  }



  @override
  void dispose() {
    _documentIDController.dispose();
    _fontNameController.dispose();
    _sizeController.dispose();
    super.dispose();
  }

  bool _readOnly(AccessState accessState, FontFormInitialized state) {
    return (formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData) || (!accessState.memberIsOwner());
  }
  

}



