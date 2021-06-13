/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 app_bar_form.dart
                       
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

import 'package:eliud_core/model/app_bar_list_bloc.dart';
import 'package:eliud_core/model/app_bar_list_event.dart';
import 'package:eliud_core/model/app_bar_model.dart';
import 'package:eliud_core/model/app_bar_form_bloc.dart';
import 'package:eliud_core/model/app_bar_form_event.dart';
import 'package:eliud_core/model/app_bar_form_state.dart';


class AppBarForm extends StatelessWidget {
  FormAction formAction;
  AppBarModel? value;
  ActionModel? submitAction;

  AppBarForm({Key? key, required this.formAction, required this.value, this.submitAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    var app = AccessBloc.app(context);
    if (app == null) return Text("No app available");
    if (formAction == FormAction.ShowData) {
      return BlocProvider<AppBarFormBloc >(
            create: (context) => AppBarFormBloc(AccessBloc.appId(context),
                                       formAction: formAction,

                                                )..add(InitialiseAppBarFormEvent(value: value)),
  
        child: MyAppBarForm(submitAction: submitAction, formAction: formAction),
          );
    } if (formAction == FormAction.ShowPreloadedData) {
      return BlocProvider<AppBarFormBloc >(
            create: (context) => AppBarFormBloc(AccessBloc.appId(context),
                                       formAction: formAction,

                                                )..add(InitialiseAppBarFormNoLoadEvent(value: value)),
  
        child: MyAppBarForm(submitAction: submitAction, formAction: formAction),
          );
    } else {
      return Scaffold(
        appBar: StyleRegistry.registry().styleWithContext(context).adminFormStyle().appBarWithString(context, title: formAction == FormAction.UpdateAction ? 'Update AppBar' : 'Add AppBar'),
        body: BlocProvider<AppBarFormBloc >(
            create: (context) => AppBarFormBloc(AccessBloc.appId(context),
                                       formAction: formAction,

                                                )..add((formAction == FormAction.UpdateAction ? InitialiseAppBarFormEvent(value: value) : InitialiseNewAppBarFormEvent())),
  
        child: MyAppBarForm(submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}


class MyAppBarForm extends StatefulWidget {
  final FormAction? formAction;
  final ActionModel? submitAction;

  MyAppBarForm({this.formAction, this.submitAction});

  _MyAppBarFormState createState() => _MyAppBarFormState(this.formAction);
}


class _MyAppBarFormState extends State<MyAppBarForm> {
  final FormAction? formAction;
  late AppBarFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  final TextEditingController _appIdController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  int? _headerSelectedRadioTile;
  String? _image;
  String? _iconMenu;
  String? _backgroundOverride;


  _MyAppBarFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<AppBarFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
    _appIdController.addListener(_onAppIdChanged);
    _titleController.addListener(_onTitleChanged);
    _headerSelectedRadioTile = 0;
  }

  @override
  Widget build(BuildContext context) {
    var app = AccessBloc.app(context);
    if (app == null) return Text('No app available');
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<AppBarFormBloc, AppBarFormState>(builder: (context, state) {
      if (state is AppBarFormUninitialized) return Center(
        child: DelayedCircularProgressIndicator(),
      );

      if (state is AppBarFormLoaded) {
        if (state.value!.documentID != null)
          _documentIDController.text = state.value!.documentID.toString();
        else
          _documentIDController.text = "";
        if (state.value!.appId != null)
          _appIdController.text = state.value!.appId.toString();
        else
          _appIdController.text = "";
        if (state.value!.title != null)
          _titleController.text = state.value!.title.toString();
        else
          _titleController.text = "";
        if (state.value!.header != null)
          _headerSelectedRadioTile = state.value!.header!.index;
        else
          _headerSelectedRadioTile = 0;
        if (state.value!.image != null)
          _image= state.value!.image!.documentID;
        else
          _image= "";
        if (state.value!.iconMenu != null)
          _iconMenu= state.value!.iconMenu!.documentID;
        else
          _iconMenu= "";
        if (state.value!.backgroundOverride != null)
          _backgroundOverride= state.value!.backgroundOverride!.documentID;
        else
          _backgroundOverride= "";
      }
      if (state is AppBarFormInitialized) {
        List<Widget> children = [];
         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'General')
                ));

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'Document ID', icon: Icons.vpn_key, readOnly: (formAction == FormAction.UpdateAction), textEditingController: _documentIDController, keyboardType: TextInputType.text, validator: (_) => state is DocumentIDAppBarFormError ? state.message : null, hintText: null)
          );

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'Title', icon: Icons.vpn_key, readOnly: _readOnly(accessState, state), textEditingController: _titleController, keyboardType: TextInputType.text, validator: (_) => state is TitleAppBarFormError ? state.message : null, hintText: null)
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Header type')
                ));

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _headerSelectedRadioTile, 'Title', 'Title', !accessState.memberIsOwner() ? null : (dynamic val) => setSelectionHeader(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _headerSelectedRadioTile, 'Image', 'Image', !accessState.memberIsOwner() ? null : (dynamic val) => setSelectionHeader(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _headerSelectedRadioTile, 'Icon', 'Icon', !accessState.memberIsOwner() ? null : (dynamic val) => setSelectionHeader(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _headerSelectedRadioTile, 'None', 'None', !accessState.memberIsOwner() ? null : (dynamic val) => setSelectionHeader(val))
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Image')
                ));

        children.add(

                DropdownButtonComponentFactory().createNew(id: "memberMediums", value: _image, trigger: _onImageSelected, optional: true),
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Icon')
                ));

