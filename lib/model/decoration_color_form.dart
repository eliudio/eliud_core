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

import 'package:eliud_core/core/global_data.dart';

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
import '../model/embedded_component.dart';
import '../tools/bespoke_formfields.dart';
import 'package:eliud_core/tools/bespoke_formfields.dart';

import 'package:eliud_core/tools/enums.dart';
import 'package:eliud_core/tools/etc.dart';

// import the main classes
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';

// import the shared classes
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/model/entity_export.dart';
  
// import the classes of this package:
import '../model/abstract_repository_singleton.dart';
import '../model/repository_export.dart';
import 'package:eliud_core/model/repository_export.dart';
import '../model/model_export.dart';
import 'package:eliud_core/model/model_export.dart';
import '../model/entity_export.dart';
import 'package:eliud_core/model/entity_export.dart';

import 'decoration_color_list_bloc.dart';
import 'decoration_color_list_event.dart';
import 'decoration_color_model.dart';
import 'decoration_color_form_bloc.dart';
import 'decoration_color_form_event.dart';
import 'decoration_color_form_state.dart';


class DecorationColorForm extends StatelessWidget {
  FormAction formAction;
  DecorationColorModel value;
  ActionModel submitAction;

  DecorationColorForm({Key key, @required this.formAction, @required this.value, this.submitAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (formAction == FormAction.ShowData) {
      return BlocProvider<DecorationColorFormBloc >(
            create: (context) => DecorationColorFormBloc(
                                       
                                                )..add(InitialiseDecorationColorFormEvent(value: value)),
  
        child: MyDecorationColorForm(submitAction: submitAction, formAction: formAction),
          );
    } if (formAction == FormAction.ShowPreloadedData) {
      return BlocProvider<DecorationColorFormBloc >(
            create: (context) => DecorationColorFormBloc(
                                       
                                                )..add(InitialiseDecorationColorFormNoLoadEvent(value: value)),
  
        child: MyDecorationColorForm(submitAction: submitAction, formAction: formAction),
          );
    } else {
      return Scaffold(
        appBar: formAction == FormAction.UpdateAction ?
                AppBar(
                    title: Text("Update DecorationColor", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formAppBarTextColor))),
                    flexibleSpace: Container(
                        decoration: BoxDecorationHelper.boxDecoration(GlobalData.app().formAppBarBackground)),
                  ) :
                AppBar(
                    title: Text("Add DecorationColor", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formAppBarTextColor))),
                    flexibleSpace: Container(
                        decoration: BoxDecorationHelper.boxDecoration(GlobalData.app().formAppBarBackground)),
                ),
        body: BlocProvider<DecorationColorFormBloc >(
            create: (context) => DecorationColorFormBloc(
                                       
                                                )..add((formAction == FormAction.UpdateAction ? InitialiseDecorationColorFormEvent(value: value) : InitialiseNewDecorationColorFormEvent())),
  
        child: MyDecorationColorForm(submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}


class MyDecorationColorForm extends StatefulWidget {
  final FormAction formAction;
  final ActionModel submitAction;

  MyDecorationColorForm({this.formAction, this.submitAction});

  _MyDecorationColorFormState createState() => _MyDecorationColorFormState(this.formAction);
}


class _MyDecorationColorFormState extends State<MyDecorationColorForm> {
  final FormAction formAction;
  DecorationColorFormBloc _myFormBloc;

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
    return BlocBuilder<DecorationColorFormBloc, DecorationColorFormState>(builder: (context, state) {
      if (state is DecorationColorFormUninitialized) return Center(
        child: CircularProgressIndicator(),
      );

      if (state is DecorationColorFormLoaded) {
        if (state.value.documentID != null)
          _documentIDController.text = state.value.documentID.toString();
        else
          _documentIDController.text = "";
        if (state.value.stop != null)
          _stopController.text = state.value.stop.toString();
        else
          _stopController.text = "";
      }
      if (state is DecorationColorFormInitialized) {
        List<Widget> children = List();
        children.add(

                RgbField("Background Color", state.value.color, _onColorChanged)
          );

        children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor)),
                  readOnly: _readOnly(state),
                  controller: _stopController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: GlobalData.app().formFieldFocusColor))),                    icon: Icon(Icons.color_lens, color: RgbHelper.color(rgbo: GlobalData.app().formFieldHeaderColor)),
                    labelText: 'Stop (-1 = no stop)',
                  ),
                  keyboardType: TextInputType.number,
                  autovalidate: true,
                  validator: (_) {
                    return state is StopDecorationColorFormError ? state.message : null;
                  },
                ),
          );


        if ((formAction != FormAction.ShowData) && (formAction != FormAction.ShowPreloadedData))
          children.add(RaisedButton(
                  color: RgbHelper.color(rgbo: GlobalData.app().formSubmitButtonColor),
                  onPressed: _readOnly(state) ? null : () {
                    if (state is DecorationColorFormError) {
                      return null;
                    } else {
                      if (formAction == FormAction.UpdateAction) {
                        BlocProvider.of<DecorationColorListBloc>(context).add(
                          UpdateDecorationColorList(value: state.value.copyWith(
                              documentID: state.value.documentID, 
                              color: state.value.color, 
                              stop: state.value.stop, 
                        )));
                      } else {
                        BlocProvider.of<DecorationColorListBloc>(context).add(
                          AddDecorationColorList(value: DecorationColorModel(
                              documentID: state.value.documentID, 
                              color: state.value.color, 
                              stop: state.value.stop, 
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
                  child: Text('Submit', style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formSubmitButtonTextColor))),
                ));

        return Container(
          color: ((formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData)) ? Colors.transparent : null,
          decoration: ((formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData)) ? null : BoxDecorationHelper.boxDecoration(GlobalData.app().formBackground),
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

  bool _readOnly(DecorationColorFormInitialized state) {
    return (formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData) || (!GlobalData.memberIsOwner());
  }
  

}



