/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 pos_size_form.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/core/global_data.dart';

import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/core/navigate/router.dart' as eliudrouter;
import 'package:eliud_core/tools/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';

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
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_core/model/entity_export.dart';

import 'package:eliud_core/model/pos_size_list_bloc.dart';
import 'package:eliud_core/model/pos_size_list_event.dart';
import 'package:eliud_core/model/pos_size_model.dart';
import 'package:eliud_core/model/pos_size_form_bloc.dart';
import 'package:eliud_core/model/pos_size_form_event.dart';
import 'package:eliud_core/model/pos_size_form_state.dart';


class PosSizeForm extends StatelessWidget {
  FormAction formAction;
  PosSizeModel value;
  ActionModel submitAction;

  PosSizeForm({Key key, @required this.formAction, @required this.value, this.submitAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (formAction == FormAction.ShowData) {
      return BlocProvider<PosSizeFormBloc >(
            create: (context) => PosSizeFormBloc(
                                       formAction: formAction,

                                                )..add(InitialisePosSizeFormEvent(value: value)),
  
        child: MyPosSizeForm(submitAction: submitAction, formAction: formAction),
          );
    } if (formAction == FormAction.ShowPreloadedData) {
      return BlocProvider<PosSizeFormBloc >(
            create: (context) => PosSizeFormBloc(
                                       formAction: formAction,

                                                )..add(InitialisePosSizeFormNoLoadEvent(value: value)),
  
        child: MyPosSizeForm(submitAction: submitAction, formAction: formAction),
          );
    } else {
      return Scaffold(
        appBar: formAction == FormAction.UpdateAction ?
                AppBar(
                    title: Text("Update PosSize", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formAppBarTextColor))),
                    flexibleSpace: Container(
                        decoration: BoxDecorationHelper.boxDecoration(GlobalData.app().formAppBarBackground)),
                  ) :
                AppBar(
                    title: Text("Add PosSize", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formAppBarTextColor))),
                    flexibleSpace: Container(
                        decoration: BoxDecorationHelper.boxDecoration(GlobalData.app().formAppBarBackground)),
                ),
        body: BlocProvider<PosSizeFormBloc >(
            create: (context) => PosSizeFormBloc(
                                       formAction: formAction,

                                                )..add((formAction == FormAction.UpdateAction ? InitialisePosSizeFormEvent(value: value) : InitialiseNewPosSizeFormEvent())),
  
        child: MyPosSizeForm(submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}


class MyPosSizeForm extends StatefulWidget {
  final FormAction formAction;
  final ActionModel submitAction;

  MyPosSizeForm({this.formAction, this.submitAction});

  _MyPosSizeFormState createState() => _MyPosSizeFormState(this.formAction);
}


class _MyPosSizeFormState extends State<MyPosSizeForm> {
  final FormAction formAction;
  PosSizeFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  final TextEditingController _appIdController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _widthPortraitController = TextEditingController();
  int _widthTypePortraitSelectedRadioTile;
  final TextEditingController _widthLandscapeController = TextEditingController();
  int _widthTypeLandscapeSelectedRadioTile;
  final TextEditingController _heightPortraitController = TextEditingController();
  int _heightTypePortraitSelectedRadioTile;
  final TextEditingController _heightLandscapeController = TextEditingController();
  int _heightTypeLandscapeSelectedRadioTile;
  int _fitPortraitSelectedRadioTile;
  int _fitLandscapeSelectedRadioTile;
  int _alignTypePortraitSelectedRadioTile;
  int _alignTypeLandscapeSelectedRadioTile;
  int _clipSelectedRadioTile;


  _MyPosSizeFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<PosSizeFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
    _appIdController.addListener(_onAppIdChanged);
    _nameController.addListener(_onNameChanged);
    _widthPortraitController.addListener(_onWidthPortraitChanged);
    _widthTypePortraitSelectedRadioTile = 0;
    _widthLandscapeController.addListener(_onWidthLandscapeChanged);
    _widthTypeLandscapeSelectedRadioTile = 0;
    _heightPortraitController.addListener(_onHeightPortraitChanged);
    _heightTypePortraitSelectedRadioTile = 0;
    _heightLandscapeController.addListener(_onHeightLandscapeChanged);
    _heightTypeLandscapeSelectedRadioTile = 0;
    _fitPortraitSelectedRadioTile = 0;
    _fitLandscapeSelectedRadioTile = 0;
    _alignTypePortraitSelectedRadioTile = 0;
    _alignTypeLandscapeSelectedRadioTile = 0;
    _clipSelectedRadioTile = 0;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PosSizeFormBloc, PosSizeFormState>(builder: (context, state) {
      if (state is PosSizeFormUninitialized) return Center(
        child: CircularProgressIndicator(),
      );

      if (state is PosSizeFormLoaded) {
        if (state.value.documentID != null)
          _documentIDController.text = state.value.documentID.toString();
        else
          _documentIDController.text = "";
        if (state.value.appId != null)
          _appIdController.text = state.value.appId.toString();
        else
          _appIdController.text = "";
        if (state.value.name != null)
          _nameController.text = state.value.name.toString();
        else
          _nameController.text = "";
        if (state.value.widthPortrait != null)
          _widthPortraitController.text = state.value.widthPortrait.toString();
        else
          _widthPortraitController.text = "";
        if (state.value.widthTypePortrait != null)
          _widthTypePortraitSelectedRadioTile = state.value.widthTypePortrait.index;
        else
          _widthTypePortraitSelectedRadioTile = 0;
        if (state.value.widthLandscape != null)
          _widthLandscapeController.text = state.value.widthLandscape.toString();
        else
          _widthLandscapeController.text = "";
        if (state.value.widthTypeLandscape != null)
          _widthTypeLandscapeSelectedRadioTile = state.value.widthTypeLandscape.index;
        else
          _widthTypeLandscapeSelectedRadioTile = 0;
        if (state.value.heightPortrait != null)
          _heightPortraitController.text = state.value.heightPortrait.toString();
        else
          _heightPortraitController.text = "";
        if (state.value.heightTypePortrait != null)
          _heightTypePortraitSelectedRadioTile = state.value.heightTypePortrait.index;
        else
          _heightTypePortraitSelectedRadioTile = 0;
        if (state.value.heightLandscape != null)
          _heightLandscapeController.text = state.value.heightLandscape.toString();
        else
          _heightLandscapeController.text = "";
        if (state.value.heightTypeLandscape != null)
          _heightTypeLandscapeSelectedRadioTile = state.value.heightTypeLandscape.index;
        else
          _heightTypeLandscapeSelectedRadioTile = 0;
        if (state.value.fitPortrait != null)
          _fitPortraitSelectedRadioTile = state.value.fitPortrait.index;
        else
          _fitPortraitSelectedRadioTile = 0;
        if (state.value.fitLandscape != null)
          _fitLandscapeSelectedRadioTile = state.value.fitLandscape.index;
        else
          _fitLandscapeSelectedRadioTile = 0;
        if (state.value.alignTypePortrait != null)
          _alignTypePortraitSelectedRadioTile = state.value.alignTypePortrait.index;
        else
          _alignTypePortraitSelectedRadioTile = 0;
        if (state.value.alignTypeLandscape != null)
          _alignTypeLandscapeSelectedRadioTile = state.value.alignTypeLandscape.index;
        else
          _alignTypeLandscapeSelectedRadioTile = 0;
        if (state.value.clip != null)
          _clipSelectedRadioTile = state.value.clip.index;
        else
          _clipSelectedRadioTile = 0;
      }
      if (state is PosSizeFormInitialized) {
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
                    return state is DocumentIDPosSizeFormError ? state.message : null;
                  },
                ),
          );

        children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor)),
                  readOnly: _readOnly(state),
                  controller: _nameController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: GlobalData.app().formFieldFocusColor))),                    icon: Icon(Icons.text_format, color: RgbHelper.color(rgbo: GlobalData.app().formFieldHeaderColor)),
                    labelText: 'Name',
                  ),
                  keyboardType: TextInputType.text,
                  autovalidate: true,
                  validator: (_) {
                    return state is NamePosSizeFormError ? state.message : null;
                  },
                ),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: GlobalData.app().dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Clip',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: GlobalData.app().formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                RadioListTile(
                    value: 0,
                    activeColor: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor),
                    groupValue: _clipSelectedRadioTile,
                    title: Text("NoClip", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    subtitle: Text("NoClip", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    onChanged: !GlobalData.memberIsOwner() ? null : (val) {
                      setSelectionClip(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 1,
                    activeColor: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor),
                    groupValue: _clipSelectedRadioTile,
                    title: Text("ClipOval", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    subtitle: Text("ClipOval", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    onChanged: !GlobalData.memberIsOwner() ? null : (val) {
                      setSelectionClip(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 2,
                    activeColor: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor),
                    groupValue: _clipSelectedRadioTile,
                    title: Text("ClipRRect5", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    subtitle: Text("ClipRRect5", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    onChanged: !GlobalData.memberIsOwner() ? null : (val) {
                      setSelectionClip(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 3,
                    activeColor: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor),
                    groupValue: _clipSelectedRadioTile,
                    title: Text("ClipRRect10", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    subtitle: Text("ClipRRect10", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    onChanged: !GlobalData.memberIsOwner() ? null : (val) {
                      setSelectionClip(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 4,
                    activeColor: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor),
                    groupValue: _clipSelectedRadioTile,
                    title: Text("ClipRRect15", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    subtitle: Text("ClipRRect15", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    onChanged: !GlobalData.memberIsOwner() ? null : (val) {
                      setSelectionClip(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 5,
                    activeColor: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor),
                    groupValue: _clipSelectedRadioTile,
                    title: Text("ClipRRect20", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    subtitle: Text("ClipRRect20", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    onChanged: !GlobalData.memberIsOwner() ? null : (val) {
                      setSelectionClip(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 6,
                    activeColor: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor),
                    groupValue: _clipSelectedRadioTile,
                    title: Text("ClipRRect30", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    subtitle: Text("ClipRRect30", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    onChanged: !GlobalData.memberIsOwner() ? null : (val) {
                      setSelectionClip(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 7,
                    activeColor: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor),
                    groupValue: _clipSelectedRadioTile,
                    title: Text("ClipRRect40", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    subtitle: Text("ClipRRect40", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    onChanged: !GlobalData.memberIsOwner() ? null : (val) {
                      setSelectionClip(val);
                    },
                ),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: GlobalData.app().dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Width and Height',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: GlobalData.app().formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: GlobalData.app().dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Width when Landscape',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: GlobalData.app().formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor)),
                  readOnly: _readOnly(state),
                  controller: _widthLandscapeController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: GlobalData.app().formFieldFocusColor))),                    icon: Icon(Icons.text_format, color: RgbHelper.color(rgbo: GlobalData.app().formFieldHeaderColor)),
                    labelText: 'widthLandscape',
                  ),
                  keyboardType: TextInputType.number,
                  autovalidate: true,
                  validator: (_) {
                    return state is WidthLandscapePosSizeFormError ? state.message : null;
                  },
                ),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: GlobalData.app().dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Width when Portrait',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: GlobalData.app().formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor)),
                  readOnly: _readOnly(state),
                  controller: _widthPortraitController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: GlobalData.app().formFieldFocusColor))),                    icon: Icon(Icons.text_format, color: RgbHelper.color(rgbo: GlobalData.app().formFieldHeaderColor)),
                    labelText: 'widthPortrait',
                  ),
                  keyboardType: TextInputType.number,
                  autovalidate: true,
                  validator: (_) {
                    return state is WidthPortraitPosSizeFormError ? state.message : null;
                  },
                ),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: GlobalData.app().dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Width type when Landscape',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: GlobalData.app().formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                RadioListTile(
                    value: 0,
                    activeColor: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor),
                    groupValue: _widthTypeLandscapeSelectedRadioTile,
                    title: Text("AbsoluteWidth", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    subtitle: Text("AbsoluteWidth", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    onChanged: !GlobalData.memberIsOwner() ? null : (val) {
                      setSelectionWidthTypeLandscape(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 1,
                    activeColor: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor),
                    groupValue: _widthTypeLandscapeSelectedRadioTile,
                    title: Text("PercentageWidth", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    subtitle: Text("PercentageWidth", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    onChanged: !GlobalData.memberIsOwner() ? null : (val) {
                      setSelectionWidthTypeLandscape(val);
                    },
                ),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: GlobalData.app().dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Width type when Portrait',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: GlobalData.app().formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                RadioListTile(
                    value: 0,
                    activeColor: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor),
                    groupValue: _widthTypePortraitSelectedRadioTile,
                    title: Text("AbsoluteWidth", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    subtitle: Text("AbsoluteWidth", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    onChanged: !GlobalData.memberIsOwner() ? null : (val) {
                      setSelectionWidthTypePortrait(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 1,
                    activeColor: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor),
                    groupValue: _widthTypePortraitSelectedRadioTile,
                    title: Text("PercentageWidth", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    subtitle: Text("PercentageWidth", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    onChanged: !GlobalData.memberIsOwner() ? null : (val) {
                      setSelectionWidthTypePortrait(val);
                    },
                ),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: GlobalData.app().dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Height when Landscape',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: GlobalData.app().formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor)),
                  readOnly: _readOnly(state),
                  controller: _heightLandscapeController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: GlobalData.app().formFieldFocusColor))),                    icon: Icon(Icons.text_format, color: RgbHelper.color(rgbo: GlobalData.app().formFieldHeaderColor)),
                    labelText: 'heightLandscape',
                  ),
                  keyboardType: TextInputType.number,
                  autovalidate: true,
                  validator: (_) {
                    return state is HeightLandscapePosSizeFormError ? state.message : null;
                  },
                ),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: GlobalData.app().dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Height when Portrait',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: GlobalData.app().formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor)),
                  readOnly: _readOnly(state),
                  controller: _heightPortraitController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: GlobalData.app().formFieldFocusColor))),                    icon: Icon(Icons.text_format, color: RgbHelper.color(rgbo: GlobalData.app().formFieldHeaderColor)),
                    labelText: 'heightPortrait',
                  ),
                  keyboardType: TextInputType.number,
                  autovalidate: true,
                  validator: (_) {
                    return state is HeightPortraitPosSizeFormError ? state.message : null;
                  },
                ),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: GlobalData.app().dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Height type when Landscape',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: GlobalData.app().formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                RadioListTile(
                    value: 0,
                    activeColor: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor),
                    groupValue: _heightTypeLandscapeSelectedRadioTile,
                    title: Text("AbsoluteHeight", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    subtitle: Text("AbsoluteHeight", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    onChanged: !GlobalData.memberIsOwner() ? null : (val) {
                      setSelectionHeightTypeLandscape(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 1,
                    activeColor: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor),
                    groupValue: _heightTypeLandscapeSelectedRadioTile,
                    title: Text("PercentageHeight", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    subtitle: Text("PercentageHeight", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    onChanged: !GlobalData.memberIsOwner() ? null : (val) {
                      setSelectionHeightTypeLandscape(val);
                    },
                ),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: GlobalData.app().dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Height type when Portrait',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: GlobalData.app().formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                RadioListTile(
                    value: 0,
                    activeColor: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor),
                    groupValue: _heightTypePortraitSelectedRadioTile,
                    title: Text("AbsoluteHeight", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    subtitle: Text("AbsoluteHeight", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    onChanged: !GlobalData.memberIsOwner() ? null : (val) {
                      setSelectionHeightTypePortrait(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 1,
                    activeColor: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor),
                    groupValue: _heightTypePortraitSelectedRadioTile,
                    title: Text("PercentageHeight", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    subtitle: Text("PercentageHeight", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    onChanged: !GlobalData.memberIsOwner() ? null : (val) {
                      setSelectionHeightTypePortrait(val);
                    },
                ),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: GlobalData.app().dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Box Fit when Landscape',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: GlobalData.app().formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                RadioListTile(
                    value: 0,
                    activeColor: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor),
                    groupValue: _fitLandscapeSelectedRadioTile,
                    title: Text("LandscapeFitWidth", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    subtitle: Text("LandscapeFitWidth", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    onChanged: !GlobalData.memberIsOwner() ? null : (val) {
                      setSelectionFitLandscape(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 1,
                    activeColor: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor),
                    groupValue: _fitLandscapeSelectedRadioTile,
                    title: Text("LandscapeFitHeight", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    subtitle: Text("LandscapeFitHeight", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    onChanged: !GlobalData.memberIsOwner() ? null : (val) {
                      setSelectionFitLandscape(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 2,
                    activeColor: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor),
                    groupValue: _fitLandscapeSelectedRadioTile,
                    title: Text("LandscapeFill", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    subtitle: Text("LandscapeFill", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    onChanged: !GlobalData.memberIsOwner() ? null : (val) {
                      setSelectionFitLandscape(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 3,
                    activeColor: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor),
                    groupValue: _fitLandscapeSelectedRadioTile,
                    title: Text("LandscapeNone", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    subtitle: Text("LandscapeNone", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    onChanged: !GlobalData.memberIsOwner() ? null : (val) {
                      setSelectionFitLandscape(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 4,
                    activeColor: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor),
                    groupValue: _fitLandscapeSelectedRadioTile,
                    title: Text("LandscapeContain", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    subtitle: Text("LandscapeContain", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    onChanged: !GlobalData.memberIsOwner() ? null : (val) {
                      setSelectionFitLandscape(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 5,
                    activeColor: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor),
                    groupValue: _fitLandscapeSelectedRadioTile,
                    title: Text("LandscapeCover", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    subtitle: Text("LandscapeCover", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    onChanged: !GlobalData.memberIsOwner() ? null : (val) {
                      setSelectionFitLandscape(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 6,
                    activeColor: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor),
                    groupValue: _fitLandscapeSelectedRadioTile,
                    title: Text("LandscapeScaleDown", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    subtitle: Text("LandscapeScaleDown", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    onChanged: !GlobalData.memberIsOwner() ? null : (val) {
                      setSelectionFitLandscape(val);
                    },
                ),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: GlobalData.app().dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Box Fit when Portrait',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: GlobalData.app().formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                RadioListTile(
                    value: 0,
                    activeColor: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor),
                    groupValue: _fitPortraitSelectedRadioTile,
                    title: Text("PortraitFitWidth", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    subtitle: Text("PortraitFitWidth", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    onChanged: !GlobalData.memberIsOwner() ? null : (val) {
                      setSelectionFitPortrait(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 1,
                    activeColor: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor),
                    groupValue: _fitPortraitSelectedRadioTile,
                    title: Text("PortraitFitHeight", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    subtitle: Text("PortraitFitHeight", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    onChanged: !GlobalData.memberIsOwner() ? null : (val) {
                      setSelectionFitPortrait(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 2,
                    activeColor: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor),
                    groupValue: _fitPortraitSelectedRadioTile,
                    title: Text("PortraitFill", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    subtitle: Text("PortraitFill", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    onChanged: !GlobalData.memberIsOwner() ? null : (val) {
                      setSelectionFitPortrait(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 3,
                    activeColor: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor),
                    groupValue: _fitPortraitSelectedRadioTile,
                    title: Text("PortraitNone", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    subtitle: Text("PortraitNone", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    onChanged: !GlobalData.memberIsOwner() ? null : (val) {
                      setSelectionFitPortrait(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 4,
                    activeColor: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor),
                    groupValue: _fitPortraitSelectedRadioTile,
                    title: Text("PortraitContain", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    subtitle: Text("PortraitContain", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    onChanged: !GlobalData.memberIsOwner() ? null : (val) {
                      setSelectionFitPortrait(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 5,
                    activeColor: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor),
                    groupValue: _fitPortraitSelectedRadioTile,
                    title: Text("PortraitCover", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    subtitle: Text("PortraitCover", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    onChanged: !GlobalData.memberIsOwner() ? null : (val) {
                      setSelectionFitPortrait(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 6,
                    activeColor: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor),
                    groupValue: _fitPortraitSelectedRadioTile,
                    title: Text("PortraitScaleDown", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    subtitle: Text("PortraitScaleDown", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    onChanged: !GlobalData.memberIsOwner() ? null : (val) {
                      setSelectionFitPortrait(val);
                    },
                ),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: GlobalData.app().dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Align when Landscape',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: GlobalData.app().formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                RadioListTile(
                    value: 0,
                    activeColor: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor),
                    groupValue: _alignTypeLandscapeSelectedRadioTile,
                    title: Text("LandscapeAlignTopLeft", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    subtitle: Text("LandscapeAlignTopLeft", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    onChanged: !GlobalData.memberIsOwner() ? null : (val) {
                      setSelectionAlignTypeLandscape(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 1,
                    activeColor: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor),
                    groupValue: _alignTypeLandscapeSelectedRadioTile,
                    title: Text("LandscapeAlignTopCenter", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    subtitle: Text("LandscapeAlignTopCenter", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    onChanged: !GlobalData.memberIsOwner() ? null : (val) {
                      setSelectionAlignTypeLandscape(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 2,
                    activeColor: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor),
                    groupValue: _alignTypeLandscapeSelectedRadioTile,
                    title: Text("LandscapeAlignTopRight", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    subtitle: Text("LandscapeAlignTopRight", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    onChanged: !GlobalData.memberIsOwner() ? null : (val) {
                      setSelectionAlignTypeLandscape(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 3,
                    activeColor: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor),
                    groupValue: _alignTypeLandscapeSelectedRadioTile,
                    title: Text("LandscapeAlignCenterLeft", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    subtitle: Text("LandscapeAlignCenterLeft", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    onChanged: !GlobalData.memberIsOwner() ? null : (val) {
                      setSelectionAlignTypeLandscape(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 4,
                    activeColor: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor),
                    groupValue: _alignTypeLandscapeSelectedRadioTile,
                    title: Text("LandscapeAlignCenter", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    subtitle: Text("LandscapeAlignCenter", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    onChanged: !GlobalData.memberIsOwner() ? null : (val) {
                      setSelectionAlignTypeLandscape(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 5,
                    activeColor: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor),
                    groupValue: _alignTypeLandscapeSelectedRadioTile,
                    title: Text("LandscapeAlignCenterRight", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    subtitle: Text("LandscapeAlignCenterRight", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    onChanged: !GlobalData.memberIsOwner() ? null : (val) {
                      setSelectionAlignTypeLandscape(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 6,
                    activeColor: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor),
                    groupValue: _alignTypeLandscapeSelectedRadioTile,
                    title: Text("LandscapeAlignBottomLeft", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    subtitle: Text("LandscapeAlignBottomLeft", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    onChanged: !GlobalData.memberIsOwner() ? null : (val) {
                      setSelectionAlignTypeLandscape(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 7,
                    activeColor: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor),
                    groupValue: _alignTypeLandscapeSelectedRadioTile,
                    title: Text("LandscapeAlignBottomCenter", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    subtitle: Text("LandscapeAlignBottomCenter", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    onChanged: !GlobalData.memberIsOwner() ? null : (val) {
                      setSelectionAlignTypeLandscape(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 8,
                    activeColor: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor),
                    groupValue: _alignTypeLandscapeSelectedRadioTile,
                    title: Text("LandscapeAlignBottomRight", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    subtitle: Text("LandscapeAlignBottomRight", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    onChanged: !GlobalData.memberIsOwner() ? null : (val) {
                      setSelectionAlignTypeLandscape(val);
                    },
                ),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: GlobalData.app().dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Align when Portrait',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: GlobalData.app().formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                RadioListTile(
                    value: 0,
                    activeColor: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor),
                    groupValue: _alignTypePortraitSelectedRadioTile,
                    title: Text("PortraitAlignTopLeft", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    subtitle: Text("PortraitAlignTopLeft", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    onChanged: !GlobalData.memberIsOwner() ? null : (val) {
                      setSelectionAlignTypePortrait(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 1,
                    activeColor: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor),
                    groupValue: _alignTypePortraitSelectedRadioTile,
                    title: Text("PortraitAlignTopCenter", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    subtitle: Text("PortraitAlignTopCenter", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    onChanged: !GlobalData.memberIsOwner() ? null : (val) {
                      setSelectionAlignTypePortrait(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 2,
                    activeColor: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor),
                    groupValue: _alignTypePortraitSelectedRadioTile,
                    title: Text("PortraitAlignTopRight", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    subtitle: Text("PortraitAlignTopRight", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    onChanged: !GlobalData.memberIsOwner() ? null : (val) {
                      setSelectionAlignTypePortrait(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 3,
                    activeColor: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor),
                    groupValue: _alignTypePortraitSelectedRadioTile,
                    title: Text("PortraitAlignCenterLeft", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    subtitle: Text("PortraitAlignCenterLeft", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    onChanged: !GlobalData.memberIsOwner() ? null : (val) {
                      setSelectionAlignTypePortrait(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 4,
                    activeColor: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor),
                    groupValue: _alignTypePortraitSelectedRadioTile,
                    title: Text("PortraitAlignCenter", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    subtitle: Text("PortraitAlignCenter", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    onChanged: !GlobalData.memberIsOwner() ? null : (val) {
                      setSelectionAlignTypePortrait(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 5,
                    activeColor: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor),
                    groupValue: _alignTypePortraitSelectedRadioTile,
                    title: Text("PortraitAlignCenterRight", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    subtitle: Text("PortraitAlignCenterRight", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    onChanged: !GlobalData.memberIsOwner() ? null : (val) {
                      setSelectionAlignTypePortrait(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 6,
                    activeColor: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor),
                    groupValue: _alignTypePortraitSelectedRadioTile,
                    title: Text("PortraitAlignBottomLeft", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    subtitle: Text("PortraitAlignBottomLeft", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    onChanged: !GlobalData.memberIsOwner() ? null : (val) {
                      setSelectionAlignTypePortrait(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 7,
                    activeColor: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor),
                    groupValue: _alignTypePortraitSelectedRadioTile,
                    title: Text("PortraitAlignBottomCenter", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    subtitle: Text("PortraitAlignBottomCenter", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    onChanged: !GlobalData.memberIsOwner() ? null : (val) {
                      setSelectionAlignTypePortrait(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 8,
                    activeColor: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor),
                    groupValue: _alignTypePortraitSelectedRadioTile,
                    title: Text("PortraitAlignBottomRight", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    subtitle: Text("PortraitAlignBottomRight", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    onChanged: !GlobalData.memberIsOwner() ? null : (val) {
                      setSelectionAlignTypePortrait(val);
                    },
                ),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: GlobalData.app().dividerColor)));


        if ((formAction != FormAction.ShowData) && (formAction != FormAction.ShowPreloadedData))
          children.add(RaisedButton(
                  color: RgbHelper.color(rgbo: GlobalData.app().formSubmitButtonColor),
                  onPressed: _readOnly(state) ? null : () {
                    if (state is PosSizeFormError) {
                      return null;
                    } else {
                      if (formAction == FormAction.UpdateAction) {
                        BlocProvider.of<PosSizeListBloc>(context).add(
                          UpdatePosSizeList(value: state.value.copyWith(
                              documentID: state.value.documentID, 
                              appId: state.value.appId, 
                              name: state.value.name, 
                              widthPortrait: state.value.widthPortrait, 
                              widthTypePortrait: state.value.widthTypePortrait, 
                              widthLandscape: state.value.widthLandscape, 
                              widthTypeLandscape: state.value.widthTypeLandscape, 
                              heightPortrait: state.value.heightPortrait, 
                              heightTypePortrait: state.value.heightTypePortrait, 
                              heightLandscape: state.value.heightLandscape, 
                              heightTypeLandscape: state.value.heightTypeLandscape, 
                              fitPortrait: state.value.fitPortrait, 
                              fitLandscape: state.value.fitLandscape, 
                              alignTypePortrait: state.value.alignTypePortrait, 
                              alignTypeLandscape: state.value.alignTypeLandscape, 
                              clip: state.value.clip, 
                        )));
                      } else {
                        BlocProvider.of<PosSizeListBloc>(context).add(
                          AddPosSizeList(value: PosSizeModel(
                              documentID: state.value.documentID, 
                              appId: state.value.appId, 
                              name: state.value.name, 
                              widthPortrait: state.value.widthPortrait, 
                              widthTypePortrait: state.value.widthTypePortrait, 
                              widthLandscape: state.value.widthLandscape, 
                              widthTypeLandscape: state.value.widthTypeLandscape, 
                              heightPortrait: state.value.heightPortrait, 
                              heightTypePortrait: state.value.heightTypePortrait, 
                              heightLandscape: state.value.heightLandscape, 
                              heightTypeLandscape: state.value.heightTypeLandscape, 
                              fitPortrait: state.value.fitPortrait, 
                              fitLandscape: state.value.fitLandscape, 
                              alignTypePortrait: state.value.alignTypePortrait, 
                              alignTypeLandscape: state.value.alignTypeLandscape, 
                              clip: state.value.clip, 
                          )));
                      }
                      if (widget.submitAction != null) {
                        eliudrouter.Router.navigateTo(context, widget.submitAction);
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
    _myFormBloc.add(ChangedPosSizeDocumentID(value: _documentIDController.text));
  }


  void _onAppIdChanged() {
    _myFormBloc.add(ChangedPosSizeAppId(value: _appIdController.text));
  }


  void _onNameChanged() {
    _myFormBloc.add(ChangedPosSizeName(value: _nameController.text));
  }


  void _onWidthPortraitChanged() {
    _myFormBloc.add(ChangedPosSizeWidthPortrait(value: _widthPortraitController.text));
  }


  void setSelectionWidthTypePortrait(int val) {
    setState(() {
      _widthTypePortraitSelectedRadioTile = val;
    });
    _myFormBloc.add(ChangedPosSizeWidthTypePortrait(value: toWidthTypePortrait(val)));
  }


  void _onWidthLandscapeChanged() {
    _myFormBloc.add(ChangedPosSizeWidthLandscape(value: _widthLandscapeController.text));
  }


  void setSelectionWidthTypeLandscape(int val) {
    setState(() {
      _widthTypeLandscapeSelectedRadioTile = val;
    });
    _myFormBloc.add(ChangedPosSizeWidthTypeLandscape(value: toWidthTypeLandscape(val)));
  }


  void _onHeightPortraitChanged() {
    _myFormBloc.add(ChangedPosSizeHeightPortrait(value: _heightPortraitController.text));
  }


  void setSelectionHeightTypePortrait(int val) {
    setState(() {
      _heightTypePortraitSelectedRadioTile = val;
    });
    _myFormBloc.add(ChangedPosSizeHeightTypePortrait(value: toHeightTypePortrait(val)));
  }


  void _onHeightLandscapeChanged() {
    _myFormBloc.add(ChangedPosSizeHeightLandscape(value: _heightLandscapeController.text));
  }


  void setSelectionHeightTypeLandscape(int val) {
    setState(() {
      _heightTypeLandscapeSelectedRadioTile = val;
    });
    _myFormBloc.add(ChangedPosSizeHeightTypeLandscape(value: toHeightTypeLandscape(val)));
  }


  void setSelectionFitPortrait(int val) {
    setState(() {
      _fitPortraitSelectedRadioTile = val;
    });
    _myFormBloc.add(ChangedPosSizeFitPortrait(value: toPortraitFitType(val)));
  }


  void setSelectionFitLandscape(int val) {
    setState(() {
      _fitLandscapeSelectedRadioTile = val;
    });
    _myFormBloc.add(ChangedPosSizeFitLandscape(value: toLandscapeFitType(val)));
  }


  void setSelectionAlignTypePortrait(int val) {
    setState(() {
      _alignTypePortraitSelectedRadioTile = val;
    });
    _myFormBloc.add(ChangedPosSizeAlignTypePortrait(value: toPortraitAlignType(val)));
  }


  void setSelectionAlignTypeLandscape(int val) {
    setState(() {
      _alignTypeLandscapeSelectedRadioTile = val;
    });
    _myFormBloc.add(ChangedPosSizeAlignTypeLandscape(value: toLandscapeAlignType(val)));
  }


  void setSelectionClip(int val) {
    setState(() {
      _clipSelectedRadioTile = val;
    });
    _myFormBloc.add(ChangedPosSizeClip(value: toClipType(val)));
  }



  @override
  void dispose() {
    _documentIDController.dispose();
    _appIdController.dispose();
    _nameController.dispose();
    _widthPortraitController.dispose();
    _widthLandscapeController.dispose();
    _heightPortraitController.dispose();
    _heightLandscapeController.dispose();
    super.dispose();
  }

  bool _readOnly(PosSizeFormInitialized state) {
    return (formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData) || (!GlobalData.memberIsOwner());
  }
  

}



