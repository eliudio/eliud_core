/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_subscription_form.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/core/global_data.dart';
import 'package:eliud_core/core/app/app_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';
import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/app/app_state.dart';
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
import 'package:eliud_core/tools/bespoke_formfields.dart';
import 'package:eliud_core/tools/bespoke_formfields.dart';

import 'package:eliud_core/tools/enums.dart';
import 'package:eliud_core/tools/etc.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/embedded_component.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_core/model/entity_export.dart';

import 'package:eliud_core/model/member_subscription_list_bloc.dart';
import 'package:eliud_core/model/member_subscription_list_event.dart';
import 'package:eliud_core/model/member_subscription_model.dart';
import 'package:eliud_core/model/member_subscription_form_bloc.dart';
import 'package:eliud_core/model/member_subscription_form_event.dart';
import 'package:eliud_core/model/member_subscription_form_state.dart';


class MemberSubscriptionForm extends StatelessWidget {
  FormAction formAction;
  MemberSubscriptionModel value;
  ActionModel submitAction;

  MemberSubscriptionForm({Key key, @required this.formAction, @required this.value, this.submitAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var app = AppBloc.app(context);
    var accessState = AccessBloc.getState(context);
    var appState = AppBloc.getState(context);
    if (formAction == FormAction.ShowData) {
      return BlocProvider<MemberSubscriptionFormBloc >(
            create: (context) => MemberSubscriptionFormBloc(AppBloc.appId(context),
                                       
                                                )..add(InitialiseMemberSubscriptionFormEvent(value: value)),
  
        child: MyMemberSubscriptionForm(submitAction: submitAction, formAction: formAction),
          );
    } if (formAction == FormAction.ShowPreloadedData) {
      return BlocProvider<MemberSubscriptionFormBloc >(
            create: (context) => MemberSubscriptionFormBloc(AppBloc.appId(context),
                                       
                                                )..add(InitialiseMemberSubscriptionFormNoLoadEvent(value: value)),
  
        child: MyMemberSubscriptionForm(submitAction: submitAction, formAction: formAction),
          );
    } else {
      return Scaffold(
        appBar: formAction == FormAction.UpdateAction ?
                AppBar(
                    title: Text("Update MemberSubscription", style: TextStyle(color: RgbHelper.color(rgbo: app.formAppBarTextColor))),
                    flexibleSpace: Container(
                        decoration: BoxDecorationHelper.boxDecoration(accessState, app.formAppBarBackground)),
                  ) :
                AppBar(
                    title: Text("Add MemberSubscription", style: TextStyle(color: RgbHelper.color(rgbo: app.formAppBarTextColor))),
                    flexibleSpace: Container(
                        decoration: BoxDecorationHelper.boxDecoration(accessState, app.formAppBarBackground)),
                ),
        body: BlocProvider<MemberSubscriptionFormBloc >(
            create: (context) => MemberSubscriptionFormBloc(AppBloc.appId(context),
                                       
                                                )..add((formAction == FormAction.UpdateAction ? InitialiseMemberSubscriptionFormEvent(value: value) : InitialiseNewMemberSubscriptionFormEvent())),
  
        child: MyMemberSubscriptionForm(submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}


class MyMemberSubscriptionForm extends StatefulWidget {
  final FormAction formAction;
  final ActionModel submitAction;

  MyMemberSubscriptionForm({this.formAction, this.submitAction});

  _MyMemberSubscriptionFormState createState() => _MyMemberSubscriptionFormState(this.formAction);
}


class _MyMemberSubscriptionFormState extends State<MyMemberSubscriptionForm> {
  final FormAction formAction;
  MemberSubscriptionFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  String _app;


  _MyMemberSubscriptionFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<MemberSubscriptionFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
  }

  @override
  Widget build(BuildContext context) {
    var app = AppBloc.app(context);
    var appState = AppBloc.getState(context);
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<MemberSubscriptionFormBloc, MemberSubscriptionFormState>(builder: (context, state) {
      if (state is MemberSubscriptionFormUninitialized) return Center(
        child: CircularProgressIndicator(),
      );

      if (state is MemberSubscriptionFormLoaded) {
        if (state.value.documentID != null)
          _documentIDController.text = state.value.documentID.toString();
        else
          _documentIDController.text = "";
        if (state.value.app != null)
          _app= state.value.app.documentID;
        else
          _app= "";
      }
      if (state is MemberSubscriptionFormInitialized) {
        List<Widget> children = List();
         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('General',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: app.formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: app.dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('App',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: app.formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                DropdownButtonComponentFactory().createNew(id: "apps", value: _app, trigger: _onAppSelected, optional: false),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: app.dividerColor)));


        if ((formAction != FormAction.ShowData) && (formAction != FormAction.ShowPreloadedData))
          children.add(RaisedButton(
                  color: RgbHelper.color(rgbo: app.formSubmitButtonColor),
                  onPressed: _readOnly(accessState, appState, state) ? null : () {
                    if (state is MemberSubscriptionFormError) {
                      return null;
                    } else {
                      if (formAction == FormAction.UpdateAction) {
                        BlocProvider.of<MemberSubscriptionListBloc>(context).add(
                          UpdateMemberSubscriptionList(value: state.value.copyWith(
                              documentID: state.value.documentID, 
                              app: state.value.app, 
                        )));
                      } else {
                        BlocProvider.of<MemberSubscriptionListBloc>(context).add(
                          AddMemberSubscriptionList(value: MemberSubscriptionModel(
                              documentID: state.value.documentID, 
                              app: state.value.app, 
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
                  child: Text('Submit', style: TextStyle(color: RgbHelper.color(rgbo: app.formSubmitButtonTextColor))),
                ));

        return Container(
          color: ((formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData)) ? Colors.transparent : null,
          decoration: ((formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData)) ? null : BoxDecorationHelper.boxDecoration(accessState, app.formBackground),
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
    _myFormBloc.add(ChangedMemberSubscriptionDocumentID(value: _documentIDController.text));
  }


  void _onAppSelected(String val) {
    setState(() {
      _app = val;
    });
    _myFormBloc.add(ChangedMemberSubscriptionApp(value: val));
  }



  @override
  void dispose() {
    _documentIDController.dispose();
    super.dispose();
  }

  bool _readOnly(AccessState accessState, AppState appState, MemberSubscriptionFormInitialized state) {
    return (formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData) || (!accessState.memberIsOwner(appState));
  }
  

}



