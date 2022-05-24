/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 drawer_form.dart
                       
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

import 'package:eliud_core/model/drawer_list_bloc.dart';
import 'package:eliud_core/model/drawer_list_event.dart';
import 'package:eliud_core/model/drawer_model.dart';
import 'package:eliud_core/model/drawer_form_bloc.dart';
import 'package:eliud_core/model/drawer_form_event.dart';
import 'package:eliud_core/model/drawer_form_state.dart';


class DrawerForm extends StatelessWidget {
  final AppModel app;
  FormAction formAction;
  DrawerModel? value;
  ActionModel? submitAction;

  DrawerForm({Key? key, required this.app, required this.formAction, required this.value, this.submitAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    var appId = app.documentID;
    if (formAction == FormAction.ShowData) {
      return BlocProvider<DrawerFormBloc >(
            create: (context) => DrawerFormBloc(appId,
                                       formAction: formAction,

                                                )..add(InitialiseDrawerFormEvent(value: value)),
  
        child: MyDrawerForm(app:app, submitAction: submitAction, formAction: formAction),
          );
    } if (formAction == FormAction.ShowPreloadedData) {
      return BlocProvider<DrawerFormBloc >(
            create: (context) => DrawerFormBloc(appId,
                                       formAction: formAction,

                                                )..add(InitialiseDrawerFormNoLoadEvent(value: value)),
  
        child: MyDrawerForm(app:app, submitAction: submitAction, formAction: formAction),
          );
    } else {
      return Scaffold(
        appBar: StyleRegistry.registry().styleWithApp(app).adminFormStyle().appBarWithString(app, context, title: formAction == FormAction.UpdateAction ? 'Update Drawer' : 'Add Drawer'),
        body: BlocProvider<DrawerFormBloc >(
            create: (context) => DrawerFormBloc(appId,
                                       formAction: formAction,

                                                )..add((formAction == FormAction.UpdateAction ? InitialiseDrawerFormEvent(value: value) : InitialiseNewDrawerFormEvent())),
  
        child: MyDrawerForm(app: app, submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}


class MyDrawerForm extends StatefulWidget {
  final AppModel app;
  final FormAction? formAction;
  final ActionModel? submitAction;

  MyDrawerForm({required this.app, this.formAction, this.submitAction});

  _MyDrawerFormState createState() => _MyDrawerFormState(this.formAction);
}


class _MyDrawerFormState extends State<MyDrawerForm> {
  final FormAction? formAction;
  late DrawerFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  final TextEditingController _appIdController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _headerTextController = TextEditingController();
  final TextEditingController _secondHeaderTextController = TextEditingController();
  final TextEditingController _headerHeightController = TextEditingController();
  String? _menu;


  _MyDrawerFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<DrawerFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
    _appIdController.addListener(_onAppIdChanged);
    _nameController.addListener(_onNameChanged);
    _headerTextController.addListener(_onHeaderTextChanged);
    _secondHeaderTextController.addListener(_onSecondHeaderTextChanged);
    _headerHeightController.addListener(_onHeaderHeightChanged);
  }

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<DrawerFormBloc, DrawerFormState>(builder: (context, state) {
      if (state is DrawerFormUninitialized) return Center(
        child: StyleRegistry.registry().styleWithApp(widget.app).adminListStyle().progressIndicator(widget.app, context),
      );

      if (state is DrawerFormLoaded) {
        if (state.value!.documentID != null)
          _documentIDController.text = state.value!.documentID.toString();
        else
          _documentIDController.text = "";
        if (state.value!.appId != null)
          _appIdController.text = state.value!.appId.toString();
        else
          _appIdController.text = "";
        if (state.value!.name != null)
          _nameController.text = state.value!.name.toString();
        else
          _nameController.text = "";
        if (state.value!.headerText != null)
          _headerTextController.text = state.value!.headerText.toString();
        else
          _headerTextController.text = "";
        if (state.value!.secondHeaderText != null)
          _secondHeaderTextController.text = state.value!.secondHeaderText.toString();
        else
          _secondHeaderTextController.text = "";
        if (state.value!.headerHeight != null)
          _headerHeightController.text = state.value!.headerHeight.toString();
        else
          _headerHeightController.text = "";
        if (state.value!.menu != null)
          _menu= state.value!.menu!.documentID;
        else
          _menu= "";
      }
      if (state is DrawerFormInitialized) {
        List<Widget> children = [];
         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'General')
                ));

        children.add(

                RgbField(widget.app, "Popup Menu Background Color", state.value!.popupMenuBackgroundColor, _onPopupMenuBackgroundColorChanged)
          );

        children.add(

                RgbField(widget.app, "Popup Menu Background Color Override", state.value!.popupMenuBackgroundColorOverride, _onPopupMenuBackgroundColorOverrideChanged)
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'General')
                ));

        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().textFormField(widget.app, context, labelText: 'Document ID', icon: Icons.vpn_key, readOnly: (formAction == FormAction.UpdateAction), textEditingController: _documentIDController, keyboardType: TextInputType.text, validator: (_) => state is DocumentIDDrawerFormError ? state.message : null, hintText: null)
          );

        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().textFormField(widget.app, context, labelText: 'Name', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _nameController, keyboardType: TextInputType.text, validator: (_) => state is NameDrawerFormError ? state.message : null, hintText: null)
          );

        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().textFormField(widget.app, context, labelText: 'Header Text', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _headerTextController, keyboardType: TextInputType.text, validator: (_) => state is HeaderTextDrawerFormError ? state.message : null, hintText: null)
          );

        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().textFormField(widget.app, context, labelText: 'Header Description', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _secondHeaderTextController, keyboardType: TextInputType.text, validator: (_) => state is SecondHeaderTextDrawerFormError ? state.message : null, hintText: null)
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'Header')
                ));

        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().textFormField(widget.app, context, labelText: 'Header Height (0 for default)', icon: Icons.photo_size_select_large, readOnly: _readOnly(accessState, state), textEditingController: _headerHeightController, keyboardType: TextInputType.number, validator: (_) => state is HeaderHeightDrawerFormError ? state.message : null, hintText: 'field.remark')
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'Header Background')
                ));



        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'Menu Item Colors')
                ));


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'Background')
                ));



        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'Menu')
                ));

        children.add(

                DropdownButtonComponentFactory().createNew(app: widget.app, id: "menuDefs", value: _menu, trigger: (value, privilegeLevel) => _onMenuSelected(value), optional: false),
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


        if ((formAction != FormAction.ShowData) && (formAction != FormAction.ShowPreloadedData))
          children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().button(widget.app, context, label: 'Submit',
                  onPressed: _readOnly(accessState, state) ? null : () {
                    if (state is DrawerFormError) {
                      return null;
                    } else {
                      if (formAction == FormAction.UpdateAction) {
                        BlocProvider.of<DrawerListBloc>(context).add(
                          UpdateDrawerList(value: state.value!.copyWith(
                              documentID: state.value!.documentID, 
                              appId: state.value!.appId, 
                              name: state.value!.name, 
                              backgroundOverride: state.value!.backgroundOverride, 
                              headerText: state.value!.headerText, 
                              secondHeaderText: state.value!.secondHeaderText, 
                              headerHeight: state.value!.headerHeight, 
                              popupMenuBackgroundColor: state.value!.popupMenuBackgroundColor, 
                              headerBackgroundOverride: state.value!.headerBackgroundOverride, 
                              popupMenuBackgroundColorOverride: state.value!.popupMenuBackgroundColorOverride, 
                              menu: state.value!.menu, 
                        )));
                      } else {
                        BlocProvider.of<DrawerListBloc>(context).add(
                          AddDrawerList(value: DrawerModel(
                              documentID: state.value!.documentID, 
                              appId: state.value!.appId, 
                              name: state.value!.name, 
                              backgroundOverride: state.value!.backgroundOverride, 
                              headerText: state.value!.headerText, 
                              secondHeaderText: state.value!.secondHeaderText, 
                              headerHeight: state.value!.headerHeight, 
                              popupMenuBackgroundColor: state.value!.popupMenuBackgroundColor, 
                              headerBackgroundOverride: state.value!.headerBackgroundOverride, 
                              popupMenuBackgroundColorOverride: state.value!.popupMenuBackgroundColorOverride, 
                              menu: state.value!.menu, 
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
    _myFormBloc.add(ChangedDrawerDocumentID(value: _documentIDController.text));
  }


  void _onAppIdChanged() {
    _myFormBloc.add(ChangedDrawerAppId(value: _appIdController.text));
  }


  void _onNameChanged() {
    _myFormBloc.add(ChangedDrawerName(value: _nameController.text));
  }


  void _onHeaderTextChanged() {
    _myFormBloc.add(ChangedDrawerHeaderText(value: _headerTextController.text));
  }


  void _onSecondHeaderTextChanged() {
    _myFormBloc.add(ChangedDrawerSecondHeaderText(value: _secondHeaderTextController.text));
  }


  void _onHeaderHeightChanged() {
    _myFormBloc.add(ChangedDrawerHeaderHeight(value: _headerHeightController.text));
  }


  void _onPopupMenuBackgroundColorChanged(value) {
    _myFormBloc.add(ChangedDrawerPopupMenuBackgroundColor(value: value));
    
  }


  void _onPopupMenuBackgroundColorOverrideChanged(value) {
    _myFormBloc.add(ChangedDrawerPopupMenuBackgroundColorOverride(value: value));
    
  }


  void _onMenuSelected(String? val) {
    setState(() {
      _menu = val;
    });
    _myFormBloc.add(ChangedDrawerMenu(value: val));
  }



  @override
  void dispose() {
    _documentIDController.dispose();
    _appIdController.dispose();
    _nameController.dispose();
    _headerTextController.dispose();
    _secondHeaderTextController.dispose();
    _headerHeightController.dispose();
    super.dispose();
  }

  bool _readOnly(AccessState accessState, DrawerFormInitialized state) {
    return (formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData) || (!accessState.memberIsOwner(widget.app.documentID));
  }
  

}



