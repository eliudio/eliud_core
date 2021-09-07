/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 menu_item_list.dart
                       
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

import 'package:eliud_core/model/menu_item_list_event.dart';
import 'package:eliud_core/model/menu_item_list_state.dart';
import 'package:eliud_core/model/menu_item_list_bloc.dart';
import 'package:eliud_core/model/menu_item_model.dart';

import 'package:eliud_core/model/app_model.dart';


import 'menu_item_form.dart';


typedef MenuItemWidgetProvider(MenuItemModel? value);

class MenuItemListWidget extends StatefulWidget with HasFab {
  BackgroundModel? listBackground;
  MenuItemWidgetProvider? widgetProvider;
  bool? readOnly;
  String? form;
  MenuItemListWidgetState? state;
  bool? isEmbedded;

  MenuItemListWidget({ Key? key, this.readOnly, this.form, this.widgetProvider, this.isEmbedded, this.listBackground }): super(key: key);

  @override
  MenuItemListWidgetState createState() {
    state ??= MenuItemListWidgetState();
    return state!;
  }

  @override
  Widget? fab(BuildContext context) {
    if ((readOnly != null) && readOnly!) return null;
    state ??= MenuItemListWidgetState();
    var accessState = AccessBloc.getState(context);
    return state!.fab(context, accessState);
  }
}

class MenuItemListWidgetState extends State<MenuItemListWidget> {
  @override
  Widget? fab(BuildContext aContext, AccessState accessState) {
    if (accessState is AppLoaded) {
      return !accessState.memberIsOwner() 
        ? null
        : StyleRegistry.registry().styleWithContext(context).adminListStyle().floatingActionButton(context, 'PageFloatBtnTag', Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
            pageRouteBuilder(accessState.app, page: BlocProvider.value(
                value: BlocProvider.of<MenuItemListBloc>(context),
                child: MenuItemForm(
                    value: null,
                    formAction: FormAction.AddAction)
            )),
          );
        },
      );
    } else {
      return Text('App not loaded');
    }
  }

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    if (accessState is AppLoaded) {
      return BlocBuilder<MenuItemListBloc, MenuItemListState>(builder: (context, state) {
        if (state is MenuItemListLoading) {
          return StyleRegistry.registry().styleWithContext(context).adminListStyle().progressIndicator(context);
        } else if (state is MenuItemListLoaded) {
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
                                    value: BlocProvider.of<MenuItemListBloc>(context),
                                    child: MenuItemForm(
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
      return Text("App not loaded");
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

          return MenuItemListItem(
            value: value,
//            app: accessState.app,
            onDismissed: (direction) {
              BlocProvider.of<MenuItemListBloc>(context)
                  .add(DeleteMenuItemList(value: value));
              Scaffold.of(context).showSnackBar(DeleteSnackBar(
                message: "MenuItem " + value.documentID,
                onUndo: () => BlocProvider.of<MenuItemListBloc>(context)
                    .add(AddMenuItemList(value: value)),
              ));
            },
            onTap: () async {
                                   final removedItem = await Navigator.of(context).push(
                        pageRouteBuilder(accessState.app, page: BlocProvider.value(
                              value: BlocProvider.of<MenuItemListBloc>(context),
                              child: getForm(value, FormAction.UpdateAction))));
                      if (removedItem != null) {
                        Scaffold.of(context).showSnackBar(
                          DeleteSnackBar(
                        message: "MenuItem " + value.documentID,
                            onUndo: () => BlocProvider.of<MenuItemListBloc>(context)
                                .add(AddMenuItemList(value: value)),
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
      return MenuItemForm(value: value, formAction: action);
    } else {
      return null;
    }
  }
  
  
}


class MenuItemListItem extends StatelessWidget {
  final DismissDirectionCallback onDismissed;
  final GestureTapCallback onTap;
  final MenuItemModel value;

  MenuItemListItem({
    Key? key,
    required this.onDismissed,
    required this.onTap,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key('__MenuItem_item_${value!.documentID}'),
      onDismissed: onDismissed,
      child: ListTile(
        onTap: onTap,
        title: value!.text != null ? Center(child: StyleRegistry.registry().styleWithContext(context).adminListStyle().listItem(context, value!.text!)) : Container(),
        subtitle: value!.description != null ? Center(child: StyleRegistry.registry().styleWithContext(context).adminListStyle().listItem(context, value!.description!)) : Container(),
      ),
    );
  }
}

