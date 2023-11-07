/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 app_bar_form.dart
                       
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

import 'package:eliud_core/model/app_bar_list_bloc.dart';
import 'package:eliud_core/model/app_bar_list_event.dart';
import 'package:eliud_core/model/app_bar_form_bloc.dart';
import 'package:eliud_core/model/app_bar_form_event.dart';
import 'package:eliud_core/model/app_bar_form_state.dart';

class AppBarForm extends StatelessWidget {
  final AppModel app;
  final FormAction formAction;
  final AppBarModel? value;
  final ActionModel? submitAction;

  AppBarForm(
      {super.key,
      required this.app,
      required this.formAction,
      required this.value,
      this.submitAction});

  /// Build the AppBarForm
  @override
  Widget build(BuildContext context) {
    //var accessState = AccessBloc.getState(context);
    var appId = app.documentID;
    if (formAction == FormAction.showData) {
      return BlocProvider<AppBarFormBloc>(
        create: (context) => AppBarFormBloc(
          appId,
          formAction: formAction,
        )..add(InitialiseAppBarFormEvent(value: value)),
        child: MyAppBarForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    }
    if (formAction == FormAction.showPreloadedData) {
      return BlocProvider<AppBarFormBloc>(
        create: (context) => AppBarFormBloc(
          appId,
          formAction: formAction,
        )..add(InitialiseAppBarFormNoLoadEvent(value: value)),
        child: MyAppBarForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    } else {
      return Scaffold(
          appBar: StyleRegistry.registry()
              .styleWithApp(app)
              .adminFormStyle()
              .appBarWithString(app, context,
                  title: formAction == FormAction.updateAction
                      ? 'Update AppBar'
                      : 'Add AppBar'),
          body: BlocProvider<AppBarFormBloc>(
            create: (context) => AppBarFormBloc(
              appId,
              formAction: formAction,
            )..add((formAction == FormAction.updateAction
                ? InitialiseAppBarFormEvent(value: value)
                : InitialiseNewAppBarFormEvent())),
            child: MyAppBarForm(
                app: app, submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}

class MyAppBarForm extends StatefulWidget {
  final AppModel app;
  final FormAction? formAction;
  final ActionModel? submitAction;

  MyAppBarForm({required this.app, this.formAction, this.submitAction});

  @override
  State<MyAppBarForm> createState() => _MyAppBarFormState(formAction);
}

class _MyAppBarFormState extends State<MyAppBarForm> {
  final FormAction? formAction;
  late AppBarFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  int? _headerSelectedRadioTile;
  String? _image;
  String? _iconMenu;

  _MyAppBarFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<AppBarFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
    _titleController.addListener(_onTitleChanged);
    _headerSelectedRadioTile = 0;
  }

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<AppBarFormBloc, AppBarFormState>(
        builder: (context, state) {
      if (state is AppBarFormUninitialized) {
        return Center(
          child: StyleRegistry.registry()
              .styleWithApp(widget.app)
              .adminListStyle()
              .progressIndicator(widget.app, context),
        );
      }

      if (state is AppBarFormLoaded) {
        _documentIDController.text = state.value!.documentID.toString();
        _titleController.text = state.value!.title.toString();
        if (state.value!.header != null) {
          _headerSelectedRadioTile = state.value!.header!.index;
        } else {
          _headerSelectedRadioTile = 0;
        }
        if (state.value!.image != null) {
          _image = state.value!.image!.documentID;
        } else {
          _image = "";
        }
        if (state.value!.iconMenu != null) {
          _iconMenu = state.value!.iconMenu!.documentID;
        } else {
          _iconMenu = "";
        }
      }
      if (state is AppBarFormInitialized) {
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
                    state is DocumentIDAppBarFormError ? state.message : null,
                hintText: null));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Title',
                icon: Icons.vpn_key,
                readOnly: _readOnly(accessState, state),
                textEditingController: _titleController,
                keyboardType: TextInputType.text,
                validator: (_) =>
                    state is TitleAppBarFormError ? state.message : null,
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
                .groupTitle(widget.app, context, 'Header type')));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .radioListTile(
                widget.app,
                context,
                0,
                _headerSelectedRadioTile,
                'title',
                'title',
                !accessState.memberIsOwner(widget.app.documentID)
                    ? null
                    : (dynamic val) => setSelectionHeader(val)));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .radioListTile(
                widget.app,
                context,
                0,
                _headerSelectedRadioTile,
                'image',
                'image',
                !accessState.memberIsOwner(widget.app.documentID)
                    ? null
                    : (dynamic val) => setSelectionHeader(val)));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .radioListTile(
                widget.app,
                context,
                0,
                _headerSelectedRadioTile,
                'icon',
                'icon',
                !accessState.memberIsOwner(widget.app.documentID)
                    ? null
                    : (dynamic val) => setSelectionHeader(val)));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .radioListTile(
                widget.app,
                context,
                0,
                _headerSelectedRadioTile,
                'none',
                'none',
                !accessState.memberIsOwner(widget.app.documentID)
                    ? null
                    : (dynamic val) => setSelectionHeader(val)));

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
                .groupTitle(widget.app, context, 'Image')));

        children.add(
          DropdownButtonComponentFactory().createNew(
              app: widget.app,
              id: "memberMediums",
              value: _image,
              trigger: (value, privilegeLevel) => _onImageSelected(value),
              optional: true),
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
                .groupTitle(widget.app, context, 'Icon')));

        children.add(IconField(widget.app, state.value!.icon, _onIconChanged));

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
                .groupTitle(widget.app, context, 'Icon Menu')));

        children.add(
          DropdownButtonComponentFactory().createNew(
              app: widget.app,
              id: "menuDefs",
              value: _iconMenu,
              trigger: (value, privilegeLevel) => _onIconMenuSelected(value),
              optional: true),
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
                .groupTitle(widget.app, context, 'AppBar Colors')));

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
                .groupTitle(widget.app, context, 'Icon Colors')));

        children.add(RgbField(widget.app, "Text color",
            state.value!.iconColorOverride, _onIconColorOverrideChanged));

        children.add(RgbField(
            widget.app,
            "Selected Icon Color",
            state.value!.selectedIconColorOverride,
            _onSelectedIconColorOverrideChanged));

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
                .groupTitle(widget.app, context, 'Menu Colors')));

        children.add(RgbField(
            widget.app,
            "Background Color",
            state.value!.menuBackgroundColorOverride,
            _onMenuBackgroundColorOverrideChanged));

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
                        if (state is AppBarFormError) {
                          return;
                        } else {
                          if (formAction == FormAction.updateAction) {
                            BlocProvider.of<AppBarListBloc>(context)
                                .add(UpdateAppBarList(
                                    value: state.value!.copyWith(
                              documentID: state.value!.documentID,
                              appId: state.value!.appId,
                              title: state.value!.title,
                              header: state.value!.header,
                              icon: state.value!.icon,
                              image: state.value!.image,
                              iconMenu: state.value!.iconMenu,
                              backgroundOverride:
                                  state.value!.backgroundOverride,
                              iconColorOverride: state.value!.iconColorOverride,
                              selectedIconColorOverride:
                                  state.value!.selectedIconColorOverride,
                              menuBackgroundColorOverride:
                                  state.value!.menuBackgroundColorOverride,
                            )));
                          } else {
                            BlocProvider.of<AppBarListBloc>(context)
                                .add(AddAppBarList(
                                    value: AppBarModel(
                              documentID: state.value!.documentID,
                              appId: state.value!.appId,
                              title: state.value!.title,
                              header: state.value!.header,
                              icon: state.value!.icon,
                              image: state.value!.image,
                              iconMenu: state.value!.iconMenu,
                              backgroundOverride:
                                  state.value!.backgroundOverride,
                              iconColorOverride: state.value!.iconColorOverride,
                              selectedIconColorOverride:
                                  state.value!.selectedIconColorOverride,
                              menuBackgroundColorOverride:
                                  state.value!.menuBackgroundColorOverride,
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
    _myFormBloc.add(ChangedAppBarDocumentID(value: _documentIDController.text));
  }

  void _onTitleChanged() {
    _myFormBloc.add(ChangedAppBarTitle(value: _titleController.text));
  }

  void setSelectionHeader(int? val) {
    setState(() {
      _headerSelectedRadioTile = val;
    });
    _myFormBloc.add(ChangedAppBarHeader(value: toHeaderSelection(val)));
  }

  void _onIconChanged(value) {
    _myFormBloc.add(ChangedAppBarIcon(value: value));
  }

  void _onImageSelected(String? val) {
    setState(() {
      _image = val;
    });
    _myFormBloc.add(ChangedAppBarImage(value: val));
  }

  void _onIconMenuSelected(String? val) {
    setState(() {
      _iconMenu = val;
    });
    _myFormBloc.add(ChangedAppBarIconMenu(value: val));
  }

  void _onIconColorOverrideChanged(value) {
    _myFormBloc.add(ChangedAppBarIconColorOverride(value: value));
  }

  void _onSelectedIconColorOverrideChanged(value) {
    _myFormBloc.add(ChangedAppBarSelectedIconColorOverride(value: value));
  }

  void _onMenuBackgroundColorOverrideChanged(value) {
    _myFormBloc.add(ChangedAppBarMenuBackgroundColorOverride(value: value));
  }

  @override
  void dispose() {
    _documentIDController.dispose();
    _titleController.dispose();
    super.dispose();
  }

  /// Is the form read-only?
  bool _readOnly(AccessState accessState, AppBarFormInitialized state) {
    return (formAction == FormAction.showData) ||
        (formAction == FormAction.showPreloadedData) ||
        (!accessState.memberIsOwner(widget.app.documentID));
  }
}
