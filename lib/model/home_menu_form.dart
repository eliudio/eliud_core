/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 home_menu_form.dart
                       
 This code is generated. This is read only. Don't touch!

*/

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

import 'package:eliud_core/model/home_menu_list_bloc.dart';
import 'package:eliud_core/model/home_menu_list_event.dart';
import 'package:eliud_core/model/home_menu_model.dart';
import 'package:eliud_core/model/home_menu_form_bloc.dart';
import 'package:eliud_core/model/home_menu_form_event.dart';
import 'package:eliud_core/model/home_menu_form_state.dart';


class HomeMenuForm extends StatelessWidget {
  FormAction formAction;
  HomeMenuModel? value;
  ActionModel? submitAction;

  HomeMenuForm({Key? key, required this.formAction, required this.value, this.submitAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    var app = AccessBloc.currentApp(context);
    if (app == null) return Text("No app available");
    var appId = app.documentID!;
    if (formAction == FormAction.ShowData) {
      return BlocProvider<HomeMenuFormBloc >(
            create: (context) => HomeMenuFormBloc(appId,
                                       formAction: formAction,

                                                )..add(InitialiseHomeMenuFormEvent(value: value)),
  
        child: MyHomeMenuForm(submitAction: submitAction, formAction: formAction),
          );
    } if (formAction == FormAction.ShowPreloadedData) {
      return BlocProvider<HomeMenuFormBloc >(
            create: (context) => HomeMenuFormBloc(appId,
                                       formAction: formAction,

                                                )..add(InitialiseHomeMenuFormNoLoadEvent(value: value)),
  
        child: MyHomeMenuForm(submitAction: submitAction, formAction: formAction),
          );
    } else {
      return Scaffold(
        appBar: StyleRegistry.registry().styleWithContext(context).adminFormStyle().appBarWithString(context, title: formAction == FormAction.UpdateAction ? 'Update HomeMenu' : 'Add HomeMenu'),
        body: BlocProvider<HomeMenuFormBloc >(
            create: (context) => HomeMenuFormBloc(appId,
                                       formAction: formAction,

                                                )..add((formAction == FormAction.UpdateAction ? InitialiseHomeMenuFormEvent(value: value) : InitialiseNewHomeMenuFormEvent())),
  
        child: MyHomeMenuForm(submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}


class MyHomeMenuForm extends StatefulWidget {
  final FormAction? formAction;
  final ActionModel? submitAction;

  MyHomeMenuForm({this.formAction, this.submitAction});

  _MyHomeMenuFormState createState() => _MyHomeMenuFormState(this.formAction);
}


class _MyHomeMenuFormState extends State<MyHomeMenuForm> {
  final FormAction? formAction;
  late HomeMenuFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  final TextEditingController _appIdController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  String? _menu;
  String? _backgroundOverride;


  _MyHomeMenuFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<HomeMenuFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
    _appIdController.addListener(_onAppIdChanged);
    _nameController.addListener(_onNameChanged);
  }

  @override
  Widget build(BuildContext context) {
    var app = AccessBloc.currentApp(context);
    if (app == null) return Text('No app available');
    var appId = app.documentID!;
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<HomeMenuFormBloc, HomeMenuFormState>(builder: (context, state) {
      if (state is HomeMenuFormUninitialized) return Center(
        child: StyleRegistry.registry().styleWithContext(context).adminListStyle().progressIndicator(context),
      );

      if (state is HomeMenuFormLoaded) {
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
        if (state.value!.menu != null)
          _menu= state.value!.menu!.documentID;
        else
          _menu= "";
        if (state.value!.backgroundOverride != null)
          _backgroundOverride= state.value!.backgroundOverride!.documentID;
        else
          _backgroundOverride= "";
      }
      if (state is HomeMenuFormInitialized) {
        List<Widget> children = [];
         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'General')
                ));

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'Document ID', icon: Icons.vpn_key, readOnly: (formAction == FormAction.UpdateAction), textEditingController: _documentIDController, keyboardType: TextInputType.text, validator: (_) => state is DocumentIDHomeMenuFormError ? state.message : null, hintText: null)
          );

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'Name', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _nameController, keyboardType: TextInputType.text, validator: (_) => state is NameHomeMenuFormError ? state.message : null, hintText: null)
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Colors')
                ));

        children.add(

                RgbField("Icon Color Override", state.value!.iconColorOverride, _onIconColorOverrideChanged)
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Menu')
                ));

