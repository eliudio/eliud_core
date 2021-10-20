/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 dialog_list.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'package:eliud_core/tools/has_fab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/tools/screen_size.dart';
import 'package:eliud_core/model/background_model.dart';
import 'package:eliud_core/tools/delete_snackbar.dart';
import 'package:eliud_core/tools/router_builders.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:eliud_core/tools/enums.dart';
import 'package:eliud_core/eliud.dart';

import 'package:eliud_core/model/dialog_list_event.dart';
import 'package:eliud_core/model/dialog_list_state.dart';
import 'package:eliud_core/model/dialog_list_bloc.dart';
import 'package:eliud_core/model/dialog_model.dart';

import 'package:eliud_core/model/app_model.dart';


import 'dialog_form.dart';


typedef DialogWidgetProvider(DialogModel? value);

class DialogListWidget extends StatefulWidget with HasFab {
  BackgroundModel? listBackground;
  DialogWidgetProvider? widgetProvider;
  bool? readOnly;
  String? form;
  DialogListWidgetState? state;
  bool? isEmbedded;

  DialogListWidget({ Key? key, this.readOnly, this.form, this.widgetProvider, this.isEmbedded, this.listBackground }): super(key: key);

  @override
  DialogListWidgetState createState() {
    state ??= DialogListWidgetState();
    return state!;
  }

  @override
  Widget? fab(BuildContext context) {
    if ((readOnly != null) && readOnly!) return null;
    state ??= DialogListWidgetState();
    var accessState = AccessBloc.getState(context);
    return state!.fab(context, accessState);
  }
}

class DialogListWidgetState extends State<DialogListWidget> {
  @override
  Widget? fab(BuildContext aContext, AccessState accessState) {
    if (accessState is AppLoaded) {
      return !accessState.memberIsOwner() 
        ? null
        : StyleRegistry.registry().styleWithContext(context).adminListStyle().floatingActionButton(context, 'PageFloatBtnTag', Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
            pageRouteBuilder(accessState.app, page: BlocProvider.value(
                value: BlocProvider.of<DialogListBloc>(context),
                child: DialogForm(
                    value: null,
                    formAction: FormAction.AddAction)
            )),
          );
        },
      );
    } else {
      return StyleRegistry.registry().styleWithContext(context).adminListStyle().progressIndicator(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    if (accessState is AppLoaded) {
      return BlocBuilder<DialogListBloc, DialogListState>(builder: (context, state) {
        if (state is DialogListLoading) {
          return StyleRegistry.registry().styleWithContext(context).adminListStyle().progressIndicator(context);
        } else if (state is DialogListLoaded) {
          final values = state.values;
          if ((widget.isEmbedded != null) && widget.isEmbedded!) {
            var children = <Widget>[];
            children.add(theList(context, values, accessState));
            children.add(
                StyleRegistry.registry().styleWithContext(context).adminFormStyle().button(
                    context, label: 'Add',
                    onPressed: () {
                      Navigator.of(context).push(
                                pageRouteBuilder(accessState.app, page: BlocProvider.value(
                                    value: BlocProvider.of<DialogListBloc>(context),
                                    child: DialogForm(
                                        value: null,
                                        formAction: FormAction.AddAction)
                                )),
                              );
                    },
                  ));
            return ListView(
              padding: const EdgeInsets.all(8),
              physics: ScrollPhysics(),
              shrinkWrap: true,
              children: children
            );
          } else {
            return theList(context, values, accessState);
          }
        } else {
          return StyleRegistry.registry().styleWithContext(context).adminListStyle().progressIndicator(context);
        }
      });
    } else {
      return StyleRegistry.registry().styleWithContext(context).adminListStyle().progressIndicator(context);
    } 
  }
  
  Widget theList(BuildContext context, values, AppLoaded accessState) {
    return Container(
      decoration: widget.listBackground == null ? StyleRegistry.registry().styleWithContext(context).adminListStyle().boxDecorator(context) : BoxDecorationHelper.boxDecoration(accessState, widget.listBackground),
      child: ListView.separated(
        separatorBuilder: (context, index) => StyleRegistry.registry().styleWithContext(context).adminListStyle().divider(context),
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount: values.length,
        itemBuilder: (context, index) {
          final value = values[index];
          
          if (widget.widgetProvider != null) return widget.widgetProvider!(value);

          return DialogListItem(
            value: value,
//            app: accessState.app,
            onDismissed: (direction) {
              BlocProvider.of<DialogListBloc>(context)
                  .add(DeleteDialogList(value: value));
              Scaffold.of(context).showSnackBar(DeleteSnackBar(
                message: "Dialog " + value.documentID,
                onUndo: () => BlocProvider.of<DialogListBloc>(context)
                    .add(AddDialogList(value: value)),
              ));
            },
            onTap: () async {
                                   final removedItem = await Navigator.of(context).push(
                        pageRouteBuilder(accessState.app, page: BlocProvider.value(
                              value: BlocProvider.of<DialogListBloc>(context),
                              child: getForm(value, FormAction.UpdateAction))));
                      if (removedItem != null) {
                        Scaffold.of(context).showSnackBar(
                          DeleteSnackBar(
                        message: "Dialog " + value.documentID,
                            onUndo: () => BlocProvider.of<DialogListBloc>(context)
                                .add(AddDialogList(value: value)),
                          ),
                        );
                      }

            },
          );
        }
      ));
  }
  
  
  Widget? getForm(value, action) {
    if (widget.form == null) {
      return DialogForm(value: value, formAction: action);
    } else {
      return null;
    }
  }
  
  
}


class DialogListItem extends StatelessWidget {
  final DismissDirectionCallback onDismissed;
  final GestureTapCallback onTap;
  final DialogModel value;

  DialogListItem({
    Key? key,
    required this.onDismissed,
    required this.onTap,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key('__Dialog_item_${value.documentID}'),
      onDismissed: onDismissed,
      child: ListTile(
        onTap: onTap,
        title: value.documentID != null ? Center(child: StyleRegistry.registry().styleWithContext(context).frontEndStyle().textStyle().text(context, value.documentID!)) : Container(),
        subtitle: value.title != null ? Center(child: StyleRegistry.registry().styleWithContext(context).frontEndStyle().textStyle().text(context, value.title!)) : Container(),
      ),
    );
  }
}

