/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_form.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/core/widgets/progress_indicator.dart';
import 'package:eliud_core/core/global_data.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';
import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core/core/navigate/router.dart' as eliudrouter;
import 'package:eliud_core/tools/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:eliud_core/tools/common_tools.dart';

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

import 'package:eliud_core/model/member_list_bloc.dart';
import 'package:eliud_core/model/member_list_event.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/model/member_form_bloc.dart';
import 'package:eliud_core/model/member_form_event.dart';
import 'package:eliud_core/model/member_form_state.dart';


class MemberForm extends StatelessWidget {
  FormAction formAction;
  MemberModel? value;
  ActionModel? submitAction;

  MemberForm({Key? key, required this.formAction, required this.value, this.submitAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    var app = AccessBloc.app(context);
    if (app == null) return Text("No app available");
    if (formAction == FormAction.ShowData) {
      return BlocProvider<MemberFormBloc >(
            create: (context) => MemberFormBloc(AccessBloc.appId(context),
                                       
                                                )..add(InitialiseMemberFormEvent(value: value)),
  
        child: MyMemberForm(submitAction: submitAction, formAction: formAction),
          );
    } if (formAction == FormAction.ShowPreloadedData) {
      return BlocProvider<MemberFormBloc >(
            create: (context) => MemberFormBloc(AccessBloc.appId(context),
                                       
                                                )..add(InitialiseMemberFormNoLoadEvent(value: value)),
  
        child: MyMemberForm(submitAction: submitAction, formAction: formAction),
          );
    } else {
      return Scaffold(
        appBar: formAction == FormAction.UpdateAction ?
                AppBar(
                    title: Text("Update Member", style: TextStyle(color: RgbHelper.color(rgbo: app.formAppBarTextColor))),
                    flexibleSpace: Container(
                        decoration: BoxDecorationHelper.boxDecoration(accessState, app.formAppBarBackground)),
                  ) :
                AppBar(
                    title: Text("Add Member", style: TextStyle(color: RgbHelper.color(rgbo: app.formAppBarTextColor))),
                    flexibleSpace: Container(
                        decoration: BoxDecorationHelper.boxDecoration(accessState, app.formAppBarBackground)),
                ),
        body: BlocProvider<MemberFormBloc >(
            create: (context) => MemberFormBloc(AccessBloc.appId(context),
                                       
                                                )..add((formAction == FormAction.UpdateAction ? InitialiseMemberFormEvent(value: value) : InitialiseNewMemberFormEvent())),
  
        child: MyMemberForm(submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}


class MyMemberForm extends StatefulWidget {
  final FormAction? formAction;
  final ActionModel? submitAction;

  MyMemberForm({this.formAction, this.submitAction});

  _MyMemberFormState createState() => _MyMemberFormState(this.formAction);
}


class _MyMemberFormState extends State<MyMemberForm> {
  final FormAction? formAction;
  late MemberFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _photoURLController = TextEditingController();
  final TextEditingController _shipStreet1Controller = TextEditingController();
  final TextEditingController _shipStreet2Controller = TextEditingController();
  final TextEditingController _shipCityController = TextEditingController();
  final TextEditingController _shipStateController = TextEditingController();
  final TextEditingController _postcodeController = TextEditingController();
  String? _country;
  bool? _invoiceSameSelection;
  final TextEditingController _invoiceStreet1Controller = TextEditingController();
  final TextEditingController _invoiceStreet2Controller = TextEditingController();
  final TextEditingController _invoiceCityController = TextEditingController();
  final TextEditingController _invoiceStateController = TextEditingController();
  final TextEditingController _invoicePostcodeController = TextEditingController();
  String? _invoiceCountry;
  final TextEditingController _emailController = TextEditingController();
  bool? _isAnonymousSelection;


  _MyMemberFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<MemberFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
    _nameController.addListener(_onNameChanged);
    _photoURLController.addListener(_onPhotoURLChanged);
    _shipStreet1Controller.addListener(_onShipStreet1Changed);
    _shipStreet2Controller.addListener(_onShipStreet2Changed);
    _shipCityController.addListener(_onShipCityChanged);
    _shipStateController.addListener(_onShipStateChanged);
    _postcodeController.addListener(_onPostcodeChanged);
    _invoiceSameSelection = false;
    _invoiceStreet1Controller.addListener(_onInvoiceStreet1Changed);
    _invoiceStreet2Controller.addListener(_onInvoiceStreet2Changed);
    _invoiceCityController.addListener(_onInvoiceCityChanged);
    _invoiceStateController.addListener(_onInvoiceStateChanged);
    _invoicePostcodeController.addListener(_onInvoicePostcodeChanged);
    _emailController.addListener(_onEmailChanged);
    _isAnonymousSelection = false;
  }

  @override
  Widget build(BuildContext context) {
    var app = AccessBloc.app(context);
    if (app == null) return Text('No app available');
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<MemberFormBloc, MemberFormState>(builder: (context, state) {
      if (state is MemberFormUninitialized) return Center(
        child: DelayedCircularProgressIndicator(),
      );

      if (state is MemberFormLoaded) {
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
        if (state.value!.shipStreet1 != null)
          _shipStreet1Controller.text = state.value!.shipStreet1.toString();
        else
          _shipStreet1Controller.text = "";
        if (state.value!.shipStreet2 != null)
          _shipStreet2Controller.text = state.value!.shipStreet2.toString();
        else
          _shipStreet2Controller.text = "";
        if (state.value!.shipCity != null)
          _shipCityController.text = state.value!.shipCity.toString();
        else
          _shipCityController.text = "";
        if (state.value!.shipState != null)
          _shipStateController.text = state.value!.shipState.toString();
        else
          _shipStateController.text = "";
        if (state.value!.postcode != null)
          _postcodeController.text = state.value!.postcode.toString();
        else
          _postcodeController.text = "";
        if (state.value!.country != null)
          _country= state.value!.country!.documentID;
        else
          _country= "";
        if (state.value!.invoiceSame != null)
        _invoiceSameSelection = state.value!.invoiceSame;
        else
        _invoiceSameSelection = false;
        if (state.value!.invoiceStreet1 != null)
          _invoiceStreet1Controller.text = state.value!.invoiceStreet1.toString();
        else
          _invoiceStreet1Controller.text = "";
        if (state.value!.invoiceStreet2 != null)
          _invoiceStreet2Controller.text = state.value!.invoiceStreet2.toString();
        else
          _invoiceStreet2Controller.text = "";
        if (state.value!.invoiceCity != null)
          _invoiceCityController.text = state.value!.invoiceCity.toString();
        else
          _invoiceCityController.text = "";
        if (state.value!.invoiceState != null)
          _invoiceStateController.text = state.value!.invoiceState.toString();
        else
          _invoiceStateController.text = "";
        if (state.value!.invoicePostcode != null)
          _invoicePostcodeController.text = state.value!.invoicePostcode.toString();
        else
          _invoicePostcodeController.text = "";
        if (state.value!.invoiceCountry != null)
          _invoiceCountry= state.value!.invoiceCountry!.documentID;
        else
          _invoiceCountry= "";
        if (state.value!.email != null)
          _emailController.text = state.value!.email.toString();
        else
          _emailController.text = "";
        if (state.value!.isAnonymous != null)
        _isAnonymousSelection = state.value!.isAnonymous;
        else
        _isAnonymousSelection = false;
      }
      if (state is MemberFormInitialized) {
        List<Widget> children = [];
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
                  child: Text('General',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: app.formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor)),
                  readOnly: true,
                  controller: _documentIDController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldFocusColor))),                    icon: Icon(Icons.vpn_key, color: RgbHelper.color(rgbo: app.formFieldHeaderColor)),
                    labelText: 'User UUID',
                    hintText: "User UUID",
                  ),
                  keyboardType: TextInputType.text,
                  autovalidate: true,
                  validator: (_) {
                    return state is DocumentIDMemberFormError ? state.message : null;
                  },
                ),
          );

        children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor)),
                  readOnly: _readOnly(accessState, state),
                  controller: _nameController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldFocusColor))),                    icon: Icon(Icons.text_format, color: RgbHelper.color(rgbo: app.formFieldHeaderColor)),
                    labelText: 'Name',
                  ),
                  keyboardType: TextInputType.text,
                  autovalidate: true,
                  validator: (_) {
                    return state is NameMemberFormError ? state.message : null;
                  },
                ),
          );

        children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor)),
                  readOnly: _readOnly(accessState, state),
                  controller: _emailController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldFocusColor))),                    icon: Icon(Icons.text_format, color: RgbHelper.color(rgbo: app.formFieldHeaderColor)),
                    labelText: 'Email address',
                  ),
                  keyboardType: TextInputType.text,
                  autovalidate: true,
                  validator: (_) {
                    return state is EmailMemberFormError ? state.message : null;
                  },
                ),
          );

        children.add(

                CheckboxListTile(
                    title: Text('Is Anonymous', style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    value: _isAnonymousSelection,
                    onChanged: _readOnly(accessState, state) ? null : (dynamic val) {
                      setSelectionIsAnonymous(val);
                    }),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: app.dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Subscriptions',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: app.formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                new Container(
                    height: (fullScreenHeight(context) / 2.5), 
                    child: memberSubscriptionsList(context, state.value!.subscriptions, _onSubscriptionsChanged)
                )
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: app.dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Cart',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: app.formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: app.dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('User Group',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: app.formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: app.dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Access',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: app.formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: app.dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Shipping Address',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: app.formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor)),
                  readOnly: _readOnly(accessState, state),
                  controller: _shipStreet1Controller,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldFocusColor))),                    icon: Icon(Icons.text_format, color: RgbHelper.color(rgbo: app.formFieldHeaderColor)),
                    labelText: 'Street Address',
                  ),
                  keyboardType: TextInputType.text,
                  autovalidate: true,
                  validator: (_) {
                    return state is ShipStreet1MemberFormError ? state.message : null;
                  },
                ),
          );

        children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor)),
                  readOnly: _readOnly(accessState, state),
                  controller: _shipStreet2Controller,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldFocusColor))),                    icon: Icon(Icons.text_format, color: RgbHelper.color(rgbo: app.formFieldHeaderColor)),
                    labelText: 'Street Address Line 2',
                  ),
                  keyboardType: TextInputType.text,
                  autovalidate: true,
                  validator: (_) {
                    return state is ShipStreet2MemberFormError ? state.message : null;
                  },
                ),
          );

        children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor)),
                  readOnly: _readOnly(accessState, state),
                  controller: _shipCityController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldFocusColor))),                    icon: Icon(Icons.text_format, color: RgbHelper.color(rgbo: app.formFieldHeaderColor)),
                    labelText: 'City',
                  ),
                  keyboardType: TextInputType.text,
                  autovalidate: true,
                  validator: (_) {
                    return state is ShipCityMemberFormError ? state.message : null;
                  },
                ),
          );

        children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor)),
                  readOnly: _readOnly(accessState, state),
                  controller: _shipStateController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldFocusColor))),                    icon: Icon(Icons.text_format, color: RgbHelper.color(rgbo: app.formFieldHeaderColor)),
                    labelText: 'State/Province',
                  ),
                  keyboardType: TextInputType.text,
                  autovalidate: true,
                  validator: (_) {
                    return state is ShipStateMemberFormError ? state.message : null;
                  },
                ),
          );

        children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor)),
                  readOnly: _readOnly(accessState, state),
                  controller: _postcodeController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldFocusColor))),                    icon: Icon(Icons.text_format, color: RgbHelper.color(rgbo: app.formFieldHeaderColor)),
                    labelText: 'Postal / Zip Code',
                  ),
                  keyboardType: TextInputType.text,
                  autovalidate: true,
                  validator: (_) {
                    return state is PostcodeMemberFormError ? state.message : null;
                  },
                ),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: app.dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Shipping Country',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: app.formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                DropdownButtonComponentFactory().createNew(id: "countrys", value: _country, trigger: _onCountrySelected, optional: false),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: app.dividerColor)));


        if ((state.value!.invoiceSame == null) || (!state.value!.invoiceSame!)) children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Invoice Address',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: app.formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                CheckboxListTile(
                    title: Text('Invoice address same as shipping address', style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    value: _invoiceSameSelection,
                    onChanged: _readOnly(accessState, state) ? null : (dynamic val) {
                      setSelectionInvoiceSame(val);
                    }),
          );

        if (((state.value!.invoiceSame == null) || (!state.value!.invoiceSame!))) children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor)),
                  readOnly: _readOnly(accessState, state),
                  controller: _invoiceStreet1Controller,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldFocusColor))),                    icon: Icon(Icons.text_format, color: RgbHelper.color(rgbo: app.formFieldHeaderColor)),
                    labelText: 'Street Address',
                  ),
                  keyboardType: TextInputType.text,
                  autovalidate: true,
                  validator: (_) {
                    return state is InvoiceStreet1MemberFormError ? state.message : null;
                  },
                ),
          );

        if (((state.value!.invoiceSame == null) || (!state.value!.invoiceSame!))) children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor)),
                  readOnly: _readOnly(accessState, state),
                  controller: _invoiceStreet2Controller,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldFocusColor))),                    icon: Icon(Icons.text_format, color: RgbHelper.color(rgbo: app.formFieldHeaderColor)),
                    labelText: 'Street Address Line 2',
                  ),
                  keyboardType: TextInputType.text,
                  autovalidate: true,
                  validator: (_) {
                    return state is InvoiceStreet2MemberFormError ? state.message : null;
                  },
                ),
          );

        if (((state.value!.invoiceSame == null) || (!state.value!.invoiceSame!))) children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor)),
                  readOnly: _readOnly(accessState, state),
                  controller: _invoiceCityController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldFocusColor))),                    icon: Icon(Icons.text_format, color: RgbHelper.color(rgbo: app.formFieldHeaderColor)),
                    labelText: 'City',
                  ),
                  keyboardType: TextInputType.text,
                  autovalidate: true,
                  validator: (_) {
                    return state is InvoiceCityMemberFormError ? state.message : null;
                  },
                ),
          );

        if (((state.value!.invoiceSame == null) || (!state.value!.invoiceSame!))) children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor)),
                  readOnly: _readOnly(accessState, state),
                  controller: _invoiceStateController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldFocusColor))),                    icon: Icon(Icons.text_format, color: RgbHelper.color(rgbo: app.formFieldHeaderColor)),
                    labelText: 'State/Province',
                  ),
                  keyboardType: TextInputType.text,
                  autovalidate: true,
                  validator: (_) {
                    return state is InvoiceStateMemberFormError ? state.message : null;
                  },
                ),
          );

        if (((state.value!.invoiceSame == null) || (!state.value!.invoiceSame!))) children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor)),
                  readOnly: _readOnly(accessState, state),
                  controller: _invoicePostcodeController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldFocusColor))),                    icon: Icon(Icons.text_format, color: RgbHelper.color(rgbo: app.formFieldHeaderColor)),
                    labelText: 'Postal / Zip Code',
                  ),
                  keyboardType: TextInputType.text,
                  autovalidate: true,
                  validator: (_) {
                    return state is InvoicePostcodeMemberFormError ? state.message : null;
                  },
                ),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: app.dividerColor)));


        if ((state.value!.invoiceSame == null) || (!state.value!.invoiceSame!)) children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Invoice Country',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: app.formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        if (((state.value!.invoiceSame == null) || (!state.value!.invoiceSame!))) children.add(

                DropdownButtonComponentFactory().createNew(id: "countrys", value: _invoiceCountry, trigger: _onInvoiceCountrySelected, optional: false),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: app.dividerColor)));


        if ((formAction != FormAction.ShowData) && (formAction != FormAction.ShowPreloadedData))
          children.add(RaisedButton(
                  color: RgbHelper.color(rgbo: app.formSubmitButtonColor),
                  onPressed: _readOnly(accessState, state) ? null : () {
                    if (state is MemberFormError) {
                      return null;
                    } else {
                      if (formAction == FormAction.UpdateAction) {
                        BlocProvider.of<MemberListBloc>(context).add(
                          UpdateMemberList(value: state.value!.copyWith(
                              documentID: state.value!.documentID, 
                              name: state.value!.name, 
                              subscriptions: state.value!.subscriptions, 
                              subscriptionsAsString: state.value!.subscriptionsAsString, 
                              photoURL: state.value!.photoURL, 
                              shipStreet1: state.value!.shipStreet1, 
                              shipStreet2: state.value!.shipStreet2, 
                              shipCity: state.value!.shipCity, 
                              shipState: state.value!.shipState, 
                              postcode: state.value!.postcode, 
                              country: state.value!.country, 
                              invoiceSame: state.value!.invoiceSame, 
                              invoiceStreet1: state.value!.invoiceStreet1, 
                              invoiceStreet2: state.value!.invoiceStreet2, 
                              invoiceCity: state.value!.invoiceCity, 
                              invoiceState: state.value!.invoiceState, 
                              invoicePostcode: state.value!.invoicePostcode, 
                              invoiceCountry: state.value!.invoiceCountry, 
                              readAccess: state.value!.readAccess, 
                              email: state.value!.email, 
                              isAnonymous: state.value!.isAnonymous, 
                        )));
                      } else {
                        BlocProvider.of<MemberListBloc>(context).add(
                          AddMemberList(value: MemberModel(
                              documentID: state.value!.documentID, 
                              name: state.value!.name, 
                              subscriptions: state.value!.subscriptions, 
                              subscriptionsAsString: state.value!.subscriptionsAsString, 
                              photoURL: state.value!.photoURL, 
                              shipStreet1: state.value!.shipStreet1, 
                              shipStreet2: state.value!.shipStreet2, 
                              shipCity: state.value!.shipCity, 
                              shipState: state.value!.shipState, 
                              postcode: state.value!.postcode, 
                              country: state.value!.country, 
                              invoiceSame: state.value!.invoiceSame, 
                              invoiceStreet1: state.value!.invoiceStreet1, 
                              invoiceStreet2: state.value!.invoiceStreet2, 
                              invoiceCity: state.value!.invoiceCity, 
                              invoiceState: state.value!.invoiceState, 
                              invoicePostcode: state.value!.invoicePostcode, 
                              invoiceCountry: state.value!.invoiceCountry, 
                              readAccess: state.value!.readAccess, 
                              email: state.value!.email, 
                              isAnonymous: state.value!.isAnonymous, 
                          )));
                      }
                      if (widget.submitAction != null) {
                        eliudrouter.Router.navigateTo(context, widget.submitAction!);
                      } else {
                        Navigator.pop(context);
                      }
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
              children: children as List<Widget>
            ),
          )
        );
      } else {
        return DelayedCircularProgressIndicator();
      }
    });
  }

  void _onDocumentIDChanged() {
    _myFormBloc.add(ChangedMemberDocumentID(value: _documentIDController.text));
  }


  void _onNameChanged() {
    _myFormBloc.add(ChangedMemberName(value: _nameController.text));
  }


  void _onSubscriptionsChanged(value) {
    _myFormBloc.add(ChangedMemberSubscriptions(value: value));
    setState(() {});
  }


  void _onSubscriptionsAsStringChanged(value) {
    _myFormBloc.add(ChangedMemberSubscriptionsAsString(value: value));
    setState(() {});
  }


  void _onPhotoURLChanged() {
    _myFormBloc.add(ChangedMemberPhotoURL(value: _photoURLController.text));
  }


  void _onShipStreet1Changed() {
    _myFormBloc.add(ChangedMemberShipStreet1(value: _shipStreet1Controller.text));
  }


  void _onShipStreet2Changed() {
    _myFormBloc.add(ChangedMemberShipStreet2(value: _shipStreet2Controller.text));
  }


  void _onShipCityChanged() {
    _myFormBloc.add(ChangedMemberShipCity(value: _shipCityController.text));
  }


  void _onShipStateChanged() {
    _myFormBloc.add(ChangedMemberShipState(value: _shipStateController.text));
  }


  void _onPostcodeChanged() {
    _myFormBloc.add(ChangedMemberPostcode(value: _postcodeController.text));
  }


  void _onCountrySelected(String? val) {
    setState(() {
      _country = val;
    });
    _myFormBloc.add(ChangedMemberCountry(value: val));
  }


  void setSelectionInvoiceSame(bool? val) {
    setState(() {
      _invoiceSameSelection = val;
    });
    _myFormBloc.add(ChangedMemberInvoiceSame(value: val));
  }

  void _onInvoiceStreet1Changed() {
    _myFormBloc.add(ChangedMemberInvoiceStreet1(value: _invoiceStreet1Controller.text));
  }


  void _onInvoiceStreet2Changed() {
    _myFormBloc.add(ChangedMemberInvoiceStreet2(value: _invoiceStreet2Controller.text));
  }


  void _onInvoiceCityChanged() {
    _myFormBloc.add(ChangedMemberInvoiceCity(value: _invoiceCityController.text));
  }


  void _onInvoiceStateChanged() {
    _myFormBloc.add(ChangedMemberInvoiceState(value: _invoiceStateController.text));
  }


  void _onInvoicePostcodeChanged() {
    _myFormBloc.add(ChangedMemberInvoicePostcode(value: _invoicePostcodeController.text));
  }


  void _onInvoiceCountrySelected(String? val) {
    setState(() {
      _invoiceCountry = val;
    });
    _myFormBloc.add(ChangedMemberInvoiceCountry(value: val));
  }


  void _onReadAccessChanged(value) {
    _myFormBloc.add(ChangedMemberReadAccess(value: value));
    setState(() {});
  }


  void _onEmailChanged() {
    _myFormBloc.add(ChangedMemberEmail(value: _emailController.text));
  }


  void setSelectionIsAnonymous(bool? val) {
    setState(() {
      _isAnonymousSelection = val;
    });
    _myFormBloc.add(ChangedMemberIsAnonymous(value: val));
  }


  @override
  void dispose() {
    _documentIDController.dispose();
    _nameController.dispose();
    _photoURLController.dispose();
    _shipStreet1Controller.dispose();
    _shipStreet2Controller.dispose();
    _shipCityController.dispose();
    _shipStateController.dispose();
    _postcodeController.dispose();
    _invoiceStreet1Controller.dispose();
    _invoiceStreet2Controller.dispose();
    _invoiceCityController.dispose();
    _invoiceStateController.dispose();
    _invoicePostcodeController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  bool _readOnly(AccessState accessState, MemberFormInitialized state) {
    return (formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData) || (!((accessState is LoggedIn) && (accessState.member.documentID == state.value!.documentID)));
  }
  

}



