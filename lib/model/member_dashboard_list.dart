/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_dashboard_list.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:eliud_core/core/blocs/app/app_bloc.dart';
import 'package:eliud_core/core/blocs/access/state/access_state.dart';
import 'package:eliud_core/core/blocs/app/app_state.dart';
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

import 'package:eliud_core/model/member_dashboard_list_event.dart';
import 'package:eliud_core/model/member_dashboard_list_state.dart';
import 'package:eliud_core/model/member_dashboard_list_bloc.dart';
import 'package:eliud_core/model/member_dashboard_model.dart';

import 'package:eliud_core/model/app_model.dart';


import 'member_dashboard_form.dart';


typedef MemberDashboardWidgetProvider(MemberDashboardModel? value);

class MemberDashboardListWidget extends StatefulWidget with HasFab {
  BackgroundModel? listBackground;
  MemberDashboardWidgetProvider? widgetProvider;
  bool? readOnly;
  String? form;
  MemberDashboardListWidgetState? state;
  bool? isEmbedded;

  MemberDashboardListWidget({ Key? key, this.readOnly, this.form, this.widgetProvider, this.isEmbedded, this.listBackground }): super(key: key);

  @override
  MemberDashboardListWidgetState createState() {
    state ??= MemberDashboardListWidgetState();
    return state!;
  }

  @override
  Widget? fab(BuildContext context) {
    if ((readOnly != null) && readOnly!) return null;
    state ??= MemberDashboardListWidgetState();
    var accessState = AccessBloc.getState(context);
    return state!.fab(context, accessState);
  }
}

class MemberDashboardListWidgetState extends State<MemberDashboardListWidget> {
  @override
  Widget? fab(BuildContext aContext, AccessState accessState) {
    if (accessState is AppLoaded) {
      return !accessState.memberIsOwner(AppBloc.currentAppId(context)) 
        ? null
        : StyleRegistry.registry().styleWithContext(context).adminListStyle().floatingActionButton(context, 'PageFloatBtnTag', Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
            pageRouteBuilder(AppBloc.currentApp(context), page: BlocProvider.value(
                value: BlocProvider.of<MemberDashboardListBloc>(context),
                child: MemberDashboardForm(
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
    return BlocBuilder<AccessBloc, AccessState>(
        builder: (context, accessState) {
      return BlocBuilder<AppBloc, AppState>(builder: (context, appState) {
        if (appState is AppLoaded) {
          return BlocBuilder<MemberDashboardListBloc, MemberDashboardListState>(builder: (context, state) {
            if (state is MemberDashboardListLoading) {
              return StyleRegistry.registry().styleWithContext(context).adminListStyle().progressIndicator(context);
            } else if (state is MemberDashboardListLoaded) {
              final values = state.values;
              if ((widget.isEmbedded != null) && widget.isEmbedded!) {
                var children = <Widget>[];
                children.add(theList(context, values, accessState));
                children.add(
                    StyleRegistry.registry().styleWithContext(context).adminFormStyle().button(
                        context, label: 'Add',
                        onPressed: () {
                          Navigator.of(context).push(
                                    pageRouteBuilder(appState.app, page: BlocProvider.value(
                                        value: BlocProvider.of<MemberDashboardListBloc>(context),
                                        child: MemberDashboardForm(
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
      });
    });
  }
  
  Widget theList(BuildContext context, values, AccessState accessState) {
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

          return MemberDashboardListItem(
            value: value,
//            app: accessState.app,
            onDismissed: (direction) {
              BlocProvider.of<MemberDashboardListBloc>(context)
                  .add(DeleteMemberDashboardList(value: value));
              Scaffold.of(context).showSnackBar(DeleteSnackBar(
                message: "MemberDashboard " + value.documentID,
                onUndo: () => BlocProvider.of<MemberDashboardListBloc>(context)
                    .add(AddMemberDashboardList(value: value)),
              ));
            },
            onTap: () async {
                                   final removedItem = await Navigator.of(context).push(
                        pageRouteBuilder(AppBloc.currentApp(context), page: BlocProvider.value(
                              value: BlocProvider.of<MemberDashboardListBloc>(context),
                              child: getForm(value, FormAction.UpdateAction))));
                      if (removedItem != null) {
                        Scaffold.of(context).showSnackBar(
                          DeleteSnackBar(
                        message: "MemberDashboard " + value.documentID,
                            onUndo: () => BlocProvider.of<MemberDashboardListBloc>(context)
                                .add(AddMemberDashboardList(value: value)),
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
      return MemberDashboardForm(value: value, formAction: action);
    } else {
      return null;
    }
  }
  
  
}


class MemberDashboardListItem extends StatelessWidget {
  final DismissDirectionCallback onDismissed;
  final GestureTapCallback onTap;
  final MemberDashboardModel value;

  MemberDashboardListItem({
    Key? key,
    required this.onDismissed,
    required this.onTap,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key('__MemberDashboard_item_${value.documentID}'),
      onDismissed: onDismissed,
      child: ListTile(
        onTap: onTap,
        title: value.documentID != null ? Center(child: StyleRegistry.registry().styleWithContext(context).frontEndStyle().textStyle().text(context, value.documentID!)) : Container(),
        subtitle: value.description != null ? Center(child: StyleRegistry.registry().styleWithContext(context).frontEndStyle().textStyle().text(context, value.description!)) : Container(),
      ),
    );
  }
}

