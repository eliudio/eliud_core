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

import 'package:eliud_core/model/dialog_list_bloc.dart';
import 'package:eliud_core/model/dialog_list_event.dart';
import 'package:eliud_core/model/dialog_model.dart';
import 'package:eliud_core/model/dialog_form_bloc.dart';
import 'package:eliud_core/model/dialog_form_event.dart';
import 'package:eliud_core/model/dialog_form_state.dart';


class DialogForm extends StatelessWidget {
  FormAction formAction;
  DialogModel? value;
  ActionModel? submitAction;

  DialogForm({Key? key, required this.formAction, required this.value, this.submitAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    var app = AccessBloc.app(context);
    if (app == null) return Text("No app available");
    if (formAction == FormAction.ShowData) {
      return BlocProvider<DialogFormBloc >(
            create: (context) => DialogFormBloc(AccessBloc.appId(context),
                                       formAction: formAction,

                                                )..add(InitialiseDialogFormEvent(value: value)),
  
        child: MyDialogForm(submitAction: submitAction, formAction: formAction),
          );
    } if (formAction == FormAction.ShowPreloadedData) {
      return BlocProvider<DialogFormBloc >(
            create: (context) => DialogFormBloc(AccessBloc.appId(context),
                                       formAction: formAction,

                                                )..add(InitialiseDialogFormNoLoadEvent(value: value)),
  
        child: MyDialogForm(submitAction: submitAction, formAction: formAction),
          );
    } else {
      return Scaffold(
        appBar: StyleRegistry.registry().styleWithContext(context).adminFormStyle().appBarWithString(context, title: formAction == FormAction.UpdateAction ? 'Update Dialog' : 'Add Dialog'),
        body: BlocProvider<DialogFormBloc >(
            create: (context) => DialogFormBloc(AccessBloc.appId(context),
                                       formAction: formAction,

                                                )..add((formAction == FormAction.UpdateAction ? InitialiseDialogFormEvent(value: value) : InitialiseNewDialogFormEvent())),
  
        child: MyDialogForm(submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}


class MyDialogForm extends StatefulWidget {
  final FormAction? formAction;
  final ActionModel? submitAction;

  MyDialogForm({this.formAction, this.submitAction});

  _MyDialogFormState createState() => _MyDialogFormState(this.formAction);
}


class _MyDialogFormState extends State<MyDialogForm> {
  final FormAction? formAction;
  late DialogFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  final TextEditingController _appIdController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  String? _backgroundOverride;
  int? _layoutSelectedRadioTile;
  bool? _includeHeadingSelection;
  String? _gridView;
  final TextEditingController _widgetWrapperController = TextEditingController();


  _MyDialogFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<DialogFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
    _appIdController.addListener(_onAppIdChanged);
    _titleController.addListener(_onTitleChanged);
    _layoutSelectedRadioTile = 0;
    _includeHeadingSelection = false;
    _widgetWrapperController.addListener(_onWidgetWrapperChanged);
  }

  @override
  Widget build(BuildContext context) {
    var app = AccessBloc.app(context);
    if (app == null) return Text('No app available');
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<DialogFormBloc, DialogFormState>(builder: (context, state) {
      if (state is DialogFormUninitialized) return Center(
        child: StyleRegistry.registry().styleWithContext(context).adminListStyle().progressIndicator(context),
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
        if (state.value!.backgroundOverride != null)
          _backgroundOverride= state.value!.backgroundOverride!.documentID;
        else
          _backgroundOverride= "";
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
        if (state.value!.widgetWrapper != null)
          _widgetWrapperController.text = state.value!.widgetWrapper.toString();
        else
          _widgetWrapperController.text = "";
      }
      if (state is DialogFormInitialized) {
        List<Widget> children = [];
         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'General')
                ));

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().checkboxListTile(context, 'Include Heading', _includeHeadingSelection, _readOnly(accessState, state) ? null : (dynamic val) => setSelectionIncludeHeading(val))
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'General')
                ));

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'Document ID', icon: Icons.vpn_key, readOnly: (formAction == FormAction.UpdateAction), textEditingController: _documentIDController, keyboardType: TextInputType.text, validator: (_) => state is DocumentIDDialogFormError ? state.message : null, hintText: null)
          );

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'Title', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _titleController, keyboardType: TextInputType.text, validator: (_) => state is TitleDialogFormError ? state.message : null, hintText: null)
          );

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'Shared Widget Wrapper', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _widgetWrapperController, keyboardType: TextInputType.text, validator: (_) => state is WidgetWrapperDialogFormError ? state.message : null, hintText: 'field.remark')
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Home menu')
                ));


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Components')
                ));

        children.add(

                new Container(
                    height: (fullScreenHeight(context) / 2.5), 
                    child: bodyComponentsList(context, state.value!.bodyComponents, _onBodyComponentsChanged)
                )
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Background')
                ));

        children.add(

                DropdownButtonComponentFactory().createNew(id: "backgrounds", value: _backgroundOverride, trigger: _onBackgroundOverrideSelected, optional: true),
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Layout')
                ));

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _layoutSelectedRadioTile, 'GridView', 'GridView', !accessState.memberIsOwner() ? null : (dynamic val) => setSelectionLayout(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _layoutSelectedRadioTile, 'ListView', 'ListView', !accessState.memberIsOwner() ? null : (dynamic val) => setSelectionLayout(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _layoutSelectedRadioTile, 'OnlyTheFirstComponent', 'OnlyTheFirstComponent', !accessState.memberIsOwner() ? null : (dynamic val) => setSelectionLayout(val))
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


        if (state.value!.layout == PageLayout.GridView) children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'GridView')
                ));

        if ((state.value!.layout == PageLayout.GridView)) children.add(

                DropdownButtonComponentFactory().createNew(id: "gridViews", value: _gridView, trigger: _onGridViewSelected, optional: false),
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Conditional')
                ));



        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Conditional')
                ));



        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


        if ((formAction != FormAction.ShowData) && (formAction != FormAction.ShowPreloadedData))
          children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().button(context, label: 'Submit',
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
                              bodyComponents: state.value!.bodyComponents, 
                              backgroundOverride: state.value!.backgroundOverride, 
                              layout: state.value!.layout, 
                              includeHeading: state.value!.includeHeading, 
                              gridView: state.value!.gridView, 
                              widgetWrapper: state.value!.widgetWrapper, 
                              conditions: state.value!.conditions, 
                        )));
                      } else {
                        BlocProvider.of<DialogListBloc>(context).add(
                          AddDialogList(value: DialogModel(
                              documentID: state.value!.documentID, 
                              appId: state.value!.appId, 
                              title: state.value!.title, 
                              bodyComponents: state.value!.bodyComponents, 
                              backgroundOverride: state.value!.backgroundOverride, 
                              layout: state.value!.layout, 
                              includeHeading: state.value!.includeHeading, 
                              gridView: state.value!.gridView, 
                              widgetWrapper: state.value!.widgetWrapper, 
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
    _myFormBloc.add(ChangedDialogDocumentID(value: _documentIDController.text));
  }


  void _onAppIdChanged() {
    _myFormBloc.add(ChangedDialogAppId(value: _appIdController.text));
  }


  void _onTitleChanged() {
    _myFormBloc.add(ChangedDialogTitle(value: _titleController.text));
  }


  void _onBodyComponentsChanged(value) {
    _myFormBloc.add(ChangedDialogBodyComponents(value: value));
    setState(() {});
  }


  void _onBackgroundOverrideSelected(String? val) {
    setState(() {
      _backgroundOverride = val;
    });
    _myFormBloc.add(ChangedDialogBackgroundOverride(value: val));
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


  void _onWidgetWrapperChanged() {
    _myFormBloc.add(ChangedDialogWidgetWrapper(value: _widgetWrapperController.text));
  }



  @override
  void dispose() {
    _documentIDController.dispose();
    _appIdController.dispose();
    _titleController.dispose();
    _widgetWrapperController.dispose();
    super.dispose();
  }

  bool _readOnly(AccessState accessState, DialogFormInitialized state) {
    return (formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData) || (!accessState.memberIsOwner());
  }
  

}



