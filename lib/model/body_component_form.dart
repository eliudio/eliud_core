/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 body_component_form.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/core/blocs/access/state/access_state.dart';
import 'package:eliud_core/core/blocs/access/state/logged_in.dart';
import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:eliud_core/core/blocs/app/app_bloc.dart';
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

import 'package:eliud_core/model/body_component_list_bloc.dart';
import 'package:eliud_core/model/body_component_list_event.dart';
import 'package:eliud_core/model/body_component_model.dart';
import 'package:eliud_core/model/body_component_form_bloc.dart';
import 'package:eliud_core/model/body_component_form_event.dart';
import 'package:eliud_core/model/body_component_form_state.dart';


class BodyComponentForm extends StatelessWidget {
  FormAction formAction;
  BodyComponentModel? value;
  ActionModel? submitAction;

  BodyComponentForm({Key? key, required this.formAction, required this.value, this.submitAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    var app = AppBloc.currentApp(context);
    if (app == null) return Text("No app available");
    if (formAction == FormAction.ShowData) {
      return BlocProvider<BodyComponentFormBloc >(
            create: (context) => BodyComponentFormBloc(AppBloc.currentAppId(context),
                                       
                                                )..add(InitialiseBodyComponentFormEvent(value: value)),
  
        child: MyBodyComponentForm(submitAction: submitAction, formAction: formAction),
          );
    } if (formAction == FormAction.ShowPreloadedData) {
      return BlocProvider<BodyComponentFormBloc >(
            create: (context) => BodyComponentFormBloc(AppBloc.currentAppId(context),
                                       
                                                )..add(InitialiseBodyComponentFormNoLoadEvent(value: value)),
  
        child: MyBodyComponentForm(submitAction: submitAction, formAction: formAction),
          );
    } else {
      return Scaffold(
        appBar: StyleRegistry.registry().styleWithContext(context).adminFormStyle().appBarWithString(context, title: formAction == FormAction.UpdateAction ? 'Update BodyComponent' : 'Add BodyComponent'),
        body: BlocProvider<BodyComponentFormBloc >(
            create: (context) => BodyComponentFormBloc(AppBloc.currentAppId(context),
                                       
                                                )..add((formAction == FormAction.UpdateAction ? InitialiseBodyComponentFormEvent(value: value) : InitialiseNewBodyComponentFormEvent())),
  
        child: MyBodyComponentForm(submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}


class MyBodyComponentForm extends StatefulWidget {
  final FormAction? formAction;
  final ActionModel? submitAction;

  MyBodyComponentForm({this.formAction, this.submitAction});

  _MyBodyComponentFormState createState() => _MyBodyComponentFormState(this.formAction);
}


class _MyBodyComponentFormState extends State<MyBodyComponentForm> {
  final FormAction? formAction;
  late BodyComponentFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();


  _MyBodyComponentFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<BodyComponentFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
  }

  @override
  Widget build(BuildContext context) {
    var app = AppBloc.currentApp(context);
    if (app == null) return Text('No app available');
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<BodyComponentFormBloc, BodyComponentFormState>(builder: (context, state) {
      if (state is BodyComponentFormUninitialized) return Center(
        child: StyleRegistry.registry().styleWithContext(context).adminListStyle().progressIndicator(context),
      );

      if (state is BodyComponentFormLoaded) {
        if (state.value!.documentID != null)
          _documentIDController.text = state.value!.documentID.toString();
        else
          _documentIDController.text = "";
      }
      if (state is BodyComponentFormInitialized) {
        List<Widget> children = [];
         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Component')
                ));

        children.add(

                ExtensionTypeField(state.value!.componentName, _onComponentNameChanged)
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Component spec')
                ));

        children.add(

                ComponentIdField(componentName: state.value!.componentName, value: state.value!.componentId, trigger: _onComponentIdChanged)
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


        if ((formAction != FormAction.ShowData) && (formAction != FormAction.ShowPreloadedData))
          children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().button(context, label: 'Submit',
                  onPressed: _readOnly(accessState, state) ? null : () {
                    if (state is BodyComponentFormError) {
                      return null;
                    } else {
                      if (formAction == FormAction.UpdateAction) {
                        BlocProvider.of<BodyComponentListBloc>(context).add(
                          UpdateBodyComponentList(value: state.value!.copyWith(
                              documentID: state.value!.documentID, 
                              componentName: state.value!.componentName, 
                              componentId: state.value!.componentId, 
                        )));
                      } else {
                        BlocProvider.of<BodyComponentListBloc>(context).add(
                          AddBodyComponentList(value: BodyComponentModel(
                              documentID: state.value!.documentID, 
                              componentName: state.value!.componentName, 
                              componentId: state.value!.componentId, 
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
    _myFormBloc.add(ChangedBodyComponentDocumentID(value: _documentIDController.text));
  }


  void _onComponentNameChanged(value) {
    _myFormBloc.add(ChangedBodyComponentComponentName(value: value));
    
  }


  void _onComponentIdChanged(value) {
    _myFormBloc.add(ChangedBodyComponentComponentId(value: value));
    
  }



  @override
  void dispose() {
    _documentIDController.dispose();
    super.dispose();
  }

  bool _readOnly(AccessState accessState, BodyComponentFormInitialized state) {
    return (formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData) || (!accessState.memberIsOwner(AppBloc.currentAppId(context)));
  }
  

}



