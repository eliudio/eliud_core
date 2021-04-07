/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_medium_form.dart
                       
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

import 'package:eliud_core/model/member_medium_list_bloc.dart';
import 'package:eliud_core/model/member_medium_list_event.dart';
import 'package:eliud_core/model/member_medium_model.dart';
import 'package:eliud_core/model/member_medium_form_bloc.dart';
import 'package:eliud_core/model/member_medium_form_event.dart';
import 'package:eliud_core/model/member_medium_form_state.dart';


class MemberMediumForm extends StatelessWidget {
  FormAction formAction;
  MemberMediumModel? value;
  ActionModel? submitAction;

  MemberMediumForm({Key? key, required this.formAction, required this.value, this.submitAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    var app = AccessBloc.app(context);
    if (formAction == FormAction.ShowData) {
      return BlocProvider<MemberMediumFormBloc >(
            create: (context) => MemberMediumFormBloc(AccessBloc.appId(context),
                                       formAction: formAction,

                                                )..add(InitialiseMemberMediumFormEvent(value: value)),
  
        child: MyMemberMediumForm(submitAction: submitAction, formAction: formAction),
          );
    } if (formAction == FormAction.ShowPreloadedData) {
      return BlocProvider<MemberMediumFormBloc >(
            create: (context) => MemberMediumFormBloc(AccessBloc.appId(context),
                                       formAction: formAction,

                                                )..add(InitialiseMemberMediumFormNoLoadEvent(value: value)),
  
        child: MyMemberMediumForm(submitAction: submitAction, formAction: formAction),
          );
    } else {
      return Scaffold(
        appBar: formAction == FormAction.UpdateAction ?
                AppBar(
                    title: Text("Update MemberMedium", style: TextStyle(color: RgbHelper.color(rgbo: app!.formAppBarTextColor))),
                    flexibleSpace: Container(
                        decoration: BoxDecorationHelper.boxDecoration(accessState, app.formAppBarBackground)),
                  ) :
                AppBar(
                    title: Text("Add MemberMedium", style: TextStyle(color: RgbHelper.color(rgbo: app!.formAppBarTextColor))),
                    flexibleSpace: Container(
                        decoration: BoxDecorationHelper.boxDecoration(accessState, app.formAppBarBackground)),
                ),
        body: BlocProvider<MemberMediumFormBloc >(
            create: (context) => MemberMediumFormBloc(AccessBloc.appId(context),
                                       formAction: formAction,

                                                )..add((formAction == FormAction.UpdateAction ? InitialiseMemberMediumFormEvent(value: value) : InitialiseNewMemberMediumFormEvent())),
  
        child: MyMemberMediumForm(submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}


class MyMemberMediumForm extends StatefulWidget {
  final FormAction? formAction;
  final ActionModel? submitAction;

  MyMemberMediumForm({this.formAction, this.submitAction});

  _MyMemberMediumFormState createState() => _MyMemberMediumFormState(this.formAction);
}


class _MyMemberMediumFormState extends State<MyMemberMediumForm> {
  final FormAction? formAction;
  late MemberMediumFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  final TextEditingController _appIdController = TextEditingController();
  final TextEditingController _authorIdController = TextEditingController();
  final TextEditingController _urlController = TextEditingController();
  final TextEditingController _refController = TextEditingController();
  final TextEditingController _urlThumbnailController = TextEditingController();
  int? _mediumTypeSelectedRadioTile;
  final TextEditingController _mediumWidthController = TextEditingController();
  final TextEditingController _mediumHeightController = TextEditingController();
  final TextEditingController _thumbnailWidthController = TextEditingController();
  final TextEditingController _thumbnailHeightController = TextEditingController();
  final TextEditingController _relatedMediumIdController = TextEditingController();


  _MyMemberMediumFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<MemberMediumFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
    _appIdController.addListener(_onAppIdChanged);
    _authorIdController.addListener(_onAuthorIdChanged);
    _urlController.addListener(_onUrlChanged);
    _refController.addListener(_onRefChanged);
    _urlThumbnailController.addListener(_onUrlThumbnailChanged);
    _mediumTypeSelectedRadioTile = 0;
    _mediumWidthController.addListener(_onMediumWidthChanged);
    _mediumHeightController.addListener(_onMediumHeightChanged);
    _thumbnailWidthController.addListener(_onThumbnailWidthChanged);
    _thumbnailHeightController.addListener(_onThumbnailHeightChanged);
    _relatedMediumIdController.addListener(_onRelatedMediumIdChanged);
  }

  @override
  Widget build(BuildContext context) {
    var app = AccessBloc.app(context);
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<MemberMediumFormBloc, MemberMediumFormState>(builder: (context, state) {
      if (state is MemberMediumFormUninitialized) return Center(
        child: DelayedCircularProgressIndicator(),
      );

      if (state is MemberMediumFormLoaded) {
        if (state.value!.documentID != null)
          _documentIDController.text = state.value!.documentID.toString();
        else
          _documentIDController.text = "";
        if (state.value!.appId != null)
          _appIdController.text = state.value!.appId.toString();
        else
          _appIdController.text = "";
        if (state.value!.authorId != null)
          _authorIdController.text = state.value!.authorId.toString();
        else
          _authorIdController.text = "";
        if (state.value!.url != null)
          _urlController.text = state.value!.url.toString();
        else
          _urlController.text = "";
        if (state.value!.ref != null)
          _refController.text = state.value!.ref.toString();
        else
          _refController.text = "";
        if (state.value!.urlThumbnail != null)
          _urlThumbnailController.text = state.value!.urlThumbnail.toString();
        else
          _urlThumbnailController.text = "";
        if (state.value!.mediumType != null)
          _mediumTypeSelectedRadioTile = state.value!.mediumType!.index;
        else
          _mediumTypeSelectedRadioTile = 0;
        if (state.value!.mediumWidth != null)
          _mediumWidthController.text = state.value!.mediumWidth.toString();
        else
          _mediumWidthController.text = "";
        if (state.value!.mediumHeight != null)
          _mediumHeightController.text = state.value!.mediumHeight.toString();
        else
          _mediumHeightController.text = "";
        if (state.value!.thumbnailWidth != null)
          _thumbnailWidthController.text = state.value!.thumbnailWidth.toString();
        else
          _thumbnailWidthController.text = "";
        if (state.value!.thumbnailHeight != null)
          _thumbnailHeightController.text = state.value!.thumbnailHeight.toString();
        else
          _thumbnailHeightController.text = "";
        if (state.value!.relatedMediumId != null)
          _relatedMediumIdController.text = state.value!.relatedMediumId.toString();
        else
          _relatedMediumIdController.text = "";
      }
      if (state is MemberMediumFormInitialized) {
        List<Widget> children = List();
         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('General',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: app!.formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor)),
                  readOnly: _readOnly(accessState, state),
                  controller: _authorIdController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldFocusColor))),                    icon: Icon(Icons.text_format, color: RgbHelper.color(rgbo: app.formFieldHeaderColor)),
                    labelText: 'Author ID',
                  ),
                  keyboardType: TextInputType.text,
                  autovalidate: true,
                  validator: (_) {
                    return state is AuthorIdMemberMediumFormError ? state.message : null;
                  },
                ),
          );

        children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor)),
                  readOnly: _readOnly(accessState, state),
                  controller: _urlController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldFocusColor))),                    icon: Icon(Icons.text_format, color: RgbHelper.color(rgbo: app.formFieldHeaderColor)),
                    labelText: 'Image URL',
                  ),
                  keyboardType: TextInputType.text,
                  autovalidate: true,
                  validator: (_) {
                    return state is UrlMemberMediumFormError ? state.message : null;
                  },
                ),
          );

        children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor)),
                  readOnly: _readOnly(accessState, state),
                  controller: _refController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldFocusColor))),                    icon: Icon(Icons.text_format, color: RgbHelper.color(rgbo: app.formFieldHeaderColor)),
                    labelText: 'Image Ref on Firebase Storage',
                  ),
                  keyboardType: TextInputType.text,
                  autovalidate: true,
                  validator: (_) {
                    return state is RefMemberMediumFormError ? state.message : null;
                  },
                ),
          );

        children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor)),
                  readOnly: _readOnly(accessState, state),
                  controller: _urlThumbnailController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldFocusColor))),                    icon: Icon(Icons.text_format, color: RgbHelper.color(rgbo: app.formFieldHeaderColor)),
                    labelText: 'Image Thumbnail URL',
                  ),
                  keyboardType: TextInputType.text,
                  autovalidate: true,
                  validator: (_) {
                    return state is UrlThumbnailMemberMediumFormError ? state.message : null;
                  },
                ),
          );

        children.add(

                RadioListTile(
                    value: 0,
                    activeColor: RgbHelper.color(rgbo: app.formFieldTextColor),
                    groupValue: _mediumTypeSelectedRadioTile,
                    title: Text("Photo", style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    subtitle: Text("Photo", style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    onChanged: !accessState.memberIsOwner() ? null : (dynamic val) {
                      setSelectionMediumType(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 1,
                    activeColor: RgbHelper.color(rgbo: app.formFieldTextColor),
                    groupValue: _mediumTypeSelectedRadioTile,
                    title: Text("Video", style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    subtitle: Text("Video", style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    onChanged: !accessState.memberIsOwner() ? null : (dynamic val) {
                      setSelectionMediumType(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 2,
                    activeColor: RgbHelper.color(rgbo: app.formFieldTextColor),
                    groupValue: _mediumTypeSelectedRadioTile,
                    title: Text("Pdf", style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    subtitle: Text("Pdf", style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    onChanged: !accessState.memberIsOwner() ? null : (dynamic val) {
                      setSelectionMediumType(val);
                    },
                ),
          );

        children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor)),
                  readOnly: _readOnly(accessState, state),
                  controller: _mediumWidthController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldFocusColor))),                    icon: Icon(Icons.text_format, color: RgbHelper.color(rgbo: app.formFieldHeaderColor)),
                    labelText: 'mediumWidth',
                  ),
                  keyboardType: TextInputType.number,
                  autovalidate: true,
                  validator: (_) {
                    return state is MediumWidthMemberMediumFormError ? state.message : null;
                  },
                ),
          );

        children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor)),
                  readOnly: _readOnly(accessState, state),
                  controller: _mediumHeightController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldFocusColor))),                    icon: Icon(Icons.text_format, color: RgbHelper.color(rgbo: app.formFieldHeaderColor)),
                    labelText: 'mediumHeight',
                  ),
                  keyboardType: TextInputType.number,
                  autovalidate: true,
                  validator: (_) {
                    return state is MediumHeightMemberMediumFormError ? state.message : null;
                  },
                ),
          );

        children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor)),
                  readOnly: _readOnly(accessState, state),
                  controller: _thumbnailWidthController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldFocusColor))),                    icon: Icon(Icons.text_format, color: RgbHelper.color(rgbo: app.formFieldHeaderColor)),
                    labelText: 'thumbnailWidth',
                  ),
                  keyboardType: TextInputType.number,
                  autovalidate: true,
                  validator: (_) {
                    return state is ThumbnailWidthMemberMediumFormError ? state.message : null;
                  },
                ),
          );

        children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor)),
                  readOnly: _readOnly(accessState, state),
                  controller: _thumbnailHeightController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldFocusColor))),                    icon: Icon(Icons.text_format, color: RgbHelper.color(rgbo: app.formFieldHeaderColor)),
                    labelText: 'thumbnailHeight',
                  ),
                  keyboardType: TextInputType.number,
                  autovalidate: true,
                  validator: (_) {
                    return state is ThumbnailHeightMemberMediumFormError ? state.message : null;
                  },
                ),
          );

        children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor)),
                  readOnly: _readOnly(accessState, state),
                  controller: _relatedMediumIdController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldFocusColor))),                    icon: Icon(Icons.text_format, color: RgbHelper.color(rgbo: app.formFieldHeaderColor)),
                    labelText: 'relatedMediumId',
                    hintText: "In case a medium has multiple related media, then we refer to the related media with this field. For example, for a pdf, we store images of all pages. These are referenced using a chain of these references.",
                  ),
                  keyboardType: TextInputType.text,
                  autovalidate: true,
                  validator: (_) {
                    return state is RelatedMediumIdMemberMediumFormError ? state.message : null;
                  },
                ),
          );


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
                  readOnly: (formAction == FormAction.UpdateAction),
                  controller: _documentIDController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldFocusColor))),                    icon: Icon(Icons.vpn_key, color: RgbHelper.color(rgbo: app.formFieldHeaderColor)),
                    labelText: 'Document ID',
                  ),
                  keyboardType: TextInputType.text,
                  autovalidate: true,
                  validator: (_) {
                    return state is DocumentIDMemberMediumFormError ? state.message : null;
                  },
                ),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: app.dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Source',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: app.formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: app.dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Photo',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: app.formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: app.dividerColor)));


        if ((formAction != FormAction.ShowData) && (formAction != FormAction.ShowPreloadedData))
          children.add(RaisedButton(
                  color: RgbHelper.color(rgbo: app.formSubmitButtonColor),
                  onPressed: _readOnly(accessState, state) ? null : () {
                    if (state is MemberMediumFormError) {
                      return null;
                    } else {
                      if (formAction == FormAction.UpdateAction) {
                        BlocProvider.of<MemberMediumListBloc>(context).add(
                          UpdateMemberMediumList(value: state.value!.copyWith(
                              documentID: state.value!.documentID, 
                              appId: state.value!.appId, 
                              authorId: state.value!.authorId, 
                              url: state.value!.url, 
                              ref: state.value!.ref, 
                              urlThumbnail: state.value!.urlThumbnail, 
                              readAccess: state.value!.readAccess, 
                              mediumType: state.value!.mediumType, 
                              mediumWidth: state.value!.mediumWidth, 
                              mediumHeight: state.value!.mediumHeight, 
                              thumbnailWidth: state.value!.thumbnailWidth, 
                              thumbnailHeight: state.value!.thumbnailHeight, 
                              relatedMediumId: state.value!.relatedMediumId, 
                        )));
                      } else {
                        BlocProvider.of<MemberMediumListBloc>(context).add(
                          AddMemberMediumList(value: MemberMediumModel(
                              documentID: state.value!.documentID, 
                              appId: state.value!.appId, 
                              authorId: state.value!.authorId, 
                              url: state.value!.url, 
                              ref: state.value!.ref, 
                              urlThumbnail: state.value!.urlThumbnail, 
                              readAccess: state.value!.readAccess, 
                              mediumType: state.value!.mediumType, 
                              mediumWidth: state.value!.mediumWidth, 
                              mediumHeight: state.value!.mediumHeight, 
                              thumbnailWidth: state.value!.thumbnailWidth, 
                              thumbnailHeight: state.value!.thumbnailHeight, 
                              relatedMediumId: state.value!.relatedMediumId, 
                          )));
                      }
                      if (widget.submitAction != null) {
                        eliudrouter.Router.navigateTo(context, widget.submitAction!);
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
        return DelayedCircularProgressIndicator();
      }
    });
  }

  void _onDocumentIDChanged() {
    _myFormBloc.add(ChangedMemberMediumDocumentID(value: _documentIDController.text));
  }


  void _onAppIdChanged() {
    _myFormBloc.add(ChangedMemberMediumAppId(value: _appIdController.text));
  }


  void _onAuthorIdChanged() {
    _myFormBloc.add(ChangedMemberMediumAuthorId(value: _authorIdController.text));
  }


  void _onUrlChanged() {
    _myFormBloc.add(ChangedMemberMediumUrl(value: _urlController.text));
  }


  void _onRefChanged() {
    _myFormBloc.add(ChangedMemberMediumRef(value: _refController.text));
  }


  void _onUrlThumbnailChanged() {
    _myFormBloc.add(ChangedMemberMediumUrlThumbnail(value: _urlThumbnailController.text));
  }


  void _onReadAccessChanged(value) {
    _myFormBloc.add(ChangedMemberMediumReadAccess(value: value));
    setState(() {});
  }


  void setSelectionMediumType(int? val) {
    setState(() {
      _mediumTypeSelectedRadioTile = val;
    });
    _myFormBloc.add(ChangedMemberMediumMediumType(value: toMediumType(val)));
  }


  void _onMediumWidthChanged() {
    _myFormBloc.add(ChangedMemberMediumMediumWidth(value: _mediumWidthController.text));
  }


  void _onMediumHeightChanged() {
    _myFormBloc.add(ChangedMemberMediumMediumHeight(value: _mediumHeightController.text));
  }


  void _onThumbnailWidthChanged() {
    _myFormBloc.add(ChangedMemberMediumThumbnailWidth(value: _thumbnailWidthController.text));
  }


  void _onThumbnailHeightChanged() {
    _myFormBloc.add(ChangedMemberMediumThumbnailHeight(value: _thumbnailHeightController.text));
  }


  void _onRelatedMediumIdChanged() {
    _myFormBloc.add(ChangedMemberMediumRelatedMediumId(value: _relatedMediumIdController.text));
  }



  @override
  void dispose() {
    _documentIDController.dispose();
    _appIdController.dispose();
    _authorIdController.dispose();
    _urlController.dispose();
    _refController.dispose();
    _urlThumbnailController.dispose();
    _mediumWidthController.dispose();
    _mediumHeightController.dispose();
    _thumbnailWidthController.dispose();
    _thumbnailHeightController.dispose();
    _relatedMediumIdController.dispose();
    super.dispose();
  }

  bool _readOnly(AccessState accessState, MemberMediumFormInitialized state) {
    return (formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData) || (!accessState.memberIsOwner());
  }
  

}



