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

import 'app_bar_list_bloc.dart';
import 'app_bar_list_event.dart';
import 'app_bar_model.dart';
import 'app_bar_form_bloc.dart';
import 'app_bar_form_event.dart';
import 'app_bar_form_state.dart';


class AppBarForm extends StatelessWidget {
  FormAction formAction;
  AppBarModel value;
  ActionModel submitAction;

  AppBarForm({Key key, @required this.formAction, @required this.value, this.submitAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (formAction == FormAction.ShowData) {
      return BlocProvider<AppBarFormBloc >(
            create: (context) => AppBarFormBloc(
                                       formAction: formAction,

                                                )..add(InitialiseAppBarFormEvent(value: value)),
  
        child: MyAppBarForm(submitAction: submitAction, formAction: formAction),
          );
    } if (formAction == FormAction.ShowPreloadedData) {
      return BlocProvider<AppBarFormBloc >(
            create: (context) => AppBarFormBloc(
                                       formAction: formAction,

                                                )..add(InitialiseAppBarFormNoLoadEvent(value: value)),
  
        child: MyAppBarForm(submitAction: submitAction, formAction: formAction),
          );
    } else {
      return Scaffold(
        appBar: formAction == FormAction.UpdateAction ?
                AppBar(
                    title: Text("Update AppBar", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formAppBarTextColor))),
                    flexibleSpace: Container(
                        decoration: BoxDecorationHelper.boxDecoration(GlobalData.app().formAppBarBackground)),
                  ) :
                AppBar(
                    title: Text("Add AppBar", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formAppBarTextColor))),
                    flexibleSpace: Container(
                        decoration: BoxDecorationHelper.boxDecoration(GlobalData.app().formAppBarBackground)),
                ),
        body: BlocProvider<AppBarFormBloc >(
            create: (context) => AppBarFormBloc(
                                       formAction: formAction,

                                                )..add((formAction == FormAction.UpdateAction ? InitialiseAppBarFormEvent(value: value) : InitialiseNewAppBarFormEvent())),
  
        child: MyAppBarForm(submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}


class MyAppBarForm extends StatefulWidget {
  final FormAction formAction;
  final ActionModel submitAction;

  MyAppBarForm({this.formAction, this.submitAction});

  _MyAppBarFormState createState() => _MyAppBarFormState(this.formAction);
}


class _MyAppBarFormState extends State<MyAppBarForm> {
  final FormAction formAction;
  AppBarFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  final TextEditingController _appIdController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  int _headerSelectedRadioTile;
  String _image;
  String _iconMenu;
  String _background;


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
    return BlocBuilder<AppBarFormBloc, AppBarFormState>(builder: (context, state) {
      if (state is AppBarFormUninitialized) return Center(
        child: CircularProgressIndicator(),
      );

      if (state is AppBarFormLoaded) {
        if (state.value.documentID != null)
          _documentIDController.text = state.value.documentID.toString();
        else
          _documentIDController.text = "";
        if (state.value.appId != null)
          _appIdController.text = state.value.appId.toString();
        else
          _appIdController.text = "";
        if (state.value.title != null)
          _titleController.text = state.value.title.toString();
        else
          _titleController.text = "";
        if (state.value.header != null)
          _headerSelectedRadioTile = state.value.header.index;
        else
          _headerSelectedRadioTile = 0;
        if (state.value.image != null)
          _image= state.value.image.documentID;
        else
          _image= "";
        if (state.value.iconMenu != null)
          _iconMenu= state.value.iconMenu.documentID;
        else
          _iconMenu= "";
        if (state.value.background != null)
          _background= state.value.background.documentID;
        else
          _background= "";
      }
      if (state is AppBarFormInitialized) {
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
                  readOnly: (formAction == FormAction.UpdateAction),
                  controller: _documentIDController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: GlobalData.app().formFieldFocusColor))),                    icon: Icon(Icons.vpn_key, color: RgbHelper.color(rgbo: GlobalData.app().formFieldHeaderColor)),
                    labelText: 'Document ID',
                  ),
                  keyboardType: TextInputType.text,
                  autovalidate: true,
                  validator: (_) {
                    return state is DocumentIDAppBarFormError ? state.message : null;
                  },
                ),
          );

        children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor)),
                  readOnly: _readOnly(state),
                  controller: _titleController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: GlobalData.app().formFieldFocusColor))),                    icon: Icon(Icons.vpn_key, color: RgbHelper.color(rgbo: GlobalData.app().formFieldHeaderColor)),
                    labelText: 'Title',
                  ),
                  keyboardType: TextInputType.text,
                  autovalidate: true,
                  validator: (_) {
                    return state is TitleAppBarFormError ? state.message : null;
                  },
                ),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: GlobalData.app().dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Header type',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: GlobalData.app().formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                RadioListTile(
                    value: 0,
                    activeColor: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor),
                    groupValue: _headerSelectedRadioTile,
                    title: Text("Title", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    subtitle: Text("Title", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    onChanged: !GlobalData.memberIsOwner() ? null : (val) {
                      setSelectionHeader(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 1,
                    activeColor: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor),
                    groupValue: _headerSelectedRadioTile,
                    title: Text("Image", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    subtitle: Text("Image", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    onChanged: !GlobalData.memberIsOwner() ? null : (val) {
                      setSelectionHeader(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 2,
                    activeColor: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor),
                    groupValue: _headerSelectedRadioTile,
                    title: Text("Icon", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    subtitle: Text("Icon", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    onChanged: !GlobalData.memberIsOwner() ? null : (val) {
                      setSelectionHeader(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 3,
                    activeColor: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor),
                    groupValue: _headerSelectedRadioTile,
                    title: Text("None", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    subtitle: Text("None", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    onChanged: !GlobalData.memberIsOwner() ? null : (val) {
                      setSelectionHeader(val);
                    },
                ),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: GlobalData.app().dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Image',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: GlobalData.app().formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                DropdownButtonComponentFactory().createNew(id: "images", value: _image, trigger: _onImageSelected, optional: true),
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


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Icon Menu',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: GlobalData.app().formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                DropdownButtonComponentFactory().createNew(id: "menuDefs", value: _iconMenu, trigger: _onIconMenuSelected, optional: true),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: GlobalData.app().dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('AppBar Colors',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: GlobalData.app().formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: GlobalData.app().dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Icon Colors',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: GlobalData.app().formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                RgbField("Text color", state.value.iconColor, _onIconColorChanged)
          );

        children.add(

                RgbField("Selected Icon Color", state.value.selectedIconColor, _onSelectedIconColorChanged)
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: GlobalData.app().dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Menu Colors',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: GlobalData.app().formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                RgbField("Background Color", state.value.menuBackgroundColor, _onMenuBackgroundColorChanged)
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: GlobalData.app().dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Header Background',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: GlobalData.app().formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                DropdownButtonComponentFactory().createNew(id: "backgrounds", value: _background, trigger: _onBackgroundSelected, optional: true),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: GlobalData.app().dividerColor)));


        if ((formAction != FormAction.ShowData) && (formAction != FormAction.ShowPreloadedData))
          children.add(RaisedButton(
                  color: RgbHelper.color(rgbo: GlobalData.app().formSubmitButtonColor),
                  onPressed: _readOnly(state) ? null : () {
                    if (state is AppBarFormError) {
                      return null;
                    } else {
                      if (formAction == FormAction.UpdateAction) {
                        BlocProvider.of<AppBarListBloc>(context).add(
                          UpdateAppBarList(value: state.value.copyWith(
                              documentID: state.value.documentID, 
                              appId: state.value.appId, 
                              title: state.value.title, 
                              header: state.value.header, 
                              icon: state.value.icon, 
                              image: state.value.image, 
                              iconMenu: state.value.iconMenu, 
                              background: state.value.background, 
                              iconColor: state.value.iconColor, 
                              selectedIconColor: state.value.selectedIconColor, 
                              menuBackgroundColor: state.value.menuBackgroundColor, 
                        )));
                      } else {
                        BlocProvider.of<AppBarListBloc>(context).add(
                          AddAppBarList(value: AppBarModel(
                              documentID: state.value.documentID, 
                              appId: state.value.appId, 
                              title: state.value.title, 
                              header: state.value.header, 
                              icon: state.value.icon, 
                              image: state.value.image, 
                              iconMenu: state.value.iconMenu, 
                              background: state.value.background, 
                              iconColor: state.value.iconColor, 
                              selectedIconColor: state.value.selectedIconColor, 
                              menuBackgroundColor: state.value.menuBackgroundColor, 
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
    _myFormBloc.add(ChangedAppBarDocumentID(value: _documentIDController.text));
  }


  void _onAppIdChanged() {
    _myFormBloc.add(ChangedAppBarAppId(value: _appIdController.text));
  }


  void _onTitleChanged() {
    _myFormBloc.add(ChangedAppBarTitle(value: _titleController.text));
  }


  void setSelectionHeader(int val) {
    setState(() {
      _headerSelectedRadioTile = val;
    });
    _myFormBloc.add(ChangedAppBarHeader(value: toHeaderSelection(val)));
  }


  void _onIconChanged(value) {
    _myFormBloc.add(ChangedAppBarIcon(value: value));
    
  }


  void _onImageSelected(String val) {
    setState(() {
      _image = val;
    });
    _myFormBloc.add(ChangedAppBarImage(value: val));
  }


  void _onIconMenuSelected(String val) {
    setState(() {
      _iconMenu = val;
    });
    _myFormBloc.add(ChangedAppBarIconMenu(value: val));
  }


  void _onBackgroundSelected(String val) {
    setState(() {
      _background = val;
    });
    _myFormBloc.add(ChangedAppBarBackground(value: val));
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

  bool _readOnly(AppBarFormInitialized state) {
    return (formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData) || (!GlobalData.memberIsOwner());
  }
  

}



