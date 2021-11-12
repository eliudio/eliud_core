/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 platform_medium_form.dart
                       
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

import 'package:eliud_core/model/platform_medium_list_bloc.dart';
import 'package:eliud_core/model/platform_medium_list_event.dart';
import 'package:eliud_core/model/platform_medium_model.dart';
import 'package:eliud_core/model/platform_medium_form_bloc.dart';
import 'package:eliud_core/model/platform_medium_form_event.dart';
import 'package:eliud_core/model/platform_medium_form_state.dart';


class PlatformMediumForm extends StatelessWidget {
  FormAction formAction;
  PlatformMediumModel? value;
  ActionModel? submitAction;

  PlatformMediumForm({Key? key, required this.formAction, required this.value, this.submitAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    var app = AccessBloc.currentApp(context);
    if (app == null) return Text("No app available");
    if (formAction == FormAction.ShowData) {
      return BlocProvider<PlatformMediumFormBloc >(
            create: (context) => PlatformMediumFormBloc(AccessBloc.currentAppId(context),
                                       formAction: formAction,

                                                )..add(InitialisePlatformMediumFormEvent(value: value)),
  
        child: MyPlatformMediumForm(submitAction: submitAction, formAction: formAction),
          );
    } if (formAction == FormAction.ShowPreloadedData) {
      return BlocProvider<PlatformMediumFormBloc >(
            create: (context) => PlatformMediumFormBloc(AccessBloc.currentAppId(context),
                                       formAction: formAction,

                                                )..add(InitialisePlatformMediumFormNoLoadEvent(value: value)),
  
        child: MyPlatformMediumForm(submitAction: submitAction, formAction: formAction),
          );
    } else {
      return Scaffold(
        appBar: StyleRegistry.registry().styleWithContext(context).adminFormStyle().appBarWithString(context, title: formAction == FormAction.UpdateAction ? 'Update PlatformMedium' : 'Add PlatformMedium'),
        body: BlocProvider<PlatformMediumFormBloc >(
            create: (context) => PlatformMediumFormBloc(AccessBloc.currentAppId(context),
                                       formAction: formAction,

                                                )..add((formAction == FormAction.UpdateAction ? InitialisePlatformMediumFormEvent(value: value) : InitialiseNewPlatformMediumFormEvent())),
  
        child: MyPlatformMediumForm(submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}


class MyPlatformMediumForm extends StatefulWidget {
  final FormAction? formAction;
  final ActionModel? submitAction;

  MyPlatformMediumForm({this.formAction, this.submitAction});

  _MyPlatformMediumFormState createState() => _MyPlatformMediumFormState(this.formAction);
}


class _MyPlatformMediumFormState extends State<MyPlatformMediumForm> {
  final FormAction? formAction;
  late PlatformMediumFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  final TextEditingController _appIdController = TextEditingController();
  final TextEditingController _authorIdController = TextEditingController();
  final TextEditingController _baseNameController = TextEditingController();
  final TextEditingController _urlController = TextEditingController();
  final TextEditingController _refController = TextEditingController();
  final TextEditingController _urlThumbnailController = TextEditingController();
  final TextEditingController _refThumbnailController = TextEditingController();
  int? _mediumTypeSelectedRadioTile;
  final TextEditingController _mediumWidthController = TextEditingController();
  final TextEditingController _mediumHeightController = TextEditingController();
  final TextEditingController _thumbnailWidthController = TextEditingController();
  final TextEditingController _thumbnailHeightController = TextEditingController();
  final TextEditingController _relatedMediumIdController = TextEditingController();


  _MyPlatformMediumFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<PlatformMediumFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
    _appIdController.addListener(_onAppIdChanged);
    _authorIdController.addListener(_onAuthorIdChanged);
    _baseNameController.addListener(_onBaseNameChanged);
    _urlController.addListener(_onUrlChanged);
    _refController.addListener(_onRefChanged);
    _urlThumbnailController.addListener(_onUrlThumbnailChanged);
    _refThumbnailController.addListener(_onRefThumbnailChanged);
    _mediumTypeSelectedRadioTile = 0;
    _mediumWidthController.addListener(_onMediumWidthChanged);
    _mediumHeightController.addListener(_onMediumHeightChanged);
    _thumbnailWidthController.addListener(_onThumbnailWidthChanged);
    _thumbnailHeightController.addListener(_onThumbnailHeightChanged);
    _relatedMediumIdController.addListener(_onRelatedMediumIdChanged);
  }

  @override
  Widget build(BuildContext context) {
    var app = AccessBloc.currentApp(context);
    if (app == null) return Text('No app available');
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<PlatformMediumFormBloc, PlatformMediumFormState>(builder: (context, state) {
      if (state is PlatformMediumFormUninitialized) return Center(
        child: StyleRegistry.registry().styleWithContext(context).adminListStyle().progressIndicator(context),
      );

      if (state is PlatformMediumFormLoaded) {
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
        if (state.value!.baseName != null)
          _baseNameController.text = state.value!.baseName.toString();
        else
          _baseNameController.text = "";
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
        if (state.value!.refThumbnail != null)
          _refThumbnailController.text = state.value!.refThumbnail.toString();
        else
          _refThumbnailController.text = "";
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
      if (state is PlatformMediumFormInitialized) {
        List<Widget> children = [];
         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'General')
                ));

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'Author ID', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _authorIdController, keyboardType: TextInputType.text, validator: (_) => state is AuthorIdPlatformMediumFormError ? state.message : null, hintText: null)
          );

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'Base Name', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _baseNameController, keyboardType: TextInputType.text, validator: (_) => state is BaseNamePlatformMediumFormError ? state.message : null, hintText: null)
          );

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'Image URL', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _urlController, keyboardType: TextInputType.text, validator: (_) => state is UrlPlatformMediumFormError ? state.message : null, hintText: null)
          );

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'Image Ref on Firebase Storage', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _refController, keyboardType: TextInputType.text, validator: (_) => state is RefPlatformMediumFormError ? state.message : null, hintText: null)
          );

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'Image Thumbnail URL', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _urlThumbnailController, keyboardType: TextInputType.text, validator: (_) => state is UrlThumbnailPlatformMediumFormError ? state.message : null, hintText: null)
          );

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'Image Ref on Firebase Storage', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _refThumbnailController, keyboardType: TextInputType.text, validator: (_) => state is RefThumbnailPlatformMediumFormError ? state.message : null, hintText: null)
          );


        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _mediumTypeSelectedRadioTile, 'Photo', 'Photo', !accessState.memberIsOwner(AccessBloc.currentAppId(context)) ? null : (dynamic val) => setSelectionMediumType(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _mediumTypeSelectedRadioTile, 'Video', 'Video', !accessState.memberIsOwner(AccessBloc.currentAppId(context)) ? null : (dynamic val) => setSelectionMediumType(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _mediumTypeSelectedRadioTile, 'Pdf', 'Pdf', !accessState.memberIsOwner(AccessBloc.currentAppId(context)) ? null : (dynamic val) => setSelectionMediumType(val))
          );

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'mediumWidth', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _mediumWidthController, keyboardType: TextInputType.number, validator: (_) => state is MediumWidthPlatformMediumFormError ? state.message : null, hintText: null)
          );

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'mediumHeight', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _mediumHeightController, keyboardType: TextInputType.number, validator: (_) => state is MediumHeightPlatformMediumFormError ? state.message : null, hintText: null)
          );

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'thumbnailWidth', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _thumbnailWidthController, keyboardType: TextInputType.number, validator: (_) => state is ThumbnailWidthPlatformMediumFormError ? state.message : null, hintText: null)
          );

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'thumbnailHeight', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _thumbnailHeightController, keyboardType: TextInputType.number, validator: (_) => state is ThumbnailHeightPlatformMediumFormError ? state.message : null, hintText: null)
          );

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'relatedMediumId', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _relatedMediumIdController, keyboardType: TextInputType.text, validator: (_) => state is RelatedMediumIdPlatformMediumFormError ? state.message : null, hintText: 'field.remark')
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'General')
                ));

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'Document ID', icon: Icons.vpn_key, readOnly: (formAction == FormAction.UpdateAction), textEditingController: _documentIDController, keyboardType: TextInputType.text, validator: (_) => state is DocumentIDPlatformMediumFormError ? state.message : null, hintText: null)
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Source')
                ));


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Photo')
                ));


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


        if ((formAction != FormAction.ShowData) && (formAction != FormAction.ShowPreloadedData))
          children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().button(context, label: 'Submit',
                  onPressed: _readOnly(accessState, state) ? null : () {
                    if (state is PlatformMediumFormError) {
                      return null;
                    } else {
                      if (formAction == FormAction.UpdateAction) {
                        BlocProvider.of<PlatformMediumListBloc>(context).add(
                          UpdatePlatformMediumList(value: state.value!.copyWith(
                              documentID: state.value!.documentID, 
                              appId: state.value!.appId, 
                              authorId: state.value!.authorId, 
                              baseName: state.value!.baseName, 
                              url: state.value!.url, 
                              ref: state.value!.ref, 
                              urlThumbnail: state.value!.urlThumbnail, 
                              refThumbnail: state.value!.refThumbnail, 
                              conditions: state.value!.conditions, 
                              mediumType: state.value!.mediumType, 
                              mediumWidth: state.value!.mediumWidth, 
                              mediumHeight: state.value!.mediumHeight, 
                              thumbnailWidth: state.value!.thumbnailWidth, 
                              thumbnailHeight: state.value!.thumbnailHeight, 
                              relatedMediumId: state.value!.relatedMediumId, 
                        )));
                      } else {
                        BlocProvider.of<PlatformMediumListBloc>(context).add(
                          AddPlatformMediumList(value: PlatformMediumModel(
                              documentID: state.value!.documentID, 
                              appId: state.value!.appId, 
                              authorId: state.value!.authorId, 
                              baseName: state.value!.baseName, 
                              url: state.value!.url, 
                              ref: state.value!.ref, 
                              urlThumbnail: state.value!.urlThumbnail, 
                              refThumbnail: state.value!.refThumbnail, 
                              conditions: state.value!.conditions, 
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
    _myFormBloc.add(ChangedPlatformMediumDocumentID(value: _documentIDController.text));
  }


  void _onAppIdChanged() {
    _myFormBloc.add(ChangedPlatformMediumAppId(value: _appIdController.text));
  }


  void _onAuthorIdChanged() {
    _myFormBloc.add(ChangedPlatformMediumAuthorId(value: _authorIdController.text));
  }


  void _onBaseNameChanged() {
    _myFormBloc.add(ChangedPlatformMediumBaseName(value: _baseNameController.text));
  }


  void _onUrlChanged() {
    _myFormBloc.add(ChangedPlatformMediumUrl(value: _urlController.text));
  }


  void _onRefChanged() {
    _myFormBloc.add(ChangedPlatformMediumRef(value: _refController.text));
  }


  void _onUrlThumbnailChanged() {
    _myFormBloc.add(ChangedPlatformMediumUrlThumbnail(value: _urlThumbnailController.text));
  }


  void _onRefThumbnailChanged() {
    _myFormBloc.add(ChangedPlatformMediumRefThumbnail(value: _refThumbnailController.text));
  }


  void setSelectionMediumType(int? val) {
    setState(() {
      _mediumTypeSelectedRadioTile = val;
    });
    _myFormBloc.add(ChangedPlatformMediumMediumType(value: toPlatformMediumType(val)));
  }


  void _onMediumWidthChanged() {
    _myFormBloc.add(ChangedPlatformMediumMediumWidth(value: _mediumWidthController.text));
  }


  void _onMediumHeightChanged() {
    _myFormBloc.add(ChangedPlatformMediumMediumHeight(value: _mediumHeightController.text));
  }


  void _onThumbnailWidthChanged() {
    _myFormBloc.add(ChangedPlatformMediumThumbnailWidth(value: _thumbnailWidthController.text));
  }


  void _onThumbnailHeightChanged() {
    _myFormBloc.add(ChangedPlatformMediumThumbnailHeight(value: _thumbnailHeightController.text));
  }


  void _onRelatedMediumIdChanged() {
    _myFormBloc.add(ChangedPlatformMediumRelatedMediumId(value: _relatedMediumIdController.text));
  }



  @override
  void dispose() {
    _documentIDController.dispose();
    _appIdController.dispose();
    _authorIdController.dispose();
    _baseNameController.dispose();
    _urlController.dispose();
    _refController.dispose();
    _urlThumbnailController.dispose();
    _refThumbnailController.dispose();
    _mediumWidthController.dispose();
    _mediumHeightController.dispose();
    _thumbnailWidthController.dispose();
    _thumbnailHeightController.dispose();
    _relatedMediumIdController.dispose();
    super.dispose();
  }

  bool _readOnly(AccessState accessState, PlatformMediumFormInitialized state) {
    return (formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData) || (!accessState.memberIsOwner(AccessBloc.currentAppId(context)));
  }
  

}



