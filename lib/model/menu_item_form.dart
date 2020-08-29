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

import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/core/navigate/router.dart';
import 'package:eliud_core/tools/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';

import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

import 'package:intl/intl.dart';

import 'package:eliud_core/core/eliud.dart';

import 'package:eliud_core/model/internal_component.dart';
import 'package:eliud_core/model/embedded_component.dart';
import '../model/embedded_component.dart';
import '../tools/bespoke_formfields.dart';
import 'package:eliud_core/tools/bespoke_formfields.dart';

import 'package:eliud_core/tools/enums.dart';
import 'package:eliud_core/tools/etc.dart';

// import the main classes
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';

// import the shared classes
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/model/entity_export.dart';
  
// import the classes of this package:
import '../model/abstract_repository_singleton.dart';
import '../model/repository_export.dart';
import 'package:eliud_core/model/repository_export.dart';
import '../model/model_export.dart';
import 'package:eliud_core/model/model_export.dart';
import '../model/entity_export.dart';
import 'package:eliud_core/model/entity_export.dart';

import 'menu_item_list_bloc.dart';
import 'menu_item_list_event.dart';
import 'menu_item_model.dart';
import 'menu_item_form_bloc.dart';
import 'menu_item_form_event.dart';
import 'menu_item_form_state.dart';


class MenuItemForm extends StatelessWidget {
  FormAction formAction;
  MenuItemModel value;
  ActionModel submitAction;

  MenuItemForm({Key key, @required this.formAction, @required this.value, this.submitAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (formAction == FormAction.ShowData) {
      return BlocProvider<MenuItemFormBloc >(
            create: (context) => MenuItemFormBloc(
                                       
                                                )..add(InitialiseMenuItemFormEvent(value: value)),
  
        child: MyMenuItemForm(submitAction: submitAction, formAction: formAction),
          );
    } if (formAction == FormAction.ShowPreloadedData) {
      return BlocProvider<MenuItemFormBloc >(
            create: (context) => MenuItemFormBloc(
                                       
                                                )..add(InitialiseMenuItemFormNoLoadEvent(value: value)),
  
        child: MyMenuItemForm(submitAction: submitAction, formAction: formAction),
          );
    } else {
      return Scaffold(
        appBar: formAction == FormAction.UpdateAction ?
                AppBar(
                    title: Text("Update MenuItem", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formAppBarTextColor))),
                    flexibleSpace: Container(
                        decoration: BoxDecorationHelper.boxDecoration(GlobalData.app().formAppBarBackground)),
                  ) :
                AppBar(
                    title: Text("Add MenuItem", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formAppBarTextColor))),
                    flexibleSpace: Container(
                        decoration: BoxDecorationHelper.boxDecoration(GlobalData.app().formAppBarBackground)),
                ),
        body: BlocProvider<MenuItemFormBloc >(
            create: (context) => MenuItemFormBloc(
                                       
                                                )..add((formAction == FormAction.UpdateAction ? InitialiseMenuItemFormEvent(value: value) : InitialiseNewMenuItemFormEvent())),
  
        child: MyMenuItemForm(submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}


class MyMenuItemForm extends StatefulWidget {
  final FormAction formAction;
  final ActionModel submitAction;

  MyMenuItemForm({this.formAction, this.submitAction});

  _MyMenuItemFormState createState() => _MyMenuItemFormState(this.formAction);
}


class _MyMenuItemFormState extends State<MyMenuItemForm> {
  final FormAction formAction;
  MenuItemFormBloc _myFormBloc;

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
    return BlocBuilder<MenuItemFormBloc, MenuItemFormState>(builder: (context, state) {
      if (state is MenuItemFormUninitialized) return Center(
        child: CircularProgressIndicator(),
      );

      if (state is MenuItemFormLoaded) {
        if (state.value.documentID != null)
          _documentIDController.text = state.value.documentID.toString();
        else
          _documentIDController.text = "";
        if (state.value.text != null)
          _textController.text = state.value.text.toString();
        else
          _textController.text = "";
        if (state.value.description != null)
          _descriptionController.text = state.value.description.toString();
        else
          _descriptionController.text = "";
      }
      if (state is MenuItemFormInitialized) {
        List<Widget> children = List();
         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('General',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: GlobalData.app().formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor)),
                  readOnly: _readOnly(state),
                  controller: _textController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: GlobalData.app().formFieldFocusColor))),                    icon: Icon(Icons.text_format, color: RgbHelper.color(rgbo: GlobalData.app().formFieldHeaderColor)),
                    labelText: 'text',
                  ),
                  keyboardType: TextInputType.text,
                  autovalidate: true,
                  validator: (_) {
                    return state is TextMenuItemFormError ? state.message : null;
                  },
                ),
          );

        children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor)),
                  readOnly: _readOnly(state),
                  controller: _descriptionController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: GlobalData.app().formFieldFocusColor))),                    icon: Icon(Icons.text_format, color: RgbHelper.color(rgbo: GlobalData.app().formFieldHeaderColor)),
                    labelText: 'description',
                  ),
                  keyboardType: TextInputType.text,
                  autovalidate: true,
                  validator: (_) {
                    return state is DescriptionMenuItemFormError ? state.message : null;
                  },
                ),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: GlobalData.app().dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Action',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: GlobalData.app().formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                ActionField(state.value.action, _onActionChanged)
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: GlobalData.app().dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Icon',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: GlobalData.app().formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                IconField(state.value.icon, _onIconChanged)
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: GlobalData.app().dividerColor)));


        if ((formAction != FormAction.ShowData) && (formAction != FormAction.ShowPreloadedData))
          children.add(RaisedButton(
                  color: RgbHelper.color(rgbo: GlobalData.app().formSubmitButtonColor),
                  onPressed: _readOnly(state) ? null : () {
                    if (state is MenuItemFormError) {
                      return null;
                    } else {
                      if (formAction == FormAction.UpdateAction) {
                        BlocProvider.of<MenuItemListBloc>(context).add(
                          UpdateMenuItemList(value: state.value.copyWith(
                              documentID: state.value.documentID, 
                              text: state.value.text, 
                              description: state.value.description, 
                              icon: state.value.icon, 
                              action: state.value.action, 
                        )));
                      } else {
                        BlocProvider.of<MenuItemListBloc>(context).add(
                          AddMenuItemList(value: MenuItemModel(
                              documentID: state.value.documentID, 
                              text: state.value.text, 
                              description: state.value.description, 
                              icon: state.value.icon, 
                              action: state.value.action, 
                          )));
                      }
                      if (widget.submitAction != null) {
                        Router.navigateTo(context, widget.submitAction);
                      } else {
                        Navigator.pop(context);
                      }
                      return true;
                    }
                  },
                  child: Text('Submit', style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formSubmitButtonTextColor))),
                ));

        return Container(
          color: ((formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData)) ? Colors.transparent : null,
          decoration: ((formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData)) ? null : BoxDecorationHelper.boxDecoration(GlobalData.app().formBackground),
          padding:
          const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
            child: Form(
            child: ListView(
              padding: const EdgeInsets.all(8),
              physics: ((formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData)) ? NeverScrollableScrollPhysics() : null,
              shrinkWrap: ((formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData)),
              children: children
            ),
          )
        );
      } else {
        return CircularProgressIndicator();
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

  bool _readOnly(MenuItemFormInitialized state) {
    return (formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData) || (!GlobalData.memberIsOwner());
  }
  

}



