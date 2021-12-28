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

import 'package:eliud_core/model/app_model.dart';
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

import 'package:eliud_core/model/background_list_bloc.dart';
import 'package:eliud_core/model/background_list_event.dart';
import 'package:eliud_core/model/background_model.dart';
import 'package:eliud_core/model/background_form_bloc.dart';
import 'package:eliud_core/model/background_form_event.dart';
import 'package:eliud_core/model/background_form_state.dart';


class BackgroundForm extends StatelessWidget {
  final AppModel app;
  FormAction formAction;
  BackgroundModel? value;
  ActionModel? submitAction;

  BackgroundForm({Key? key, required this.app, required this.formAction, required this.value, this.submitAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    var appId = app.documentID!;
    if (formAction == FormAction.ShowData) {
      return BlocProvider<BackgroundFormBloc >(
            create: (context) => BackgroundFormBloc(appId,
                                       formAction: formAction,

                                                )..add(InitialiseBackgroundFormEvent(value: value)),
  
        child: MyBackgroundForm(app:app, submitAction: submitAction, formAction: formAction),
          );
    } if (formAction == FormAction.ShowPreloadedData) {
      return BlocProvider<BackgroundFormBloc >(
            create: (context) => BackgroundFormBloc(appId,
                                       formAction: formAction,

                                                )..add(InitialiseBackgroundFormNoLoadEvent(value: value)),
  
        child: MyBackgroundForm(app:app, submitAction: submitAction, formAction: formAction),
          );
    } else {
      return Scaffold(
        appBar: StyleRegistry.registry().styleWithApp(app).adminFormStyle().appBarWithString(app, context, title: formAction == FormAction.UpdateAction ? 'Update Background' : 'Add Background'),
        body: BlocProvider<BackgroundFormBloc >(
            create: (context) => BackgroundFormBloc(appId,
                                       formAction: formAction,

                                                )..add((formAction == FormAction.UpdateAction ? InitialiseBackgroundFormEvent(value: value) : InitialiseNewBackgroundFormEvent())),
  
        child: MyBackgroundForm(app: app, submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}


class MyBackgroundForm extends StatefulWidget {
  final AppModel app;
  final FormAction? formAction;
  final ActionModel? submitAction;

  MyBackgroundForm({required this.app, this.formAction, this.submitAction});

  _MyBackgroundFormState createState() => _MyBackgroundFormState(this.formAction);
}


class _MyBackgroundFormState extends State<MyBackgroundForm> {
  final FormAction? formAction;
  late BackgroundFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  final TextEditingController _appIdController = TextEditingController();
  final TextEditingController _commentsController = TextEditingController();
  String? _backgroundImage;
  bool? _useProfilePhotoAsBackgroundSelection;
  int? _beginGradientPositionSelectedRadioTile;
  int? _endGradientPositionSelectedRadioTile;
  String? _shadow;
  bool? _borderSelection;


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
  }

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<BackgroundFormBloc, BackgroundFormState>(builder: (context, state) {
      if (state is BackgroundFormUninitialized) return Center(
        child: StyleRegistry.registry().styleWithApp(widget.app).adminListStyle().progressIndicator(widget.app, context),
      );

      if (state is BackgroundFormLoaded) {
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
        if (state.value!.backgroundImage != null)
          _backgroundImage= state.value!.backgroundImage!.documentID;
        else
          _backgroundImage= "";
        if (state.value!.useProfilePhotoAsBackground != null)
        _useProfilePhotoAsBackgroundSelection = state.value!.useProfilePhotoAsBackground;
        else
        _useProfilePhotoAsBackgroundSelection = false;
        if (state.value!.beginGradientPosition != null)
          _beginGradientPositionSelectedRadioTile = state.value!.beginGradientPosition!.index;
        else
          _beginGradientPositionSelectedRadioTile = 0;
        if (state.value!.endGradientPosition != null)
          _endGradientPositionSelectedRadioTile = state.value!.endGradientPosition!.index;
        else
          _endGradientPositionSelectedRadioTile = 0;
        if (state.value!.shadow != null)
          _shadow= state.value!.shadow!.documentID;
        else
          _shadow= "";
        if (state.value!.border != null)
        _borderSelection = state.value!.border;
        else
        _borderSelection = false;
      }
      if (state is BackgroundFormInitialized) {
        List<Widget> children = [];
         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'General')
                ));

        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().checkboxListTile(widget.app, context, 'Use Profile Photo As Background', _useProfilePhotoAsBackgroundSelection, _readOnly(accessState, state) ? null : (dynamic val) => setSelectionUseProfilePhotoAsBackground(val))
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'General')
                ));

        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().textFormField(widget.app, context, labelText: 'Document ID', icon: Icons.vpn_key, readOnly: (formAction == FormAction.UpdateAction), textEditingController: _documentIDController, keyboardType: TextInputType.text, validator: (_) => state is DocumentIDBackgroundFormError ? state.message : null, hintText: null)
          );

        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().textFormField(widget.app, context, labelText: 'Comments', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _commentsController, keyboardType: TextInputType.text, validator: (_) => state is CommentsBackgroundFormError ? state.message : null, hintText: null)
          );

        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().checkboxListTile(widget.app, context, 'border', _borderSelection, _readOnly(accessState, state) ? null : (dynamic val) => setSelectionBorder(val))
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'Colors')
                ));

        children.add(

                new Container(
                    height: (fullScreenHeight(context) / 2.5), 
                    child: decorationColorsList(widget.app, context, state.value!.decorationColors, _onDecorationColorsChanged)
                )
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'Background Image')
                ));

        children.add(

                DropdownButtonComponentFactory().createNew(app: widget.app, id: "publicMediums", value: _backgroundImage, trigger: _onBackgroundImageSelected, optional: true),
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'Start position of the gradient')
                ));

        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().radioListTile(widget.app, context, 0, _beginGradientPositionSelectedRadioTile, 'TopLeft', 'TopLeft', !accessState.memberIsOwner(widget.app.documentID!) ? null : (dynamic val) => setSelectionBeginGradientPosition(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().radioListTile(widget.app, context, 0, _beginGradientPositionSelectedRadioTile, 'TopCenter', 'TopCenter', !accessState.memberIsOwner(widget.app.documentID!) ? null : (dynamic val) => setSelectionBeginGradientPosition(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().radioListTile(widget.app, context, 0, _beginGradientPositionSelectedRadioTile, 'TopRight', 'TopRight', !accessState.memberIsOwner(widget.app.documentID!) ? null : (dynamic val) => setSelectionBeginGradientPosition(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().radioListTile(widget.app, context, 0, _beginGradientPositionSelectedRadioTile, 'CenterLeft', 'CenterLeft', !accessState.memberIsOwner(widget.app.documentID!) ? null : (dynamic val) => setSelectionBeginGradientPosition(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().radioListTile(widget.app, context, 0, _beginGradientPositionSelectedRadioTile, 'Center', 'Center', !accessState.memberIsOwner(widget.app.documentID!) ? null : (dynamic val) => setSelectionBeginGradientPosition(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().radioListTile(widget.app, context, 0, _beginGradientPositionSelectedRadioTile, 'CenterRight', 'CenterRight', !accessState.memberIsOwner(widget.app.documentID!) ? null : (dynamic val) => setSelectionBeginGradientPosition(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().radioListTile(widget.app, context, 0, _beginGradientPositionSelectedRadioTile, 'BottomLeft', 'BottomLeft', !accessState.memberIsOwner(widget.app.documentID!) ? null : (dynamic val) => setSelectionBeginGradientPosition(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().radioListTile(widget.app, context, 0, _beginGradientPositionSelectedRadioTile, 'BottomCenter', 'BottomCenter', !accessState.memberIsOwner(widget.app.documentID!) ? null : (dynamic val) => setSelectionBeginGradientPosition(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().radioListTile(widget.app, context, 0, _beginGradientPositionSelectedRadioTile, 'BottomRight', 'BottomRight', !accessState.memberIsOwner(widget.app.documentID!) ? null : (dynamic val) => setSelectionBeginGradientPosition(val))
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'End position of the gradient')
                ));

        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().radioListTile(widget.app, context, 0, _endGradientPositionSelectedRadioTile, 'TopLeft', 'TopLeft', !accessState.memberIsOwner(widget.app.documentID!) ? null : (dynamic val) => setSelectionEndGradientPosition(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().radioListTile(widget.app, context, 0, _endGradientPositionSelectedRadioTile, 'TopCenter', 'TopCenter', !accessState.memberIsOwner(widget.app.documentID!) ? null : (dynamic val) => setSelectionEndGradientPosition(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().radioListTile(widget.app, context, 0, _endGradientPositionSelectedRadioTile, 'TopRight', 'TopRight', !accessState.memberIsOwner(widget.app.documentID!) ? null : (dynamic val) => setSelectionEndGradientPosition(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().radioListTile(widget.app, context, 0, _endGradientPositionSelectedRadioTile, 'CenterLeft', 'CenterLeft', !accessState.memberIsOwner(widget.app.documentID!) ? null : (dynamic val) => setSelectionEndGradientPosition(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().radioListTile(widget.app, context, 0, _endGradientPositionSelectedRadioTile, 'Center', 'Center', !accessState.memberIsOwner(widget.app.documentID!) ? null : (dynamic val) => setSelectionEndGradientPosition(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().radioListTile(widget.app, context, 0, _endGradientPositionSelectedRadioTile, 'CenterRight', 'CenterRight', !accessState.memberIsOwner(widget.app.documentID!) ? null : (dynamic val) => setSelectionEndGradientPosition(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().radioListTile(widget.app, context, 0, _endGradientPositionSelectedRadioTile, 'BottomLeft', 'BottomLeft', !accessState.memberIsOwner(widget.app.documentID!) ? null : (dynamic val) => setSelectionEndGradientPosition(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().radioListTile(widget.app, context, 0, _endGradientPositionSelectedRadioTile, 'BottomCenter', 'BottomCenter', !accessState.memberIsOwner(widget.app.documentID!) ? null : (dynamic val) => setSelectionEndGradientPosition(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().radioListTile(widget.app, context, 0, _endGradientPositionSelectedRadioTile, 'BottomRight', 'BottomRight', !accessState.memberIsOwner(widget.app.documentID!) ? null : (dynamic val) => setSelectionEndGradientPosition(val))
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'Shadow')
                ));

        children.add(

                DropdownButtonComponentFactory().createNew(app: widget.app, id: "shadows", value: _shadow, trigger: _onShadowSelected, optional: true),
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


        if ((formAction != FormAction.ShowData) && (formAction != FormAction.ShowPreloadedData))
          children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().button(widget.app, context, label: 'Submit',
                  onPressed: _readOnly(accessState, state) ? null : () {
                    if (state is BackgroundFormError) {
                      return null;
                    } else {
                      if (formAction == FormAction.UpdateAction) {
                        BlocProvider.of<BackgroundListBloc>(context).add(
                          UpdateBackgroundList(value: state.value!.copyWith(
                              documentID: state.value!.documentID, 
                              appId: state.value!.appId, 
                              comments: state.value!.comments, 
                              backgroundImage: state.value!.backgroundImage, 
                              useProfilePhotoAsBackground: state.value!.useProfilePhotoAsBackground, 
                              beginGradientPosition: state.value!.beginGradientPosition, 
                              endGradientPosition: state.value!.endGradientPosition, 
                              shadow: state.value!.shadow, 
                              decorationColors: state.value!.decorationColors, 
                              border: state.value!.border, 
                        )));
                      } else {
                        BlocProvider.of<BackgroundListBloc>(context).add(
                          AddBackgroundList(value: BackgroundModel(
                              documentID: state.value!.documentID, 
                              appId: state.value!.appId, 
                              comments: state.value!.comments, 
                              backgroundImage: state.value!.backgroundImage, 
                              useProfilePhotoAsBackground: state.value!.useProfilePhotoAsBackground, 
                              beginGradientPosition: state.value!.beginGradientPosition, 
                              endGradientPosition: state.value!.endGradientPosition, 
                              shadow: state.value!.shadow, 
                              decorationColors: state.value!.decorationColors, 
                              border: state.value!.border, 
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

        return StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().container(widget.app, context, Form(
            child: ListView(
              padding: const EdgeInsets.all(8),
              physics: ((formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData)) ? NeverScrollableScrollPhysics() : null,
              shrinkWrap: ((formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData)),
              children: children as List<Widget>
            ),
          ), formAction!
        );
      } else {
        return StyleRegistry.registry().styleWithApp(widget.app).adminListStyle().progressIndicator(widget.app, context);
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


  void _onBackgroundImageSelected(String? val) {
    setState(() {
      _backgroundImage = val;
    });
    _myFormBloc.add(ChangedBackgroundBackgroundImage(value: val));
  }


  void setSelectionUseProfilePhotoAsBackground(bool? val) {
    setState(() {
      _useProfilePhotoAsBackgroundSelection = val;
    });
    _myFormBloc.add(ChangedBackgroundUseProfilePhotoAsBackground(value: val));
  }

  void setSelectionBeginGradientPosition(int? val) {
    setState(() {
      _beginGradientPositionSelectedRadioTile = val;
    });
    _myFormBloc.add(ChangedBackgroundBeginGradientPosition(value: toStartGradientPosition(val)));
  }


  void setSelectionEndGradientPosition(int? val) {
    setState(() {
      _endGradientPositionSelectedRadioTile = val;
    });
    _myFormBloc.add(ChangedBackgroundEndGradientPosition(value: toEndGradientPosition(val)));
  }


  void _onShadowSelected(String? val) {
    setState(() {
      _shadow = val;
    });
    _myFormBloc.add(ChangedBackgroundShadow(value: val));
  }


  void _onDecorationColorsChanged(value) {
    _myFormBloc.add(ChangedBackgroundDecorationColors(value: value));
    setState(() {});
  }


  void setSelectionBorder(bool? val) {
    setState(() {
      _borderSelection = val;
    });
    _myFormBloc.add(ChangedBackgroundBorder(value: val));
  }


  @override
  void dispose() {
    _documentIDController.dispose();
    _appIdController.dispose();
    _commentsController.dispose();
    super.dispose();
  }

  bool _readOnly(AccessState accessState, BackgroundFormInitialized state) {
    return (formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData) || (!accessState.memberIsOwner(widget.app.documentID!));
  }
  

}



