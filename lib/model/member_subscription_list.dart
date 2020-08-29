/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_subscription_list.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/core/global_data.dart';
import 'package:eliud_core/tools/has_fab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/tools/screen_size.dart';

import 'package:eliud_core/tools/delete_snackbar.dart';
import 'package:eliud_core/tools/router_builders.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:eliud_core/tools/enums.dart';
import 'package:eliud_core/core/eliud.dart';

import 'member_subscription_list_event.dart';
import 'member_subscription_list_state.dart';
import 'member_subscription_list_bloc.dart';
import 'member_subscription_model.dart';

import 'member_subscription_form.dart';
class MemberSubscriptionListWidget extends StatefulWidget with HasFab {
  bool readOnly;
  String form;
  MemberSubscriptionListWidgetState state;

  MemberSubscriptionListWidget({ Key key, this.readOnly, this.form }): super(key: key);

  @override
  MemberSubscriptionListWidgetState createState() {
    state ??= MemberSubscriptionListWidgetState();
    return state;
  }

  Widget fab(BuildContext context) {
    if ((readOnly != null) && readOnly) return null;
    state ??= MemberSubscriptionListWidgetState();
    return state.fab(context);
  }
}

class MemberSubscriptionListWidgetState extends State<MemberSubscriptionListWidget> {
  MemberSubscriptionListBloc bloc;

  @override
  void didChangeDependencies() {
    bloc = BlocProvider.of<MemberSubscriptionListBloc>(context);
    super.didChangeDependencies();
  }

  @override
  void dispose () {
    if (bloc != null) bloc.close();
    super.dispose();
  }

  @override
  Widget fab(BuildContext aContext) {
    return !GlobalData.memberIsOwner()  
        ? null
        :FloatingActionButton(
      heroTag: "MemberSubscriptionFloatBtnTag",
      foregroundColor: RgbHelper.color(rgbo: GlobalData.app().floatingButtonForegroundColor),
      backgroundColor: RgbHelper.color(rgbo: GlobalData.app().floatingButtonBackgroundColor),
      child: Icon(Icons.add),
      onPressed: () {
        Navigator.of(context).push(
          pageRouteBuilder(page: BlocProvider.value(
              value: bloc,
              child: MemberSubscriptionForm(
                  value: null,
                  formAction: FormAction.AddAction)
          )),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MemberSubscriptionListBloc, MemberSubscriptionListState>(builder: (context, state) {
      if (state is MemberSubscriptionListLoading) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is MemberSubscriptionListLoaded) {
        final values = state.values;
        return Container(
                 decoration: BoxDecorationHelper.boxDecoration(GlobalData.app().listBackground),
                 child: ListView.separated(
                   separatorBuilder: (context, index) => Divider(
                     color: RgbHelper.color(rgbo: GlobalData.app().dividerColor)
                   ),
                   shrinkWrap: true,
                   physics: ScrollPhysics(),
                   itemCount: values.length,
                   itemBuilder: (context, index) {
                     final value = values[index];
                     return MemberSubscriptionListItem(
                       value: value,
                       onDismissed: (direction) {
                         BlocProvider.of<MemberSubscriptionListBloc>(context)
                             .add(DeleteMemberSubscriptionList(value: value));
                         Scaffold.of(context).showSnackBar(DeleteSnackBar(
                           message: "MemberSubscription " + value.documentID,
                           onUndo: () => BlocProvider.of<MemberSubscriptionListBloc>(context)
                               .add(AddMemberSubscriptionList(value: value)),
                         ));
                       },
                       onTap: () async {
                                             final removedItem = await Navigator.of(context).push(
                        pageRouteBuilder(page: BlocProvider.value(
                              value: BlocProvider.of<MemberSubscriptionListBloc>(context),
                              child: getForm(value, FormAction.UpdateAction))));
                      if (removedItem != null) {
                        Scaffold.of(context).showSnackBar(
                          DeleteSnackBar(
                        message: "MemberSubscription " + value.documentID,
                            onUndo: () => BlocProvider.of<MemberSubscriptionListBloc>(context)
                                .add(AddMemberSubscriptionList(value: value)),
                          ),
                        );
                      }

                       },
                     );
                   }
               ));
      } else {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }
  
  Widget getForm(value, action) {
    if (widget.form == null) {
      return MemberSubscriptionForm(value: value, formAction: action);
    } else {
      return null;
    }
  }
  
}


class MemberSubscriptionListItem extends StatelessWidget {
  final DismissDirectionCallback onDismissed;
  final GestureTapCallback onTap;
  final MemberSubscriptionModel value;

  MemberSubscriptionListItem({
    Key key,
    @required this.onDismissed,
    @required this.onTap,
    @required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key('__MemberSubscription_item_${value.documentID}'),
      onDismissed: onDismissed,
      child: ListTile(
        onTap: onTap,
        title: Hero(
          tag: '${value.documentID}__MemberSubscriptionheroTag',
          child: Container(
            width: fullScreenWidth(context),
            child: Center(child: Text(
              value.app.title,
              style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().listTextItemColor)),
            )),
          ),
        ),
      ),
    );
  }
}

