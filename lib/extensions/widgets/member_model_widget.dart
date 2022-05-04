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
import '../../model/public_medium_model.dart';
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
    MemberModelCallback memberModelCallback,
  ) {
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
                      await BlocProvider.of<MemberBloc>(context)
                          .save(memberState.model);
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
                        getListTile(context, widget.app,
                            leading: Icon(Icons.description),
                            title: dialogField(
                              widget.app,
                              context,
                              initialValue: memberState.model.name,
                              valueChanged: (value) {
                                memberState.model.name = value;
                              },
                              maxLines: 1,
                              decoration: const InputDecoration(
                                hintText: 'Name',
                                labelText: 'Name',
                              ),
                            )),
                        getListTile(context, widget.app,
                            leading: Icon(Icons.email),
                            title: dialogField(
                              widget.app,
                              context,
                              initialValue: memberState.model.email,
                              valueChanged: (value) {
                                memberState.model.email = value;
                              },
                              maxLines: 1,
                              decoration: const InputDecoration(
                                hintText: 'email',
                                labelText: 'email',
                              ),
                            )),
                      ]),
                  topicContainer(widget.app, context,
                      title: 'Profile Photo',
                      collapsible: true,
                      collapsed: true,
                      children: [
                        Registry.registry()!
                            .getMediumApi()
                            .getPublicPhotoWidget(
                          context: context,
                          allowCrop: true,
                          feedbackFunction: (mediumModel) {
                            if (mediumModel != null) {
                              setState(() {
                                  var myMediumModel =
                                  mediumModel as PublicMediumModel;
                                  memberState.model.photo = mediumModel;
                                  memberState.model.photoURL =
                                      myMediumModel.url;
                              });
                            }
                          },
                          app: widget.app,
                          initialImage: memberState.model.photo,
                        ),
                      ]),
                  topicContainer(widget.app, context,
                      title: 'Shipping address',
                      collapsible: true,
                      collapsed: true,
                      children: [
                        getListTile(context, widget.app,
                            leading: Icon(Icons.description),
                            title: dialogField(
                              widget.app,
                              context,
                              initialValue: memberState.model.shipStreet1,
                              valueChanged: (value) {
                                memberState.model.shipStreet1 = value;
                              },
                              maxLines: 1,
                              decoration: const InputDecoration(
                                hintText: 'Address 1',
                                labelText: 'Address 1',
                              ),
                            )),
                        getListTile(context, widget.app,
                            leading: Icon(Icons.description),
                            title: dialogField(
                              widget.app,
                              context,
                              initialValue: memberState.model.shipStreet1,
                              valueChanged: (value) {
                                memberState.model.shipStreet1 = value;
                              },
                              maxLines: 1,
                              decoration: const InputDecoration(
                                hintText: 'Address 2',
                                labelText: 'Address 2',
                              ),
                            )),
                        getListTile(context, widget.app,
                            leading: Icon(Icons.description),
                            title: dialogField(
                              widget.app,
                              context,
                              initialValue: memberState.model.shipCity,
                              valueChanged: (value) {
                                memberState.model.shipCity = value;
                              },
                              maxLines: 1,
                              decoration: const InputDecoration(
                                hintText: 'City',
                                labelText: 'City',
                              ),
                            )),
                        getListTile(context, widget.app,
                            leading: Icon(Icons.description),
                            title: dialogField(
                              widget.app,
                              context,
                              initialValue: memberState.model.shipState,
                              valueChanged: (value) {
                                memberState.model.shipState = value;
                              },
                              maxLines: 1,
                              decoration: const InputDecoration(
                                hintText: 'State',
                                labelText: 'State',
                              ),
                            )),
                        getListTile(context, widget.app,
                            leading: Icon(Icons.description),
                            title: dialogField(
                              widget.app,
                              context,
                              initialValue: memberState.model.postcode,
                              valueChanged: (value) {
                                memberState.model.postcode = value;
                              },
                              maxLines: 1,
                              decoration: const InputDecoration(
                                hintText: 'Postcode',
                                labelText: 'Postcode',
                              ),
                            )),
                        getListTile(context, widget.app,
                            leading: Icon(Icons.description),
                            title: dialogField(
                              widget.app,
                              context,
                              initialValue: memberState.model.country,
                              valueChanged: (value) {
                                memberState.model.country = value;
                              },
                              maxLines: 1,
                              decoration: const InputDecoration(
                                hintText: 'Country',
                                labelText: 'Country',
                              ),
                            )),
                      ]),
                  topicContainer(widget.app, context,
                      title: 'Invoice address',
                      collapsible: true,
                      collapsed: true,
                      children: [
                        checkboxListTile(
                          widget.app,
                          context,
                          'Same as shipping address',
                          memberState.model.invoiceSame ?? false,
                              (value) {
                            setState(() {
                              memberState.model.invoiceSame = value ?? false;
                            });
                          },
                        ),
                        if (!(memberState.model.invoiceSame ?? false)) getListTile(context, widget.app,
                            leading: Icon(Icons.description),
                            title: dialogField(
                              widget.app,
                              context,
                              initialValue: memberState.model.invoiceStreet1,
                              valueChanged: (value) {
                                memberState.model.invoiceStreet1 = value;
                              },
                              maxLines: 1,
                              decoration: const InputDecoration(
                                hintText: 'Address 1',
                                labelText: 'Address 1',
                              ),
                            )),
                        if (!(memberState.model.invoiceSame ?? false)) getListTile(context, widget.app,
                            leading: Icon(Icons.description),
                            title: dialogField(
                              widget.app,
                              context,
                              initialValue: memberState.model.invoiceStreet1,
                              valueChanged: (value) {
                                memberState.model.invoiceStreet1 = value;
                              },
                              maxLines: 1,
                              decoration: const InputDecoration(
                                hintText: 'Address 2',
                                labelText: 'Address 2',
                              ),
                            )),
                        if (!(memberState.model.invoiceSame ?? false)) getListTile(context, widget.app,
                            leading: Icon(Icons.description),
                            title: dialogField(
                              widget.app,
                              context,
                              initialValue: memberState.model.invoiceCity,
                              valueChanged: (value) {
                                memberState.model.invoiceCity = value;
                              },
                              maxLines: 1,
                              decoration: const InputDecoration(
                                hintText: 'City',
                                labelText: 'City',
                              ),
                            )),
                        if (!(memberState.model.invoiceSame ?? false)) getListTile(context, widget.app,
                            leading: Icon(Icons.description),
                            title: dialogField(
                              widget.app,
                              context,
                              initialValue: memberState.model.invoiceState,
                              valueChanged: (value) {
                                memberState.model.invoiceState = value;
                              },
                              maxLines: 1,
                              decoration: const InputDecoration(
                                hintText: 'State',
                                labelText: 'State',
                              ),
                            )),
                        if (!(memberState.model.invoiceSame ?? false)) getListTile(context, widget.app,
                            leading: Icon(Icons.description),
                            title: dialogField(
                              widget.app,
                              context,
                              initialValue: memberState.model.invoicePostcode,
                              valueChanged: (value) {
                                memberState.model.invoicePostcode = value;
                              },
                              maxLines: 1,
                              decoration: const InputDecoration(
                                hintText: 'Postcode',
                                labelText: 'Postcode',
                              ),
                            )),
                        if (!(memberState.model.invoiceSame ?? false)) getListTile(context, widget.app,
                            leading: Icon(Icons.description),
                            title: dialogField(
                              widget.app,
                              context,
                              initialValue: memberState.model.invoiceCountry,
                              valueChanged: (value) {
                                memberState.model.invoiceCountry = value;
                              },
                              maxLines: 1,
                              decoration: const InputDecoration(
                                hintText: 'Postcode',
                                labelText: 'Postcode',
                              ),
                            )),
                      ]),
                  topicContainer(widget.app, context,
                      title: 'Subscriptions',
                      collapsible: true,
                      collapsed: true,
                      children: [
                        _subscripions(memberState),
                      ]),
                ]);
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
    var items =
        state.model.subscriptions != null ? state.model.subscriptions! : [];
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
                    title: text(widget.app, context,
                        (value.app != null ? value.app.documentID! : '?')),
                    trailing: PopupMenuButton<int>(
                        child: Icon(Icons.more_vert),
                        elevation: 10,
                        itemBuilder: (context) => [
/*
                              PopupMenuItem(
                                value: 1,
                                child: text(widget.app, context, 'Update'),
                              ),
*/
                              PopupMenuItem(
                                value: 2,
                                child: text(widget.app, context, 'Delete'),
                              ),
                            ],
                        onSelected: (selectedValue) {
                          if (selectedValue == 1) {
                            open(
                              value,
                              (newItem) => BlocProvider.of<MemberBloc>(context)
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
/*
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
                    .add(AddItemEvent(itemModel: newItem)),
              );
            },
          ),
          Spacer(),
        ])
*/
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
