/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 dialog_form.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:eliud_core/core/blocs/access/state/access_state.dart';
import 'package:eliud_core/core/navigate/router.dart' as eliudrouter;
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/dialog_form_bloc.dart';
import 'package:eliud_core/model/dialog_form_event.dart';
import 'package:eliud_core/model/dialog_form_state.dart';
import 'package:eliud_core/model/dialog_list_bloc.dart';
import 'package:eliud_core/model/dialog_list_event.dart';
import 'package:eliud_core/model/dialog_model.dart';
import 'package:eliud_core/model/embedded_component.dart';
import 'package:eliud_core/model/internal_component.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'package:eliud_core/tools/enums.dart';
import 'package:eliud_core/tools/screen_size.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../tools/bespoke_models.dart';


class DialogForm extends StatelessWidget {
  final AppModel app;
  FormAction formAction;
  DialogModel? value;
  ActionModel? submitAction;

  DialogForm({Key? key, required this.app, required this.formAction, required this.value, this.submitAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    var appId = app.documentID;
    if (formAction == FormAction.ShowData) {
      return BlocProvider<DialogFormBloc >(
            create: (context) => DialogFormBloc(appId,
                                       formAction: formAction,

                                                )..add(InitialiseDialogFormEvent(value: value)),
  
        child: MyDialogForm(app:app, submitAction: submitAction, formAction: formAction),
          );
    } if (formAction == FormAction.ShowPreloadedData) {
      return BlocProvider<DialogFormBloc >(
            create: (context) => DialogFormBloc(appId,
                                       formAction: formAction,

                                                )..add(InitialiseDialogFormNoLoadEvent(value: value)),
  
        child: MyDialogForm(app:app, submitAction: submitAction, formAction: formAction),
          );
    } else {
      return Scaffold(
        appBar: StyleRegistry.registry().styleWithApp(app).adminFormStyle().appBarWithString(app, context, title: formAction == FormAction.UpdateAction ? 'Update Dialog' : 'Add Dialog'),
        body: BlocProvider<DialogFormBloc >(
            create: (context) => DialogFormBloc(appId,
                                       formAction: formAction,

                                                )..add((formAction == FormAction.UpdateAction ? InitialiseDialogFormEvent(value: value) : InitialiseNewDialogFormEvent())),
  
        child: MyDialogForm(app: app, submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}


class MyDialogForm extends StatefulWidget {
  final AppModel app;
  final FormAction? formAction;
  final ActionModel? submitAction;

  MyDialogForm({required this.app, this.formAction, this.submitAction});

  _MyDialogFormState createState() => _MyDialogFormState(this.formAction);
}


class _MyDialogFormState extends State<MyDialogForm> {
  final FormAction? formAction;
  late DialogFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  final TextEditingController _appIdController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  int? _layoutSelectedRadioTile;
  bool? _includeHeadingSelection;
  String? _gridView;


  _MyDialogFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<DialogFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
    _appIdController.addListener(_onAppIdChanged);
    _titleController.addListener(_onTitleChanged);
    _descriptionController.addListener(_onDescriptionChanged);
    _layoutSelectedRadioTile = 0;
    _includeHeadingSelection = false;
  }

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<DialogFormBloc, DialogFormState>(builder: (context, state) {
      if (state is DialogFormUninitialized) return Center(
        child: StyleRegistry.registry().styleWithApp(widget.app).adminListStyle().progressIndicator(widget.app, context),
      );

      if (state is DialogFormLoaded) {
        if (state.value!.documentID != null)
          _documentIDController.text = state.value!.documentID.toString();
        else
          _documentIDController.text = "";
        if (state.value!.appId != null)
          _appIdController.text = state.value!.appId.toString();
        else
          _appIdController.text = "";
        if (state.value!.title != null)
          _titleController.text = state.value!.title.toString();
        else
          _titleController.text = "";
        if (state.value!.description != null)
          _descriptionController.text = state.value!.description.toString();
        else
          _descriptionController.text = "";
        if (state.value!.layout != null)
          _layoutSelectedRadioTile = state.value!.layout!.index;
        else
          _layoutSelectedRadioTile = 0;
        if (state.value!.includeHeading != null)
        _includeHeadingSelection = state.value!.includeHeading;
        else
        _includeHeadingSelection = false;
        if (state.value!.gridView != null)
          _gridView= state.value!.gridView!.documentID;
        else
          _gridView= "";
      }
      if (state is DialogFormInitialized) {
        List<Widget> children = [];
         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'General')
                ));

        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().checkboxListTile(widget.app, context, 'Include Heading', _includeHeadingSelection, _readOnly(accessState, state) ? null : (dynamic val) => setSelectionIncludeHeading(val))
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'General')
                ));

        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().textFormField(widget.app, context, labelText: 'Document ID', icon: Icons.vpn_key, readOnly: (formAction == FormAction.UpdateAction), textEditingController: _documentIDController, keyboardType: TextInputType.text, validator: (_) => state is DocumentIDDialogFormError ? state.message : null, hintText: null)
          );

        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().textFormField(widget.app, context, labelText: 'Title', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _titleController, keyboardType: TextInputType.text, validator: (_) => state is TitleDialogFormError ? state.message : null, hintText: null)
          );

        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().textFormField(widget.app, context, labelText: 'Description', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _descriptionController, keyboardType: TextInputType.text, validator: (_) => state is DescriptionDialogFormError ? state.message : null, hintText: null)
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'Home menu')
                ));


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'Components')
                ));

        children.add(

                new Container(
                    height: (fullScreenHeight(context) / 2.5), 
                    child: bodyComponentsList(widget.app, context, state.value!.bodyComponents, _onBodyComponentsChanged)
                )
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'Background')
                ));



        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'Layout')
                ));

        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().radioListTile(widget.app, context, 0, _layoutSelectedRadioTile, 'GridView', 'GridView', !accessState.memberIsOwner(widget.app.documentID) ? null : (dynamic val) => setSelectionLayout(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().radioListTile(widget.app, context, 0, _layoutSelectedRadioTile, 'ListView', 'ListView', !accessState.memberIsOwner(widget.app.documentID) ? null : (dynamic val) => setSelectionLayout(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().radioListTile(widget.app, context, 0, _layoutSelectedRadioTile, 'OnlyTheFirstComponent', 'OnlyTheFirstComponent', !accessState.memberIsOwner(widget.app.documentID) ? null : (dynamic val) => setSelectionLayout(val))
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


        if (state.value!.layout == PageLayout.GridView) children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'GridView')
                ));

        if ((state.value!.layout == PageLayout.GridView)) children.add(

                DropdownButtonComponentFactory().createNew(app: widget.app, id: "gridViews", value: _gridView, trigger: (value, privilegeLevel) => _onGridViewSelected(value), optional: false),
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'Conditional')
                ));



        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'Conditional')
                ));



        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


        if ((formAction != FormAction.ShowData) && (formAction != FormAction.ShowPreloadedData))
          children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().button(widget.app, context, label: 'Submit',
                  onPressed: _readOnly(accessState, state) ? null : () {
                    if (state is DialogFormError) {
                      return null;
                    } else {
                      if (formAction == FormAction.UpdateAction) {
                        BlocProvider.of<DialogListBloc>(context).add(
                          UpdateDialogList(value: state.value!.copyWith(
                              documentID: state.value!.documentID, 
                              appId: state.value!.appId, 
                              title: state.value!.title, 
                              description: state.value!.description, 
                              bodyComponents: state.value!.bodyComponents, 
                              backgroundOverride: state.value!.backgroundOverride, 
                              layout: state.value!.layout, 
                              includeHeading: state.value!.includeHeading, 
                              gridView: state.value!.gridView, 
                              conditions: state.value!.conditions, 
                        )));
                      } else {
                        BlocProvider.of<DialogListBloc>(context).add(
                          AddDialogList(value: DialogModel(
                              documentID: state.value!.documentID, 
                              appId: state.value!.appId, 
                              title: state.value!.title, 
                              description: state.value!.description, 
                              bodyComponents: state.value!.bodyComponents, 
                              backgroundOverride: state.value!.backgroundOverride, 
                              layout: state.value!.layout, 
                              includeHeading: state.value!.includeHeading, 
                              gridView: state.value!.gridView, 
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
    _myFormBloc.add(ChangedDialogDocumentID(value: _documentIDController.text));
  }


  void _onAppIdChanged() {
    _myFormBloc.add(ChangedDialogAppId(value: _appIdController.text));
  }


  void _onTitleChanged() {
    _myFormBloc.add(ChangedDialogTitle(value: _titleController.text));
  }


  void _onDescriptionChanged() {
    _myFormBloc.add(ChangedDialogDescription(value: _descriptionController.text));
  }


  void _onBodyComponentsChanged(value) {
    _myFormBloc.add(ChangedDialogBodyComponents(value: value));
    setState(() {});
  }


  void setSelectionLayout(int? val) {
    setState(() {
      _layoutSelectedRadioTile = val;
    });
    _myFormBloc.add(ChangedDialogLayout(value: toDialogLayout(val)));
  }


  void setSelectionIncludeHeading(bool? val) {
    setState(() {
      _includeHeadingSelection = val;
    });
    _myFormBloc.add(ChangedDialogIncludeHeading(value: val));
  }

  void _onGridViewSelected(String? val) {
    setState(() {
      _gridView = val;
    });
    _myFormBloc.add(ChangedDialogGridView(value: val));
  }



  @override
  void dispose() {
    _documentIDController.dispose();
    _appIdController.dispose();
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  bool _readOnly(AccessState accessState, DialogFormInitialized state) {
    return (formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData) || (!accessState.memberIsOwner(widget.app.documentID));
  }
  

}



