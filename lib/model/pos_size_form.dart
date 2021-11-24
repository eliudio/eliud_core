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

import 'package:eliud_core/model/pos_size_list_bloc.dart';
import 'package:eliud_core/model/pos_size_list_event.dart';
import 'package:eliud_core/model/pos_size_model.dart';
import 'package:eliud_core/model/pos_size_form_bloc.dart';
import 'package:eliud_core/model/pos_size_form_event.dart';
import 'package:eliud_core/model/pos_size_form_state.dart';


class PosSizeForm extends StatelessWidget {
  FormAction formAction;
  PosSizeModel? value;
  ActionModel? submitAction;

  PosSizeForm({Key? key, required this.formAction, required this.value, this.submitAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    var app = AccessBloc.currentApp(context);
    if (app == null) return Text("No app available");
    var appId = app.documentID!;
    if (formAction == FormAction.ShowData) {
      return BlocProvider<PosSizeFormBloc >(
            create: (context) => PosSizeFormBloc(AccessBloc.currentAppId(context),
                                       formAction: formAction,

                                                )..add(InitialisePosSizeFormEvent(value: value)),
  
        child: MyPosSizeForm(submitAction: submitAction, formAction: formAction),
          );
    } if (formAction == FormAction.ShowPreloadedData) {
      return BlocProvider<PosSizeFormBloc >(
            create: (context) => PosSizeFormBloc(AccessBloc.currentAppId(context),
                                       formAction: formAction,

                                                )..add(InitialisePosSizeFormNoLoadEvent(value: value)),
  
        child: MyPosSizeForm(submitAction: submitAction, formAction: formAction),
          );
    } else {
      return Scaffold(
        appBar: StyleRegistry.registry().styleWithContext(context).adminFormStyle().appBarWithString(context, title: formAction == FormAction.UpdateAction ? 'Update PosSize' : 'Add PosSize'),
        body: BlocProvider<PosSizeFormBloc >(
            create: (context) => PosSizeFormBloc(AccessBloc.currentAppId(context),
                                       formAction: formAction,

                                                )..add((formAction == FormAction.UpdateAction ? InitialisePosSizeFormEvent(value: value) : InitialiseNewPosSizeFormEvent())),
  
        child: MyPosSizeForm(submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}


class MyPosSizeForm extends StatefulWidget {
  final FormAction? formAction;
  final ActionModel? submitAction;

  MyPosSizeForm({this.formAction, this.submitAction});

  _MyPosSizeFormState createState() => _MyPosSizeFormState(this.formAction);
}


class _MyPosSizeFormState extends State<MyPosSizeForm> {
  final FormAction? formAction;
  late PosSizeFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  final TextEditingController _appIdController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _widthPortraitController = TextEditingController();
  int? _widthTypePortraitSelectedRadioTile;
  final TextEditingController _widthLandscapeController = TextEditingController();
  int? _widthTypeLandscapeSelectedRadioTile;
  final TextEditingController _heightPortraitController = TextEditingController();
  int? _heightTypePortraitSelectedRadioTile;
  final TextEditingController _heightLandscapeController = TextEditingController();
  int? _heightTypeLandscapeSelectedRadioTile;
  int? _fitPortraitSelectedRadioTile;
  int? _fitLandscapeSelectedRadioTile;
  int? _alignTypePortraitSelectedRadioTile;
  int? _alignTypeLandscapeSelectedRadioTile;
  int? _clipSelectedRadioTile;


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
    var app = AccessBloc.currentApp(context);
    if (app == null) return Text('No app available');
    var appId = app.documentID!;
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<PosSizeFormBloc, PosSizeFormState>(builder: (context, state) {
      if (state is PosSizeFormUninitialized) return Center(
        child: StyleRegistry.registry().styleWithContext(context).adminListStyle().progressIndicator(context),
      );

      if (state is PosSizeFormLoaded) {
        if (state.value!.documentID != null)
          _documentIDController.text = state.value!.documentID.toString();
        else
          _documentIDController.text = "";
        if (state.value!.appId != null)
          _appIdController.text = state.value!.appId.toString();
        else
          _appIdController.text = "";
        if (state.value!.name != null)
          _nameController.text = state.value!.name.toString();
        else
          _nameController.text = "";
        if (state.value!.widthPortrait != null)
          _widthPortraitController.text = state.value!.widthPortrait.toString();
        else
          _widthPortraitController.text = "";
        if (state.value!.widthTypePortrait != null)
          _widthTypePortraitSelectedRadioTile = state.value!.widthTypePortrait!.index;
        else
          _widthTypePortraitSelectedRadioTile = 0;
        if (state.value!.widthLandscape != null)
          _widthLandscapeController.text = state.value!.widthLandscape.toString();
        else
          _widthLandscapeController.text = "";
        if (state.value!.widthTypeLandscape != null)
          _widthTypeLandscapeSelectedRadioTile = state.value!.widthTypeLandscape!.index;
        else
          _widthTypeLandscapeSelectedRadioTile = 0;
        if (state.value!.heightPortrait != null)
          _heightPortraitController.text = state.value!.heightPortrait.toString();
        else
          _heightPortraitController.text = "";
        if (state.value!.heightTypePortrait != null)
          _heightTypePortraitSelectedRadioTile = state.value!.heightTypePortrait!.index;
        else
          _heightTypePortraitSelectedRadioTile = 0;
        if (state.value!.heightLandscape != null)
          _heightLandscapeController.text = state.value!.heightLandscape.toString();
        else
          _heightLandscapeController.text = "";
        if (state.value!.heightTypeLandscape != null)
          _heightTypeLandscapeSelectedRadioTile = state.value!.heightTypeLandscape!.index;
        else
          _heightTypeLandscapeSelectedRadioTile = 0;
        if (state.value!.fitPortrait != null)
          _fitPortraitSelectedRadioTile = state.value!.fitPortrait!.index;
        else
          _fitPortraitSelectedRadioTile = 0;
        if (state.value!.fitLandscape != null)
          _fitLandscapeSelectedRadioTile = state.value!.fitLandscape!.index;
        else
          _fitLandscapeSelectedRadioTile = 0;
        if (state.value!.alignTypePortrait != null)
          _alignTypePortraitSelectedRadioTile = state.value!.alignTypePortrait!.index;
        else
          _alignTypePortraitSelectedRadioTile = 0;
        if (state.value!.alignTypeLandscape != null)
          _alignTypeLandscapeSelectedRadioTile = state.value!.alignTypeLandscape!.index;
        else
          _alignTypeLandscapeSelectedRadioTile = 0;
        if (state.value!.clip != null)
          _clipSelectedRadioTile = state.value!.clip!.index;
        else
          _clipSelectedRadioTile = 0;
      }
      if (state is PosSizeFormInitialized) {
        List<Widget> children = [];
         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'General')
                ));

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'Document ID', icon: Icons.vpn_key, readOnly: (formAction == FormAction.UpdateAction), textEditingController: _documentIDController, keyboardType: TextInputType.text, validator: (_) => state is DocumentIDPosSizeFormError ? state.message : null, hintText: null)
          );

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'Name', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _nameController, keyboardType: TextInputType.text, validator: (_) => state is NamePosSizeFormError ? state.message : null, hintText: null)
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Clip')
                ));

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _clipSelectedRadioTile, 'NoClip', 'NoClip', !accessState.memberIsOwner(AccessBloc.currentAppId(context)) ? null : (dynamic val) => setSelectionClip(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _clipSelectedRadioTile, 'ClipOval', 'ClipOval', !accessState.memberIsOwner(AccessBloc.currentAppId(context)) ? null : (dynamic val) => setSelectionClip(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _clipSelectedRadioTile, 'ClipRRect5', 'ClipRRect5', !accessState.memberIsOwner(AccessBloc.currentAppId(context)) ? null : (dynamic val) => setSelectionClip(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _clipSelectedRadioTile, 'ClipRRect10', 'ClipRRect10', !accessState.memberIsOwner(AccessBloc.currentAppId(context)) ? null : (dynamic val) => setSelectionClip(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _clipSelectedRadioTile, 'ClipRRect15', 'ClipRRect15', !accessState.memberIsOwner(AccessBloc.currentAppId(context)) ? null : (dynamic val) => setSelectionClip(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _clipSelectedRadioTile, 'ClipRRect20', 'ClipRRect20', !accessState.memberIsOwner(AccessBloc.currentAppId(context)) ? null : (dynamic val) => setSelectionClip(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _clipSelectedRadioTile, 'ClipRRect30', 'ClipRRect30', !accessState.memberIsOwner(AccessBloc.currentAppId(context)) ? null : (dynamic val) => setSelectionClip(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _clipSelectedRadioTile, 'ClipRRect40', 'ClipRRect40', !accessState.memberIsOwner(AccessBloc.currentAppId(context)) ? null : (dynamic val) => setSelectionClip(val))
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Width and Height')
                ));


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Width when Landscape')
                ));

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'widthLandscape', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _widthLandscapeController, keyboardType: TextInputType.number, validator: (_) => state is WidthLandscapePosSizeFormError ? state.message : null, hintText: null)
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Width when Portrait')
                ));

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'widthPortrait', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _widthPortraitController, keyboardType: TextInputType.number, validator: (_) => state is WidthPortraitPosSizeFormError ? state.message : null, hintText: null)
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Width type when Landscape')
                ));

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _widthTypeLandscapeSelectedRadioTile, 'AbsoluteWidth', 'AbsoluteWidth', !accessState.memberIsOwner(AccessBloc.currentAppId(context)) ? null : (dynamic val) => setSelectionWidthTypeLandscape(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _widthTypeLandscapeSelectedRadioTile, 'PercentageWidth', 'PercentageWidth', !accessState.memberIsOwner(AccessBloc.currentAppId(context)) ? null : (dynamic val) => setSelectionWidthTypeLandscape(val))
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Width type when Portrait')
                ));

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _widthTypePortraitSelectedRadioTile, 'AbsoluteWidth', 'AbsoluteWidth', !accessState.memberIsOwner(AccessBloc.currentAppId(context)) ? null : (dynamic val) => setSelectionWidthTypePortrait(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _widthTypePortraitSelectedRadioTile, 'PercentageWidth', 'PercentageWidth', !accessState.memberIsOwner(AccessBloc.currentAppId(context)) ? null : (dynamic val) => setSelectionWidthTypePortrait(val))
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Height when Landscape')
                ));

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'heightLandscape', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _heightLandscapeController, keyboardType: TextInputType.number, validator: (_) => state is HeightLandscapePosSizeFormError ? state.message : null, hintText: null)
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Height when Portrait')
                ));

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'heightPortrait', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _heightPortraitController, keyboardType: TextInputType.number, validator: (_) => state is HeightPortraitPosSizeFormError ? state.message : null, hintText: null)
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Height type when Landscape')
                ));

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _heightTypeLandscapeSelectedRadioTile, 'AbsoluteHeight', 'AbsoluteHeight', !accessState.memberIsOwner(AccessBloc.currentAppId(context)) ? null : (dynamic val) => setSelectionHeightTypeLandscape(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _heightTypeLandscapeSelectedRadioTile, 'PercentageHeight', 'PercentageHeight', !accessState.memberIsOwner(AccessBloc.currentAppId(context)) ? null : (dynamic val) => setSelectionHeightTypeLandscape(val))
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Height type when Portrait')
                ));

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _heightTypePortraitSelectedRadioTile, 'AbsoluteHeight', 'AbsoluteHeight', !accessState.memberIsOwner(AccessBloc.currentAppId(context)) ? null : (dynamic val) => setSelectionHeightTypePortrait(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _heightTypePortraitSelectedRadioTile, 'PercentageHeight', 'PercentageHeight', !accessState.memberIsOwner(AccessBloc.currentAppId(context)) ? null : (dynamic val) => setSelectionHeightTypePortrait(val))
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Box Fit when Landscape')
                ));

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _fitLandscapeSelectedRadioTile, 'LandscapeFitWidth', 'LandscapeFitWidth', !accessState.memberIsOwner(AccessBloc.currentAppId(context)) ? null : (dynamic val) => setSelectionFitLandscape(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _fitLandscapeSelectedRadioTile, 'LandscapeFitHeight', 'LandscapeFitHeight', !accessState.memberIsOwner(AccessBloc.currentAppId(context)) ? null : (dynamic val) => setSelectionFitLandscape(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _fitLandscapeSelectedRadioTile, 'LandscapeFill', 'LandscapeFill', !accessState.memberIsOwner(AccessBloc.currentAppId(context)) ? null : (dynamic val) => setSelectionFitLandscape(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _fitLandscapeSelectedRadioTile, 'LandscapeNone', 'LandscapeNone', !accessState.memberIsOwner(AccessBloc.currentAppId(context)) ? null : (dynamic val) => setSelectionFitLandscape(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _fitLandscapeSelectedRadioTile, 'LandscapeContain', 'LandscapeContain', !accessState.memberIsOwner(AccessBloc.currentAppId(context)) ? null : (dynamic val) => setSelectionFitLandscape(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _fitLandscapeSelectedRadioTile, 'LandscapeCover', 'LandscapeCover', !accessState.memberIsOwner(AccessBloc.currentAppId(context)) ? null : (dynamic val) => setSelectionFitLandscape(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _fitLandscapeSelectedRadioTile, 'LandscapeScaleDown', 'LandscapeScaleDown', !accessState.memberIsOwner(AccessBloc.currentAppId(context)) ? null : (dynamic val) => setSelectionFitLandscape(val))
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Box Fit when Portrait')
                ));

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _fitPortraitSelectedRadioTile, 'PortraitFitWidth', 'PortraitFitWidth', !accessState.memberIsOwner(AccessBloc.currentAppId(context)) ? null : (dynamic val) => setSelectionFitPortrait(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _fitPortraitSelectedRadioTile, 'PortraitFitHeight', 'PortraitFitHeight', !accessState.memberIsOwner(AccessBloc.currentAppId(context)) ? null : (dynamic val) => setSelectionFitPortrait(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _fitPortraitSelectedRadioTile, 'PortraitFill', 'PortraitFill', !accessState.memberIsOwner(AccessBloc.currentAppId(context)) ? null : (dynamic val) => setSelectionFitPortrait(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _fitPortraitSelectedRadioTile, 'PortraitNone', 'PortraitNone', !accessState.memberIsOwner(AccessBloc.currentAppId(context)) ? null : (dynamic val) => setSelectionFitPortrait(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _fitPortraitSelectedRadioTile, 'PortraitContain', 'PortraitContain', !accessState.memberIsOwner(AccessBloc.currentAppId(context)) ? null : (dynamic val) => setSelectionFitPortrait(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _fitPortraitSelectedRadioTile, 'PortraitCover', 'PortraitCover', !accessState.memberIsOwner(AccessBloc.currentAppId(context)) ? null : (dynamic val) => setSelectionFitPortrait(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _fitPortraitSelectedRadioTile, 'PortraitScaleDown', 'PortraitScaleDown', !accessState.memberIsOwner(AccessBloc.currentAppId(context)) ? null : (dynamic val) => setSelectionFitPortrait(val))
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Align when Landscape')
                ));

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _alignTypeLandscapeSelectedRadioTile, 'LandscapeAlignTopLeft', 'LandscapeAlignTopLeft', !accessState.memberIsOwner(AccessBloc.currentAppId(context)) ? null : (dynamic val) => setSelectionAlignTypeLandscape(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _alignTypeLandscapeSelectedRadioTile, 'LandscapeAlignTopCenter', 'LandscapeAlignTopCenter', !accessState.memberIsOwner(AccessBloc.currentAppId(context)) ? null : (dynamic val) => setSelectionAlignTypeLandscape(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _alignTypeLandscapeSelectedRadioTile, 'LandscapeAlignTopRight', 'LandscapeAlignTopRight', !accessState.memberIsOwner(AccessBloc.currentAppId(context)) ? null : (dynamic val) => setSelectionAlignTypeLandscape(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _alignTypeLandscapeSelectedRadioTile, 'LandscapeAlignCenterLeft', 'LandscapeAlignCenterLeft', !accessState.memberIsOwner(AccessBloc.currentAppId(context)) ? null : (dynamic val) => setSelectionAlignTypeLandscape(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _alignTypeLandscapeSelectedRadioTile, 'LandscapeAlignCenter', 'LandscapeAlignCenter', !accessState.memberIsOwner(AccessBloc.currentAppId(context)) ? null : (dynamic val) => setSelectionAlignTypeLandscape(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _alignTypeLandscapeSelectedRadioTile, 'LandscapeAlignCenterRight', 'LandscapeAlignCenterRight', !accessState.memberIsOwner(AccessBloc.currentAppId(context)) ? null : (dynamic val) => setSelectionAlignTypeLandscape(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _alignTypeLandscapeSelectedRadioTile, 'LandscapeAlignBottomLeft', 'LandscapeAlignBottomLeft', !accessState.memberIsOwner(AccessBloc.currentAppId(context)) ? null : (dynamic val) => setSelectionAlignTypeLandscape(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _alignTypeLandscapeSelectedRadioTile, 'LandscapeAlignBottomCenter', 'LandscapeAlignBottomCenter', !accessState.memberIsOwner(AccessBloc.currentAppId(context)) ? null : (dynamic val) => setSelectionAlignTypeLandscape(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _alignTypeLandscapeSelectedRadioTile, 'LandscapeAlignBottomRight', 'LandscapeAlignBottomRight', !accessState.memberIsOwner(AccessBloc.currentAppId(context)) ? null : (dynamic val) => setSelectionAlignTypeLandscape(val))
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Align when Portrait')
                ));

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _alignTypePortraitSelectedRadioTile, 'PortraitAlignTopLeft', 'PortraitAlignTopLeft', !accessState.memberIsOwner(AccessBloc.currentAppId(context)) ? null : (dynamic val) => setSelectionAlignTypePortrait(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _alignTypePortraitSelectedRadioTile, 'PortraitAlignTopCenter', 'PortraitAlignTopCenter', !accessState.memberIsOwner(AccessBloc.currentAppId(context)) ? null : (dynamic val) => setSelectionAlignTypePortrait(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _alignTypePortraitSelectedRadioTile, 'PortraitAlignTopRight', 'PortraitAlignTopRight', !accessState.memberIsOwner(AccessBloc.currentAppId(context)) ? null : (dynamic val) => setSelectionAlignTypePortrait(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _alignTypePortraitSelectedRadioTile, 'PortraitAlignCenterLeft', 'PortraitAlignCenterLeft', !accessState.memberIsOwner(AccessBloc.currentAppId(context)) ? null : (dynamic val) => setSelectionAlignTypePortrait(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _alignTypePortraitSelectedRadioTile, 'PortraitAlignCenter', 'PortraitAlignCenter', !accessState.memberIsOwner(AccessBloc.currentAppId(context)) ? null : (dynamic val) => setSelectionAlignTypePortrait(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _alignTypePortraitSelectedRadioTile, 'PortraitAlignCenterRight', 'PortraitAlignCenterRight', !accessState.memberIsOwner(AccessBloc.currentAppId(context)) ? null : (dynamic val) => setSelectionAlignTypePortrait(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _alignTypePortraitSelectedRadioTile, 'PortraitAlignBottomLeft', 'PortraitAlignBottomLeft', !accessState.memberIsOwner(AccessBloc.currentAppId(context)) ? null : (dynamic val) => setSelectionAlignTypePortrait(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _alignTypePortraitSelectedRadioTile, 'PortraitAlignBottomCenter', 'PortraitAlignBottomCenter', !accessState.memberIsOwner(AccessBloc.currentAppId(context)) ? null : (dynamic val) => setSelectionAlignTypePortrait(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _alignTypePortraitSelectedRadioTile, 'PortraitAlignBottomRight', 'PortraitAlignBottomRight', !accessState.memberIsOwner(AccessBloc.currentAppId(context)) ? null : (dynamic val) => setSelectionAlignTypePortrait(val))
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


        if ((formAction != FormAction.ShowData) && (formAction != FormAction.ShowPreloadedData))
          children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().button(context, label: 'Submit',
                  onPressed: _readOnly(accessState, state) ? null : () {
                    if (state is PosSizeFormError) {
                      return null;
                    } else {
                      if (formAction == FormAction.UpdateAction) {
                        BlocProvider.of<PosSizeListBloc>(context).add(
                          UpdatePosSizeList(value: state.value!.copyWith(
                              documentID: state.value!.documentID, 
                              appId: state.value!.appId, 
                              name: state.value!.name, 
                              widthPortrait: state.value!.widthPortrait, 
                              widthTypePortrait: state.value!.widthTypePortrait, 
                              widthLandscape: state.value!.widthLandscape, 
                              widthTypeLandscape: state.value!.widthTypeLandscape, 
                              heightPortrait: state.value!.heightPortrait, 
                              heightTypePortrait: state.value!.heightTypePortrait, 
                              heightLandscape: state.value!.heightLandscape, 
                              heightTypeLandscape: state.value!.heightTypeLandscape, 
                              fitPortrait: state.value!.fitPortrait, 
                              fitLandscape: state.value!.fitLandscape, 
                              alignTypePortrait: state.value!.alignTypePortrait, 
                              alignTypeLandscape: state.value!.alignTypeLandscape, 
                              clip: state.value!.clip, 
                        )));
                      } else {
                        BlocProvider.of<PosSizeListBloc>(context).add(
                          AddPosSizeList(value: PosSizeModel(
                              documentID: state.value!.documentID, 
                              appId: state.value!.appId, 
                              name: state.value!.name, 
                              widthPortrait: state.value!.widthPortrait, 
                              widthTypePortrait: state.value!.widthTypePortrait, 
                              widthLandscape: state.value!.widthLandscape, 
                              widthTypeLandscape: state.value!.widthTypeLandscape, 
                              heightPortrait: state.value!.heightPortrait, 
                              heightTypePortrait: state.value!.heightTypePortrait, 
                              heightLandscape: state.value!.heightLandscape, 
                              heightTypeLandscape: state.value!.heightTypeLandscape, 
                              fitPortrait: state.value!.fitPortrait, 
                              fitLandscape: state.value!.fitLandscape, 
                              alignTypePortrait: state.value!.alignTypePortrait, 
                              alignTypeLandscape: state.value!.alignTypeLandscape, 
                              clip: state.value!.clip, 
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


  void setSelectionWidthTypePortrait(int? val) {
    setState(() {
      _widthTypePortraitSelectedRadioTile = val;
    });
    _myFormBloc.add(ChangedPosSizeWidthTypePortrait(value: toWidthTypePortrait(val)));
  }


  void _onWidthLandscapeChanged() {
    _myFormBloc.add(ChangedPosSizeWidthLandscape(value: _widthLandscapeController.text));
  }


  void setSelectionWidthTypeLandscape(int? val) {
    setState(() {
      _widthTypeLandscapeSelectedRadioTile = val;
    });
    _myFormBloc.add(ChangedPosSizeWidthTypeLandscape(value: toWidthTypeLandscape(val)));
  }


  void _onHeightPortraitChanged() {
    _myFormBloc.add(ChangedPosSizeHeightPortrait(value: _heightPortraitController.text));
  }


  void setSelectionHeightTypePortrait(int? val) {
    setState(() {
      _heightTypePortraitSelectedRadioTile = val;
    });
    _myFormBloc.add(ChangedPosSizeHeightTypePortrait(value: toHeightTypePortrait(val)));
  }


  void _onHeightLandscapeChanged() {
    _myFormBloc.add(ChangedPosSizeHeightLandscape(value: _heightLandscapeController.text));
  }


  void setSelectionHeightTypeLandscape(int? val) {
    setState(() {
      _heightTypeLandscapeSelectedRadioTile = val;
    });
    _myFormBloc.add(ChangedPosSizeHeightTypeLandscape(value: toHeightTypeLandscape(val)));
  }


  void setSelectionFitPortrait(int? val) {
    setState(() {
      _fitPortraitSelectedRadioTile = val;
    });
    _myFormBloc.add(ChangedPosSizeFitPortrait(value: toPortraitFitType(val)));
  }


  void setSelectionFitLandscape(int? val) {
    setState(() {
      _fitLandscapeSelectedRadioTile = val;
    });
    _myFormBloc.add(ChangedPosSizeFitLandscape(value: toLandscapeFitType(val)));
  }


  void setSelectionAlignTypePortrait(int? val) {
    setState(() {
      _alignTypePortraitSelectedRadioTile = val;
    });
    _myFormBloc.add(ChangedPosSizeAlignTypePortrait(value: toPortraitAlignType(val)));
  }


  void setSelectionAlignTypeLandscape(int? val) {
    setState(() {
      _alignTypeLandscapeSelectedRadioTile = val;
    });
    _myFormBloc.add(ChangedPosSizeAlignTypeLandscape(value: toLandscapeAlignType(val)));
  }


  void setSelectionClip(int? val) {
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

  bool _readOnly(AccessState accessState, PosSizeFormInitialized state) {
    return (formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData) || (!accessState.memberIsOwner(AccessBloc.currentAppId(context)));
  }
  

}