        children.add(

                DropdownButtonComponentFactory().createNew(appId: appId, id: "menuDefs", value: _menu, trigger: _onMenuSelected, optional: false),
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Background')
                ));

        children.add(

                DropdownButtonComponentFactory().createNew(appId: appId, id: "backgrounds", value: _backgroundOverride, trigger: _onBackgroundOverrideSelected, optional: true),
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Popup Menu Background Color')
                ));

        children.add(

                RgbField("Popup Menu Background Color Override", state.value!.popupMenuBackgroundColorOverride, _onPopupMenuBackgroundColorOverrideChanged)
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


        if ((formAction != FormAction.ShowData) && (formAction != FormAction.ShowPreloadedData))
          children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().button(context, label: 'Submit',
                  onPressed: _readOnly(accessState, state) ? null : () {
                    if (state is HomeMenuFormError) {
                      return null;
                    } else {
                      if (formAction == FormAction.UpdateAction) {
                        BlocProvider.of<HomeMenuListBloc>(context).add(
                          UpdateHomeMenuList(value: state.value!.copyWith(
                              documentID: state.value!.documentID, 
                              appId: state.value!.appId, 
                              name: state.value!.name, 
                              menu: state.value!.menu, 
                              iconColorOverride: state.value!.iconColorOverride, 
                              backgroundOverride: state.value!.backgroundOverride, 
                              popupMenuBackgroundColorOverride: state.value!.popupMenuBackgroundColorOverride, 
                        )));
                      } else {
                        BlocProvider.of<HomeMenuListBloc>(context).add(
                          AddHomeMenuList(value: HomeMenuModel(
                              documentID: state.value!.documentID, 
                              appId: state.value!.appId, 
                              name: state.value!.name, 
                              menu: state.value!.menu, 
                              iconColorOverride: state.value!.iconColorOverride, 
                              backgroundOverride: state.value!.backgroundOverride, 
                              popupMenuBackgroundColorOverride: state.value!.popupMenuBackgroundColorOverride, 
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
    _myFormBloc.add(ChangedHomeMenuDocumentID(value: _documentIDController.text));
  }


  void _onAppIdChanged() {
    _myFormBloc.add(ChangedHomeMenuAppId(value: _appIdController.text));
  }


  void _onNameChanged() {
    _myFormBloc.add(ChangedHomeMenuName(value: _nameController.text));
  }


  void _onMenuSelected(String? val) {
    setState(() {
      _menu = val;
    });
    _myFormBloc.add(ChangedHomeMenuMenu(value: val));
  }


  void _onIconColorOverrideChanged(value) {
    _myFormBloc.add(ChangedHomeMenuIconColorOverride(value: value));
    
  }


  void _onBackgroundOverrideSelected(String? val) {
    setState(() {
      _backgroundOverride = val;
    });
    _myFormBloc.add(ChangedHomeMenuBackgroundOverride(value: val));
  }


  void _onPopupMenuBackgroundColorOverrideChanged(value) {
    _myFormBloc.add(ChangedHomeMenuPopupMenuBackgroundColorOverride(value: value));
    
  }



  @override
  void dispose() {
    _documentIDController.dispose();
    _appIdController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  bool _readOnly(AccessState accessState, HomeMenuFormInitialized state) {
    return (formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData) || (!accessState.memberIsOwner(AccessBloc.currentAppId(context)));
  }
  

}



