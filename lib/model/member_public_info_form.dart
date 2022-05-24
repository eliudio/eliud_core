/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_public_info_form.dart
                       
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

import 'package:eliud_core/model/member_public_info_list_bloc.dart';
import 'package:eliud_core/model/member_public_info_list_event.dart';
import 'package:eliud_core/model/member_public_info_model.dart';
import 'package:eliud_core/model/member_public_info_form_bloc.dart';
import 'package:eliud_core/model/member_public_info_form_event.dart';
import 'package:eliud_core/model/member_public_info_form_state.dart';


class MemberPublicInfoForm extends StatelessWidget {
  final AppModel app;
  FormAction formAction;
  MemberPublicInfoModel? value;
  ActionModel? submitAction;

  MemberPublicInfoForm({Key? key, required this.app, required this.formAction, required this.value, this.submitAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    var appId = app.documentID;
    if (formAction == FormAction.ShowData) {
      return BlocProvider<MemberPublicInfoFormBloc >(
            create: (context) => MemberPublicInfoFormBloc(appId,
                                       formAction: formAction,

                                                )..add(InitialiseMemberPublicInfoFormEvent(value: value)),
  
        child: MyMemberPublicInfoForm(app:app, submitAction: submitAction, formAction: formAction),
          );
    } if (formAction == FormAction.ShowPreloadedData) {
      return BlocProvider<MemberPublicInfoFormBloc >(
            create: (context) => MemberPublicInfoFormBloc(appId,
                                       formAction: formAction,

                                                )..add(InitialiseMemberPublicInfoFormNoLoadEvent(value: value)),
  
        child: MyMemberPublicInfoForm(app:app, submitAction: submitAction, formAction: formAction),
          );
    } else {
      return Scaffold(
        appBar: StyleRegistry.registry().styleWithApp(app).adminFormStyle().appBarWithString(app, context, title: formAction == FormAction.UpdateAction ? 'Update MemberPublicInfo' : 'Add MemberPublicInfo'),
        body: BlocProvider<MemberPublicInfoFormBloc >(
            create: (context) => MemberPublicInfoFormBloc(appId,
                                       formAction: formAction,

                                                )..add((formAction == FormAction.UpdateAction ? InitialiseMemberPublicInfoFormEvent(value: value) : InitialiseNewMemberPublicInfoFormEvent())),
  
        child: MyMemberPublicInfoForm(app: app, submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}


class MyMemberPublicInfoForm extends StatefulWidget {
  final AppModel app;
  final FormAction? formAction;
  final ActionModel? submitAction;

  MyMemberPublicInfoForm({required this.app, this.formAction, this.submitAction});

  _MyMemberPublicInfoFormState createState() => _MyMemberPublicInfoFormState(this.formAction);
}


class _MyMemberPublicInfoFormState extends State<MyMemberPublicInfoForm> {
  final FormAction? formAction;
  late MemberPublicInfoFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _photoURLController = TextEditingController();


  _MyMemberPublicInfoFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<MemberPublicInfoFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
    _nameController.addListener(_onNameChanged);
    _photoURLController.addListener(_onPhotoURLChanged);
  }

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<MemberPublicInfoFormBloc, MemberPublicInfoFormState>(builder: (context, state) {
      if (state is MemberPublicInfoFormUninitialized) return Center(
        child: StyleRegistry.registry().styleWithApp(widget.app).adminListStyle().progressIndicator(widget.app, context),
      );

      if (state is MemberPublicInfoFormLoaded) {
        if (state.value!.documentID != null)
          _documentIDController.text = state.value!.documentID.toString();
        else
          _documentIDController.text = "";
        if (state.value!.name != null)
          _nameController.text = state.value!.name.toString();
        else
          _nameController.text = "";
        if (state.value!.photoURL != null)
          _photoURLController.text = state.value!.photoURL.toString();
        else
          _photoURLController.text = "";
      }
      if (state is MemberPublicInfoFormInitialized) {
        List<Widget> children = [];
         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'General')
                ));

        children.add(

                new Container(
                    height: (fullScreenHeight(context) / 2.5), 
                    child: memberSubscriptionsList(widget.app, context, state.value!.subscriptions, _onSubscriptionsChanged)
                )
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'General')
                ));

        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().textFormField(widget.app, context, labelText: 'User UUID', icon: Icons.vpn_key, readOnly: (formAction == FormAction.UpdateAction), textEditingController: _documentIDController, keyboardType: TextInputType.text, validator: (_) => state is DocumentIDMemberPublicInfoFormError ? state.message : null, hintText: 'field.remark')
          );

        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().textFormField(widget.app, context, labelText: 'Name', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _nameController, keyboardType: TextInputType.text, validator: (_) => state is NameMemberPublicInfoFormError ? state.message : null, hintText: null)
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


        if ((formAction != FormAction.ShowData) && (formAction != FormAction.ShowPreloadedData))
          children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().button(widget.app, context, label: 'Submit',
                  onPressed: _readOnly(accessState, state) ? null : () {
                    if (state is MemberPublicInfoFormError) {
                      return null;
                    } else {
                      if (formAction == FormAction.UpdateAction) {
                        BlocProvider.of<MemberPublicInfoListBloc>(context).add(
                          UpdateMemberPublicInfoList(value: state.value!.copyWith(
                              documentID: state.value!.documentID, 
                              name: state.value!.name, 
                              photoURL: state.value!.photoURL, 
                              subscriptions: state.value!.subscriptions, 
                        )));
                      } else {
                        BlocProvider.of<MemberPublicInfoListBloc>(context).add(
                          AddMemberPublicInfoList(value: MemberPublicInfoModel(
                              documentID: state.value!.documentID, 
                              name: state.value!.name, 
                              photoURL: state.value!.photoURL, 
                              subscriptions: state.value!.subscriptions, 
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
    _myFormBloc.add(ChangedMemberPublicInfoDocumentID(value: _documentIDController.text));
  }


  void _onNameChanged() {
    _myFormBloc.add(ChangedMemberPublicInfoName(value: _nameController.text));
  }


  void _onPhotoURLChanged() {
    _myFormBloc.add(ChangedMemberPublicInfoPhotoURL(value: _photoURLController.text));
  }


  void _onSubscriptionsChanged(value) {
    _myFormBloc.add(ChangedMemberPublicInfoSubscriptions(value: value));
    setState(() {});
  }



  @override
  void dispose() {
    _documentIDController.dispose();
    _nameController.dispose();
    _photoURLController.dispose();
    super.dispose();
  }

  bool _readOnly(AccessState accessState, MemberPublicInfoFormInitialized state) {
    return (formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData) || (!accessState.memberIsOwner(widget.app.documentID));
  }
  

}



