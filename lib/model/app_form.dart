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
        appBar: StyleRegistry.registry().styleWithContext(context).adminFormStyle().appBarWithString(context, title: formAction == FormAction.UpdateAction ? 'Update App' : 'Add App'),
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
  String? _logo;
  int? _routeBuilderSelectedRadioTile;
  final TextEditingController _routeAnimationDurationController = TextEditingController();
  final TextEditingController _logoURLController = TextEditingController();
  String? _policies;
  final TextEditingController _styleFamilyController = TextEditingController();
  final TextEditingController _styleNameController = TextEditingController();


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
    _routeBuilderSelectedRadioTile = 0;
    _routeAnimationDurationController.addListener(_onRouteAnimationDurationChanged);
    _logoURLController.addListener(_onLogoURLChanged);
    _styleFamilyController.addListener(_onStyleFamilyChanged);
    _styleNameController.addListener(_onStyleNameChanged);
  }

  @override
  Widget build(BuildContext context) {
    var app = AccessBloc.app(context);
    if (app == null) return Text('No app available');
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<AppFormBloc, AppFormState>(builder: (context, state) {
      if (state is AppFormUninitialized) return Center(
        child: StyleRegistry.registry().styleWithContext(context).adminListStyle().progressIndicator(context),
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
        if (state.value!.logo != null)
          _logo= state.value!.logo!.documentID;
        else
          _logo= "";
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
        if (state.value!.policies != null)
          _policies= state.value!.policies!.documentID;
        else
          _policies= "";
        if (state.value!.styleFamily != null)
          _styleFamilyController.text = state.value!.styleFamily.toString();
        else
          _styleFamilyController.text = "";
        if (state.value!.styleName != null)
          _styleNameController.text = state.value!.styleName.toString();
        else
          _styleNameController.text = "";
      }
      if (state is AppFormInitialized) {
        List<Widget> children = [];
         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'General')
                ));

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'Style Family', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _styleFamilyController, keyboardType: TextInputType.text, validator: (_) => state is StyleFamilyAppFormError ? state.message : null, hintText: null)
          );

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'Style Name', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _styleNameController, keyboardType: TextInputType.text, validator: (_) => state is StyleNameAppFormError ? state.message : null, hintText: null)
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'General')
                ));

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'Document ID', icon: Icons.vpn_key, readOnly: (formAction == FormAction.UpdateAction), textEditingController: _documentIDController, keyboardType: TextInputType.text, validator: (_) => state is DocumentIDAppFormError ? state.message : null, hintText: null)
          );

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'Title', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _titleController, keyboardType: TextInputType.text, validator: (_) => state is TitleAppFormError ? state.message : null, hintText: null)
          );

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'Contact email', icon: Icons.email, readOnly: _readOnly(accessState, state), textEditingController: _emailController, keyboardType: TextInputType.text, validator: (_) => state is EmailAppFormError ? state.message : null, hintText: null)
          );

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'Description', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _descriptionController, keyboardType: TextInputType.text, validator: (_) => state is DescriptionAppFormError ? state.message : null, hintText: null)
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Style')
                ));


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Policy')
                ));

        children.add(

                DropdownButtonComponentFactory().createNew(id: "appPolicys", value: _policies, trigger: _onPoliciesSelected, optional: true),
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Owner')
                ));


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Home Pages')
                ));



        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Logo')
                ));

        children.add(

                DropdownButtonComponentFactory().createNew(id: "memberMediums", value: _logo, trigger: _onLogoSelected, optional: true),
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Page Route Builder')
                ));

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _routeBuilderSelectedRadioTile, 'SlideRightToLeft', 'SlideRightToLeft', !accessState.memberIsOwner() ? null : (dynamic val) => setSelectionRouteBuilder(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _routeBuilderSelectedRadioTile, 'SlideBottomToTop', 'SlideBottomToTop', !accessState.memberIsOwner() ? null : (dynamic val) => setSelectionRouteBuilder(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _routeBuilderSelectedRadioTile, 'ScaleRoute', 'ScaleRoute', !accessState.memberIsOwner() ? null : (dynamic val) => setSelectionRouteBuilder(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _routeBuilderSelectedRadioTile, 'RotationRoute', 'RotationRoute', !accessState.memberIsOwner() ? null : (dynamic val) => setSelectionRouteBuilder(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _routeBuilderSelectedRadioTile, 'FadeRoute', 'FadeRoute', !accessState.memberIsOwner() ? null : (dynamic val) => setSelectionRouteBuilder(val))
          );

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'Page Animation (millisec)', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _routeAnimationDurationController, keyboardType: TextInputType.number, validator: (_) => state is RouteAnimationDurationAppFormError ? state.message : null, hintText: null)
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Status of the application')
                ));

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _appStatusSelectedRadioTile, 'Live', 'Live', !accessState.memberIsOwner() ? null : (dynamic val) => setSelectionAppStatus(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _appStatusSelectedRadioTile, 'Offline', 'Offline', !accessState.memberIsOwner() ? null : (dynamic val) => setSelectionAppStatus(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _appStatusSelectedRadioTile, 'Invisible', 'Invisible', !accessState.memberIsOwner() ? null : (dynamic val) => setSelectionAppStatus(val))
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Style')
                ));


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


        if ((formAction != FormAction.ShowData) && (formAction != FormAction.ShowPreloadedData))
          children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().button(context, label: 'Submit',
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
                              homePages: state.value!.homePages, 
                              logo: state.value!.logo, 
                              routeBuilder: state.value!.routeBuilder, 
                              routeAnimationDuration: state.value!.routeAnimationDuration, 
                              logoURL: state.value!.logoURL, 
                              policies: state.value!.policies, 
                              styleFamily: state.value!.styleFamily, 
                              styleName: state.value!.styleName, 
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
                              homePages: state.value!.homePages, 
                              logo: state.value!.logo, 
                              routeBuilder: state.value!.routeBuilder, 
                              routeAnimationDuration: state.value!.routeAnimationDuration, 
                              logoURL: state.value!.logoURL, 
                              policies: state.value!.policies, 
                              styleFamily: state.value!.styleFamily, 
                              styleName: state.value!.styleName, 
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


  void _onLogoSelected(String? val) {
    setState(() {
      _logo = val;
    });
    _myFormBloc.add(ChangedAppLogo(value: val));
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


  void _onPoliciesSelected(String? val) {
    setState(() {
      _policies = val;
    });
    _myFormBloc.add(ChangedAppPolicies(value: val));
  }


  void _onStyleFamilyChanged() {
    _myFormBloc.add(ChangedAppStyleFamily(value: _styleFamilyController.text));
  }


  void _onStyleNameChanged() {
    _myFormBloc.add(ChangedAppStyleName(value: _styleNameController.text));
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
    _styleFamilyController.dispose();
    _styleNameController.dispose();
    super.dispose();
  }

  bool _readOnly(AccessState accessState, AppFormInitialized state) {
    return (formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData) || (!accessState.memberIsOwner());
  }
  

}



