/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 home_menu_form.dart
                       
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

import 'package:eliud_core/model/home_menu_list_bloc.dart';
import 'package:eliud_core/model/home_menu_list_event.dart';
import 'package:eliud_core/model/home_menu_form_bloc.dart';
import 'package:eliud_core/model/home_menu_form_event.dart';
import 'package:eliud_core/model/home_menu_form_state.dart';

class HomeMenuForm extends StatelessWidget {
  final AppModel app;
  final FormAction formAction;
  final HomeMenuModel? value;
  final ActionModel? submitAction;

  HomeMenuForm(
      {super.key,
      required this.app,
      required this.formAction,
      required this.value,
      this.submitAction});

  /// Build the HomeMenuForm
  @override
  Widget build(BuildContext context) {
    //var accessState = AccessBloc.getState(context);
    var appId = app.documentID;
    if (formAction == FormAction.showData) {
      return BlocProvider<HomeMenuFormBloc>(
        create: (context) => HomeMenuFormBloc(
          appId,
          formAction: formAction,
        )..add(InitialiseHomeMenuFormEvent(value: value)),
        child: MyHomeMenuForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    }
    if (formAction == FormAction.showPreloadedData) {
      return BlocProvider<HomeMenuFormBloc>(
        create: (context) => HomeMenuFormBloc(
          appId,
          formAction: formAction,
        )..add(InitialiseHomeMenuFormNoLoadEvent(value: value)),
        child: MyHomeMenuForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    } else {
      return Scaffold(
          appBar: StyleRegistry.registry()
              .styleWithApp(app)
              .adminFormStyle()
              .appBarWithString(app, context,
                  title: formAction == FormAction.updateAction
                      ? 'Update HomeMenu'
                      : 'Add HomeMenu'),
          body: BlocProvider<HomeMenuFormBloc>(
            create: (context) => HomeMenuFormBloc(
              appId,
              formAction: formAction,
            )..add((formAction == FormAction.updateAction
                ? InitialiseHomeMenuFormEvent(value: value)
                : InitialiseNewHomeMenuFormEvent())),
            child: MyHomeMenuForm(
                app: app, submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}

class MyHomeMenuForm extends StatefulWidget {
  final AppModel app;
  final FormAction? formAction;
  final ActionModel? submitAction;

  MyHomeMenuForm({required this.app, this.formAction, this.submitAction});

  @override
  State<MyHomeMenuForm> createState() => _MyHomeMenuFormState(formAction);
}

class _MyHomeMenuFormState extends State<MyHomeMenuForm> {
  final FormAction? formAction;
  late HomeMenuFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  String? _menu;

  _MyHomeMenuFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<HomeMenuFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
    _nameController.addListener(_onNameChanged);
  }

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<HomeMenuFormBloc, HomeMenuFormState>(
        builder: (context, state) {
      if (state is HomeMenuFormUninitialized) {
        return Center(
          child: StyleRegistry.registry()
              .styleWithApp(widget.app)
              .adminListStyle()
              .progressIndicator(widget.app, context),
        );
      }

      if (state is HomeMenuFormLoaded) {
        _documentIDController.text = state.value!.documentID.toString();
        _nameController.text = state.value!.name.toString();
        if (state.value!.menu != null) {
          _menu = state.value!.menu!.documentID;
        } else {
          _menu = "";
        }
      }
      if (state is HomeMenuFormInitialized) {
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
                labelText: 'Document ID',
                icon: Icons.vpn_key,
                readOnly: (formAction == FormAction.updateAction),
                textEditingController: _documentIDController,
                keyboardType: TextInputType.text,
                validator: (_) =>
                    state is DocumentIDHomeMenuFormError ? state.message : null,
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
                    state is NameHomeMenuFormError ? state.message : null,
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
                .groupTitle(widget.app, context, 'Colors')));

        children.add(RgbField(widget.app, "Icon Color Override",
            state.value!.iconColorOverride, _onIconColorOverrideChanged));

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
                .groupTitle(
                    widget.app, context, 'Popup Menu Background Color')));

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
                        if (state is HomeMenuFormError) {
                          return;
                        } else {
                          if (formAction == FormAction.updateAction) {
                            BlocProvider.of<HomeMenuListBloc>(context)
                                .add(UpdateHomeMenuList(
                                    value: state.value!.copyWith(
                              documentID: state.value!.documentID,
                              appId: state.value!.appId,
                              name: state.value!.name,
                              menu: state.value!.menu,
                              iconColorOverride: state.value!.iconColorOverride,
                              backgroundOverride:
                                  state.value!.backgroundOverride,
                              popupMenuBackgroundColorOverride:
                                  state.value!.popupMenuBackgroundColorOverride,
                            )));
                          } else {
                            BlocProvider.of<HomeMenuListBloc>(context)
                                .add(AddHomeMenuList(
                                    value: HomeMenuModel(
                              documentID: state.value!.documentID,
                              appId: state.value!.appId,
                              name: state.value!.name,
                              menu: state.value!.menu,
                              iconColorOverride: state.value!.iconColorOverride,
                              backgroundOverride:
                                  state.value!.backgroundOverride,
                              popupMenuBackgroundColorOverride:
                                  state.value!.popupMenuBackgroundColorOverride,
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
        .add(ChangedHomeMenuDocumentID(value: _documentIDController.text));
  }

  void _onNameChanged() {
    _myFormBloc.add(ChangedHomeMenuName(value: _nameController.text));
  }

  void _onMenuSelected(String? val) {
    setState(() {
      _menu = val;
    });
    _myFormBloc.add(ChangedHomeMenuMenu(value: val));
  }

  void _onIconColorOverrideChanged(value) {
    _myFormBloc.add(ChangedHomeMenuIconColorOverride(value: value));
  }

  void _onPopupMenuBackgroundColorOverrideChanged(value) {
    _myFormBloc
        .add(ChangedHomeMenuPopupMenuBackgroundColorOverride(value: value));
  }

  @override
  void dispose() {
    _documentIDController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  /// Is the form read-only?
  bool _readOnly(AccessState accessState, HomeMenuFormInitialized state) {
    return (formAction == FormAction.showData) ||
        (formAction == FormAction.showPreloadedData) ||
        (!accessState.memberIsOwner(widget.app.documentID));
  }
}
