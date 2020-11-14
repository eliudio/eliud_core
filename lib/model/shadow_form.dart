/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 shadow_form.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/core/global_data.dart';
import 'package:eliud_core/core/app/app_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';
import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/app/app_state.dart';
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

import 'package:eliud_core/model/shadow_list_bloc.dart';
import 'package:eliud_core/model/shadow_list_event.dart';
import 'package:eliud_core/model/shadow_model.dart';
import 'package:eliud_core/model/shadow_form_bloc.dart';
import 'package:eliud_core/model/shadow_form_event.dart';
import 'package:eliud_core/model/shadow_form_state.dart';


class ShadowForm extends StatelessWidget {
  FormAction formAction;
  ShadowModel value;
  ActionModel submitAction;

  ShadowForm({Key key, @required this.formAction, @required this.value, this.submitAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var app = AppBloc.app(context);
    var accessState = AccessBloc.getState(context);
    var appState = AppBloc.getState(context);
    if (formAction == FormAction.ShowData) {
      return BlocProvider<ShadowFormBloc >(
            create: (context) => ShadowFormBloc(AppBloc.appId(context),
                                       formAction: formAction,

                                                )..add(InitialiseShadowFormEvent(value: value)),
  
        child: MyShadowForm(submitAction: submitAction, formAction: formAction),
          );
    } if (formAction == FormAction.ShowPreloadedData) {
      return BlocProvider<ShadowFormBloc >(
            create: (context) => ShadowFormBloc(AppBloc.appId(context),
                                       formAction: formAction,

                                                )..add(InitialiseShadowFormNoLoadEvent(value: value)),
  
        child: MyShadowForm(submitAction: submitAction, formAction: formAction),
          );
    } else {
      return Scaffold(
        appBar: formAction == FormAction.UpdateAction ?
                AppBar(
                    title: Text("Update Shadow", style: TextStyle(color: RgbHelper.color(rgbo: app.formAppBarTextColor))),
                    flexibleSpace: Container(
                        decoration: BoxDecorationHelper.boxDecoration(accessState, app.formAppBarBackground)),
                  ) :
                AppBar(
                    title: Text("Add Shadow", style: TextStyle(color: RgbHelper.color(rgbo: app.formAppBarTextColor))),
                    flexibleSpace: Container(
                        decoration: BoxDecorationHelper.boxDecoration(accessState, app.formAppBarBackground)),
                ),
        body: BlocProvider<ShadowFormBloc >(
            create: (context) => ShadowFormBloc(AppBloc.appId(context),
                                       formAction: formAction,

                                                )..add((formAction == FormAction.UpdateAction ? InitialiseShadowFormEvent(value: value) : InitialiseNewShadowFormEvent())),
  
        child: MyShadowForm(submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}


class MyShadowForm extends StatefulWidget {
  final FormAction formAction;
  final ActionModel submitAction;

  MyShadowForm({this.formAction, this.submitAction});

  _MyShadowFormState createState() => _MyShadowFormState(this.formAction);
}


class _MyShadowFormState extends State<MyShadowForm> {
  final FormAction formAction;
  ShadowFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  final TextEditingController _appIdController = TextEditingController();
  final TextEditingController _commentsController = TextEditingController();
  final TextEditingController _offsetDXController = TextEditingController();
  final TextEditingController _offsetDYController = TextEditingController();
  final TextEditingController _spreadRadiusController = TextEditingController();
  final TextEditingController _blurRadiusController = TextEditingController();


  _MyShadowFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<ShadowFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
    _appIdController.addListener(_onAppIdChanged);
    _commentsController.addListener(_onCommentsChanged);
    _offsetDXController.addListener(_onOffsetDXChanged);
    _offsetDYController.addListener(_onOffsetDYChanged);
    _spreadRadiusController.addListener(_onSpreadRadiusChanged);
    _blurRadiusController.addListener(_onBlurRadiusChanged);
  }

  @override
  Widget build(BuildContext context) {
    var app = AppBloc.app(context);
    var appState = AppBloc.getState(context);
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<ShadowFormBloc, ShadowFormState>(builder: (context, state) {
      if (state is ShadowFormUninitialized) return Center(
        child: CircularProgressIndicator(),
      );

      if (state is ShadowFormLoaded) {
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
        if (state.value.offsetDX != null)
          _offsetDXController.text = state.value.offsetDX.toString();
        else
          _offsetDXController.text = "";
        if (state.value.offsetDY != null)
          _offsetDYController.text = state.value.offsetDY.toString();
        else
          _offsetDYController.text = "";
        if (state.value.spreadRadius != null)
          _spreadRadiusController.text = state.value.spreadRadius.toString();
        else
          _spreadRadiusController.text = "";
        if (state.value.blurRadius != null)
          _blurRadiusController.text = state.value.blurRadius.toString();
        else
          _blurRadiusController.text = "";
      }
      if (state is ShadowFormInitialized) {
        List<Widget> children = List();
         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('General',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: app.formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                RgbField("Color", state.value.color, _onColorChanged)
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
                    return state is DocumentIDShadowFormError ? state.message : null;
                  },
                ),
          );

        children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor)),
                  readOnly: _readOnly(accessState, appState, state),
                  controller: _commentsController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldFocusColor))),                    icon: Icon(Icons.text_format, color: RgbHelper.color(rgbo: app.formFieldHeaderColor)),
                    labelText: 'Comments',
                  ),
                  keyboardType: TextInputType.text,
                  autovalidate: true,
                  validator: (_) {
                    return state is CommentsShadowFormError ? state.message : null;
                  },
                ),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: app.dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Offset',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: app.formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor)),
                  readOnly: _readOnly(accessState, appState, state),
                  controller: _offsetDXController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldFocusColor))),                    icon: Icon(Icons.text_format, color: RgbHelper.color(rgbo: app.formFieldHeaderColor)),
                    labelText: 'DX',
                    hintText: "The first argument sets [dx], the horizontal component of the offset",
                  ),
                  keyboardType: TextInputType.number,
                  autovalidate: true,
                  validator: (_) {
                    return state is OffsetDXShadowFormError ? state.message : null;
                  },
                ),
          );

        children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor)),
                  readOnly: _readOnly(accessState, appState, state),
                  controller: _offsetDYController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldFocusColor))),                    icon: Icon(Icons.text_format, color: RgbHelper.color(rgbo: app.formFieldHeaderColor)),
                    labelText: 'DY',
                    hintText: "The second argument sets [dy], the vertical component of the offset",
                  ),
                  keyboardType: TextInputType.number,
                  autovalidate: true,
                  validator: (_) {
                    return state is OffsetDYShadowFormError ? state.message : null;
                  },
                ),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: app.dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Other parameters',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: app.formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor)),
                  readOnly: _readOnly(accessState, appState, state),
                  controller: _spreadRadiusController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldFocusColor))),                    icon: Icon(Icons.text_format, color: RgbHelper.color(rgbo: app.formFieldHeaderColor)),
                    labelText: 'Spread Radius',
                    hintText: "The amount the box should be inflated prior to applying the blur.",
                  ),
                  keyboardType: TextInputType.number,
                  autovalidate: true,
                  validator: (_) {
                    return state is SpreadRadiusShadowFormError ? state.message : null;
                  },
                ),
          );

        children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor)),
                  readOnly: _readOnly(accessState, appState, state),
                  controller: _blurRadiusController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldFocusColor))),                    icon: Icon(Icons.text_format, color: RgbHelper.color(rgbo: app.formFieldHeaderColor)),
                    labelText: 'Blur Radius',
                    hintText: "The standard deviation of the Gaussian to convolve with the shadow's shape.",
                  ),
                  keyboardType: TextInputType.number,
                  autovalidate: true,
                  validator: (_) {
                    return state is BlurRadiusShadowFormError ? state.message : null;
                  },
                ),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: app.dividerColor)));


        if ((formAction != FormAction.ShowData) && (formAction != FormAction.ShowPreloadedData))
          children.add(RaisedButton(
                  color: RgbHelper.color(rgbo: app.formSubmitButtonColor),
                  onPressed: _readOnly(accessState, appState, state) ? null : () {
                    if (state is ShadowFormError) {
                      return null;
                    } else {
                      if (formAction == FormAction.UpdateAction) {
                        BlocProvider.of<ShadowListBloc>(context).add(
                          UpdateShadowList(value: state.value.copyWith(
                              documentID: state.value.documentID, 
                              appId: state.value.appId, 
                              comments: state.value.comments, 
                              color: state.value.color, 
                              offsetDX: state.value.offsetDX, 
                              offsetDY: state.value.offsetDY, 
                              spreadRadius: state.value.spreadRadius, 
                              blurRadius: state.value.blurRadius, 
                        )));
                      } else {
                        BlocProvider.of<ShadowListBloc>(context).add(
                          AddShadowList(value: ShadowModel(
                              documentID: state.value.documentID, 
                              appId: state.value.appId, 
                              comments: state.value.comments, 
                              color: state.value.color, 
                              offsetDX: state.value.offsetDX, 
                              offsetDY: state.value.offsetDY, 
                              spreadRadius: state.value.spreadRadius, 
                              blurRadius: state.value.blurRadius, 
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
        return CircularProgressIndicator();
      }
    });
  }

  void _onDocumentIDChanged() {
    _myFormBloc.add(ChangedShadowDocumentID(value: _documentIDController.text));
  }


  void _onAppIdChanged() {
    _myFormBloc.add(ChangedShadowAppId(value: _appIdController.text));
  }


  void _onCommentsChanged() {
    _myFormBloc.add(ChangedShadowComments(value: _commentsController.text));
  }


  void _onColorChanged(value) {
    _myFormBloc.add(ChangedShadowColor(value: value));
    
  }


  void _onOffsetDXChanged() {
    _myFormBloc.add(ChangedShadowOffsetDX(value: _offsetDXController.text));
  }


  void _onOffsetDYChanged() {
    _myFormBloc.add(ChangedShadowOffsetDY(value: _offsetDYController.text));
  }


  void _onSpreadRadiusChanged() {
    _myFormBloc.add(ChangedShadowSpreadRadius(value: _spreadRadiusController.text));
  }


  void _onBlurRadiusChanged() {
    _myFormBloc.add(ChangedShadowBlurRadius(value: _blurRadiusController.text));
  }



  @override
  void dispose() {
    _documentIDController.dispose();
    _appIdController.dispose();
    _commentsController.dispose();
    _offsetDXController.dispose();
    _offsetDYController.dispose();
    _spreadRadiusController.dispose();
    _blurRadiusController.dispose();
    super.dispose();
  }

  bool _readOnly(AccessState accessState, AppState appState, ShadowFormInitialized state) {
    return (formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData) || (!accessState.memberIsOwner(appState));
  }
  

}



