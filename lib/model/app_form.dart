/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 app_form.dart
                       
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

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/embedded_component.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_core/model/entity_export.dart';

import 'package:eliud_core/model/app_list_bloc.dart';
import 'package:eliud_core/model/app_list_event.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/app_form_bloc.dart';
import 'package:eliud_core/model/app_form_event.dart';
import 'package:eliud_core/model/app_form_state.dart';


class AppForm extends StatelessWidget {
  FormAction formAction;
  AppModel? value;
  ActionModel? submitAction;

  AppForm({Key? key, required this.formAction, required this.value, this.submitAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    var app = AccessBloc.app(context);
    if (app == null) return Text("No app available");
    if (formAction == FormAction.ShowData) {
      return BlocProvider<AppFormBloc >(
            create: (context) => AppFormBloc(AccessBloc.appId(context),
                                       formAction: formAction,

                                                )..add(InitialiseAppFormEvent(value: value)),
  
        child: MyAppForm(submitAction: submitAction, formAction: formAction),
          );
    } if (formAction == FormAction.ShowPreloadedData) {
      return BlocProvider<AppFormBloc >(
            create: (context) => AppFormBloc(AccessBloc.appId(context),
                                       formAction: formAction,

                                                )..add(InitialiseAppFormNoLoadEvent(value: value)),
  
        child: MyAppForm(submitAction: submitAction, formAction: formAction),
          );
    } else {
      return Scaffold(
        appBar: formAction == FormAction.UpdateAction ?
                AppBar(
                    title: Text("Update App", style: TextStyle(color: RgbHelper.color(rgbo: app.formAppBarTextColor))),
                    flexibleSpace: Container(
                        decoration: BoxDecorationHelper.boxDecoration(accessState, app.formAppBarBackground)),
                  ) :
                AppBar(
                    title: Text("Add App", style: TextStyle(color: RgbHelper.color(rgbo: app.formAppBarTextColor))),
                    flexibleSpace: Container(
                        decoration: BoxDecorationHelper.boxDecoration(accessState, app.formAppBarBackground)),
                ),
        body: BlocProvider<AppFormBloc >(
            create: (context) => AppFormBloc(AccessBloc.appId(context),
                                       formAction: formAction,

                                                )..add((formAction == FormAction.UpdateAction ? InitialiseAppFormEvent(value: value) : InitialiseNewAppFormEvent())),
  
        child: MyAppForm(submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}


class MyAppForm extends StatefulWidget {
  final FormAction? formAction;
  final ActionModel? submitAction;

  MyAppForm({this.formAction, this.submitAction});

  _MyAppFormState createState() => _MyAppFormState(this.formAction);
}


class _MyAppFormState extends State<MyAppForm> {
  final FormAction? formAction;
  late AppFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  final TextEditingController _ownerIDController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  int? _appStatusSelectedRadioTile;
  int? _darkOrLightSelectedRadioTile;
  String? _logo;
  String? _formBackground;
  String? _formAppBarBackground;
  String? _listBackground;
  int? _routeBuilderSelectedRadioTile;
  final TextEditingController _routeAnimationDurationController = TextEditingController();
  final TextEditingController _logoURLController = TextEditingController();
  String? _h1;
  String? _h2;
  String? _h3;
  String? _h4;
  String? _h5;
  String? _fontText;
  String? _fontHighlight1;
  String? _fontHighlight2;
  String? _fontLink;
  String? _policies;


  _MyAppFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<AppFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
    _ownerIDController.addListener(_onOwnerIDChanged);
    _titleController.addListener(_onTitleChanged);
    _emailController.addListener(_onEmailChanged);
    _descriptionController.addListener(_onDescriptionChanged);
    _appStatusSelectedRadioTile = 0;
    _darkOrLightSelectedRadioTile = 0;
    _routeBuilderSelectedRadioTile = 0;
    _routeAnimationDurationController.addListener(_onRouteAnimationDurationChanged);
    _logoURLController.addListener(_onLogoURLChanged);
  }

  @override
  Widget build(BuildContext context) {
    var app = AccessBloc.app(context);
    if (app == null) return Text('No app available');
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<AppFormBloc, AppFormState>(builder: (context, state) {
      if (state is AppFormUninitialized) return Center(
        child: DelayedCircularProgressIndicator(),
      );

      if (state is AppFormLoaded) {
        if (state.value!.documentID != null)
          _documentIDController.text = state.value!.documentID.toString();
        else
          _documentIDController.text = "";
        if (state.value!.ownerID != null)
          _ownerIDController.text = state.value!.ownerID.toString();
        else
          _ownerIDController.text = "";
        if (state.value!.title != null)
          _titleController.text = state.value!.title.toString();
        else
          _titleController.text = "";
        if (state.value!.email != null)
          _emailController.text = state.value!.email.toString();
        else
          _emailController.text = "";
        if (state.value!.description != null)
          _descriptionController.text = state.value!.description.toString();
        else
          _descriptionController.text = "";
        if (state.value!.appStatus != null)
          _appStatusSelectedRadioTile = state.value!.appStatus!.index;
        else
          _appStatusSelectedRadioTile = 0;
        if (state.value!.darkOrLight != null)
          _darkOrLightSelectedRadioTile = state.value!.darkOrLight!.index;
        else
          _darkOrLightSelectedRadioTile = 0;
        if (state.value!.logo != null)
          _logo= state.value!.logo!.documentID;
        else
          _logo= "";
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
        if (state.value!.routeBuilder != null)
          _routeBuilderSelectedRadioTile = state.value!.routeBuilder!.index;
        else
          _routeBuilderSelectedRadioTile = 0;
        if (state.value!.routeAnimationDuration != null)
          _routeAnimationDurationController.text = state.value!.routeAnimationDuration.toString();
        else
          _routeAnimationDurationController.text = "";
        if (state.value!.logoURL != null)
          _logoURLController.text = state.value!.logoURL.toString();
        else
          _logoURLController.text = "";
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
        if (state.value!.policies != null)
          _policies= state.value!.policies!.documentID;
        else
          _policies= "";
      }
      if (state is AppFormInitialized) {
        List<Widget> children = [];
         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('General',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: app.formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                DropdownButtonComponentFactory().createNew(id: "fonts", value: _fontLink, trigger: _onFontLinkSelected, optional: true),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: app.dividerColor)));


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
                    return state is DocumentIDAppFormError ? state.message : null;
                  },
                ),
          );

        children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor)),
                  readOnly: _readOnly(accessState, state),
                  controller: _titleController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldFocusColor))),                    icon: Icon(Icons.text_format, color: RgbHelper.color(rgbo: app.formFieldHeaderColor)),
                    labelText: 'Title',
                  ),
                  keyboardType: TextInputType.text,
                  autovalidate: true,
                  validator: (_) {
                    return state is TitleAppFormError ? state.message : null;
                  },
                ),
          );

        children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor)),
                  readOnly: _readOnly(accessState, state),
                  controller: _emailController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldFocusColor))),                    icon: Icon(Icons.email, color: RgbHelper.color(rgbo: app.formFieldHeaderColor)),
                    labelText: 'Contact email',
                  ),
                  keyboardType: TextInputType.text,
                  autovalidate: true,
                  validator: (_) {
                    return state is EmailAppFormError ? state.message : null;
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
                    return state is DescriptionAppFormError ? state.message : null;
                  },
                ),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: app.dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Policy',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: app.formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                DropdownButtonComponentFactory().createNew(id: "appPolicys", value: _policies, trigger: _onPoliciesSelected, optional: true),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: app.dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Owner',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: app.formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: app.dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Dark or Light',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: app.formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                RadioListTile(
                    value: 0,
                    activeColor: RgbHelper.color(rgbo: app.formFieldTextColor),
                    groupValue: _darkOrLightSelectedRadioTile,
                    title: Text("Dark", style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    subtitle: Text("Dark", style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    onChanged: !accessState.memberIsOwner() ? null : (dynamic val) {
                      setSelectionDarkOrLight(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 1,
                    activeColor: RgbHelper.color(rgbo: app.formFieldTextColor),
                    groupValue: _darkOrLightSelectedRadioTile,
                    title: Text("Light", style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    subtitle: Text("Light", style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    onChanged: !accessState.memberIsOwner() ? null : (dynamic val) {
                      setSelectionDarkOrLight(val);
                    },
                ),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: app.dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Home Pages',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: app.formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));



        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: app.dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Logo',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: app.formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                DropdownButtonComponentFactory().createNew(id: "memberMediums", value: _logo, trigger: _onLogoSelected, optional: true),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: app.dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Form Colors',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: app.formGroupTitleColor), fontWeight: FontWeight.bold)),
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
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: app.dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('List Items Colors',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: app.formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                RgbField("List Item Text Color", state.value!.listTextItemColor, _onListTextItemColorChanged)
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: app.dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Floating Button Colors',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: app.formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                RgbField("List Item Text Color", state.value!.floatingButtonForegroundColor, _onFloatingButtonForegroundColorChanged)
          );

        children.add(

                RgbField("List Item Text Color", state.value!.floatingButtonBackgroundColor, _onFloatingButtonBackgroundColorChanged)
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: app.dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Other Colors',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: app.formGroupTitleColor), fontWeight: FontWeight.bold)),
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
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: app.dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Background forms',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: app.formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                DropdownButtonComponentFactory().createNew(id: "backgrounds", value: _formBackground, trigger: _onFormBackgroundSelected, optional: true),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: app.dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Form AppBar Background',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: app.formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                DropdownButtonComponentFactory().createNew(id: "backgrounds", value: _formAppBarBackground, trigger: _onFormAppBarBackgroundSelected, optional: true),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: app.dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('List Background',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: app.formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                DropdownButtonComponentFactory().createNew(id: "backgrounds", value: _listBackground, trigger: _onListBackgroundSelected, optional: true),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: app.dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Flush Cache',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: app.formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: app.dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Page Route Builder',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: app.formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                RadioListTile(
                    value: 0,
                    activeColor: RgbHelper.color(rgbo: app.formFieldTextColor),
                    groupValue: _routeBuilderSelectedRadioTile,
                    title: Text("SlideRightToLeft", style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    subtitle: Text("SlideRightToLeft", style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    onChanged: !accessState.memberIsOwner() ? null : (dynamic val) {
                      setSelectionRouteBuilder(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 1,
                    activeColor: RgbHelper.color(rgbo: app.formFieldTextColor),
                    groupValue: _routeBuilderSelectedRadioTile,
                    title: Text("SlideBottomToTop", style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    subtitle: Text("SlideBottomToTop", style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    onChanged: !accessState.memberIsOwner() ? null : (dynamic val) {
                      setSelectionRouteBuilder(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 2,
                    activeColor: RgbHelper.color(rgbo: app.formFieldTextColor),
                    groupValue: _routeBuilderSelectedRadioTile,
                    title: Text("ScaleRoute", style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    subtitle: Text("ScaleRoute", style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    onChanged: !accessState.memberIsOwner() ? null : (dynamic val) {
                      setSelectionRouteBuilder(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 3,
                    activeColor: RgbHelper.color(rgbo: app.formFieldTextColor),
                    groupValue: _routeBuilderSelectedRadioTile,
                    title: Text("RotationRoute", style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    subtitle: Text("RotationRoute", style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    onChanged: !accessState.memberIsOwner() ? null : (dynamic val) {
                      setSelectionRouteBuilder(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 4,
                    activeColor: RgbHelper.color(rgbo: app.formFieldTextColor),
                    groupValue: _routeBuilderSelectedRadioTile,
                    title: Text("FadeRoute", style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    subtitle: Text("FadeRoute", style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    onChanged: !accessState.memberIsOwner() ? null : (dynamic val) {
                      setSelectionRouteBuilder(val);
                    },
                ),
          );

        children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor)),
                  readOnly: _readOnly(accessState, state),
                  controller: _routeAnimationDurationController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldFocusColor))),                    icon: Icon(Icons.text_format, color: RgbHelper.color(rgbo: app.formFieldHeaderColor)),
                    labelText: 'Page Animation (millisec)',
                  ),
                  keyboardType: TextInputType.number,
                  autovalidate: true,
                  validator: (_) {
                    return state is RouteAnimationDurationAppFormError ? state.message : null;
                  },
                ),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: app.dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Status of the application',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: app.formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                RadioListTile(
                    value: 0,
                    activeColor: RgbHelper.color(rgbo: app.formFieldTextColor),
                    groupValue: _appStatusSelectedRadioTile,
                    title: Text("Live", style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    subtitle: Text("Live", style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    onChanged: !accessState.memberIsOwner() ? null : (dynamic val) {
                      setSelectionAppStatus(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 1,
                    activeColor: RgbHelper.color(rgbo: app.formFieldTextColor),
                    groupValue: _appStatusSelectedRadioTile,
                    title: Text("Offline", style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    subtitle: Text("Offline", style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    onChanged: !accessState.memberIsOwner() ? null : (dynamic val) {
                      setSelectionAppStatus(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 2,
                    activeColor: RgbHelper.color(rgbo: app.formFieldTextColor),
                    groupValue: _appStatusSelectedRadioTile,
                    title: Text("Invisible", style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    subtitle: Text("Invisible", style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    onChanged: !accessState.memberIsOwner() ? null : (dynamic val) {
                      setSelectionAppStatus(val);
                    },
                ),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: app.dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Font header 1',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: app.formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                DropdownButtonComponentFactory().createNew(id: "fonts", value: _h1, trigger: _onH1Selected, optional: true),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: app.dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Font header 2',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: app.formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                DropdownButtonComponentFactory().createNew(id: "fonts", value: _h2, trigger: _onH2Selected, optional: true),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: app.dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Font header 3',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: app.formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                DropdownButtonComponentFactory().createNew(id: "fonts", value: _h3, trigger: _onH3Selected, optional: true),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: app.dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Font header 4',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: app.formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                DropdownButtonComponentFactory().createNew(id: "fonts", value: _h4, trigger: _onH4Selected, optional: true),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: app.dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Font header 5',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: app.formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                DropdownButtonComponentFactory().createNew(id: "fonts", value: _h5, trigger: _onH5Selected, optional: true),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: app.dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Font header 5',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: app.formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                DropdownButtonComponentFactory().createNew(id: "fonts", value: _fontText, trigger: _onFontTextSelected, optional: true),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: app.dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Font highlight 1',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: app.formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                DropdownButtonComponentFactory().createNew(id: "fonts", value: _fontHighlight1, trigger: _onFontHighlight1Selected, optional: true),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: app.dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Font hightlight 2',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: app.formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                DropdownButtonComponentFactory().createNew(id: "fonts", value: _fontHighlight2, trigger: _onFontHighlight2Selected, optional: true),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: app.dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Font Link',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: app.formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: app.dividerColor)));


        if ((formAction != FormAction.ShowData) && (formAction != FormAction.ShowPreloadedData))
          children.add(RaisedButton(
                  color: RgbHelper.color(rgbo: app.formSubmitButtonColor),
                  onPressed: _readOnly(accessState, state) ? null : () {
                    if (state is AppFormError) {
                      return null;
                    } else {
                      if (formAction == FormAction.UpdateAction) {
                        BlocProvider.of<AppListBloc>(context).add(
                          UpdateAppList(value: state.value!.copyWith(
                              documentID: state.value!.documentID, 
                              ownerID: state.value!.ownerID, 
                              title: state.value!.title, 
                              email: state.value!.email, 
                              description: state.value!.description, 
                              appStatus: state.value!.appStatus, 
                              darkOrLight: state.value!.darkOrLight, 
                              homePages: state.value!.homePages, 
                              logo: state.value!.logo, 
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
                              routeBuilder: state.value!.routeBuilder, 
                              routeAnimationDuration: state.value!.routeAnimationDuration, 
                              logoURL: state.value!.logoURL, 
                              h1: state.value!.h1, 
                              h2: state.value!.h2, 
                              h3: state.value!.h3, 
                              h4: state.value!.h4, 
                              h5: state.value!.h5, 
                              fontText: state.value!.fontText, 
                              fontHighlight1: state.value!.fontHighlight1, 
                              fontHighlight2: state.value!.fontHighlight2, 
                              fontLink: state.value!.fontLink, 
                              policies: state.value!.policies, 
                        )));
                      } else {
                        BlocProvider.of<AppListBloc>(context).add(
                          AddAppList(value: AppModel(
                              documentID: state.value!.documentID, 
                              ownerID: state.value!.ownerID, 
                              title: state.value!.title, 
                              email: state.value!.email, 
                              description: state.value!.description, 
                              appStatus: state.value!.appStatus, 
                              darkOrLight: state.value!.darkOrLight, 
                              homePages: state.value!.homePages, 
                              logo: state.value!.logo, 
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
                              routeBuilder: state.value!.routeBuilder, 
                              routeAnimationDuration: state.value!.routeAnimationDuration, 
                              logoURL: state.value!.logoURL, 
                              h1: state.value!.h1, 
                              h2: state.value!.h2, 
                              h3: state.value!.h3, 
                              h4: state.value!.h4, 
                              h5: state.value!.h5, 
                              fontText: state.value!.fontText, 
                              fontHighlight1: state.value!.fontHighlight1, 
                              fontHighlight2: state.value!.fontHighlight2, 
                              fontLink: state.value!.fontLink, 
                              policies: state.value!.policies, 
                          )));
                      }
                      if (widget.submitAction != null) {
                        eliudrouter.Router.navigateTo(context, widget.submitAction!);
                      } else {
                        Navigator.pop(context);
                      }
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
              children: children as List<Widget>
            ),
          )
        );
      } else {
        return DelayedCircularProgressIndicator();
      }
    });
  }

  void _onDocumentIDChanged() {
    _myFormBloc.add(ChangedAppDocumentID(value: _documentIDController.text));
  }


  void _onOwnerIDChanged() {
    _myFormBloc.add(ChangedAppOwnerID(value: _ownerIDController.text));
  }


  void _onTitleChanged() {
    _myFormBloc.add(ChangedAppTitle(value: _titleController.text));
  }


  void _onEmailChanged() {
    _myFormBloc.add(ChangedAppEmail(value: _emailController.text));
  }


  void _onDescriptionChanged() {
    _myFormBloc.add(ChangedAppDescription(value: _descriptionController.text));
  }


  void setSelectionAppStatus(int? val) {
    setState(() {
      _appStatusSelectedRadioTile = val;
    });
    _myFormBloc.add(ChangedAppAppStatus(value: toAppStatus(val)));
  }


  void setSelectionDarkOrLight(int? val) {
    setState(() {
      _darkOrLightSelectedRadioTile = val;
    });
    _myFormBloc.add(ChangedAppDarkOrLight(value: toDarkOrLight(val)));
  }


  void _onLogoSelected(String? val) {
    setState(() {
      _logo = val;
    });
    _myFormBloc.add(ChangedAppLogo(value: val));
  }


  void _onFormSubmitButtonColorChanged(value) {
    _myFormBloc.add(ChangedAppFormSubmitButtonColor(value: value));
    
  }


  void _onFormBackgroundSelected(String? val) {
    setState(() {
      _formBackground = val;
    });
    _myFormBloc.add(ChangedAppFormBackground(value: val));
  }


  void _onFormSubmitButtonTextColorChanged(value) {
    _myFormBloc.add(ChangedAppFormSubmitButtonTextColor(value: value));
    
  }


  void _onFormGroupTitleColorChanged(value) {
    _myFormBloc.add(ChangedAppFormGroupTitleColor(value: value));
    
  }


  void _onFormFieldTextColorChanged(value) {
    _myFormBloc.add(ChangedAppFormFieldTextColor(value: value));
    
  }


  void _onFormFieldHeaderColorChanged(value) {
    _myFormBloc.add(ChangedAppFormFieldHeaderColor(value: value));
    
  }


  void _onFormFieldFocusColorChanged(value) {
    _myFormBloc.add(ChangedAppFormFieldFocusColor(value: value));
    
  }


  void _onFormAppBarBackgroundSelected(String? val) {
    setState(() {
      _formAppBarBackground = val;
    });
    _myFormBloc.add(ChangedAppFormAppBarBackground(value: val));
  }


  void _onFormAppBarTextColorChanged(value) {
    _myFormBloc.add(ChangedAppFormAppBarTextColor(value: value));
    
  }


  void _onListBackgroundSelected(String? val) {
    setState(() {
      _listBackground = val;
    });
    _myFormBloc.add(ChangedAppListBackground(value: val));
  }


  void _onListTextItemColorChanged(value) {
    _myFormBloc.add(ChangedAppListTextItemColor(value: value));
    
  }


  void _onFloatingButtonForegroundColorChanged(value) {
    _myFormBloc.add(ChangedAppFloatingButtonForegroundColor(value: value));
    
  }


  void _onFloatingButtonBackgroundColorChanged(value) {
    _myFormBloc.add(ChangedAppFloatingButtonBackgroundColor(value: value));
    
  }


  void _onDividerColorChanged(value) {
    _myFormBloc.add(ChangedAppDividerColor(value: value));
    
  }


  void _onIconColorChanged(value) {
    _myFormBloc.add(ChangedAppIconColor(value: value));
    
  }


  void setSelectionRouteBuilder(int? val) {
    setState(() {
      _routeBuilderSelectedRadioTile = val;
    });
    _myFormBloc.add(ChangedAppRouteBuilder(value: toPageTransitionAnimation(val)));
  }


  void _onRouteAnimationDurationChanged() {
    _myFormBloc.add(ChangedAppRouteAnimationDuration(value: _routeAnimationDurationController.text));
  }


  void _onLogoURLChanged() {
    _myFormBloc.add(ChangedAppLogoURL(value: _logoURLController.text));
  }


  void _onH1Selected(String? val) {
    setState(() {
      _h1 = val;
    });
    _myFormBloc.add(ChangedAppH1(value: val));
  }


  void _onH2Selected(String? val) {
    setState(() {
      _h2 = val;
    });
    _myFormBloc.add(ChangedAppH2(value: val));
  }


  void _onH3Selected(String? val) {
    setState(() {
      _h3 = val;
    });
    _myFormBloc.add(ChangedAppH3(value: val));
  }


  void _onH4Selected(String? val) {
    setState(() {
      _h4 = val;
    });
    _myFormBloc.add(ChangedAppH4(value: val));
  }


  void _onH5Selected(String? val) {
    setState(() {
      _h5 = val;
    });
    _myFormBloc.add(ChangedAppH5(value: val));
  }


  void _onFontTextSelected(String? val) {
    setState(() {
      _fontText = val;
    });
    _myFormBloc.add(ChangedAppFontText(value: val));
  }


  void _onFontHighlight1Selected(String? val) {
    setState(() {
      _fontHighlight1 = val;
    });
    _myFormBloc.add(ChangedAppFontHighlight1(value: val));
  }


  void _onFontHighlight2Selected(String? val) {
    setState(() {
      _fontHighlight2 = val;
    });
    _myFormBloc.add(ChangedAppFontHighlight2(value: val));
  }


  void _onFontLinkSelected(String? val) {
    setState(() {
      _fontLink = val;
    });
    _myFormBloc.add(ChangedAppFontLink(value: val));
  }


  void _onPoliciesSelected(String? val) {
    setState(() {
      _policies = val;
    });
    _myFormBloc.add(ChangedAppPolicies(value: val));
  }



  @override
  void dispose() {
    _documentIDController.dispose();
    _ownerIDController.dispose();
    _titleController.dispose();
    _emailController.dispose();
    _descriptionController.dispose();
    _routeAnimationDurationController.dispose();
    _logoURLController.dispose();
    super.dispose();
  }

  bool _readOnly(AccessState accessState, AppFormInitialized state) {
    return (formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData) || (!accessState.memberIsOwner());
  }
  

}



