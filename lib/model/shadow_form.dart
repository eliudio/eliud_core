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
    var app = AccessBloc.app(context);
    if (app == null) return Text("No app available");
    if (formAction == FormAction.ShowData) {
      return BlocProvider<ShadowFormBloc >(
            create: (context) => ShadowFormBloc(AccessBloc.appId(context),
                                       formAction: formAction,

                                                )..add(InitialiseShadowFormEvent(value: value)),
  
        child: MyShadowForm(submitAction: submitAction, formAction: formAction),
          );
    } if (formAction == FormAction.ShowPreloadedData) {
      return BlocProvider<ShadowFormBloc >(
            create: (context) => ShadowFormBloc(AccessBloc.appId(context),
                                       formAction: formAction,

                                                )..add(InitialiseShadowFormNoLoadEvent(value: value)),
  
        child: MyShadowForm(submitAction: submitAction, formAction: formAction),
          );
    } else {
      return Scaffold(
        appBar: StyleRegistry.registry().styleWithContext(context).adminFormStyle().constructAppBar(context, formAction == FormAction.UpdateAction ? 'Update Shadow' : 'Add Shadow'),
        body: BlocProvider<ShadowFormBloc >(
            create: (context) => ShadowFormBloc(AccessBloc.appId(context),
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
    var app = AccessBloc.app(context);
    if (app == null) return Text('No app available');
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<ShadowFormBloc, ShadowFormState>(builder: (context, state) {
      if (state is ShadowFormUninitialized) return Center(
        child: DelayedCircularProgressIndicator(),
      );

      if (state is ShadowFormLoaded) {
        if (state.value!.documentID != null)
          _documentIDController.text = state.value!.documentID.toString();
        else
          _documentIDController.text = "";
        if (state.value!.appId != null)
          _appIdController.text = state.value!.appId.toString();
        else
          _appIdController.text = "";
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

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, 'Document ID', Icons.vpn_key, (formAction == FormAction.UpdateAction), _documentIDController, FieldType.String, validator: (_) => state is DocumentIDShadowFormError ? state.message : null, hintText: 'null')
          );

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, 'Comments', Icons.text_format, _readOnly(accessState, state), _commentsController, FieldType.String, validator: (_) => state is CommentsShadowFormError ? state.message : null, hintText: 'null')
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Offset')
                ));

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, 'DX', Icons.text_format, _readOnly(accessState, state), _offsetDXController, FieldType.Double, validator: (_) => state is OffsetDXShadowFormError ? state.message : null, hintText: 'The first argument sets [dx], the horizontal component of the offset')
          );

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, 'DY', Icons.text_format, _readOnly(accessState, state), _offsetDYController, FieldType.Double, validator: (_) => state is OffsetDYShadowFormError ? state.message : null, hintText: 'The second argument sets [dy], the vertical component of the offset')
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Other parameters')
                ));

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, 'Spread Radius', Icons.text_format, _readOnly(accessState, state), _spreadRadiusController, FieldType.Double, validator: (_) => state is SpreadRadiusShadowFormError ? state.message : null, hintText: 'The amount the box should be inflated prior to applying the blur.')
          );

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, 'Blur Radius', Icons.text_format, _readOnly(accessState, state), _blurRadiusController, FieldType.Double, validator: (_) => state is BlurRadiusShadowFormError ? state.message : null, hintText: 'The standard deviation of the Gaussian to convolve with the shadow's shape.')
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


        if ((formAction != FormAction.ShowData) && (formAction != FormAction.ShowPreloadedData))
          children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().submitButton(context, 'Submit',
                  onPressed: _readOnly(accessState, state) ? null : () {
                    if (state is ShadowFormError) {
                      return null;
                    } else {
                      if (formAction == FormAction.UpdateAction) {
                        BlocProvider.of<ShadowListBloc>(context).add(
                          UpdateShadowList(value: state.value!.copyWith(
                              documentID: state.value!.documentID, 
                              appId: state.value!.appId, 
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
                              appId: state.value!.appId, 
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
        return DelayedCircularProgressIndicator();
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

  bool _readOnly(AccessState accessState, ShadowFormInitialized state) {
    return (formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData) || (!accessState.memberIsOwner());
  }
  

}



