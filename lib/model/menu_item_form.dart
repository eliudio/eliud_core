/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 menu_item_form.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/core/blocs/access/state/access_state.dart';
import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core/core/navigate/router.dart' as eliudrouter;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/style/style_registry.dart';

import 'package:eliud_core/tools/bespoke_formfields.dart';

import 'package:eliud_core/tools/enums.dart';

import 'package:eliud_core/model/model_export.dart';

import 'package:eliud_core/model/menu_item_list_bloc.dart';
import 'package:eliud_core/model/menu_item_list_event.dart';
import 'package:eliud_core/model/menu_item_form_bloc.dart';
import 'package:eliud_core/model/menu_item_form_event.dart';
import 'package:eliud_core/model/menu_item_form_state.dart';

class MenuItemForm extends StatelessWidget {
  final AppModel app;
  final FormAction formAction;
  final MenuItemModel? value;
  final ActionModel? submitAction;

  MenuItemForm(
      {super.key,
      required this.app,
      required this.formAction,
      required this.value,
      this.submitAction});

  /// Build the MenuItemForm
  @override
  Widget build(BuildContext context) {
    //var accessState = AccessBloc.getState(context);
    var appId = app.documentID;
    if (formAction == FormAction.showData) {
      return BlocProvider<MenuItemFormBloc>(
        create: (context) => MenuItemFormBloc(
          appId,
        )..add(InitialiseMenuItemFormEvent(value: value)),
        child: _MyMenuItemForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    }
    if (formAction == FormAction.showPreloadedData) {
      return BlocProvider<MenuItemFormBloc>(
        create: (context) => MenuItemFormBloc(
          appId,
        )..add(InitialiseMenuItemFormNoLoadEvent(value: value)),
        child: _MyMenuItemForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    } else {
      return Scaffold(
          appBar: StyleRegistry.registry()
              .styleWithApp(app)
              .adminFormStyle()
              .appBarWithString(app, context,
                  title: formAction == FormAction.updateAction
                      ? 'Update MenuItem'
                      : 'Add MenuItem'),
          body: BlocProvider<MenuItemFormBloc>(
            create: (context) => MenuItemFormBloc(
              appId,
            )..add((formAction == FormAction.updateAction
                ? InitialiseMenuItemFormEvent(value: value)
                : InitialiseNewMenuItemFormEvent())),
            child: _MyMenuItemForm(
                app: app, submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}

class _MyMenuItemForm extends StatefulWidget {
  final AppModel app;
  final FormAction? formAction;
  final ActionModel? submitAction;

  _MyMenuItemForm({required this.app, this.formAction, this.submitAction});

  @override
  State<_MyMenuItemForm> createState() => _MyMenuItemFormState(formAction);
}

class _MyMenuItemFormState extends State<_MyMenuItemForm> {
  final FormAction? formAction;
  late MenuItemFormBloc _myFormBloc;

  final TextEditingController _textController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  _MyMenuItemFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<MenuItemFormBloc>(context);
    _textController.addListener(_onTextChanged);
    _descriptionController.addListener(_onDescriptionChanged);
  }

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<MenuItemFormBloc, MenuItemFormState>(
        builder: (context, state) {
      if (state is MenuItemFormUninitialized) {
        return Center(
          child: StyleRegistry.registry()
              .styleWithApp(widget.app)
              .adminListStyle()
              .progressIndicator(widget.app, context),
        );
      }

      if (state is MenuItemFormLoaded) {
        _textController.text = state.value!.text.toString();
        _descriptionController.text = state.value!.description.toString();
      }
      if (state is MenuItemFormInitialized) {
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
                labelText: 'text',
                icon: Icons.text_format,
                readOnly: _readOnly(accessState, state),
                textEditingController: _textController,
                keyboardType: TextInputType.text,
                validator: (_) =>
                    state is TextMenuItemFormError ? state.message : null,
                hintText: null));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'description',
                icon: Icons.text_format,
                readOnly: _readOnly(accessState, state),
                textEditingController: _descriptionController,
                keyboardType: TextInputType.text,
                validator: (_) => state is DescriptionMenuItemFormError
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
                .groupTitle(widget.app, context, 'Action')));

        children.add(
            ActionField(widget.app, state.value!.action, _onActionChanged));

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
                        if (state is MenuItemFormError) {
                          return;
                        } else {
                          if (formAction == FormAction.updateAction) {
                            BlocProvider.of<MenuItemListBloc>(context)
                                .add(UpdateMenuItemList(
                                    value: state.value!.copyWith(
                              documentID: state.value!.documentID,
                              text: state.value!.text,
                              description: state.value!.description,
                              icon: state.value!.icon,
                              action: state.value!.action,
                            )));
                          } else {
                            BlocProvider.of<MenuItemListBloc>(context)
                                .add(AddMenuItemList(
                                    value: MenuItemModel(
                              documentID: state.value!.documentID,
                              text: state.value!.text,
                              description: state.value!.description,
                              icon: state.value!.icon,
                              action: state.value!.action,
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

  void _onTextChanged() {
    _myFormBloc.add(ChangedMenuItemText(value: _textController.text));
  }

  void _onDescriptionChanged() {
    _myFormBloc
        .add(ChangedMenuItemDescription(value: _descriptionController.text));
  }

  void _onIconChanged(value) {
    _myFormBloc.add(ChangedMenuItemIcon(value: value));
  }

  void _onActionChanged(value) {
    _myFormBloc.add(ChangedMenuItemAction(value: value));
  }

  @override
  void dispose() {
    _textController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  /// Is the form read-only?
  bool _readOnly(AccessState accessState, MenuItemFormInitialized state) {
    return (formAction == FormAction.showData) ||
        (formAction == FormAction.showPreloadedData) ||
        (!accessState.memberIsOwner(widget.app.documentID));
  }
}
