/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 menu_item_form.dart
                       
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

import 'package:eliud_core/model/menu_item_list_bloc.dart';
import 'package:eliud_core/model/menu_item_list_event.dart';
import 'package:eliud_core/model/menu_item_model.dart';
import 'package:eliud_core/model/menu_item_form_bloc.dart';
import 'package:eliud_core/model/menu_item_form_event.dart';
import 'package:eliud_core/model/menu_item_form_state.dart';


class MenuItemForm extends StatelessWidget {
  FormAction formAction;
  MenuItemModel? value;
  ActionModel? submitAction;

  MenuItemForm({Key? key, required this.formAction, required this.value, this.submitAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    var app = AccessBloc.app(context);
    if (app == null) return Text("No app available");
    if (formAction == FormAction.ShowData) {
      return BlocProvider<MenuItemFormBloc >(
            create: (context) => MenuItemFormBloc(AccessBloc.appId(context),
                                       
                                                )..add(InitialiseMenuItemFormEvent(value: value)),
  
        child: MyMenuItemForm(submitAction: submitAction, formAction: formAction),
          );
    } if (formAction == FormAction.ShowPreloadedData) {
      return BlocProvider<MenuItemFormBloc >(
            create: (context) => MenuItemFormBloc(AccessBloc.appId(context),
                                       
                                                )..add(InitialiseMenuItemFormNoLoadEvent(value: value)),
  
        child: MyMenuItemForm(submitAction: submitAction, formAction: formAction),
          );
    } else {
      return Scaffold(
        appBar: StyleRegistry.registry().styleWithContext(context).adminFormStyle().appBarWithString(context, title: formAction == FormAction.UpdateAction ? 'Update MenuItem' : 'Add MenuItem'),
        body: BlocProvider<MenuItemFormBloc >(
            create: (context) => MenuItemFormBloc(AccessBloc.appId(context),
                                       
                                                )..add((formAction == FormAction.UpdateAction ? InitialiseMenuItemFormEvent(value: value) : InitialiseNewMenuItemFormEvent())),
  
        child: MyMenuItemForm(submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}


class MyMenuItemForm extends StatefulWidget {
  final FormAction? formAction;
  final ActionModel? submitAction;

  MyMenuItemForm({this.formAction, this.submitAction});

  _MyMenuItemFormState createState() => _MyMenuItemFormState(this.formAction);
}


class _MyMenuItemFormState extends State<MyMenuItemForm> {
  final FormAction? formAction;
  late MenuItemFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  final TextEditingController _textController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();


  _MyMenuItemFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<MenuItemFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
    _textController.addListener(_onTextChanged);
    _descriptionController.addListener(_onDescriptionChanged);
  }

  @override
  Widget build(BuildContext context) {
    var app = AccessBloc.app(context);
    if (app == null) return Text('No app available');
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<MenuItemFormBloc, MenuItemFormState>(builder: (context, state) {
      if (state is MenuItemFormUninitialized) return Center(
        child: StyleRegistry.registry().styleWithContext(context).adminListStyle().progressIndicator(context),
      );

      if (state is MenuItemFormLoaded) {
        if (state.value!.documentID != null)
          _documentIDController.text = state.value!.documentID.toString();
        else
          _documentIDController.text = "";
        if (state.value!.text != null)
          _textController.text = state.value!.text.toString();
        else
          _textController.text = "";
        if (state.value!.description != null)
          _descriptionController.text = state.value!.description.toString();
        else
          _descriptionController.text = "";
      }
      if (state is MenuItemFormInitialized) {
        List<Widget> children = [];
         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'General')
                ));

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'text', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _textController, keyboardType: TextInputType.text, validator: (_) => state is TextMenuItemFormError ? state.message : null, hintText: null)
          );

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'description', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _descriptionController, keyboardType: TextInputType.text, validator: (_) => state is DescriptionMenuItemFormError ? state.message : null, hintText: null)
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Action')
                ));

        children.add(

                ActionField(AccessBloc.appId(context), state.value!.action, _onActionChanged)
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


        if ((formAction != FormAction.ShowData) && (formAction != FormAction.ShowPreloadedData))
          children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().button(context, label: 'Submit',
                  onPressed: _readOnly(accessState, state) ? null : () {
                    if (state is MenuItemFormError) {
                      return null;
                    } else {
                      if (formAction == FormAction.UpdateAction) {
                        BlocProvider.of<MenuItemListBloc>(context).add(
                          UpdateMenuItemList(value: state.value!.copyWith(
                              documentID: state.value!.documentID, 
                              text: state.value!.text, 
                              description: state.value!.description, 
                              icon: state.value!.icon, 
                              action: state.value!.action, 
                        )));
                      } else {
                        BlocProvider.of<MenuItemListBloc>(context).add(
                          AddMenuItemList(value: MenuItemModel(
                              documentID: state.value!.documentID, 
                              text: state.value!.text, 
                              description: state.value!.description, 
                              icon: state.value!.icon, 
                              action: state.value!.action, 
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
    _myFormBloc.add(ChangedMenuItemDocumentID(value: _documentIDController.text));
  }


  void _onTextChanged() {
    _myFormBloc.add(ChangedMenuItemText(value: _textController.text));
  }


  void _onDescriptionChanged() {
    _myFormBloc.add(ChangedMenuItemDescription(value: _descriptionController.text));
  }


  void _onIconChanged(value) {
    _myFormBloc.add(ChangedMenuItemIcon(value: value));
    
  }


  void _onActionChanged(value) {
    _myFormBloc.add(ChangedMenuItemAction(value: value));
    
  }



  @override
  void dispose() {
    _documentIDController.dispose();
    _textController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  bool _readOnly(AccessState accessState, MenuItemFormInitialized state) {
    return (formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData) || (!accessState.memberIsOwner());
  }
  

}



