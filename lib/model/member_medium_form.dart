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

import 'package:eliud_core/core/blocs/access/state/access_state.dart';
import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core/core/navigate/router.dart' as eliudrouter;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/style/style_registry.dart';

import 'package:eliud_core/tools/enums.dart';

import 'package:eliud_core/model/model_export.dart';

import 'package:eliud_core/model/member_medium_list_bloc.dart';
import 'package:eliud_core/model/member_medium_list_event.dart';
import 'package:eliud_core/model/member_medium_form_bloc.dart';
import 'package:eliud_core/model/member_medium_form_event.dart';
import 'package:eliud_core/model/member_medium_form_state.dart';

class MemberMediumForm extends StatelessWidget {
  final AppModel app;
  final FormAction formAction;
  final MemberMediumModel? value;
  final ActionModel? submitAction;

  MemberMediumForm(
      {super.key,
      required this.app,
      required this.formAction,
      required this.value,
      this.submitAction});

  /// Build the MemberMediumForm
  @override
  Widget build(BuildContext context) {
    //var accessState = AccessBloc.getState(context);
    var appId = app.documentID;
    if (formAction == FormAction.showData) {
      return BlocProvider<MemberMediumFormBloc>(
        create: (context) => MemberMediumFormBloc(
          appId,
          formAction: formAction,
        )..add(InitialiseMemberMediumFormEvent(value: value)),
        child: MyMemberMediumForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    }
    if (formAction == FormAction.showPreloadedData) {
      return BlocProvider<MemberMediumFormBloc>(
        create: (context) => MemberMediumFormBloc(
          appId,
          formAction: formAction,
        )..add(InitialiseMemberMediumFormNoLoadEvent(value: value)),
        child: MyMemberMediumForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    } else {
      return Scaffold(
          appBar: StyleRegistry.registry()
              .styleWithApp(app)
              .adminFormStyle()
              .appBarWithString(app, context,
                  title: formAction == FormAction.updateAction
                      ? 'Update MemberMedium'
                      : 'Add MemberMedium'),
          body: BlocProvider<MemberMediumFormBloc>(
            create: (context) => MemberMediumFormBloc(
              appId,
              formAction: formAction,
            )..add((formAction == FormAction.updateAction
                ? InitialiseMemberMediumFormEvent(value: value)
                : InitialiseNewMemberMediumFormEvent())),
            child: MyMemberMediumForm(
                app: app, submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}

class MyMemberMediumForm extends StatefulWidget {
  final AppModel app;
  final FormAction? formAction;
  final ActionModel? submitAction;

  MyMemberMediumForm({required this.app, this.formAction, this.submitAction});

  @override
  State<MyMemberMediumForm> createState() =>
      _MyMemberMediumFormState(formAction);
}

class _MyMemberMediumFormState extends State<MyMemberMediumForm> {
  final FormAction? formAction;
  late MemberMediumFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  final TextEditingController _authorIdController = TextEditingController();
  final TextEditingController _baseController = TextEditingController();
  final TextEditingController _extController = TextEditingController();
  final TextEditingController _urlController = TextEditingController();
  final TextEditingController _refController = TextEditingController();
  final TextEditingController _urlThumbnailController = TextEditingController();
  final TextEditingController _refThumbnailController = TextEditingController();
  int? _accessibleByGroupSelectedRadioTile;
  int? _mediumTypeSelectedRadioTile;
  final TextEditingController _mediumWidthController = TextEditingController();
  final TextEditingController _mediumHeightController = TextEditingController();
  final TextEditingController _thumbnailWidthController =
      TextEditingController();
  final TextEditingController _thumbnailHeightController =
      TextEditingController();
  final TextEditingController _relatedMediumIdController =
      TextEditingController();

  _MyMemberMediumFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<MemberMediumFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
    _authorIdController.addListener(_onAuthorIdChanged);
    _baseController.addListener(_onBaseChanged);
    _extController.addListener(_onExtChanged);
    _urlController.addListener(_onUrlChanged);
    _refController.addListener(_onRefChanged);
    _urlThumbnailController.addListener(_onUrlThumbnailChanged);
    _refThumbnailController.addListener(_onRefThumbnailChanged);
    _accessibleByGroupSelectedRadioTile = 0;
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
    return BlocBuilder<MemberMediumFormBloc, MemberMediumFormState>(
        builder: (context, state) {
      if (state is MemberMediumFormUninitialized) {
        return Center(
          child: StyleRegistry.registry()
              .styleWithApp(widget.app)
              .adminListStyle()
              .progressIndicator(widget.app, context),
        );
      }

      if (state is MemberMediumFormLoaded) {
        _documentIDController.text = state.value!.documentID.toString();
        _authorIdController.text = state.value!.authorId.toString();
        _baseController.text = state.value!.base.toString();
        _extController.text = state.value!.ext.toString();
        _urlController.text = state.value!.url.toString();
        _refController.text = state.value!.ref.toString();
        _urlThumbnailController.text = state.value!.urlThumbnail.toString();
        _refThumbnailController.text = state.value!.refThumbnail.toString();
        if (state.value!.accessibleByGroup != null) {
          _accessibleByGroupSelectedRadioTile =
              state.value!.accessibleByGroup!.index;
        } else {
          _accessibleByGroupSelectedRadioTile = 0;
        }
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
      if (state is MemberMediumFormInitialized) {
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
                validator: (_) => state is AuthorIdMemberMediumFormError
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
                    state is BaseMemberMediumFormError ? state.message : null,
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
                    state is ExtMemberMediumFormError ? state.message : null,
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
                    state is UrlMemberMediumFormError ? state.message : null,
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
                    state is RefMemberMediumFormError ? state.message : null,
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
                validator: (_) => state is UrlThumbnailMemberMediumFormError
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
                validator: (_) => state is RefThumbnailMemberMediumFormError
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
                _accessibleByGroupSelectedRadioTile,
                'public',
                'public',
                !accessState.memberIsOwner(widget.app.documentID)
                    ? null
                    : (dynamic val) => setSelectionAccessibleByGroup(val)));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .radioListTile(
                widget.app,
                context,
                0,
                _accessibleByGroupSelectedRadioTile,
                'followers',
                'followers',
                !accessState.memberIsOwner(widget.app.documentID)
                    ? null
                    : (dynamic val) => setSelectionAccessibleByGroup(val)));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .radioListTile(
                widget.app,
                context,
                0,
                _accessibleByGroupSelectedRadioTile,
                'me',
                'me',
                !accessState.memberIsOwner(widget.app.documentID)
                    ? null
                    : (dynamic val) => setSelectionAccessibleByGroup(val)));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .radioListTile(
                widget.app,
                context,
                0,
                _accessibleByGroupSelectedRadioTile,
                'specificMembers',
                'specificMembers',
                !accessState.memberIsOwner(widget.app.documentID)
                    ? null
                    : (dynamic val) => setSelectionAccessibleByGroup(val)));

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
                validator: (_) => state is MediumWidthMemberMediumFormError
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
                validator: (_) => state is MediumHeightMemberMediumFormError
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
                validator: (_) => state is ThumbnailWidthMemberMediumFormError
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
                validator: (_) => state is ThumbnailHeightMemberMediumFormError
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
                validator: (_) => state is RelatedMediumIdMemberMediumFormError
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
                validator: (_) => state is DocumentIDMemberMediumFormError
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
                        if (state is MemberMediumFormError) {
                          return;
                        } else {
                          if (formAction == FormAction.updateAction) {
                            BlocProvider.of<MemberMediumListBloc>(context)
                                .add(UpdateMemberMediumList(
                                    value: state.value!.copyWith(
                              documentID: state.value!.documentID,
                              appId: state.value!.appId,
                              authorId: state.value!.authorId,
                              base: state.value!.base,
                              ext: state.value!.ext,
                              url: state.value!.url,
                              ref: state.value!.ref,
                              urlThumbnail: state.value!.urlThumbnail,
                              refThumbnail: state.value!.refThumbnail,
                              accessibleByGroup: state.value!.accessibleByGroup,
                              accessibleByMembers:
                                  state.value!.accessibleByMembers,
                              readAccess: state.value!.readAccess,
                              mediumType: state.value!.mediumType,
                              mediumWidth: state.value!.mediumWidth,
                              mediumHeight: state.value!.mediumHeight,
                              thumbnailWidth: state.value!.thumbnailWidth,
                              thumbnailHeight: state.value!.thumbnailHeight,
                              relatedMediumId: state.value!.relatedMediumId,
                            )));
                          } else {
                            BlocProvider.of<MemberMediumListBloc>(context)
                                .add(AddMemberMediumList(
                                    value: MemberMediumModel(
                              documentID: state.value!.documentID,
                              appId: state.value!.appId,
                              authorId: state.value!.authorId,
                              base: state.value!.base,
                              ext: state.value!.ext,
                              url: state.value!.url,
                              ref: state.value!.ref,
                              urlThumbnail: state.value!.urlThumbnail,
                              refThumbnail: state.value!.refThumbnail,
                              accessibleByGroup: state.value!.accessibleByGroup,
                              accessibleByMembers:
                                  state.value!.accessibleByMembers,
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
        .add(ChangedMemberMediumDocumentID(value: _documentIDController.text));
  }

  void _onAuthorIdChanged() {
    _myFormBloc
        .add(ChangedMemberMediumAuthorId(value: _authorIdController.text));
  }

  void _onBaseChanged() {
    _myFormBloc.add(ChangedMemberMediumBase(value: _baseController.text));
  }

  void _onExtChanged() {
    _myFormBloc.add(ChangedMemberMediumExt(value: _extController.text));
  }

  void _onUrlChanged() {
    _myFormBloc.add(ChangedMemberMediumUrl(value: _urlController.text));
  }

  void _onRefChanged() {
    _myFormBloc.add(ChangedMemberMediumRef(value: _refController.text));
  }

  void _onUrlThumbnailChanged() {
    _myFormBloc.add(
        ChangedMemberMediumUrlThumbnail(value: _urlThumbnailController.text));
  }

  void _onRefThumbnailChanged() {
    _myFormBloc.add(
        ChangedMemberMediumRefThumbnail(value: _refThumbnailController.text));
  }

  void setSelectionAccessibleByGroup(int? val) {
    setState(() {
      _accessibleByGroupSelectedRadioTile = val;
    });
    _myFormBloc.add(ChangedMemberMediumAccessibleByGroup(
        value: toMemberMediumAccessibleByGroup(val)));
  }

  void setSelectionMediumType(int? val) {
    setState(() {
      _mediumTypeSelectedRadioTile = val;
    });
    _myFormBloc.add(ChangedMemberMediumMediumType(value: toMediumType(val)));
  }

  void _onMediumWidthChanged() {
    _myFormBloc.add(
        ChangedMemberMediumMediumWidth(value: _mediumWidthController.text));
  }

  void _onMediumHeightChanged() {
    _myFormBloc.add(
        ChangedMemberMediumMediumHeight(value: _mediumHeightController.text));
  }

  void _onThumbnailWidthChanged() {
    _myFormBloc.add(ChangedMemberMediumThumbnailWidth(
        value: _thumbnailWidthController.text));
  }

  void _onThumbnailHeightChanged() {
    _myFormBloc.add(ChangedMemberMediumThumbnailHeight(
        value: _thumbnailHeightController.text));
  }

  void _onRelatedMediumIdChanged() {
    _myFormBloc.add(ChangedMemberMediumRelatedMediumId(
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
  bool _readOnly(AccessState accessState, MemberMediumFormInitialized state) {
    return (formAction == FormAction.showData) ||
        (formAction == FormAction.showPreloadedData) ||
        (!accessState.memberIsOwner(widget.app.documentID));
  }
}
