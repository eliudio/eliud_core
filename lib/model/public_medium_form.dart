/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 public_medium_form.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/core/blocs/access/state/access_state.dart';
import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core/core/navigate/router.dart' as eliudrouter;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/style/style_registry.dart';

import 'package:eliud_core/tools/enums.dart';

import 'package:eliud_core/model/model_export.dart';

import 'package:eliud_core/model/public_medium_list_bloc.dart';
import 'package:eliud_core/model/public_medium_list_event.dart';
import 'package:eliud_core/model/public_medium_form_bloc.dart';
import 'package:eliud_core/model/public_medium_form_event.dart';
import 'package:eliud_core/model/public_medium_form_state.dart';

class PublicMediumForm extends StatelessWidget {
  final AppModel app;
  final FormAction formAction;
  final PublicMediumModel? value;
  final ActionModel? submitAction;

  PublicMediumForm(
      {super.key,
      required this.app,
      required this.formAction,
      required this.value,
      this.submitAction});

  /// Build the PublicMediumForm
  @override
  Widget build(BuildContext context) {
    //var accessState = AccessBloc.getState(context);
    var appId = app.documentID;
    if (formAction == FormAction.showData) {
      return BlocProvider<PublicMediumFormBloc>(
        create: (context) => PublicMediumFormBloc(
          appId,
          formAction: formAction,
        )..add(InitialisePublicMediumFormEvent(value: value)),
        child: _MyPublicMediumForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    }
    if (formAction == FormAction.showPreloadedData) {
      return BlocProvider<PublicMediumFormBloc>(
        create: (context) => PublicMediumFormBloc(
          appId,
          formAction: formAction,
        )..add(InitialisePublicMediumFormNoLoadEvent(value: value)),
        child: _MyPublicMediumForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    } else {
      return Scaffold(
          appBar: StyleRegistry.registry()
              .styleWithApp(app)
              .adminFormStyle()
              .appBarWithString(app, context,
                  title: formAction == FormAction.updateAction
                      ? 'Update PublicMedium'
                      : 'Add PublicMedium'),
          body: BlocProvider<PublicMediumFormBloc>(
            create: (context) => PublicMediumFormBloc(
              appId,
              formAction: formAction,
            )..add((formAction == FormAction.updateAction
                ? InitialisePublicMediumFormEvent(value: value)
                : InitialiseNewPublicMediumFormEvent())),
            child: _MyPublicMediumForm(
                app: app, submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}

class _MyPublicMediumForm extends StatefulWidget {
  final AppModel app;
  final FormAction? formAction;
  final ActionModel? submitAction;

  _MyPublicMediumForm({required this.app, this.formAction, this.submitAction});

  @override
  State<_MyPublicMediumForm> createState() =>
      _MyPublicMediumFormState(formAction);
}

class _MyPublicMediumFormState extends State<_MyPublicMediumForm> {
  final FormAction? formAction;
  late PublicMediumFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  final TextEditingController _authorIdController = TextEditingController();
  final TextEditingController _baseController = TextEditingController();
  final TextEditingController _extController = TextEditingController();
  final TextEditingController _urlController = TextEditingController();
  final TextEditingController _refController = TextEditingController();
  final TextEditingController _urlThumbnailController = TextEditingController();
  final TextEditingController _refThumbnailController = TextEditingController();
  int? _mediumTypeSelectedRadioTile;
  final TextEditingController _mediumWidthController = TextEditingController();
  final TextEditingController _mediumHeightController = TextEditingController();
  final TextEditingController _thumbnailWidthController =
      TextEditingController();
  final TextEditingController _thumbnailHeightController =
      TextEditingController();
  final TextEditingController _relatedMediumIdController =
      TextEditingController();

  _MyPublicMediumFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<PublicMediumFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
    _authorIdController.addListener(_onAuthorIdChanged);
    _baseController.addListener(_onBaseChanged);
    _extController.addListener(_onExtChanged);
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
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<PublicMediumFormBloc, PublicMediumFormState>(
        builder: (context, state) {
      if (state is PublicMediumFormUninitialized) {
        return Center(
          child: StyleRegistry.registry()
              .styleWithApp(widget.app)
              .adminListStyle()
              .progressIndicator(widget.app, context),
        );
      }

      if (state is PublicMediumFormLoaded) {
        _documentIDController.text = state.value!.documentID.toString();
        _authorIdController.text = state.value!.authorId.toString();
        _baseController.text = state.value!.base.toString();
        _extController.text = state.value!.ext.toString();
        _urlController.text = state.value!.url.toString();
        _refController.text = state.value!.ref.toString();
        _urlThumbnailController.text = state.value!.urlThumbnail.toString();
        _refThumbnailController.text = state.value!.refThumbnail.toString();
        if (state.value!.mediumType != null) {
          _mediumTypeSelectedRadioTile = state.value!.mediumType!.index;
        } else {
          _mediumTypeSelectedRadioTile = 0;
        }
        _mediumWidthController.text = state.value!.mediumWidth.toString();
        _mediumHeightController.text = state.value!.mediumHeight.toString();
        _thumbnailWidthController.text = state.value!.thumbnailWidth.toString();
        _thumbnailHeightController.text =
            state.value!.thumbnailHeight.toString();
        _relatedMediumIdController.text =
            state.value!.relatedMediumId.toString();
      }
      if (state is PublicMediumFormInitialized) {
        List<Widget> children = [];
        children.add(Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: StyleRegistry.registry()
                .styleWithApp(widget.app)
                .adminFormStyle()
                .groupTitle(widget.app, context, 'General')));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Author ID',
                icon: Icons.text_format,
                readOnly: _readOnly(accessState, state),
                textEditingController: _authorIdController,
                keyboardType: TextInputType.text,
                validator: (_) => state is AuthorIdPublicMediumFormError
                    ? state.message
                    : null,
                hintText: null));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Base Name',
                icon: Icons.text_format,
                readOnly: _readOnly(accessState, state),
                textEditingController: _baseController,
                keyboardType: TextInputType.text,
                validator: (_) =>
                    state is BasePublicMediumFormError ? state.message : null,
                hintText: null));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Extension',
                icon: Icons.text_format,
                readOnly: _readOnly(accessState, state),
                textEditingController: _extController,
                keyboardType: TextInputType.text,
                validator: (_) =>
                    state is ExtPublicMediumFormError ? state.message : null,
                hintText: null));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Image URL',
                icon: Icons.text_format,
                readOnly: _readOnly(accessState, state),
                textEditingController: _urlController,
                keyboardType: TextInputType.text,
                validator: (_) =>
                    state is UrlPublicMediumFormError ? state.message : null,
                hintText: null));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Image Ref on Firebase Storage',
                icon: Icons.text_format,
                readOnly: _readOnly(accessState, state),
                textEditingController: _refController,
                keyboardType: TextInputType.text,
                validator: (_) =>
                    state is RefPublicMediumFormError ? state.message : null,
                hintText: null));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Image Thumbnail URL',
                icon: Icons.text_format,
                readOnly: _readOnly(accessState, state),
                textEditingController: _urlThumbnailController,
                keyboardType: TextInputType.text,
                validator: (_) => state is UrlThumbnailPublicMediumFormError
                    ? state.message
                    : null,
                hintText: null));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Image Ref on Firebase Storage',
                icon: Icons.text_format,
                readOnly: _readOnly(accessState, state),
                textEditingController: _refThumbnailController,
                keyboardType: TextInputType.text,
                validator: (_) => state is RefThumbnailPublicMediumFormError
                    ? state.message
                    : null,
                hintText: null));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .radioListTile(
                widget.app,
                context,
                0,
                _mediumTypeSelectedRadioTile,
                'photo',
                'photo',
                !accessState.memberIsOwner(widget.app.documentID)
                    ? null
                    : (dynamic val) => setSelectionMediumType(val)));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .radioListTile(
                widget.app,
                context,
                0,
                _mediumTypeSelectedRadioTile,
                'video',
                'video',
                !accessState.memberIsOwner(widget.app.documentID)
                    ? null
                    : (dynamic val) => setSelectionMediumType(val)));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .radioListTile(
                widget.app,
                context,
                0,
                _mediumTypeSelectedRadioTile,
                'pdf',
                'pdf',
                !accessState.memberIsOwner(widget.app.documentID)
                    ? null
                    : (dynamic val) => setSelectionMediumType(val)));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .radioListTile(
                widget.app,
                context,
                0,
                _mediumTypeSelectedRadioTile,
                'text',
                'text',
                !accessState.memberIsOwner(widget.app.documentID)
                    ? null
                    : (dynamic val) => setSelectionMediumType(val)));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'mediumWidth',
                icon: Icons.text_format,
                readOnly: _readOnly(accessState, state),
                textEditingController: _mediumWidthController,
                keyboardType: TextInputType.number,
                validator: (_) => state is MediumWidthPublicMediumFormError
                    ? state.message
                    : null,
                hintText: null));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'mediumHeight',
                icon: Icons.text_format,
                readOnly: _readOnly(accessState, state),
                textEditingController: _mediumHeightController,
                keyboardType: TextInputType.number,
                validator: (_) => state is MediumHeightPublicMediumFormError
                    ? state.message
                    : null,
                hintText: null));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'thumbnailWidth',
                icon: Icons.text_format,
                readOnly: _readOnly(accessState, state),
                textEditingController: _thumbnailWidthController,
                keyboardType: TextInputType.number,
                validator: (_) => state is ThumbnailWidthPublicMediumFormError
                    ? state.message
                    : null,
                hintText: null));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'thumbnailHeight',
                icon: Icons.text_format,
                readOnly: _readOnly(accessState, state),
                textEditingController: _thumbnailHeightController,
                keyboardType: TextInputType.number,
                validator: (_) => state is ThumbnailHeightPublicMediumFormError
                    ? state.message
                    : null,
                hintText: null));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'relatedMediumId',
                icon: Icons.text_format,
                readOnly: _readOnly(accessState, state),
                textEditingController: _relatedMediumIdController,
                keyboardType: TextInputType.text,
                validator: (_) => state is RelatedMediumIdPublicMediumFormError
                    ? state.message
                    : null,
                hintText: 'field.remark'));

        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .divider(widget.app, context));

        children.add(Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: StyleRegistry.registry()
                .styleWithApp(widget.app)
                .adminFormStyle()
                .groupTitle(widget.app, context, 'General')));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Document ID',
                icon: Icons.vpn_key,
                readOnly: (formAction == FormAction.updateAction),
                textEditingController: _documentIDController,
                keyboardType: TextInputType.text,
                validator: (_) => state is DocumentIDPublicMediumFormError
                    ? state.message
                    : null,
                hintText: null));

        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .divider(widget.app, context));

        children.add(Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: StyleRegistry.registry()
                .styleWithApp(widget.app)
                .adminFormStyle()
                .groupTitle(widget.app, context, 'Source')));

        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .divider(widget.app, context));

        children.add(Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: StyleRegistry.registry()
                .styleWithApp(widget.app)
                .adminFormStyle()
                .groupTitle(widget.app, context, 'Photo')));

        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .divider(widget.app, context));

        if ((formAction != FormAction.showData) &&
            (formAction != FormAction.showPreloadedData)) {
          children.add(StyleRegistry.registry()
              .styleWithApp(widget.app)
              .adminFormStyle()
              .button(
                widget.app,
                context,
                label: 'Submit',
                onPressed: _readOnly(accessState, state)
                    ? null
                    : () {
                        if (state is PublicMediumFormError) {
                          return;
                        } else {
                          if (formAction == FormAction.updateAction) {
                            BlocProvider.of<PublicMediumListBloc>(context)
                                .add(UpdatePublicMediumList(
                                    value: state.value!.copyWith(
                              documentID: state.value!.documentID,
                              authorId: state.value!.authorId,
                              base: state.value!.base,
                              ext: state.value!.ext,
                              url: state.value!.url,
                              ref: state.value!.ref,
                              urlThumbnail: state.value!.urlThumbnail,
                              refThumbnail: state.value!.refThumbnail,
                              mediumType: state.value!.mediumType,
                              mediumWidth: state.value!.mediumWidth,
                              mediumHeight: state.value!.mediumHeight,
                              thumbnailWidth: state.value!.thumbnailWidth,
                              thumbnailHeight: state.value!.thumbnailHeight,
                              relatedMediumId: state.value!.relatedMediumId,
                            )));
                          } else {
                            BlocProvider.of<PublicMediumListBloc>(context)
                                .add(AddPublicMediumList(
                                    value: PublicMediumModel(
                              documentID: state.value!.documentID,
                              authorId: state.value!.authorId,
                              base: state.value!.base,
                              ext: state.value!.ext,
                              url: state.value!.url,
                              ref: state.value!.ref,
                              urlThumbnail: state.value!.urlThumbnail,
                              refThumbnail: state.value!.refThumbnail,
                              mediumType: state.value!.mediumType,
                              mediumWidth: state.value!.mediumWidth,
                              mediumHeight: state.value!.mediumHeight,
                              thumbnailWidth: state.value!.thumbnailWidth,
                              thumbnailHeight: state.value!.thumbnailHeight,
                              relatedMediumId: state.value!.relatedMediumId,
                            )));
                          }
                          if (widget.submitAction != null) {
                            eliudrouter.Router.navigateTo(
                                context, widget.submitAction!);
                          } else {
                            Navigator.pop(context);
                          }
                        }
                      },
              ));
        }

        return StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .container(
                widget.app,
                context,
                Form(
                  child: ListView(
                      padding: const EdgeInsets.all(8),
                      physics: ((formAction == FormAction.showData) ||
                              (formAction == FormAction.showPreloadedData))
                          ? NeverScrollableScrollPhysics()
                          : null,
                      shrinkWrap: ((formAction == FormAction.showData) ||
                          (formAction == FormAction.showPreloadedData)),
                      children: children),
                ),
                formAction!);
      } else {
        return StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminListStyle()
            .progressIndicator(widget.app, context);
      }
    });
  }

  void _onDocumentIDChanged() {
    _myFormBloc
        .add(ChangedPublicMediumDocumentID(value: _documentIDController.text));
  }

  void _onAuthorIdChanged() {
    _myFormBloc
        .add(ChangedPublicMediumAuthorId(value: _authorIdController.text));
  }

  void _onBaseChanged() {
    _myFormBloc.add(ChangedPublicMediumBase(value: _baseController.text));
  }

  void _onExtChanged() {
    _myFormBloc.add(ChangedPublicMediumExt(value: _extController.text));
  }

  void _onUrlChanged() {
    _myFormBloc.add(ChangedPublicMediumUrl(value: _urlController.text));
  }

  void _onRefChanged() {
    _myFormBloc.add(ChangedPublicMediumRef(value: _refController.text));
  }

  void _onUrlThumbnailChanged() {
    _myFormBloc.add(
        ChangedPublicMediumUrlThumbnail(value: _urlThumbnailController.text));
  }

  void _onRefThumbnailChanged() {
    _myFormBloc.add(
        ChangedPublicMediumRefThumbnail(value: _refThumbnailController.text));
  }

  void setSelectionMediumType(int? val) {
    setState(() {
      _mediumTypeSelectedRadioTile = val;
    });
    _myFormBloc
        .add(ChangedPublicMediumMediumType(value: toPublicMediumType(val)));
  }

  void _onMediumWidthChanged() {
    _myFormBloc.add(
        ChangedPublicMediumMediumWidth(value: _mediumWidthController.text));
  }

  void _onMediumHeightChanged() {
    _myFormBloc.add(
        ChangedPublicMediumMediumHeight(value: _mediumHeightController.text));
  }

  void _onThumbnailWidthChanged() {
    _myFormBloc.add(ChangedPublicMediumThumbnailWidth(
        value: _thumbnailWidthController.text));
  }

  void _onThumbnailHeightChanged() {
    _myFormBloc.add(ChangedPublicMediumThumbnailHeight(
        value: _thumbnailHeightController.text));
  }

  void _onRelatedMediumIdChanged() {
    _myFormBloc.add(ChangedPublicMediumRelatedMediumId(
        value: _relatedMediumIdController.text));
  }

  @override
  void dispose() {
    _documentIDController.dispose();
    _authorIdController.dispose();
    _baseController.dispose();
    _extController.dispose();
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

  /// Is the form read-only?
  bool _readOnly(AccessState accessState, PublicMediumFormInitialized state) {
    return (formAction == FormAction.showData) ||
        (formAction == FormAction.showPreloadedData) ||
        (!accessState.memberIsOwner(widget.app.documentID));
  }
}