        children.add(

                IconField(state.value!.icon, _onIconChanged)
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Icon Menu')
                ));

        children.add(

                DropdownButtonComponentFactory().createNew(id: "menuDefs", value: _iconMenu, trigger: _onIconMenuSelected, optional: true),
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'AppBar Colors')
                ));


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Icon Colors')
                ));

        children.add(

                RgbField("Text color", state.value!.iconColor, _onIconColorChanged)
          );

        children.add(

                RgbField("Selected Icon Color", state.value!.selectedIconColor, _onSelectedIconColorChanged)
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Menu Colors')
                ));

        children.add(

                RgbField("Background Color", state.value!.menuBackgroundColor, _onMenuBackgroundColorChanged)
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Header Background')
                ));

        children.add(

                DropdownButtonComponentFactory().createNew(id: "backgrounds", value: _backgroundOverride, trigger: _onBackgroundOverrideSelected, optional: true),
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


        if ((formAction != FormAction.ShowData) && (formAction != FormAction.ShowPreloadedData))
          children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().button(context, label: 'Submit',
                  onPressed: _readOnly(accessState, state) ? null : () {
                    if (state is AppBarFormError) {
                      return null;
                    } else {
                      if (formAction == FormAction.UpdateAction) {
                        BlocProvider.of<AppBarListBloc>(context).add(
                          UpdateAppBarList(value: state.value!.copyWith(
                              documentID: state.value!.documentID, 
                              appId: state.value!.appId, 
                              title: state.value!.title, 
                              header: state.value!.header, 
                              icon: state.value!.icon, 
                              image: state.value!.image, 
                              iconMenu: state.value!.iconMenu, 
                              backgroundOverride: state.value!.backgroundOverride, 
                              iconColor: state.value!.iconColor, 
                              selectedIconColor: state.value!.selectedIconColor, 
                              menuBackgroundColor: state.value!.menuBackgroundColor, 
                        )));
                      } else {
                        BlocProvider.of<AppBarListBloc>(context).add(
                          AddAppBarList(value: AppBarModel(
                              documentID: state.value!.documentID, 
                              appId: state.value!.appId, 
                              title: state.value!.title, 
                              header: state.value!.header, 
                              icon: state.value!.icon, 
                              image: state.value!.image, 
                              iconMenu: state.value!.iconMenu, 
                              backgroundOverride: state.value!.backgroundOverride, 
                              iconColor: state.value!.iconColor, 
                              selectedIconColor: state.value!.selectedIconColor, 
                              menuBackgroundColor: state.value!.menuBackgroundColor, 
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
    _myFormBloc.add(ChangedAppBarDocumentID(value: _documentIDController.text));
  }


  void _onAppIdChanged() {
    _myFormBloc.add(ChangedAppBarAppId(value: _appIdController.text));
  }


  void _onTitleChanged() {
    _myFormBloc.add(ChangedAppBarTitle(value: _titleController.text));
  }


  void setSelectionHeader(int? val) {
    setState(() {
      _headerSelectedRadioTile = val;
    });
    _myFormBloc.add(ChangedAppBarHeader(value: toHeaderSelection(val)));
  }


  void _onIconChanged(value) {
    _myFormBloc.add(ChangedAppBarIcon(value: value));
    
  }


  void _onImageSelected(String? val) {
    setState(() {
      _image = val;
    });
    _myFormBloc.add(ChangedAppBarImage(value: val));
  }


  void _onIconMenuSelected(String? val) {
    setState(() {
      _iconMenu = val;
    });
    _myFormBloc.add(ChangedAppBarIconMenu(value: val));
  }


  void _onBackgroundOverrideSelected(String? val) {
    setState(() {
      _backgroundOverride = val;
    });
    _myFormBloc.add(ChangedAppBarBackgroundOverride(value: val));
  }


  void _onIconColorChanged(value) {
    _myFormBloc.add(ChangedAppBarIconColor(value: value));
    
  }


  void _onSelectedIconColorChanged(value) {
    _myFormBloc.add(ChangedAppBarSelectedIconColor(value: value));
    
  }


  void _onMenuBackgroundColorChanged(value) {
    _myFormBloc.add(ChangedAppBarMenuBackgroundColor(value: value));
    
  }



  @override
  void dispose() {
    _documentIDController.dispose();
    _appIdController.dispose();
    _titleController.dispose();
    super.dispose();
  }

  bool _readOnly(AccessState accessState, AppBarFormInitialized state) {
    return (formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData) || (!accessState.memberIsOwner());
  }
  

}



