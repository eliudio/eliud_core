/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_list.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:eliud_core/core/blocs/access/state/access_state.dart';
import 'package:eliud_core/core/blocs/access/state/access_determined.dart';
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

import 'package:eliud_core/model/member_list_event.dart';
import 'package:eliud_core/model/member_list_state.dart';
import 'package:eliud_core/model/member_list_bloc.dart';
import 'package:eliud_core/model/member_model.dart';

import 'package:eliud_core/model/app_model.dart';


import 'member_form.dart';


typedef MemberWidgetProvider(MemberModel? value);

class MemberListWidget extends StatefulWidget with HasFab {
  BackgroundModel? listBackground;
  MemberWidgetProvider? widgetProvider;
  bool? readOnly;
  String? form;
  MemberListWidgetState? state;
  bool? isEmbedded;

  MemberListWidget({ Key? key, this.readOnly, this.form, this.widgetProvider, this.isEmbedded, this.listBackground }): super(key: key);

  @override
  MemberListWidgetState createState() {
    state ??= MemberListWidgetState();
    return state!;
  }

  @override
  Widget? fab(BuildContext context) {
    if ((readOnly != null) && readOnly!) return null;
    state ??= MemberListWidgetState();
    var accessState = AccessBloc.getState(context);
    return state!.fab(context, accessState);
  }
}

class MemberListWidgetState extends State<MemberListWidget> {
  @override
  Widget? fab(BuildContext aContext, AccessState accessState) {
    return !accessState.memberIsOwner(AccessBloc.currentAppId(context)) && false
      ? null
      : StyleRegistry.registry().styleWithContext(context).adminListStyle().floatingActionButton(context, 'PageFloatBtnTag', Icon(Icons.add),
      onPressed: () {
        Navigator.of(context).push(
          pageRouteBuilder(AccessBloc.currentApp(context), page: BlocProvider.value(
              value: BlocProvider.of<MemberListBloc>(context),
              child: MemberForm(
                  value: null,
                  formAction: FormAction.AddAction)
          )),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccessBloc, AccessState>(
        builder: (context, accessState) {
      if (accessState is AccessDetermined) {
        return BlocBuilder<MemberListBloc, MemberListState>(builder: (context, state) {
          if (state is MemberListLoading) {
            return StyleRegistry.registry().styleWithContext(context).adminListStyle().progressIndicator(context);
          } else if (state is MemberListLoaded) {
            final values = state.values;
            if ((widget.isEmbedded != null) && widget.isEmbedded!) {
              var children = <Widget>[];
              children.add(theList(context, values, accessState));
              children.add(
                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().button(
                      context, label: 'Add',
                      onPressed: () {
                        Navigator.of(context).push(
                                  pageRouteBuilder(accessState.currentApp, page: BlocProvider.value(
                                      value: BlocProvider.of<MemberListBloc>(context),
                                      child: MemberForm(
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
  }
  
  Widget theList(BuildContext context, values, AccessState accessState) {
    return Container(
      decoration: widget.listBackground == null ? StyleRegistry.registry().styleWithContext(context).adminListStyle().boxDecorator(context, accessState.getMember()) : BoxDecorationHelper.boxDecoration(accessState.getMember(), widget.listBackground),
      child: ListView.separated(
        separatorBuilder: (context, index) => StyleRegistry.registry().styleWithContext(context).adminListStyle().divider(context),
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount: values.length,
        itemBuilder: (context, index) {
          final value = values[index];
          
          if (widget.widgetProvider != null) return widget.widgetProvider!(value);

          return MemberListItem(
            value: value,
//            app: accessState.app,
            onDismissed: (direction) {
              BlocProvider.of<MemberListBloc>(context)
                  .add(DeleteMemberList(value: value));
              Scaffold.of(context).showSnackBar(DeleteSnackBar(
                message: "Member " + value.,
                onUndo: () => BlocProvider.of<MemberListBloc>(context)
                    .add(AddMemberList(value: value)),
              ));
            },
            onTap: () async {
                                   final removedItem = await Navigator.of(context).push(
                        pageRouteBuilder(AccessBloc.currentApp(context), page: BlocProvider.value(
                              value: BlocProvider.of<MemberListBloc>(context),
                              child: getForm(value, FormAction.UpdateAction))));
                      if (removedItem != null) {
                        Scaffold.of(context).showSnackBar(
                          DeleteSnackBar(
                        message: "Member " + value.,
                            onUndo: () => BlocProvider.of<MemberListBloc>(context)
                                .add(AddMemberList(value: value)),
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
      return MemberForm(value: value, formAction: action);
    } else {
      if (widget.form == "MemberSmallForm") return MemberSmallForm(value: value, formAction: action);
      if (widget.form == "MemberAddressForm") return MemberAddressForm(value: value, formAction: action);
      return null;
    }
  }
  
  
}


class MemberListItem extends StatelessWidget {
  final DismissDirectionCallback onDismissed;
  final GestureTapCallback onTap;
  final MemberModel value;

  MemberListItem({
    Key? key,
    required this.onDismissed,
    required this.onTap,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key('__Member_item_${value.documentID}'),
      onDismissed: onDismissed,
      child: ListTile(
        onTap: onTap,
        title: value.documentID != null ? Center(child: StyleRegistry.registry().styleWithContext(context).frontEndStyle().textStyle().text(context, value.documentID!)) : Container(),
        subtitle: value.name != null ? Center(child: StyleRegistry.registry().styleWithContext(context).frontEndStyle().textStyle().text(context, value.name!)) : Container(),
      ),
    );
  }
}

