/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 drawer_form.dart
                       
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
import 'package:eliud_core/tools/bespoke_formfields.dart';

import 'package:eliud_core/tools/enums.dart';

import 'package:eliud_core/model/model_export.dart';

import 'package:eliud_core/model/drawer_list_bloc.dart';
import 'package:eliud_core/model/drawer_list_event.dart';
import 'package:eliud_core/model/drawer_form_bloc.dart';
import 'package:eliud_core/model/drawer_form_event.dart';
import 'package:eliud_core/model/drawer_form_state.dart';

class DrawerForm extends StatelessWidget {
  final AppModel app;
  final FormAction formAction;
  final DrawerModel? value;
  final ActionModel? submitAction;

  DrawerForm(
      {super.key,
      required this.app,
      required this.formAction,
      required this.value,
      this.submitAction});

  /// Build the DrawerForm
  @override
  Widget build(BuildContext context) {
    //var accessState = AccessBloc.getState(context);
    var appId = app.documentID;
    if (formAction == FormAction.showData) {
      return BlocProvider<DrawerFormBloc>(
        create: (context) => DrawerFormBloc(
          appId,
          formAction: formAction,
        )..add(InitialiseDrawerFormEvent(value: value)),
        child: MyDrawerForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    }
    if (formAction == FormAction.showPreloadedData) {
      return BlocProvider<DrawerFormBloc>(
        create: (context) => DrawerFormBloc(
          appId,
          formAction: formAction,
        )..add(InitialiseDrawerFormNoLoadEvent(value: value)),
        child: MyDrawerForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    } else {
      return Scaffold(
          appBar: StyleRegistry.registry()
              .styleWithApp(app)
              .adminFormStyle()
              .appBarWithString(app, context,
                  title: formAction == FormAction.updateAction
                      ? 'Update Drawer'
                      : 'Add Drawer'),
          body: BlocProvider<DrawerFormBloc>(
            create: (context) => DrawerFormBloc(
              appId,
              formAction: formAction,
            )..add((formAction == FormAction.updateAction
                ? InitialiseDrawerFormEvent(value: value)
                : InitialiseNewDrawerFormEvent())),
            child: MyDrawerForm(
                app: app, submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}

class MyDrawerForm extends StatefulWidget {
  final AppModel app;
  final FormAction? formAction;
  final ActionModel? submitAction;

  MyDrawerForm({required this.app, this.formAction, this.submitAction});

  @override
  State<MyDrawerForm> createState() => _MyDrawerFormState(formAction);
}

class _MyDrawerFormState extends State<MyDrawerForm> {
  final FormAction? formAction;
  late DrawerFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _headerTextController = TextEditingController();
  final TextEditingController _secondHeaderTextController =
      TextEditingController();
  final TextEditingController _headerHeightController = TextEditingController();
  String? _menu;

  _MyDrawerFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<DrawerFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
    _nameController.addListener(_onNameChanged);
    _headerTextController.addListener(_onHeaderTextChanged);
    _secondHeaderTextController.addListener(_onSecondHeaderTextChanged);
    _headerHeightController.addListener(_onHeaderHeightChanged);
  }

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<DrawerFormBloc, DrawerFormState>(
        builder: (context, state) {
      if (state is DrawerFormUninitialized) {
        return Center(
          child: StyleRegistry.registry()
              .styleWithApp(widget.app)
              .adminListStyle()
              .progressIndicator(widget.app, context),
        );
      }

      if (state is DrawerFormLoaded) {
        _documentIDController.text = state.value!.documentID.toString();
        _nameController.text = state.value!.name.toString();
        _headerTextController.text = state.value!.headerText.toString();
        _secondHeaderTextController.text =
            state.value!.secondHeaderText.toString();
        _headerHeightController.text = state.value!.headerHeight.toString();
        if (state.value!.menu != null) {
          _menu = state.value!.menu!.documentID;
        } else {
          _menu = "";
        }
      }
      if (state is DrawerFormInitialized) {
        List<Widget> children = [];
        children.add(Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: StyleRegistry.registry()
                .styleWithApp(widget.app)
                .adminFormStyle()
                .groupTitle(widget.app, context, 'General')));

        children.add(RgbField(
            widget.app,
            "Popup Menu Background Color",
            state.value!.popupMenuBackgroundColor,
            _onPopupMenuBackgroundColorChanged));

        children.add(RgbField(
            widget.app,
            "Popup Menu Background Color Override",
            state.value!.popupMenuBackgroundColorOverride,
            _onPopupMenuBackgroundColorOverrideChanged));

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
                validator: (_) =>
                    state is DocumentIDDrawerFormError ? state.message : null,
                hintText: null));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Name',
                icon: Icons.text_format,
                readOnly: _readOnly(accessState, state),
                textEditingController: _nameController,
                keyboardType: TextInputType.text,
                validator: (_) =>
                    state is NameDrawerFormError ? state.message : null,
                hintText: null));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Header Text',
                icon: Icons.text_format,
                readOnly: _readOnly(accessState, state),
                textEditingController: _headerTextController,
                keyboardType: TextInputType.text,
                validator: (_) =>
                    state is HeaderTextDrawerFormError ? state.message : null,
                hintText: null));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Header Description',
                icon: Icons.text_format,
                readOnly: _readOnly(accessState, state),
                textEditingController: _secondHeaderTextController,
                keyboardType: TextInputType.text,
                validator: (_) => state is SecondHeaderTextDrawerFormError
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
                .groupTitle(widget.app, context, 'Header')));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Header Height (0 for default)',
                icon: Icons.photo_size_select_large,
                readOnly: _readOnly(accessState, state),
                textEditingController: _headerHeightController,
                keyboardType: TextInputType.number,
                validator: (_) =>
                    state is HeaderHeightDrawerFormError ? state.message : null,
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
                .groupTitle(widget.app, context, 'Header Background')));

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
                .groupTitle(widget.app, context, 'Menu Item Colors')));

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
                .groupTitle(widget.app, context, 'Background')));

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
                .groupTitle(widget.app, context, 'Menu')));

        children.add(
          DropdownButtonComponentFactory().createNew(
              app: widget.app,
              id: "menuDefs",
              value: _menu,
              trigger: (value, privilegeLevel) => _onMenuSelected(value),
              optional: false),
        );

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
                        if (state is DrawerFormError) {
                          return;
                        } else {
                          if (formAction == FormAction.updateAction) {
                            BlocProvider.of<DrawerListBloc>(context)
                                .add(UpdateDrawerList(
                                    value: state.value!.copyWith(
                              documentID: state.value!.documentID,
                              appId: state.value!.appId,
                              name: state.value!.name,
                              backgroundOverride:
                                  state.value!.backgroundOverride,
                              headerText: state.value!.headerText,
                              secondHeaderText: state.value!.secondHeaderText,
                              headerHeight: state.value!.headerHeight,
                              popupMenuBackgroundColor:
                                  state.value!.popupMenuBackgroundColor,
                              headerBackgroundOverride:
                                  state.value!.headerBackgroundOverride,
                              popupMenuBackgroundColorOverride:
                                  state.value!.popupMenuBackgroundColorOverride,
                              menu: state.value!.menu,
                            )));
                          } else {
                            BlocProvider.of<DrawerListBloc>(context)
                                .add(AddDrawerList(
                                    value: DrawerModel(
                              documentID: state.value!.documentID,
                              appId: state.value!.appId,
                              name: state.value!.name,
                              backgroundOverride:
                                  state.value!.backgroundOverride,
                              headerText: state.value!.headerText,
                              secondHeaderText: state.value!.secondHeaderText,
                              headerHeight: state.value!.headerHeight,
                              popupMenuBackgroundColor:
                                  state.value!.popupMenuBackgroundColor,
                              headerBackgroundOverride:
                                  state.value!.headerBackgroundOverride,
                              popupMenuBackgroundColorOverride:
                                  state.value!.popupMenuBackgroundColorOverride,
                              menu: state.value!.menu,
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
    _myFormBloc.add(ChangedDrawerDocumentID(value: _documentIDController.text));
  }

  void _onNameChanged() {
    _myFormBloc.add(ChangedDrawerName(value: _nameController.text));
  }

  void _onHeaderTextChanged() {
    _myFormBloc.add(ChangedDrawerHeaderText(value: _headerTextController.text));
  }

  void _onSecondHeaderTextChanged() {
    _myFormBloc.add(
        ChangedDrawerSecondHeaderText(value: _secondHeaderTextController.text));
  }

  void _onHeaderHeightChanged() {
    _myFormBloc
        .add(ChangedDrawerHeaderHeight(value: _headerHeightController.text));
  }

  void _onPopupMenuBackgroundColorChanged(value) {
    _myFormBloc.add(ChangedDrawerPopupMenuBackgroundColor(value: value));
  }

  void _onPopupMenuBackgroundColorOverrideChanged(value) {
    _myFormBloc
        .add(ChangedDrawerPopupMenuBackgroundColorOverride(value: value));
  }

  void _onMenuSelected(String? val) {
    setState(() {
      _menu = val;
    });
    _myFormBloc.add(ChangedDrawerMenu(value: val));
  }

  @override
  void dispose() {
    _documentIDController.dispose();
    _nameController.dispose();
    _headerTextController.dispose();
    _secondHeaderTextController.dispose();
    _headerHeightController.dispose();
    super.dispose();
  }

  /// Is the form read-only?
  bool _readOnly(AccessState accessState, DrawerFormInitialized state) {
    return (formAction == FormAction.showData) ||
        (formAction == FormAction.showPreloadedData) ||
        (!accessState.memberIsOwner(widget.app.documentID));
  }
}
