/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 grid_view_form.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/core/blocs/access/state/access_state.dart';
import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core/core/navigate/router.dart' as eliudrouter;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/style/style_registry.dart';





import 'package:eliud_core/tools/enums.dart';

import 'package:eliud_core/model/model_export.dart';

import 'package:eliud_core/model/grid_view_list_bloc.dart';
import 'package:eliud_core/model/grid_view_list_event.dart';
import 'package:eliud_core/model/grid_view_form_bloc.dart';
import 'package:eliud_core/model/grid_view_form_event.dart';
import 'package:eliud_core/model/grid_view_form_state.dart';


class GridViewForm extends StatelessWidget {
  final AppModel app;
  FormAction formAction;
  GridViewModel? value;
  ActionModel? submitAction;

  GridViewForm({Key? key, required this.app, required this.formAction, required this.value, this.submitAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    var appId = app.documentID;
    if (formAction == FormAction.ShowData) {
      return BlocProvider<GridViewFormBloc >(
            create: (context) => GridViewFormBloc(appId,
                                       formAction: formAction,

                                                )..add(InitialiseGridViewFormEvent(value: value)),
  
        child: MyGridViewForm(app:app, submitAction: submitAction, formAction: formAction),
          );
    } if (formAction == FormAction.ShowPreloadedData) {
      return BlocProvider<GridViewFormBloc >(
            create: (context) => GridViewFormBloc(appId,
                                       formAction: formAction,

                                                )..add(InitialiseGridViewFormNoLoadEvent(value: value)),
  
        child: MyGridViewForm(app:app, submitAction: submitAction, formAction: formAction),
          );
    } else {
      return Scaffold(
        appBar: StyleRegistry.registry().styleWithApp(app).adminFormStyle().appBarWithString(app, context, title: formAction == FormAction.UpdateAction ? 'Update GridView' : 'Add GridView'),
        body: BlocProvider<GridViewFormBloc >(
            create: (context) => GridViewFormBloc(appId,
                                       formAction: formAction,

                                                )..add((formAction == FormAction.UpdateAction ? InitialiseGridViewFormEvent(value: value) : InitialiseNewGridViewFormEvent())),
  
        child: MyGridViewForm(app: app, submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}


class MyGridViewForm extends StatefulWidget {
  final AppModel app;
  final FormAction? formAction;
  final ActionModel? submitAction;

  MyGridViewForm({required this.app, this.formAction, this.submitAction});

  _MyGridViewFormState createState() => _MyGridViewFormState(this.formAction);
}


class _MyGridViewFormState extends State<MyGridViewForm> {
  final FormAction? formAction;
  late GridViewFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  final TextEditingController _appIdController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  int? _scrollDirectionSelectedRadioTile;
  int? _typeSelectedRadioTile;
  final TextEditingController _crossAxisCountController = TextEditingController();
  int? _maxCrossAxisExtentTypeSelectedRadioTile;
  final TextEditingController _absoluteMaxCrossAxisExtentController = TextEditingController();
  final TextEditingController _relativeMaxCrossAxisExtentController = TextEditingController();
  final TextEditingController _childAspectRatioController = TextEditingController();
  final TextEditingController _paddingController = TextEditingController();
  final TextEditingController _mainAxisSpacingController = TextEditingController();
  final TextEditingController _crossAxisSpacingController = TextEditingController();


  _MyGridViewFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<GridViewFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
    _appIdController.addListener(_onAppIdChanged);
    _nameController.addListener(_onNameChanged);
    _scrollDirectionSelectedRadioTile = 0;
    _typeSelectedRadioTile = 0;
    _crossAxisCountController.addListener(_onCrossAxisCountChanged);
    _maxCrossAxisExtentTypeSelectedRadioTile = 0;
    _absoluteMaxCrossAxisExtentController.addListener(_onAbsoluteMaxCrossAxisExtentChanged);
    _relativeMaxCrossAxisExtentController.addListener(_onRelativeMaxCrossAxisExtentChanged);
    _childAspectRatioController.addListener(_onChildAspectRatioChanged);
    _paddingController.addListener(_onPaddingChanged);
    _mainAxisSpacingController.addListener(_onMainAxisSpacingChanged);
    _crossAxisSpacingController.addListener(_onCrossAxisSpacingChanged);
  }

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<GridViewFormBloc, GridViewFormState>(builder: (context, state) {
      if (state is GridViewFormUninitialized) return Center(
        child: StyleRegistry.registry().styleWithApp(widget.app).adminListStyle().progressIndicator(widget.app, context),
      );

      if (state is GridViewFormLoaded) {
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
        if (state.value!.scrollDirection != null)
          _scrollDirectionSelectedRadioTile = state.value!.scrollDirection!.index;
        else
          _scrollDirectionSelectedRadioTile = 0;
        if (state.value!.type != null)
          _typeSelectedRadioTile = state.value!.type!.index;
        else
          _typeSelectedRadioTile = 0;
        if (state.value!.crossAxisCount != null)
          _crossAxisCountController.text = state.value!.crossAxisCount.toString();
        else
          _crossAxisCountController.text = "";
        if (state.value!.maxCrossAxisExtentType != null)
          _maxCrossAxisExtentTypeSelectedRadioTile = state.value!.maxCrossAxisExtentType!.index;
        else
          _maxCrossAxisExtentTypeSelectedRadioTile = 0;
        if (state.value!.absoluteMaxCrossAxisExtent != null)
          _absoluteMaxCrossAxisExtentController.text = state.value!.absoluteMaxCrossAxisExtent.toString();
        else
          _absoluteMaxCrossAxisExtentController.text = "";
        if (state.value!.relativeMaxCrossAxisExtent != null)
          _relativeMaxCrossAxisExtentController.text = state.value!.relativeMaxCrossAxisExtent.toString();
        else
          _relativeMaxCrossAxisExtentController.text = "";
        if (state.value!.childAspectRatio != null)
          _childAspectRatioController.text = state.value!.childAspectRatio.toString();
        else
          _childAspectRatioController.text = "";
        if (state.value!.padding != null)
          _paddingController.text = state.value!.padding.toString();
        else
          _paddingController.text = "";
        if (state.value!.mainAxisSpacing != null)
          _mainAxisSpacingController.text = state.value!.mainAxisSpacing.toString();
        else
          _mainAxisSpacingController.text = "";
        if (state.value!.crossAxisSpacing != null)
          _crossAxisSpacingController.text = state.value!.crossAxisSpacing.toString();
        else
          _crossAxisSpacingController.text = "";
      }
      if (state is GridViewFormInitialized) {
        List<Widget> children = [];
         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'General')
                ));


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'General')
                ));

        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().textFormField(widget.app, context, labelText: 'Document ID', icon: Icons.vpn_key, readOnly: (formAction == FormAction.UpdateAction), textEditingController: _documentIDController, keyboardType: TextInputType.text, validator: (_) => state is DocumentIDGridViewFormError ? state.message : null, hintText: null)
          );

        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().textFormField(widget.app, context, labelText: 'name', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _nameController, keyboardType: TextInputType.text, validator: (_) => state is NameGridViewFormError ? state.message : null, hintText: null)
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'Scroll Direction')
                ));

        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().radioListTile(widget.app, context, 0, _scrollDirectionSelectedRadioTile, 'Horizontal', 'Horizontal', !accessState.memberIsOwner(widget.app.documentID) ? null : (dynamic val) => setSelectionScrollDirection(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().radioListTile(widget.app, context, 0, _scrollDirectionSelectedRadioTile, 'Vertical', 'Vertical', !accessState.memberIsOwner(widget.app.documentID) ? null : (dynamic val) => setSelectionScrollDirection(val))
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'gridType')
                ));

        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().radioListTile(widget.app, context, 0, _typeSelectedRadioTile, 'Count', 'Count', !accessState.memberIsOwner(widget.app.documentID) ? null : (dynamic val) => setSelectionType(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().radioListTile(widget.app, context, 0, _typeSelectedRadioTile, 'Extent', 'Extent', !accessState.memberIsOwner(widget.app.documentID) ? null : (dynamic val) => setSelectionType(val))
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


        if (state.value!.type == GridViewGridType.Count) children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'crossAxisCount')
                ));

        if ((state.value!.type == GridViewGridType.Count)) children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().textFormField(widget.app, context, labelText: 'Cross Axis Count', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _crossAxisCountController, keyboardType: TextInputType.number, validator: (_) => state is CrossAxisCountGridViewFormError ? state.message : null, hintText: 'field.remark')
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


        if (state.value!.type == GridViewGridType.Extent) children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'Max Cross Axis Extent Type')
                ));

        if ((state.value!.type == GridViewGridType.Extent)) children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().radioListTile(widget.app, context, 0, _maxCrossAxisExtentTypeSelectedRadioTile, 'Absolute', 'Absolute', !accessState.memberIsOwner(widget.app.documentID) ? null : (dynamic val) => setSelectionMaxCrossAxisExtentType(val))
          );
        if ((state.value!.type == GridViewGridType.Extent)) children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().radioListTile(widget.app, context, 0, _maxCrossAxisExtentTypeSelectedRadioTile, 'Relative', 'Relative', !accessState.memberIsOwner(widget.app.documentID) ? null : (dynamic val) => setSelectionMaxCrossAxisExtentType(val))
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


        if ((state.value!.type == GridViewGridType.Extent) && (state.value!.maxCrossAxisExtentType == MaxCrossAxisExtentType.Absolute)) children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'Absolute Max Cross Axis Extent')
                ));

        if (((state.value!.type == GridViewGridType.Extent) && (state.value!.maxCrossAxisExtentType == MaxCrossAxisExtentType.Absolute))) children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().textFormField(widget.app, context, labelText: 'Absolute Max Cross Axis Extent', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _absoluteMaxCrossAxisExtentController, keyboardType: TextInputType.number, validator: (_) => state is AbsoluteMaxCrossAxisExtentGridViewFormError ? state.message : null, hintText: 'field.remark')
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


        if ((state.value!.type == GridViewGridType.Extent) && (state.value!.maxCrossAxisExtentType == MaxCrossAxisExtentType.Relative)) children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'Relative Max Cross Axis Extent')
                ));

        if (((state.value!.type == GridViewGridType.Extent) && (state.value!.maxCrossAxisExtentType == MaxCrossAxisExtentType.Relative))) children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().textFormField(widget.app, context, labelText: 'Relative Max Cross Axis Extent', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _relativeMaxCrossAxisExtentController, keyboardType: TextInputType.number, validator: (_) => state is RelativeMaxCrossAxisExtentGridViewFormError ? state.message : null, hintText: 'field.remark')
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'Spec')
                ));

        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().textFormField(widget.app, context, labelText: 'ChildAspectRatio', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _childAspectRatioController, keyboardType: TextInputType.number, validator: (_) => state is ChildAspectRatioGridViewFormError ? state.message : null, hintText: null)
          );

        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().textFormField(widget.app, context, labelText: 'Padding', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _paddingController, keyboardType: TextInputType.number, validator: (_) => state is PaddingGridViewFormError ? state.message : null, hintText: null)
          );

        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().textFormField(widget.app, context, labelText: 'MainAxisSpacing', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _mainAxisSpacingController, keyboardType: TextInputType.number, validator: (_) => state is MainAxisSpacingGridViewFormError ? state.message : null, hintText: null)
          );

        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().textFormField(widget.app, context, labelText: 'CrossAxisSpacing', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _crossAxisSpacingController, keyboardType: TextInputType.number, validator: (_) => state is CrossAxisSpacingGridViewFormError ? state.message : null, hintText: null)
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'Conditions')
                ));



        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


        if ((formAction != FormAction.ShowData) && (formAction != FormAction.ShowPreloadedData))
          children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().button(widget.app, context, label: 'Submit',
                  onPressed: _readOnly(accessState, state) ? null : () {
                    if (state is GridViewFormError) {
                      return null;
                    } else {
                      if (formAction == FormAction.UpdateAction) {
                        BlocProvider.of<GridViewListBloc>(context).add(
                          UpdateGridViewList(value: state.value!.copyWith(
                              documentID: state.value!.documentID, 
                              appId: state.value!.appId, 
                              name: state.value!.name, 
                              scrollDirection: state.value!.scrollDirection, 
                              type: state.value!.type, 
                              crossAxisCount: state.value!.crossAxisCount, 
                              maxCrossAxisExtentType: state.value!.maxCrossAxisExtentType, 
                              absoluteMaxCrossAxisExtent: state.value!.absoluteMaxCrossAxisExtent, 
                              relativeMaxCrossAxisExtent: state.value!.relativeMaxCrossAxisExtent, 
                              childAspectRatio: state.value!.childAspectRatio, 
                              padding: state.value!.padding, 
                              mainAxisSpacing: state.value!.mainAxisSpacing, 
                              crossAxisSpacing: state.value!.crossAxisSpacing, 
                              conditions: state.value!.conditions, 
                        )));
                      } else {
                        BlocProvider.of<GridViewListBloc>(context).add(
                          AddGridViewList(value: GridViewModel(
                              documentID: state.value!.documentID, 
                              appId: state.value!.appId, 
                              name: state.value!.name, 
                              scrollDirection: state.value!.scrollDirection, 
                              type: state.value!.type, 
                              crossAxisCount: state.value!.crossAxisCount, 
                              maxCrossAxisExtentType: state.value!.maxCrossAxisExtentType, 
                              absoluteMaxCrossAxisExtent: state.value!.absoluteMaxCrossAxisExtent, 
                              relativeMaxCrossAxisExtent: state.value!.relativeMaxCrossAxisExtent, 
                              childAspectRatio: state.value!.childAspectRatio, 
                              padding: state.value!.padding, 
                              mainAxisSpacing: state.value!.mainAxisSpacing, 
                              crossAxisSpacing: state.value!.crossAxisSpacing, 
                              conditions: state.value!.conditions, 
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
              children: children
            ),
          ), formAction!
        );
      } else {
        return StyleRegistry.registry().styleWithApp(widget.app).adminListStyle().progressIndicator(widget.app, context);
      }
    });
  }

  void _onDocumentIDChanged() {
    _myFormBloc.add(ChangedGridViewDocumentID(value: _documentIDController.text));
  }


  void _onAppIdChanged() {
    _myFormBloc.add(ChangedGridViewAppId(value: _appIdController.text));
  }


  void _onNameChanged() {
    _myFormBloc.add(ChangedGridViewName(value: _nameController.text));
  }


  void setSelectionScrollDirection(int? val) {
    setState(() {
      _scrollDirectionSelectedRadioTile = val;
    });
    _myFormBloc.add(ChangedGridViewScrollDirection(value: toGridViewScrollDirection(val)));
  }


  void setSelectionType(int? val) {
    setState(() {
      _typeSelectedRadioTile = val;
    });
    _myFormBloc.add(ChangedGridViewType(value: toGridViewGridType(val)));
  }


  void _onCrossAxisCountChanged() {
    _myFormBloc.add(ChangedGridViewCrossAxisCount(value: _crossAxisCountController.text));
  }


  void setSelectionMaxCrossAxisExtentType(int? val) {
    setState(() {
      _maxCrossAxisExtentTypeSelectedRadioTile = val;
    });
    _myFormBloc.add(ChangedGridViewMaxCrossAxisExtentType(value: toMaxCrossAxisExtentType(val)));
  }


  void _onAbsoluteMaxCrossAxisExtentChanged() {
    _myFormBloc.add(ChangedGridViewAbsoluteMaxCrossAxisExtent(value: _absoluteMaxCrossAxisExtentController.text));
  }


  void _onRelativeMaxCrossAxisExtentChanged() {
    _myFormBloc.add(ChangedGridViewRelativeMaxCrossAxisExtent(value: _relativeMaxCrossAxisExtentController.text));
  }


  void _onChildAspectRatioChanged() {
    _myFormBloc.add(ChangedGridViewChildAspectRatio(value: _childAspectRatioController.text));
  }


  void _onPaddingChanged() {
    _myFormBloc.add(ChangedGridViewPadding(value: _paddingController.text));
  }


  void _onMainAxisSpacingChanged() {
    _myFormBloc.add(ChangedGridViewMainAxisSpacing(value: _mainAxisSpacingController.text));
  }


  void _onCrossAxisSpacingChanged() {
    _myFormBloc.add(ChangedGridViewCrossAxisSpacing(value: _crossAxisSpacingController.text));
  }



  @override
  void dispose() {
    _documentIDController.dispose();
    _appIdController.dispose();
    _nameController.dispose();
    _crossAxisCountController.dispose();
    _absoluteMaxCrossAxisExtentController.dispose();
    _relativeMaxCrossAxisExtentController.dispose();
    _childAspectRatioController.dispose();
    _paddingController.dispose();
    _mainAxisSpacingController.dispose();
    _crossAxisSpacingController.dispose();
    super.dispose();
  }

  bool _readOnly(AccessState accessState, GridViewFormInitialized state) {
    return (formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData) || (!accessState.memberIsOwner(widget.app.documentID));
  }
  

}



