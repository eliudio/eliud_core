import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:eliud_core/core/blocs/access/state/access_determined.dart';
import 'package:eliud_core/core/blocs/access/state/access_state.dart';
import 'package:eliud_core/core/editor/ext_editor_base_bloc/ext_editor_base_event.dart';
import 'package:eliud_core/core/editor/ext_editor_base_bloc/ext_editor_base_state.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/member_medium_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/style/frontend/has_button.dart';
import 'package:eliud_core/style/frontend/has_container.dart';
import 'package:eliud_core/style/frontend/has_dialog.dart';
import 'package:eliud_core/style/frontend/has_dialog_field.dart';
import 'package:eliud_core/style/frontend/has_divider.dart';
import 'package:eliud_core/style/frontend/has_list_tile.dart';
import 'package:eliud_core/style/frontend/has_progress_indicator.dart';
import 'package:eliud_core/style/frontend/has_text.dart';
import 'package:eliud_core/tools/random.dart';
import 'package:eliud_core/tools/screen_size.dart';
import 'package:eliud_core/tools/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/registry.dart';
import '../../model/member_subscription_model.dart';
import '../bloc/member_bloc.dart';
import 'member_subscription_model_widget.dart';

typedef void MemberModelCallback(MemberModel memberModel);

class MemberModelWidget extends StatefulWidget {
  final bool create;
  final double widgetWidth;
  final double widgetHeight;
  final AppModel app;
  //final MemberModel memberModel;
  final MemberModelCallback memberModelCallback;

  MemberModelWidget._({
    Key? key,
    required this.app,
    required this.create,
    required this.widgetWidth,
    required this.widgetHeight,
//    required this.memberModel,
    required this.memberModelCallback,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MemberModelWidgetState();
  }

  static Widget getIt(
      BuildContext context,
      AppModel app,
      bool create,
      double widgetWidth,
      double widgetHeight,
      MemberModel memberModel,
      MemberModelCallback memberModelCallback,) {
    //var copyOf = memberModel.copyWith();
    return MemberModelWidget._(
      app: app,
      create: create,
      widgetWidth: widgetWidth,
      widgetHeight: widgetHeight,
      //memberModel: copyOf,
      memberModelCallback: memberModelCallback,
    );
  }
}

class _MemberModelWidgetState extends State<MemberModelWidget> {
  int? currentPrivilegeLevel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccessBloc, AccessState>(
        builder: (aContext, accessState) {
      if (accessState is AccessDetermined) {
        return BlocBuilder<MemberBloc, ExtEditorBaseState<MemberModel>>(
            builder: (ppContext, memberState) {
          if (memberState is ExtEditorBaseInitialised<MemberModel, dynamic>) {
            return ListView(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                children: [
                  HeaderWidget(
                    app: widget.app,
                    cancelAction: () async {
                      return true;
                    },
                    okAction: () async {
                      widget.memberModelCallback(memberState.model);
                      return true;
                    },
                    title: 'Member',
                  ),
                  divider(widget.app, context),
                  topicContainer(widget.app, context,
                      title: 'General',
                      collapsible: true,
                      collapsed: true,
                      children: [
                        getListTile(context, widget.app,
                            leading: Icon(Icons.vpn_key),
                            title: text(widget.app, context,
                                memberState.model.documentID!)),
                  topicContainer(widget.app, context,
                      title: 'Links',
                      collapsible: true,
                      collapsed: true,
                      children: [
                        _subscripions(memberState),
                      ]),
                  topicContainer(widget.app, context,
                      title: 'Image',
                      collapsible: true,
                      collapsed: true,
                      children: [
                        Registry.registry()!.getMediumApi().getMemberPhotoWidget(
                          context: context,
                          title: 'Select Image',
                          feedbackFunction: (mediumModel) {
                            setState(() {
                              var myMediumModel = mediumModel as MemberMediumModel;
                              memberState.model.photo = mediumModel;
                              memberState.model.photoURL = myMediumModel.url;
                            });
                          },
                          app: widget.app,
                          initialImage: memberState.model.photo,
                        ),
                      ])

                ])]);
          } else {
            return progressIndicator(widget.app, context);
          }
        });
      } else {
        return progressIndicator(widget.app, context);
      }
    });
  }

  Widget _subscripions(ExtEditorBaseInitialised<MemberModel, dynamic> state) {
    var items = state.model.subscriptions != null ? state.model.subscriptions! : [];
    return Container(
      height: 150,
      child: ListView(shrinkWrap: true, physics: ScrollPhysics(), children: [
        Container(
            height: 100,
            child: ListView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                //separatorBuilder: (context, index) => divider(widget.app, context),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final value = items[index];
                  return getListTile(
                    context,
                    widget.app,
                    title: text(
                        widget.app,
                        context,
                        (value.documentID ?? 'no documentID')),
                    trailing: PopupMenuButton<int>(
                        child: Icon(Icons.more_vert),
                        elevation: 10,
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            value: 1,
                            child: text(widget.app, context, 'Update'),
                          ),
                          PopupMenuItem(
                            value: 2,
                            child: text(widget.app, context, 'Delete'),
                          ),
                        ],
                        onSelected: (selectedValue) {
                          if (selectedValue == 1) {
                            open(
                                value,
                                    (newItem) =>
                                    BlocProvider.of<MemberBloc>(context)
                                        .add(UpdateItemEvent<MemberModel,
                                        MemberSubscriptionModel>(
                                        oldItem: value, newItem: newItem)),
                                );
                          } else if (selectedValue == 2) {
                            BlocProvider.of<MemberBloc>(context).add(
                                DeleteItemEvent<MemberModel,
                                    MemberSubscriptionModel>(itemModel: value));
                          }
                        }),
                  );
                })),
        divider(
          widget.app,
          context,
        ),
        Row(children: [
          Spacer(),
          button(
            widget.app,
            context,
            icon: Icon(
              Icons.add,
            ),
            label: 'Add',
            onPressed: () {
              open(
                  MemberSubscriptionModel(
                    documentID: newRandomKey(),
                  ),
                      (newItem) => BlocProvider.of<MemberBloc>(context)
                      .add(AddItemEvent(itemModel: newItem)),);
            },
          ),
          Spacer(),
        ])
      ]),
    );
  }

  void open(
      MemberSubscriptionModel value,
      MemberSubscriptionModelCallback memberActionModelCallback,
      ) {
    openFlexibleDialog(
      widget.app,
      context,
      widget.app.documentID! + '/_linkmodel',
      includeHeading: false,
      widthFraction: .8,
      child: MemberSubscriptionModelWidget.getIt(
          context,
          widget.app,
          false,
          fullScreenWidth(context) * .8,
          fullScreenHeight(context) - 100,
          value,
          memberActionModelCallback,
          ),
    );
  }

}


