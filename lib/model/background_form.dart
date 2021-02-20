/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 background_form.dart
                       
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

import 'package:eliud_core/model/background_list_bloc.dart';
import 'package:eliud_core/model/background_list_event.dart';
import 'package:eliud_core/model/background_model.dart';
import 'package:eliud_core/model/background_form_bloc.dart';
import 'package:eliud_core/model/background_form_event.dart';
import 'package:eliud_core/model/background_form_state.dart';


class BackgroundForm extends StatelessWidget {
  FormAction formAction;
  BackgroundModel value;
  ActionModel submitAction;

  BackgroundForm({Key key, @required this.formAction, @required this.value, this.submitAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    var app = AccessBloc.app(context);
    if (formAction == FormAction.ShowData) {
      return BlocProvider<BackgroundFormBloc >(
            create: (context) => BackgroundFormBloc(AccessBloc.appId(context),
                                       formAction: formAction,

                                                )..add(InitialiseBackgroundFormEvent(value: value)),
  
        child: MyBackgroundForm(submitAction: submitAction, formAction: formAction),
          );
    } if (formAction == FormAction.ShowPreloadedData) {
      return BlocProvider<BackgroundFormBloc >(
            create: (context) => BackgroundFormBloc(AccessBloc.appId(context),
                                       formAction: formAction,

                                                )..add(InitialiseBackgroundFormNoLoadEvent(value: value)),
  
        child: MyBackgroundForm(submitAction: submitAction, formAction: formAction),
          );
    } else {
      return Scaffold(
        appBar: formAction == FormAction.UpdateAction ?
                AppBar(
                    title: Text("Update Background", style: TextStyle(color: RgbHelper.color(rgbo: app.formAppBarTextColor))),
                    flexibleSpace: Container(
                        decoration: BoxDecorationHelper.boxDecoration(accessState, app.formAppBarBackground)),
                  ) :
                AppBar(
                    title: Text("Add Background", style: TextStyle(color: RgbHelper.color(rgbo: app.formAppBarTextColor))),
                    flexibleSpace: Container(
                        decoration: BoxDecorationHelper.boxDecoration(accessState, app.formAppBarBackground)),
                ),
        body: BlocProvider<BackgroundFormBloc >(
            create: (context) => BackgroundFormBloc(AccessBloc.appId(context),
                                       formAction: formAction,

                                                )..add((formAction == FormAction.UpdateAction ? InitialiseBackgroundFormEvent(value: value) : InitialiseNewBackgroundFormEvent())),
  
        child: MyBackgroundForm(submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}


class MyBackgroundForm extends StatefulWidget {
  final FormAction formAction;
  final ActionModel submitAction;

  MyBackgroundForm({this.formAction, this.submitAction});

  _MyBackgroundFormState createState() => _MyBackgroundFormState(this.formAction);
}


class _MyBackgroundFormState extends State<MyBackgroundForm> {
  final FormAction formAction;
  BackgroundFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  final TextEditingController _appIdController = TextEditingController();
  final TextEditingController _commentsController = TextEditingController();
  String _backgroundImage;
  bool _useProfilePhotoAsBackgroundSelection;
  int _beginGradientPositionSelectedRadioTile;
  int _endGradientPositionSelectedRadioTile;
  String _shadow;
  bool _borderSelection;
  bool _adminSelection;


  _MyBackgroundFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<BackgroundFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
    _appIdController.addListener(_onAppIdChanged);
    _commentsController.addListener(_onCommentsChanged);
    _useProfilePhotoAsBackgroundSelection = false;
    _beginGradientPositionSelectedRadioTile = 0;
    _endGradientPositionSelectedRadioTile = 0;
    _borderSelection = false;
    _adminSelection = false;
  }

  @override
  Widget build(BuildContext context) {
    var app = AccessBloc.app(context);
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<BackgroundFormBloc, BackgroundFormState>(builder: (context, state) {
      if (state is BackgroundFormUninitialized) return Center(
        child: DelayedCircularProgressIndicator(),
      );

      if (state is BackgroundFormLoaded) {
        if (state.value.documentID != null)
          _documentIDController.text = state.value.documentID.toString();
        else
          _documentIDController.text = "";
        if (state.value.appId != null)
          _appIdController.text = state.value.appId.toString();
        else
          _appIdController.text = "";
        if (state.value.comments != null)
          _commentsController.text = state.value.comments.toString();
        else
          _commentsController.text = "";
        if (state.value.backgroundImage != null)
          _backgroundImage= state.value.backgroundImage.documentID;
        else
          _backgroundImage= "";
        if (state.value.useProfilePhotoAsBackground != null)
        _useProfilePhotoAsBackgroundSelection = state.value.useProfilePhotoAsBackground;
        else
        _useProfilePhotoAsBackgroundSelection = false;
        if (state.value.beginGradientPosition != null)
          _beginGradientPositionSelectedRadioTile = state.value.beginGradientPosition.index;
        else
          _beginGradientPositionSelectedRadioTile = 0;
        if (state.value.endGradientPosition != null)
          _endGradientPositionSelectedRadioTile = state.value.endGradientPosition.index;
        else
          _endGradientPositionSelectedRadioTile = 0;
        if (state.value.shadow != null)
          _shadow= state.value.shadow.documentID;
        else
          _shadow= "";
        if (state.value.border != null)
        _borderSelection = state.value.border;
        else
        _borderSelection = false;
        if (state.value.admin != null)
        _adminSelection = state.value.admin;
        else
        _adminSelection = false;
      }
      if (state is BackgroundFormInitialized) {
        List<Widget> children = List();
         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('General',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: app.formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                CheckboxListTile(
                    title: Text('Use Profile Photo As Background', style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    value: _useProfilePhotoAsBackgroundSelection,
                    onChanged: _readOnly(accessState, state) ? null : (val) {
                      setSelectionUseProfilePhotoAsBackground(val);
                    }),
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
                    return state is DocumentIDBackgroundFormError ? state.message : null;
                  },
                ),
          );

        children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor)),
                  readOnly: _readOnly(accessState, state),
                  controller: _commentsController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldFocusColor))),                    icon: Icon(Icons.text_format, color: RgbHelper.color(rgbo: app.formFieldHeaderColor)),
                    labelText: 'Comments',
                  ),
                  keyboardType: TextInputType.text,
                  autovalidate: true,
                  validator: (_) {
                    return state is CommentsBackgroundFormError ? state.message : null;
                  },
                ),
          );

