/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 app_policy_item_list.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';
import 'package:eliud_core/core/widgets/progress_indicator.dart';

import 'package:eliud_core/core/global_data.dart';
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

import 'package:eliud_core/model/app_policy_item_list_event.dart';
import 'package:eliud_core/model/app_policy_item_list_state.dart';
import 'package:eliud_core/model/app_policy_item_list_bloc.dart';
import 'package:eliud_core/model/app_policy_item_model.dart';

import 'package:eliud_core/model/app_model.dart';


import 'app_policy_item_form.dart';


typedef AppPolicyItemWidgetProvider(AppPolicyItemModel? value);

class AppPolicyItemListWidget extends StatefulWidget with HasFab {
  BackgroundModel? listBackground;
  AppPolicyItemWidgetProvider? widgetProvider;
  bool? readOnly;
  String? form;
  AppPolicyItemListWidgetState? state;
  bool? isEmbedded;

  AppPolicyItemListWidget({ Key? key, this.readOnly, this.form, this.widgetProvider, this.isEmbedded, this.listBackground }): super(key: key);

  @override
  AppPolicyItemListWidgetState createState() {
    state ??= AppPolicyItemListWidgetState();
    return state!;
  }

  @override
  Widget? fab(BuildContext context) {
    if ((readOnly != null) && readOnly!) return null;
    state ??= AppPolicyItemListWidgetState();
    var accessState = AccessBloc.getState(context);
    return state!.fab(context, accessState);
  }
}

class AppPolicyItemListWidgetState extends State<AppPolicyItemListWidget> {
  @override
  Widget? fab(BuildContext aContext, AccessState accessState) {
    if (accessState is AppLoaded) {
      return !accessState.memberIsOwner() 
        ? null
        :FloatingActionButton(
        heroTag: "AppPolicyItemFloatBtnTag",
        foregroundColor: RgbHelper.color(rgbo: accessState.app.floatingButtonForegroundColor),
        backgroundColor: RgbHelper.color(rgbo: accessState.app.floatingButtonBackgroundColor),
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
            pageRouteBuilder(accessState.app, page: BlocProvider.value(
                value: BlocProvider.of<AppPolicyItemListBloc>(context),
                child: AppPolicyItemForm(
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
      return BlocBuilder<AppPolicyItemListBloc, AppPolicyItemListState>(builder: (context, state) {
        if (state is AppPolicyItemListLoading) {
          return Center(
            child: DelayedCircularProgressIndicator(),
          );
        } else if (state is AppPolicyItemListLoaded) {
          final values = state.values;
          if ((widget.isEmbedded != null) && widget.isEmbedded!) {
            var children = <Widget>[];
            children.add(theList(context, values, accessState));
            children.add(RaisedButton(
                    color: RgbHelper.color(rgbo: accessState.app.formSubmitButtonColor),
                    onPressed: () {
                      Navigator.of(context).push(
                                pageRouteBuilder(accessState.app, page: BlocProvider.value(
                                    value: BlocProvider.of<AppPolicyItemListBloc>(context),
                                    child: AppPolicyItemForm(
                                        value: null,
                                        formAction: FormAction.AddAction)
                                )),
                              );
                    },
                    child: Text('Add', style: TextStyle(color: RgbHelper.color(rgbo: accessState.app.formSubmitButtonTextColor))),
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
          return Center(
            child: DelayedCircularProgressIndicator(),
          );
        }
      });
    } else {
      return Text("App not loaded");
    } 
  }
  
  Widget theList(BuildContext context, values, AppLoaded accessState) {
    return Container(
      decoration: widget.listBackground == null ? BoxDecorationHelper.boxDecoration(accessState, accessState.app.listBackground) : BoxDecorationHelper.boxDecoration(accessState, widget.listBackground),
      child: ListView.separated(
        separatorBuilder: (context, index) => Divider(
          color: RgbHelper.color(rgbo: accessState.app.dividerColor)
        ),
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount: values.length,
        itemBuilder: (context, index) {
          final value = values[index];
          
          if (widget.widgetProvider != null) return widget.widgetProvider!(value);

          return AppPolicyItemListItem(
            value: value,
            app: accessState.app,
            onDismissed: (direction) {
              BlocProvider.of<AppPolicyItemListBloc>(context)
                  .add(DeleteAppPolicyItemList(value: value));
              Scaffold.of(context).showSnackBar(DeleteSnackBar(
                message: "AppPolicyItem " + value.documentID,
                onUndo: () => BlocProvider.of<AppPolicyItemListBloc>(context)
                    .add(AddAppPolicyItemList(value: value)),
              ));
            },
            onTap: () async {
                                   final removedItem = await Navigator.of(context).push(
                        pageRouteBuilder(accessState.app, page: BlocProvider.value(
                              value: BlocProvider.of<AppPolicyItemListBloc>(context),
                              child: getForm(value, FormAction.UpdateAction))));
                      if (removedItem != null) {
                        Scaffold.of(context).showSnackBar(
                          DeleteSnackBar(
                        message: "AppPolicyItem " + value.documentID,
                            onUndo: () => BlocProvider.of<AppPolicyItemListBloc>(context)
                                .add(AddAppPolicyItemList(value: value)),
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
      return AppPolicyItemForm(value: value, formAction: action);
    } else {
      return null;
    }
  }
  
  
}


class AppPolicyItemListItem extends StatelessWidget {
  final DismissDirectionCallback onDismissed;
  final GestureTapCallback onTap;
  final AppModel app;
  final AppPolicyItemModel? value;

  AppPolicyItemListItem({
    Key? key,
    required this.onDismissed,
    required this.onTap,
    required this.value,
    required this.app,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key('__AppPolicyItem_item_${value!.documentID}'),
      onDismissed: onDismissed,
      child: ListTile(
        onTap: onTap,
        title: Hero(
          tag: '${value!.documentID}__AppPolicyItemheroTag',
          child: Container(
            width: fullScreenWidth(context),
            child: Center(child: Text(
              value!.documentID!,
              style: TextStyle(color: RgbHelper.color(rgbo: app.listTextItemColor)),
            )),
          ),
        ),
        subtitle: (value!.documentID != null) && (value!.documentID!.isNotEmpty)
            ? Center( child: Text(
          value!.documentID!,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: RgbHelper.color(rgbo: app.listTextItemColor)),
        ))
            : null,
      ),
    );
  }
}

