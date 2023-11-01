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

import 'package:eliud_core/core/blocs/access/state/access_state.dart';
import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core/core/navigate/router.dart' as eliudrouter;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/style/style_registry.dart';




import 'package:eliud_core/model/internal_component.dart';

import 'package:eliud_core/tools/enums.dart';

import 'package:eliud_core/model/model_export.dart';

import 'package:eliud_core/model/member_subscription_list_bloc.dart';
import 'package:eliud_core/model/member_subscription_list_event.dart';
import 'package:eliud_core/model/member_subscription_form_bloc.dart';
import 'package:eliud_core/model/member_subscription_form_event.dart';
import 'package:eliud_core/model/member_subscription_form_state.dart';


class MemberSubscriptionForm extends StatelessWidget {
  final AppModel app;
  FormAction formAction;
  MemberSubscriptionModel? value;
  ActionModel? submitAction;

  MemberSubscriptionForm({Key? key, required this.app, required this.formAction, required this.value, this.submitAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    var appId = app.documentID;
    if (formAction == FormAction.ShowData) {
      return BlocProvider<MemberSubscriptionFormBloc >(
            create: (context) => MemberSubscriptionFormBloc(appId,
                                       
                                                )..add(InitialiseMemberSubscriptionFormEvent(value: value)),
  
        child: MyMemberSubscriptionForm(app:app, submitAction: submitAction, formAction: formAction),
          );
    } if (formAction == FormAction.ShowPreloadedData) {
      return BlocProvider<MemberSubscriptionFormBloc >(
            create: (context) => MemberSubscriptionFormBloc(appId,
                                       
                                                )..add(InitialiseMemberSubscriptionFormNoLoadEvent(value: value)),
  
        child: MyMemberSubscriptionForm(app:app, submitAction: submitAction, formAction: formAction),
          );
    } else {
      return Scaffold(
        appBar: StyleRegistry.registry().styleWithApp(app).adminFormStyle().appBarWithString(app, context, title: formAction == FormAction.UpdateAction ? 'Update MemberSubscription' : 'Add MemberSubscription'),
        body: BlocProvider<MemberSubscriptionFormBloc >(
            create: (context) => MemberSubscriptionFormBloc(appId,
                                       
                                                )..add((formAction == FormAction.UpdateAction ? InitialiseMemberSubscriptionFormEvent(value: value) : InitialiseNewMemberSubscriptionFormEvent())),
  
        child: MyMemberSubscriptionForm(app: app, submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}


class MyMemberSubscriptionForm extends StatefulWidget {
  final AppModel app;
  final FormAction? formAction;
  final ActionModel? submitAction;

  MyMemberSubscriptionForm({required this.app, this.formAction, this.submitAction});

  _MyMemberSubscriptionFormState createState() => _MyMemberSubscriptionFormState(this.formAction);
}


class _MyMemberSubscriptionFormState extends State<MyMemberSubscriptionForm> {
  final FormAction? formAction;
  late MemberSubscriptionFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  String? _app;


  _MyMemberSubscriptionFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<MemberSubscriptionFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
  }

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<MemberSubscriptionFormBloc, MemberSubscriptionFormState>(builder: (context, state) {
      if (state is MemberSubscriptionFormUninitialized) return Center(
        child: StyleRegistry.registry().styleWithApp(widget.app).adminListStyle().progressIndicator(widget.app, context),
      );

      if (state is MemberSubscriptionFormLoaded) {
        if (state.value!.documentID != null)
          _documentIDController.text = state.value!.documentID.toString();
        else
          _documentIDController.text = "";
        if (state.value!.app != null)
          _app= state.value!.app!.documentID;
        else
          _app= "";
      }
      if (state is MemberSubscriptionFormInitialized) {
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
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'App')
                ));

        children.add(

                DropdownButtonComponentFactory().createNew(app: widget.app, id: "apps", value: _app, trigger: (value, privilegeLevel) => _onAppSelected(value), optional: false),
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


        if ((formAction != FormAction.ShowData) && (formAction != FormAction.ShowPreloadedData))
          children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().button(widget.app, context, label: 'Submit',
                  onPressed: _readOnly(accessState, state) ? null : () {
                    if (state is MemberSubscriptionFormError) {
                      return null;
                    } else {
                      if (formAction == FormAction.UpdateAction) {
                        BlocProvider.of<MemberSubscriptionListBloc>(context).add(
                          UpdateMemberSubscriptionList(value: state.value!.copyWith(
                              documentID: state.value!.documentID, 
                              app: state.value!.app, 
                        )));
                      } else {
                        BlocProvider.of<MemberSubscriptionListBloc>(context).add(
                          AddMemberSubscriptionList(value: MemberSubscriptionModel(
                              documentID: state.value!.documentID, 
                              app: state.value!.app, 
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
    _myFormBloc.add(ChangedMemberSubscriptionDocumentID(value: _documentIDController.text));
  }


  void _onAppSelected(String? val) {
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

  bool _readOnly(AccessState accessState, MemberSubscriptionFormInitialized state) {
    return (formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData) || (!accessState.memberIsOwner(widget.app.documentID));
  }
  

}