        children.add(

                CheckboxListTile(
                    title: Text('border', style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    value: _borderSelection,
                    onChanged: _readOnly(accessState, state) ? null : (val) {
                      setSelectionBorder(val);
                    }),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: app.dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Colors',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: app.formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                new Container(
                    height: (fullScreenHeight(context) / 2.5), 
                    child: decorationColorsList(context, state.value.decorationColors, _onDecorationColorsChanged)
                )
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: app.dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Background Image',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: app.formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                DropdownButtonComponentFactory().createNew(id: "memberMediums", value: _backgroundImage, trigger: _onBackgroundImageSelected, optional: true),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: app.dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Start position of the gradient',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: app.formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                RadioListTile(
                    value: 0,
                    activeColor: RgbHelper.color(rgbo: app.formFieldTextColor),
                    groupValue: _beginGradientPositionSelectedRadioTile,
                    title: Text("TopLeft", style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    subtitle: Text("TopLeft", style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    onChanged: !accessState.memberIsOwner() ? null : (val) {
                      setSelectionBeginGradientPosition(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 1,
                    activeColor: RgbHelper.color(rgbo: app.formFieldTextColor),
                    groupValue: _beginGradientPositionSelectedRadioTile,
                    title: Text("TopCenter", style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    subtitle: Text("TopCenter", style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    onChanged: !accessState.memberIsOwner() ? null : (val) {
                      setSelectionBeginGradientPosition(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 2,
                    activeColor: RgbHelper.color(rgbo: app.formFieldTextColor),
                    groupValue: _beginGradientPositionSelectedRadioTile,
                    title: Text("TopRight", style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    subtitle: Text("TopRight", style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    onChanged: !accessState.memberIsOwner() ? null : (val) {
                      setSelectionBeginGradientPosition(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 3,
                    activeColor: RgbHelper.color(rgbo: app.formFieldTextColor),
                    groupValue: _beginGradientPositionSelectedRadioTile,
                    title: Text("CenterLeft", style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    subtitle: Text("CenterLeft", style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    onChanged: !accessState.memberIsOwner() ? null : (val) {
                      setSelectionBeginGradientPosition(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 4,
                    activeColor: RgbHelper.color(rgbo: app.formFieldTextColor),
                    groupValue: _beginGradientPositionSelectedRadioTile,
                    title: Text("Center", style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    subtitle: Text("Center", style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    onChanged: !accessState.memberIsOwner() ? null : (val) {
                      setSelectionBeginGradientPosition(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 5,
                    activeColor: RgbHelper.color(rgbo: app.formFieldTextColor),
                    groupValue: _beginGradientPositionSelectedRadioTile,
                    title: Text("CenterRight", style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    subtitle: Text("CenterRight", style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    onChanged: !accessState.memberIsOwner() ? null : (val) {
                      setSelectionBeginGradientPosition(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 6,
                    activeColor: RgbHelper.color(rgbo: app.formFieldTextColor),
                    groupValue: _beginGradientPositionSelectedRadioTile,
                    title: Text("BottomLeft", style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    subtitle: Text("BottomLeft", style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    onChanged: !accessState.memberIsOwner() ? null : (val) {
                      setSelectionBeginGradientPosition(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 7,
                    activeColor: RgbHelper.color(rgbo: app.formFieldTextColor),
                    groupValue: _beginGradientPositionSelectedRadioTile,
                    title: Text("BottomCenter", style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    subtitle: Text("BottomCenter", style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    onChanged: !accessState.memberIsOwner() ? null : (val) {
                      setSelectionBeginGradientPosition(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 8,
                    activeColor: RgbHelper.color(rgbo: app.formFieldTextColor),
                    groupValue: _beginGradientPositionSelectedRadioTile,
                    title: Text("BottomRight", style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    subtitle: Text("BottomRight", style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    onChanged: !accessState.memberIsOwner() ? null : (val) {
                      setSelectionBeginGradientPosition(val);
                    },
                ),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: app.dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('End position of the gradient',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: app.formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                RadioListTile(
                    value: 0,
                    activeColor: RgbHelper.color(rgbo: app.formFieldTextColor),
                    groupValue: _endGradientPositionSelectedRadioTile,
                    title: Text("TopLeft", style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    subtitle: Text("TopLeft", style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    onChanged: !accessState.memberIsOwner() ? null : (val) {
                      setSelectionEndGradientPosition(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 1,
                    activeColor: RgbHelper.color(rgbo: app.formFieldTextColor),
                    groupValue: _endGradientPositionSelectedRadioTile,
                    title: Text("TopCenter", style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    subtitle: Text("TopCenter", style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    onChanged: !accessState.memberIsOwner() ? null : (val) {
                      setSelectionEndGradientPosition(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 2,
                    activeColor: RgbHelper.color(rgbo: app.formFieldTextColor),
                    groupValue: _endGradientPositionSelectedRadioTile,
                    title: Text("TopRight", style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    subtitle: Text("TopRight", style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    onChanged: !accessState.memberIsOwner() ? null : (val) {
                      setSelectionEndGradientPosition(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 3,
                    activeColor: RgbHelper.color(rgbo: app.formFieldTextColor),
                    groupValue: _endGradientPositionSelectedRadioTile,
                    title: Text("CenterLeft", style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    subtitle: Text("CenterLeft", style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    onChanged: !accessState.memberIsOwner() ? null : (val) {
                      setSelectionEndGradientPosition(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 4,
                    activeColor: RgbHelper.color(rgbo: app.formFieldTextColor),
                    groupValue: _endGradientPositionSelectedRadioTile,
                    title: Text("Center", style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    subtitle: Text("Center", style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    onChanged: !accessState.memberIsOwner() ? null : (val) {
                      setSelectionEndGradientPosition(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 5,
                    activeColor: RgbHelper.color(rgbo: app.formFieldTextColor),
                    groupValue: _endGradientPositionSelectedRadioTile,
                    title: Text("CenterRight", style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    subtitle: Text("CenterRight", style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    onChanged: !accessState.memberIsOwner() ? null : (val) {
                      setSelectionEndGradientPosition(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 6,
                    activeColor: RgbHelper.color(rgbo: app.formFieldTextColor),
                    groupValue: _endGradientPositionSelectedRadioTile,
                    title: Text("BottomLeft", style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    subtitle: Text("BottomLeft", style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    onChanged: !accessState.memberIsOwner() ? null : (val) {
                      setSelectionEndGradientPosition(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 7,
                    activeColor: RgbHelper.color(rgbo: app.formFieldTextColor),
                    groupValue: _endGradientPositionSelectedRadioTile,
                    title: Text("BottomCenter", style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    subtitle: Text("BottomCenter", style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    onChanged: !accessState.memberIsOwner() ? null : (val) {
                      setSelectionEndGradientPosition(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 8,
                    activeColor: RgbHelper.color(rgbo: app.formFieldTextColor),
                    groupValue: _endGradientPositionSelectedRadioTile,
                    title: Text("BottomRight", style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    subtitle: Text("BottomRight", style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    onChanged: !accessState.memberIsOwner() ? null : (val) {
                      setSelectionEndGradientPosition(val);
                    },
                ),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: app.dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Shadow',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: app.formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                DropdownButtonComponentFactory().createNew(id: "shadows", value: _shadow, trigger: _onShadowSelected, optional: true),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: app.dividerColor)));


        if ((formAction != FormAction.ShowData) && (formAction != FormAction.ShowPreloadedData))
          children.add(RaisedButton(
                  color: RgbHelper.color(rgbo: app.formSubmitButtonColor),
                  onPressed: _readOnly(accessState, state) ? null : () {
                    if (state is BackgroundFormError) {
                      return null;
                    } else {
                      if (formAction == FormAction.UpdateAction) {
                        BlocProvider.of<BackgroundListBloc>(context).add(
                          UpdateBackgroundList(value: state.value.copyWith(
                              documentID: state.value.documentID, 
                              appId: state.value.appId, 
                              comments: state.value.comments, 
                              backgroundImage: state.value.backgroundImage, 
                              useProfilePhotoAsBackground: state.value.useProfilePhotoAsBackground, 
                              beginGradientPosition: state.value.beginGradientPosition, 
                              endGradientPosition: state.value.endGradientPosition, 
                              shadow: state.value.shadow, 
                              decorationColors: state.value.decorationColors, 
                              border: state.value.border, 
                              admin: state.value.admin, 
                        )));
                      } else {
                        BlocProvider.of<BackgroundListBloc>(context).add(
                          AddBackgroundList(value: BackgroundModel(
                              documentID: state.value.documentID, 
                              appId: state.value.appId, 
                              comments: state.value.comments, 
                              backgroundImage: state.value.backgroundImage, 
                              useProfilePhotoAsBackground: state.value.useProfilePhotoAsBackground, 
                              beginGradientPosition: state.value.beginGradientPosition, 
                              endGradientPosition: state.value.endGradientPosition, 
                              shadow: state.value.shadow, 
                              decorationColors: state.value.decorationColors, 
                              border: state.value.border, 
                              admin: state.value.admin, 
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
              children: children
            ),
          )
        );
      } else {
        return DelayedCircularProgressIndicator();
      }
    });
  }

  void _onDocumentIDChanged() {
    _myFormBloc.add(ChangedBackgroundDocumentID(value: _documentIDController.text));
  }


  void _onAppIdChanged() {
    _myFormBloc.add(ChangedBackgroundAppId(value: _appIdController.text));
  }


  void _onCommentsChanged() {
    _myFormBloc.add(ChangedBackgroundComments(value: _commentsController.text));
  }


  void _onBackgroundImageSelected(String val) {
    setState(() {
      _backgroundImage = val;
    });
    _myFormBloc.add(ChangedBackgroundBackgroundImage(value: val));
  }


  void setSelectionUseProfilePhotoAsBackground(bool val) {
    setState(() {
      _useProfilePhotoAsBackgroundSelection = val;
    });
    _myFormBloc.add(ChangedBackgroundUseProfilePhotoAsBackground(value: val));
  }

  void setSelectionBeginGradientPosition(int val) {
    setState(() {
      _beginGradientPositionSelectedRadioTile = val;
    });
    _myFormBloc.add(ChangedBackgroundBeginGradientPosition(value: toStartGradientPosition(val)));
  }


  void setSelectionEndGradientPosition(int val) {
    setState(() {
      _endGradientPositionSelectedRadioTile = val;
    });
    _myFormBloc.add(ChangedBackgroundEndGradientPosition(value: toEndGradientPosition(val)));
  }


  void _onShadowSelected(String val) {
    setState(() {
      _shadow = val;
    });
    _myFormBloc.add(ChangedBackgroundShadow(value: val));
  }


  void _onDecorationColorsChanged(value) {
    _myFormBloc.add(ChangedBackgroundDecorationColors(value: value));
    setState(() {});
  }


  void setSelectionBorder(bool val) {
    setState(() {
      _borderSelection = val;
    });
    _myFormBloc.add(ChangedBackgroundBorder(value: val));
  }

  void setSelectionAdmin(bool val) {
    setState(() {
      _adminSelection = val;
    });
    _myFormBloc.add(ChangedBackgroundAdmin(value: val));
  }


  @override
  void dispose() {
    _documentIDController.dispose();
    _appIdController.dispose();
    _commentsController.dispose();
    super.dispose();
  }

  bool _readOnly(AccessState accessState, BackgroundFormInitialized state) {
    return (formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData) || (!accessState.memberIsOwner());
  }
  

}