class MemberSmallForm extends StatelessWidget {
  FormAction formAction;
  MemberModel? value;
  ActionModel? submitAction;

  MemberSmallForm({Key? key, required this.formAction, required this.value, this.submitAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    var app = AccessBloc.app(context);
    if (app == null) return Text("No app available");
    if (formAction == FormAction.ShowData) {
      return BlocProvider<MemberFormBloc >(
            create: (context) => MemberFormBloc(AccessBloc.appId(context),
                                       
                                                )..add(InitialiseMemberFormEvent(value: value)),
  
        child: MyMemberSmallForm(submitAction: submitAction, formAction: formAction),
          );
    } if (formAction == FormAction.ShowPreloadedData) {
      return BlocProvider<MemberFormBloc >(
            create: (context) => MemberFormBloc(AccessBloc.appId(context),
                                       
                                                )..add(InitialiseMemberFormNoLoadEvent(value: value)),
  
        child: MyMemberSmallForm(submitAction: submitAction, formAction: formAction),
          );
    } else {
      return Scaffold(
        appBar: formAction == FormAction.UpdateAction ?
                AppBar(
                    title: Text("Update Member", style: TextStyle(color: RgbHelper.color(rgbo: app.formAppBarTextColor))),
                    flexibleSpace: Container(
                        decoration: BoxDecorationHelper.boxDecoration(accessState, app.formAppBarBackground)),
                  ) :
                AppBar(
                    title: Text("Add Member", style: TextStyle(color: RgbHelper.color(rgbo: app.formAppBarTextColor))),
                    flexibleSpace: Container(
                        decoration: BoxDecorationHelper.boxDecoration(accessState, app.formAppBarBackground)),
                ),
        body: BlocProvider<MemberFormBloc >(
            create: (context) => MemberFormBloc(AccessBloc.appId(context),
                                       
                                                )..add((formAction == FormAction.UpdateAction ? InitialiseMemberFormEvent(value: value) : InitialiseNewMemberFormEvent())),
  
        child: MyMemberSmallForm(submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}


class MyMemberSmallForm extends StatefulWidget {
  final FormAction? formAction;
  final ActionModel? submitAction;

  MyMemberSmallForm({this.formAction, this.submitAction});

  _MyMemberSmallFormState createState() => _MyMemberSmallFormState(this.formAction);
}


class _MyMemberSmallFormState extends State<MyMemberSmallForm> {
  final FormAction? formAction;
  late MemberFormBloc _myFormBloc;

  final TextEditingController _nameController = TextEditingController();


  _MyMemberSmallFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<MemberFormBloc>(context);
    _nameController.addListener(_onNameChanged);
  }

  @override
  Widget build(BuildContext context) {
    var app = AccessBloc.app(context);
    if (app == null) return Text('No app available');
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<MemberFormBloc, MemberFormState>(builder: (context, state) {
      if (state is MemberFormUninitialized) return Center(
        child: DelayedCircularProgressIndicator(),
      );

      if (state is MemberFormLoaded) {
        if (state.value!.name != null)
          _nameController.text = state.value!.name.toString();
        else
          _nameController.text = "";
      }
      if (state is MemberFormInitialized) {
        List<Widget> children = [];
         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('General',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: app.formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor)),
                  readOnly: _readOnly(accessState, state),
                  controller: _nameController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldFocusColor))),                    icon: Icon(Icons.text_format, color: RgbHelper.color(rgbo: app.formFieldHeaderColor)),
                    labelText: 'Name',
                  ),
                  keyboardType: TextInputType.text,
                  autovalidate: true,
                  validator: (_) {
                    return state is NameMemberFormError ? state.message : null;
                  },
                ),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: app.dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Subscriptions',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: app.formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                new Container(
                    height: (fullScreenHeight(context) / 2.5), 
                    child: memberSubscriptionsList(context, state.value!.subscriptions, _onSubscriptionsChanged)
                )
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: app.dividerColor)));


        if ((formAction != FormAction.ShowData) && (formAction != FormAction.ShowPreloadedData))
          children.add(RaisedButton(
                  color: RgbHelper.color(rgbo: app.formSubmitButtonColor),
                  onPressed: _readOnly(accessState, state) ? null : () {
                    if (state is MemberFormError) {
                      return null;
                    } else {
                      if (formAction == FormAction.UpdateAction) {
                        BlocProvider.of<MemberListBloc>(context).add(
                          UpdateMemberList(value: state.value!.copyWith(
                              name: state.value!.name, 
                              subscriptions: state.value!.subscriptions, 
                        )));
                      } else {
                        BlocProvider.of<MemberListBloc>(context).add(
                          AddMemberList(value: MemberModel(
                              name: state.value!.name, 
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
              children: children as List<Widget>
            ),
          )
        );
      } else {
        return DelayedCircularProgressIndicator();
      }
    });
  }

  void _onNameChanged() {
    _myFormBloc.add(ChangedMemberName(value: _nameController.text));
  }


  void _onSubscriptionsChanged(value) {
    _myFormBloc.add(ChangedMemberSubscriptions(value: value));
    setState(() {});
  }



  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  bool _readOnly(AccessState accessState, MemberFormInitialized state) {
    return (formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData) || (!((accessState is LoggedIn) && (accessState.member.documentID == state.value!.documentID)));
  }
  

}



