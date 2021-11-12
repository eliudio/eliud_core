/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 decoration_color_form.dart
                       
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

import 'package:eliud_core/model/decoration_color_list_bloc.dart';
import 'package:eliud_core/model/decoration_color_list_event.dart';
import 'package:eliud_core/model/decoration_color_model.dart';
import 'package:eliud_core/model/decoration_color_form_bloc.dart';
import 'package:eliud_core/model/decoration_color_form_event.dart';
import 'package:eliud_core/model/decoration_color_form_state.dart';


class DecorationColorForm extends StatelessWidget {
  FormAction formAction;
  DecorationColorModel? value;
  ActionModel? submitAction;

  DecorationColorForm({Key? key, required this.formAction, required this.value, this.submitAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    var app = AccessBloc.currentApp(context);
    if (app == null) return Text("No app available");
    if (formAction == FormAction.ShowData) {
      return BlocProvider<DecorationColorFormBloc >(
            create: (context) => DecorationColorFormBloc(AccessBloc.currentAppId(context),
                                       
                                                )..add(InitialiseDecorationColorFormEvent(value: value)),
  
        child: MyDecorationColorForm(submitAction: submitAction, formAction: formAction),
          );
    } if (formAction == FormAction.ShowPreloadedData) {
      return BlocProvider<DecorationColorFormBloc >(
            create: (context) => DecorationColorFormBloc(AccessBloc.currentAppId(context),
                                       
                                                )..add(InitialiseDecorationColorFormNoLoadEvent(value: value)),
  
        child: MyDecorationColorForm(submitAction: submitAction, formAction: formAction),
          );
    } else {
      return Scaffold(
        appBar: StyleRegistry.registry().styleWithContext(context).adminFormStyle().appBarWithString(context, title: formAction == FormAction.UpdateAction ? 'Update DecorationColor' : 'Add DecorationColor'),
        body: BlocProvider<DecorationColorFormBloc >(
            create: (context) => DecorationColorFormBloc(AccessBloc.currentAppId(context),
                                       
                                                )..add((formAction == FormAction.UpdateAction ? InitialiseDecorationColorFormEvent(value: value) : InitialiseNewDecorationColorFormEvent())),
  
        child: MyDecorationColorForm(submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}


class MyDecorationColorForm extends StatefulWidget {
  final FormAction? formAction;
  final ActionModel? submitAction;

  MyDecorationColorForm({this.formAction, this.submitAction});

  _MyDecorationColorFormState createState() => _MyDecorationColorFormState(this.formAction);
}


class _MyDecorationColorFormState extends State<MyDecorationColorForm> {
  final FormAction? formAction;
  late DecorationColorFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  final TextEditingController _stopController = TextEditingController();


  _MyDecorationColorFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<DecorationColorFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
    _stopController.addListener(_onStopChanged);
  }

  @override
  Widget build(BuildContext context) {
    var app = AccessBloc.currentApp(context);
    if (app == null) return Text('No app available');
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<DecorationColorFormBloc, DecorationColorFormState>(builder: (context, state) {
      if (state is DecorationColorFormUninitialized) return Center(
        child: StyleRegistry.registry().styleWithContext(context).adminListStyle().progressIndicator(context),
      );

      if (state is DecorationColorFormLoaded) {
        if (state.value!.documentID != null)
          _documentIDController.text = state.value!.documentID.toString();
        else
          _documentIDController.text = "";
        if (state.value!.stop != null)
          _stopController.text = state.value!.stop.toString();
        else
          _stopController.text = "";
      }
      if (state is DecorationColorFormInitialized) {
        List<Widget> children = [];
        children.add(

                RgbField("Background Color", state.value!.color, _onColorChanged)
          );

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'Stop (-1 = no stop)', icon: Icons.color_lens, readOnly: _readOnly(accessState, state), textEditingController: _stopController, keyboardType: TextInputType.number, validator: (_) => state is StopDecorationColorFormError ? state.message : null, hintText: null)
          );


        if ((formAction != FormAction.ShowData) && (formAction != FormAction.ShowPreloadedData))
          children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().button(context, label: 'Submit',
                  onPressed: _readOnly(accessState, state) ? null : () {
                    if (state is DecorationColorFormError) {
                      return null;
                    } else {
                      if (formAction == FormAction.UpdateAction) {
                        BlocProvider.of<DecorationColorListBloc>(context).add(
                          UpdateDecorationColorList(value: state.value!.copyWith(
                              documentID: state.value!.documentID, 
                              color: state.value!.color, 
                              stop: state.value!.stop, 
                        )));
                      } else {
                        BlocProvider.of<DecorationColorListBloc>(context).add(
                          AddDecorationColorList(value: DecorationColorModel(
                              documentID: state.value!.documentID, 
                              color: state.value!.color, 
                              stop: state.value!.stop, 
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
    _myFormBloc.add(ChangedDecorationColorDocumentID(value: _documentIDController.text));
  }


  void _onColorChanged(value) {
    _myFormBloc.add(ChangedDecorationColorColor(value: value));
    
  }


  void _onStopChanged() {
    _myFormBloc.add(ChangedDecorationColorStop(value: _stopController.text));
  }



  @override
  void dispose() {
    _documentIDController.dispose();
    _stopController.dispose();
    super.dispose();
  }

  bool _readOnly(AccessState accessState, DecorationColorFormInitialized state) {
    return (formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData) || (!accessState.memberIsOwner(AccessBloc.currentAppId(context)));
  }
  

}



