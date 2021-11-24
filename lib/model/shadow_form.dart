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

import 'package:eliud_core/model/shadow_list_bloc.dart';
import 'package:eliud_core/model/shadow_list_event.dart';
import 'package:eliud_core/model/shadow_model.dart';
import 'package:eliud_core/model/shadow_form_bloc.dart';
import 'package:eliud_core/model/shadow_form_event.dart';
import 'package:eliud_core/model/shadow_form_state.dart';


class ShadowForm extends StatelessWidget {
  FormAction formAction;
  ShadowModel? value;
  ActionModel? submitAction;

  ShadowForm({Key? key, required this.formAction, required this.value, this.submitAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    var app = AccessBloc.currentApp(context);
    if (app == null) return Text("No app available");
    var appId = app.documentID!;
    if (formAction == FormAction.ShowData) {
      return BlocProvider<ShadowFormBloc >(
            create: (context) => ShadowFormBloc(AccessBloc.currentAppId(context),
                                       formAction: formAction,

                                                )..add(InitialiseShadowFormEvent(value: value)),
  
        child: MyShadowForm(submitAction: submitAction, formAction: formAction),
          );
    } if (formAction == FormAction.ShowPreloadedData) {
      return BlocProvider<ShadowFormBloc >(
            create: (context) => ShadowFormBloc(AccessBloc.currentAppId(context),
                                       formAction: formAction,

                                                )..add(InitialiseShadowFormNoLoadEvent(value: value)),
  
        child: MyShadowForm(submitAction: submitAction, formAction: formAction),
          );
    } else {
      return Scaffold(
        appBar: StyleRegistry.registry().styleWithContext(context).adminFormStyle().appBarWithString(context, title: formAction == FormAction.UpdateAction ? 'Update Shadow' : 'Add Shadow'),
        body: BlocProvider<ShadowFormBloc >(
            create: (context) => ShadowFormBloc(AccessBloc.currentAppId(context),
                                       formAction: formAction,

                                                )..add((formAction == FormAction.UpdateAction ? InitialiseShadowFormEvent(value: value) : InitialiseNewShadowFormEvent())),
  
        child: MyShadowForm(submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}


class MyShadowForm extends StatefulWidget {
  final FormAction? formAction;
  final ActionModel? submitAction;

  MyShadowForm({this.formAction, this.submitAction});

  _MyShadowFormState createState() => _MyShadowFormState(this.formAction);
}


class _MyShadowFormState extends State<MyShadowForm> {
  final FormAction? formAction;
  late ShadowFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
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
    _commentsController.addListener(_onCommentsChanged);
    _offsetDXController.addListener(_onOffsetDXChanged);
    _offsetDYController.addListener(_onOffsetDYChanged);
    _spreadRadiusController.addListener(_onSpreadRadiusChanged);
    _blurRadiusController.addListener(_onBlurRadiusChanged);
  }

  @override
  Widget build(BuildContext context) {
    var app = AccessBloc.currentApp(context);
    if (app == null) return Text('No app available');
    var appId = app.documentID!;
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<ShadowFormBloc, ShadowFormState>(builder: (context, state) {
      if (state is ShadowFormUninitialized) return Center(
        child: StyleRegistry.registry().styleWithContext(context).adminListStyle().progressIndicator(context),
      );

      if (state is ShadowFormLoaded) {
        if (state.value!.documentID != null)
          _documentIDController.text = state.value!.documentID.toString();
        else
          _documentIDController.text = "";
        if (state.value!.comments != null)
          _commentsController.text = state.value!.comments.toString();
        else
          _commentsController.text = "";
        if (state.value!.offsetDX != null)
          _offsetDXController.text = state.value!.offsetDX.toString();
        else
          _offsetDXController.text = "";
        if (state.value!.offsetDY != null)
          _offsetDYController.text = state.value!.offsetDY.toString();
        else
          _offsetDYController.text = "";
        if (state.value!.spreadRadius != null)
          _spreadRadiusController.text = state.value!.spreadRadius.toString();
        else
          _spreadRadiusController.text = "";
        if (state.value!.blurRadius != null)
          _blurRadiusController.text = state.value!.blurRadius.toString();
        else
          _blurRadiusController.text = "";
      }
      if (state is ShadowFormInitialized) {
        List<Widget> children = [];
         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'General')
                ));

        children.add(

                RgbField("Color", state.value!.color, _onColorChanged)
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'General')
                ));

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'Document ID', icon: Icons.vpn_key, readOnly: (formAction == FormAction.UpdateAction), textEditingController: _documentIDController, keyboardType: TextInputType.text, validator: (_) => state is DocumentIDShadowFormError ? state.message : null, hintText: null)
          );

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'Comments', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _commentsController, keyboardType: TextInputType.text, validator: (_) => state is CommentsShadowFormError ? state.message : null, hintText: null)
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Offset')
                ));

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'DX', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _offsetDXController, keyboardType: TextInputType.number, validator: (_) => state is OffsetDXShadowFormError ? state.message : null, hintText: 'field.remark')
          );

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'DY', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _offsetDYController, keyboardType: TextInputType.number, validator: (_) => state is OffsetDYShadowFormError ? state.message : null, hintText: 'field.remark')
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Other parameters')
                ));

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'Spread Radius', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _spreadRadiusController, keyboardType: TextInputType.number, validator: (_) => state is SpreadRadiusShadowFormError ? state.message : null, hintText: 'field.remark')
          );

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'Blur Radius', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _blurRadiusController, keyboardType: TextInputType.number, validator: (_) => state is BlurRadiusShadowFormError ? state.message : null, hintText: 'field.remark')
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


        if ((formAction != FormAction.ShowData) && (formAction != FormAction.ShowPreloadedData))
          children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().button(context, label: 'Submit',
                  onPressed: _readOnly(accessState, state) ? null : () {
                    if (state is ShadowFormError) {
                      return null;
                    } else {
                      if (formAction == FormAction.UpdateAction) {
                        BlocProvider.of<ShadowListBloc>(context).add(
                          UpdateShadowList(value: state.value!.copyWith(
                              documentID: state.value!.documentID, 
                              comments: state.value!.comments, 
                              color: state.value!.color, 
                              offsetDX: state.value!.offsetDX, 
                              offsetDY: state.value!.offsetDY, 
                              spreadRadius: state.value!.spreadRadius, 
                              blurRadius: state.value!.blurRadius, 
                        )));
                      } else {
                        BlocProvider.of<ShadowListBloc>(context).add(
                          AddShadowList(value: ShadowModel(
                              documentID: state.value!.documentID, 
                              comments: state.value!.comments, 
                              color: state.value!.color, 
                              offsetDX: state.value!.offsetDX, 
                              offsetDY: state.value!.offsetDY, 
                              spreadRadius: state.value!.spreadRadius, 
                              blurRadius: state.value!.blurRadius, 
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
    _myFormBloc.add(ChangedShadowDocumentID(value: _documentIDController.text));
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
    _commentsController.dispose();
    _offsetDXController.dispose();
    _offsetDYController.dispose();
    _spreadRadiusController.dispose();
    _blurRadiusController.dispose();
    super.dispose();
  }

  bool _readOnly(AccessState accessState, ShadowFormInitialized state) {
    return (formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData) || (!accessState.memberIsOwner(AccessBloc.currentAppId(context)));
  }
  

}