class MemberAddressForm extends StatelessWidget {
  FormAction formAction;
  MemberModel? value;
  ActionModel? submitAction;

  MemberAddressForm({Key? key, required this.formAction, required this.value, this.submitAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    var app = AccessBloc.app(context);
    if (app == null) return Text("No app available");
    if (formAction == FormAction.ShowData) {
      return BlocProvider<MemberFormBloc >(
            create: (context) => MemberFormBloc(AccessBloc.appId(context),
                                       
                                                )..add(InitialiseMemberFormEvent(value: value)),
  
        child: MyMemberAddressForm(submitAction: submitAction, formAction: formAction),
          );
    } if (formAction == FormAction.ShowPreloadedData) {
      return BlocProvider<MemberFormBloc >(
            create: (context) => MemberFormBloc(AccessBloc.appId(context),
                                       
                                                )..add(InitialiseMemberFormNoLoadEvent(value: value)),
  
        child: MyMemberAddressForm(submitAction: submitAction, formAction: formAction),
          );
    } else {
      return Scaffold(
        appBar: formAction == FormAction.UpdateAction ?
                AppBar(
                    title: Text("Confirm Delivery Address", style: TextStyle(color: RgbHelper.color(rgbo: app.formAppBarTextColor))),
                    flexibleSpace: Container(
                        decoration: BoxDecorationHelper.boxDecoration(accessState, app.formAppBarBackground)),
                  ) :
                AppBar(
                    title: Text("Confirm Delivery Address", style: TextStyle(color: RgbHelper.color(rgbo: app.formAppBarTextColor))),
                    flexibleSpace: Container(
                        decoration: BoxDecorationHelper.boxDecoration(accessState, app.formAppBarBackground)),
                ),
        body: BlocProvider<MemberFormBloc >(
            create: (context) => MemberFormBloc(AccessBloc.appId(context),
                                       
                                                )..add((formAction == FormAction.UpdateAction ? InitialiseMemberFormEvent(value: value) : InitialiseNewMemberFormEvent())),
  
        child: MyMemberAddressForm(submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}


class MyMemberAddressForm extends StatefulWidget {
  final FormAction? formAction;
  final ActionModel? submitAction;

  MyMemberAddressForm({this.formAction, this.submitAction});

  _MyMemberAddressFormState createState() => _MyMemberAddressFormState(this.formAction);
}


class _MyMemberAddressFormState extends State<MyMemberAddressForm> {
  final FormAction? formAction;
  late MemberFormBloc _myFormBloc;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _shipStreet1Controller = TextEditingController();
  final TextEditingController _shipStreet2Controller = TextEditingController();
  final TextEditingController _shipCityController = TextEditingController();
  final TextEditingController _shipStateController = TextEditingController();
  final TextEditingController _postcodeController = TextEditingController();
  String? _country;
  bool? _invoiceSameSelection;
  final TextEditingController _invoiceStreet1Controller = TextEditingController();
  final TextEditingController _invoiceStreet2Controller = TextEditingController();
  final TextEditingController _invoiceCityController = TextEditingController();
  final TextEditingController _invoiceStateController = TextEditingController();
  final TextEditingController _invoicePostcodeController = TextEditingController();
  String? _invoiceCountry;


  _MyMemberAddressFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<MemberFormBloc>(context);
    _nameController.addListener(_onNameChanged);
    _emailController.addListener(_onEmailChanged);
    _shipStreet1Controller.addListener(_onShipStreet1Changed);
    _shipStreet2Controller.addListener(_onShipStreet2Changed);
    _shipCityController.addListener(_onShipCityChanged);
    _shipStateController.addListener(_onShipStateChanged);
    _postcodeController.addListener(_onPostcodeChanged);
    _invoiceSameSelection = false;
    _invoiceStreet1Controller.addListener(_onInvoiceStreet1Changed);
    _invoiceStreet2Controller.addListener(_onInvoiceStreet2Changed);
    _invoiceCityController.addListener(_onInvoiceCityChanged);
    _invoiceStateController.addListener(_onInvoiceStateChanged);
    _invoicePostcodeController.addListener(_onInvoicePostcodeChanged);
  }

  @override
  Widget build(BuildContext context) {
    var app = AccessBloc.app(context);
    if (app == null) return Text('No app available');
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<MemberFormBloc, MemberFormState>(builder: (context, state) {
      if (state is MemberFormUninitialized) return Center(
        child: DelayedCircularProgressIndicator(),
      );

      if (state is MemberFormLoaded) {
        if (state.value!.name != null)
          _nameController.text = state.value!.name.toString();
        else
          _nameController.text = "";
        if (state.value!.email != null)
          _emailController.text = state.value!.email.toString();
        else
          _emailController.text = "";
        if (state.value!.shipStreet1 != null)
          _shipStreet1Controller.text = state.value!.shipStreet1.toString();
        else
          _shipStreet1Controller.text = "";
        if (state.value!.shipStreet2 != null)
          _shipStreet2Controller.text = state.value!.shipStreet2.toString();
        else
          _shipStreet2Controller.text = "";
        if (state.value!.shipCity != null)
          _shipCityController.text = state.value!.shipCity.toString();
        else
          _shipCityController.text = "";
        if (state.value!.shipState != null)
          _shipStateController.text = state.value!.shipState.toString();
        else
          _shipStateController.text = "";
        if (state.value!.postcode != null)
          _postcodeController.text = state.value!.postcode.toString();
        else
          _postcodeController.text = "";
        if (state.value!.country != null)
          _country= state.value!.country!.documentID;
        else
          _country= "";
        if (state.value!.invoiceSame != null)
        _invoiceSameSelection = state.value!.invoiceSame;
        else
        _invoiceSameSelection = false;
        if (state.value!.invoiceStreet1 != null)
          _invoiceStreet1Controller.text = state.value!.invoiceStreet1.toString();
        else
          _invoiceStreet1Controller.text = "";
        if (state.value!.invoiceStreet2 != null)
          _invoiceStreet2Controller.text = state.value!.invoiceStreet2.toString();
        else
          _invoiceStreet2Controller.text = "";
        if (state.value!.invoiceCity != null)
          _invoiceCityController.text = state.value!.invoiceCity.toString();
        else
          _invoiceCityController.text = "";
        if (state.value!.invoiceState != null)
          _invoiceStateController.text = state.value!.invoiceState.toString();
        else
          _invoiceStateController.text = "";
        if (state.value!.invoicePostcode != null)
          _invoicePostcodeController.text = state.value!.invoicePostcode.toString();
        else
          _invoicePostcodeController.text = "";
        if (state.value!.invoiceCountry != null)
          _invoiceCountry= state.value!.invoiceCountry!.documentID;
        else
          _invoiceCountry= "";
      }
      if (state is MemberFormInitialized) {
        List<Widget> children = [];
         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('General',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: app.formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor)),
                  readOnly: _readOnly(accessState, state),
                  controller: _nameController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldFocusColor))),                    icon: Icon(Icons.text_format, color: RgbHelper.color(rgbo: app.formFieldHeaderColor)),
                    labelText: 'Name',
                  ),
                  keyboardType: TextInputType.text,
                  autovalidate: true,
                  validator: (_) {
                    return state is NameMemberFormError ? state.message : null;
                  },
                ),
          );

        children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor)),
                  readOnly: _readOnly(accessState, state),
                  controller: _emailController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldFocusColor))),                    icon: Icon(Icons.text_format, color: RgbHelper.color(rgbo: app.formFieldHeaderColor)),
                    labelText: 'Email address',
                  ),
                  keyboardType: TextInputType.text,
                  autovalidate: true,
                  validator: (_) {
                    return state is EmailMemberFormError ? state.message : null;
                  },
                ),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: app.dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Shipping Address',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: app.formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor)),
                  readOnly: _readOnly(accessState, state),
                  controller: _shipStreet1Controller,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldFocusColor))),                    icon: Icon(Icons.text_format, color: RgbHelper.color(rgbo: app.formFieldHeaderColor)),
                    labelText: 'Street Address',
                  ),
                  keyboardType: TextInputType.text,
                  autovalidate: true,
                  validator: (_) {
                    return state is ShipStreet1MemberFormError ? state.message : null;
                  },
                ),
          );

        children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor)),
                  readOnly: _readOnly(accessState, state),
                  controller: _shipStreet2Controller,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldFocusColor))),                    icon: Icon(Icons.text_format, color: RgbHelper.color(rgbo: app.formFieldHeaderColor)),
                    labelText: 'Street Address Line 2',
                  ),
                  keyboardType: TextInputType.text,
                  autovalidate: true,
                  validator: (_) {
                    return state is ShipStreet2MemberFormError ? state.message : null;
                  },
                ),
          );

        children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor)),
                  readOnly: _readOnly(accessState, state),
                  controller: _shipCityController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldFocusColor))),                    icon: Icon(Icons.text_format, color: RgbHelper.color(rgbo: app.formFieldHeaderColor)),
                    labelText: 'City',
                  ),
                  keyboardType: TextInputType.text,
                  autovalidate: true,
                  validator: (_) {
                    return state is ShipCityMemberFormError ? state.message : null;
                  },
                ),
          );

        children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor)),
                  readOnly: _readOnly(accessState, state),
                  controller: _shipStateController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldFocusColor))),                    icon: Icon(Icons.text_format, color: RgbHelper.color(rgbo: app.formFieldHeaderColor)),
                    labelText: 'State/Province',
                  ),
                  keyboardType: TextInputType.text,
                  autovalidate: true,
                  validator: (_) {
                    return state is ShipStateMemberFormError ? state.message : null;
                  },
                ),
          );

        children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor)),
                  readOnly: _readOnly(accessState, state),
                  controller: _postcodeController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldFocusColor))),                    icon: Icon(Icons.text_format, color: RgbHelper.color(rgbo: app.formFieldHeaderColor)),
                    labelText: 'Postal / Zip Code',
                  ),
                  keyboardType: TextInputType.text,
                  autovalidate: true,
                  validator: (_) {
                    return state is PostcodeMemberFormError ? state.message : null;
                  },
                ),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: app.dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Shipping Country',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: app.formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                DropdownButtonComponentFactory().createNew(id: "countrys", value: _country, trigger: _onCountrySelected, optional: false),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: app.dividerColor)));


        if ((state.value!.invoiceSame == null) || (!state.value!.invoiceSame!)) children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Invoice Address',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: app.formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                CheckboxListTile(
                    title: Text('Invoice address same as shipping address', style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    value: _invoiceSameSelection,
                    onChanged: _readOnly(accessState, state) ? null : (dynamic val) {
                      setSelectionInvoiceSame(val);
                    }),
          );

        if (((state.value!.invoiceSame == null) || (!state.value!.invoiceSame!))) children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor)),
                  readOnly: _readOnly(accessState, state),
                  controller: _invoiceStreet1Controller,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldFocusColor))),                    icon: Icon(Icons.text_format, color: RgbHelper.color(rgbo: app.formFieldHeaderColor)),
                    labelText: 'Street Address',
                  ),
                  keyboardType: TextInputType.text,
                  autovalidate: true,
                  validator: (_) {
                    return state is InvoiceStreet1MemberFormError ? state.message : null;
                  },
                ),
          );

        if (((state.value!.invoiceSame == null) || (!state.value!.invoiceSame!))) children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor)),
                  readOnly: _readOnly(accessState, state),
                  controller: _invoiceStreet2Controller,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldFocusColor))),                    icon: Icon(Icons.text_format, color: RgbHelper.color(rgbo: app.formFieldHeaderColor)),
                    labelText: 'Street Address Line 2',
                  ),
                  keyboardType: TextInputType.text,
                  autovalidate: true,
                  validator: (_) {
                    return state is InvoiceStreet2MemberFormError ? state.message : null;
                  },
                ),
          );

        if (((state.value!.invoiceSame == null) || (!state.value!.invoiceSame!))) children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor)),
                  readOnly: _readOnly(accessState, state),
                  controller: _invoiceCityController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldFocusColor))),                    icon: Icon(Icons.text_format, color: RgbHelper.color(rgbo: app.formFieldHeaderColor)),
                    labelText: 'City',
                  ),
                  keyboardType: TextInputType.text,
                  autovalidate: true,
                  validator: (_) {
                    return state is InvoiceCityMemberFormError ? state.message : null;
                  },
                ),
          );

        if (((state.value!.invoiceSame == null) || (!state.value!.invoiceSame!))) children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor)),
                  readOnly: _readOnly(accessState, state),
                  controller: _invoiceStateController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldFocusColor))),                    icon: Icon(Icons.text_format, color: RgbHelper.color(rgbo: app.formFieldHeaderColor)),
                    labelText: 'State/Province',
                  ),
                  keyboardType: TextInputType.text,
                  autovalidate: true,
                  validator: (_) {
                    return state is InvoiceStateMemberFormError ? state.message : null;
                  },
                ),
          );

        if (((state.value!.invoiceSame == null) || (!state.value!.invoiceSame!))) children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor)),
                  readOnly: _readOnly(accessState, state),
                  controller: _invoicePostcodeController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldFocusColor))),                    icon: Icon(Icons.text_format, color: RgbHelper.color(rgbo: app.formFieldHeaderColor)),
                    labelText: 'Postal / Zip Code',
                  ),
                  keyboardType: TextInputType.text,
                  autovalidate: true,
                  validator: (_) {
                    return state is InvoicePostcodeMemberFormError ? state.message : null;
                  },
                ),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: app.dividerColor)));


        if ((state.value!.invoiceSame == null) || (!state.value!.invoiceSame!)) children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Invoice Country',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: app.formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        if (((state.value!.invoiceSame == null) || (!state.value!.invoiceSame!))) children.add(

                DropdownButtonComponentFactory().createNew(id: "countrys", value: _invoiceCountry, trigger: _onInvoiceCountrySelected, optional: false),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: app.dividerColor)));


        if ((formAction != FormAction.ShowData) && (formAction != FormAction.ShowPreloadedData))
          children.add(RaisedButton(
                  color: RgbHelper.color(rgbo: app.formSubmitButtonColor),
                  onPressed: _readOnly(accessState, state) ? null : () {
                    if (state is MemberFormError) {
                      return null;
                    } else {
                      if (formAction == FormAction.UpdateAction) {
                        BlocProvider.of<MemberListBloc>(context).add(
                          UpdateMemberList(value: state.value!.copyWith(
                              name: state.value!.name, 
                              email: state.value!.email, 
                              shipStreet1: state.value!.shipStreet1, 
                              shipStreet2: state.value!.shipStreet2, 
                              shipCity: state.value!.shipCity, 
                              shipState: state.value!.shipState, 
                              postcode: state.value!.postcode, 
                              country: state.value!.country, 
                              invoiceSame: state.value!.invoiceSame, 
                              invoiceStreet1: state.value!.invoiceStreet1, 
                              invoiceStreet2: state.value!.invoiceStreet2, 
                              invoiceCity: state.value!.invoiceCity, 
                              invoiceState: state.value!.invoiceState, 
                              invoicePostcode: state.value!.invoicePostcode, 
                              invoiceCountry: state.value!.invoiceCountry, 
                        )));
                      } else {
                        BlocProvider.of<MemberListBloc>(context).add(
                          AddMemberList(value: MemberModel(
                              name: state.value!.name, 
                              email: state.value!.email, 
                              shipStreet1: state.value!.shipStreet1, 
                              shipStreet2: state.value!.shipStreet2, 
                              shipCity: state.value!.shipCity, 
                              shipState: state.value!.shipState, 
                              postcode: state.value!.postcode, 
                              country: state.value!.country, 
                              invoiceSame: state.value!.invoiceSame, 
                              invoiceStreet1: state.value!.invoiceStreet1, 
                              invoiceStreet2: state.value!.invoiceStreet2, 
                              invoiceCity: state.value!.invoiceCity, 
                              invoiceState: state.value!.invoiceState, 
                              invoicePostcode: state.value!.invoicePostcode, 
                              invoiceCountry: state.value!.invoiceCountry, 
                          )));
                      }
                      if (widget.submitAction != null) {
                        eliudrouter.Router.navigateTo(context, widget.submitAction!);
                      } else {
                        Navigator.pop(context);
                      }
                    }
                  },
                  child: Text('Finish Order', style: TextStyle(color: RgbHelper.color(rgbo: app.formSubmitButtonTextColor))),
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
              children: children as List<Widget>
            ),
          )
        );
      } else {
        return DelayedCircularProgressIndicator();
      }
    });
  }

  void _onNameChanged() {
    _myFormBloc.add(ChangedMemberName(value: _nameController.text));
  }


  void _onEmailChanged() {
    _myFormBloc.add(ChangedMemberEmail(value: _emailController.text));
  }


  void _onShipStreet1Changed() {
    _myFormBloc.add(ChangedMemberShipStreet1(value: _shipStreet1Controller.text));
  }


  void _onShipStreet2Changed() {
    _myFormBloc.add(ChangedMemberShipStreet2(value: _shipStreet2Controller.text));
  }


  void _onShipCityChanged() {
    _myFormBloc.add(ChangedMemberShipCity(value: _shipCityController.text));
  }


  void _onShipStateChanged() {
    _myFormBloc.add(ChangedMemberShipState(value: _shipStateController.text));
  }


  void _onPostcodeChanged() {
    _myFormBloc.add(ChangedMemberPostcode(value: _postcodeController.text));
  }


  void _onCountrySelected(String? val) {
    setState(() {
      _country = val;
    });
    _myFormBloc.add(ChangedMemberCountry(value: val));
  }


  void setSelectionInvoiceSame(bool? val) {
    setState(() {
      _invoiceSameSelection = val;
    });
    _myFormBloc.add(ChangedMemberInvoiceSame(value: val));
  }

  void _onInvoiceStreet1Changed() {
    _myFormBloc.add(ChangedMemberInvoiceStreet1(value: _invoiceStreet1Controller.text));
  }


  void _onInvoiceStreet2Changed() {
    _myFormBloc.add(ChangedMemberInvoiceStreet2(value: _invoiceStreet2Controller.text));
  }


  void _onInvoiceCityChanged() {
    _myFormBloc.add(ChangedMemberInvoiceCity(value: _invoiceCityController.text));
  }


  void _onInvoiceStateChanged() {
    _myFormBloc.add(ChangedMemberInvoiceState(value: _invoiceStateController.text));
  }


  void _onInvoicePostcodeChanged() {
    _myFormBloc.add(ChangedMemberInvoicePostcode(value: _invoicePostcodeController.text));
  }


  void _onInvoiceCountrySelected(String? val) {
    setState(() {
      _invoiceCountry = val;
    });
    _myFormBloc.add(ChangedMemberInvoiceCountry(value: val));
  }



  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _shipStreet1Controller.dispose();
    _shipStreet2Controller.dispose();
    _shipCityController.dispose();
    _shipStateController.dispose();
    _postcodeController.dispose();
    _invoiceStreet1Controller.dispose();
    _invoiceStreet2Controller.dispose();
    _invoiceCityController.dispose();
    _invoiceStateController.dispose();
    _invoicePostcodeController.dispose();
    super.dispose();
  }

  bool _readOnly(AccessState accessState, MemberFormInitialized state) {
    return (formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData) || (!((accessState is LoggedIn) && (accessState.member.documentID == state.value!.documentID)));
  }
  

}



